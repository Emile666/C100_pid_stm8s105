/*==================================================================
  File Name    : spi.c
  Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the SPI related functions 
            for the STM8 uC.
            It is meant for the C100_PID project.
  ------------------------------------------------------------------
  C100_PID is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
 
  C100_PPID is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
 
  You should have received a copy of the GNU General Public License
  along with C100_PID.  If not, see <http://www.gnu.org/licenses/>.
  ------------------------------------------------------------------
  $Log: $
  ==================================================================
*/ 
#include "spi.h"
#include "c100_pid_main.h"
#include "delay.h"

uint8_t spi_error;

//  SPI interrupt handler.
@interrupt void SPI_Handler(void)
{   // Useful for debugging purposes
    spi_error = SPI_DR;
    spi_error = SPI_SR; // This clears the OVR bit
} // I2C_IRQHandler()

/*-----------------------------------------------------------------------------
  Purpose  : This function initializes the SPI bus controller
  Variables: --
  Returns  : --
  ---------------------------------------------------------------------------*/
void spi_init(void)
{
	SPI_CR1   &= ~SPI_CR1_SPE; // Disable SPI
    SPI_CR1    = 0x0C;         // MSB first, disable SPI, 4 MHz clock, Master mode, SPI mode 0
	SPI_CR2    = 0x03;         // Select SW Slave Management and Master mode
	SPI_ICR    = 0x00;         // Disable SPI interrupt on error
	// SPI_NSS is already set to Output and a high-level by GPIO init.
} // spi_init()

/*-----------------------------------------------------------------------------
  Purpose  : This function sends one byte to the SPI device
  Variables: data: byte to be transferred
  Returns  : -
  ---------------------------------------------------------------------------*/
void spi_write(uint8_t data)
{
	while (!(SPI_SR & SPI_SR_TXE)) delay_usec(5); // wait until TX Register is empty
	SPI_DR = data; // send byte over SPI bus
	while (!(SPI_SR & SPI_SR_TXE)) delay_usec(5); // wait until TX Register is empty
	while (SPI_SR & SPI_SR_BSY)    delay_usec(5); // wait until SPI is not busy anymore
} // spi_write()

/*-----------------------------------------------------------------------------
  Purpose  : This function reads one byte from the SPI device
  Variables: --
  Returns  : byte read from the SPI device
  ---------------------------------------------------------------------------*/
uint8_t spi_read(void)
{   
    uint8_t x1, reg;
    
	while (!(SPI_SR & SPI_SR_RXNE)) delay_usec(5); // wait until RX Register is full
    reg = SPI_DR;
    x1  = SPI_SR; // clear possible OVR flag
    return reg;
} // spi_read()

/*-----------------------------------------------------------------------------
  Purpose  : This function reads the temperature from the MAX31855 device. 
             A K-type thermocouple should be connected to the device.
  Variables: err: SCV, SCG or OC Fault bits
  Returns  : temperature in E-1 °C
  ---------------------------------------------------------------------------*/
int16_t max31855_read(uint8_t *err)
{
    uint32_t d = 0;
    int32_t  v, v1;
    
    CS_TC_0;         // Set chip-select for MAX31855 active
    delay_usec(1);   // at least 100 nsec. delay
    spi_write(0xFF);
    d = spi_read();  // Read byte 1
    d <<= 8;
    spi_write(0xFF);
    d |= spi_read(); // Read byte 2
    d <<= 8;
    spi_write(0xFF); 
    d |= spi_read(); // Read byte 3
    d <<= 8;
    spi_write(0xFF); 
    d |= spi_read(); // Read byte 4
    CS_TC_1;         // Set chip-select for MAX31855 inactive again
    
    *err = (d & 0x07); // Contains error bits
    if (d & 0x80000000) 
    {
        // Negative value, drop the lower 18 bits and explicitly extend sign bits.
        v = (int32_t)(0xFFFFC000 | ((d >> 18) & 0x00003FFFF));
    }
    else 
    {
        // Positive value, just drop the lower 18 bits.
        v = (int32_t)(d >>= 18);
    } // else
    // v is a number * 4. Add number * 8 to number * 2 to convert into E-1 °C
    v1 = ((v << 1) + (v >> 1));
    return (int16_t)v1;
} // max31855_read()

/*-----------------------------------------------------------------------------
  Purpose  : This function initialises the MAX31865 device. 
             A PT100 sensor should be connected to the device.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void max31865_init(void)
{
    CS_PT100_0;                        // Set chip-select for MAX31865 active
    delay_usec(1);                     // at least 400 nsec. delay
    spi_write(MAX31856_CONFIG | 0x80); // Write to CONFIG register
    spi_write(0x03);                   // Bias off, auto mode off, 2-wires, clear fault, 50 Hz filter
    CS_PT100_1;                        // Disable chip-select for MAX31865
} // max31865_init()

/*-----------------------------------------------------------------------------
  Purpose  : This function reads the temperature from the MAX31865 device. 
             A PT100 sensor should be connected to the device.
  Variables: err: SCV, SCG or OC Fault bits
  Returns  : temperature in E-1 °C
  ---------------------------------------------------------------------------*/
int16_t max31865_read(void)
{
	uint8_t  t;
	uint16_t rtd;
    int32_t  x;
	
    CS_PT100_0;                            // Set chip-select for MAX31865 active
    delay_usec(1);                         // at least 400 nsec. delay
    spi_write(MAX31856_CONFIG | 0x80);     // Write to CONFIG register
    spi_write(VBIAS | CLR_FLT | FIL_50HZ); // Vbias ON, clear faults, 50 Hz filter
    CS_PT100_1;                            // Disable chip-select for MAX31865
    delay_msec(10);                        // Let Vbias settle

    CS_PT100_0;                            // Set chip-select for MAX31865 active again
	spi_write(MAX31856_CONFIG | 0x80);     // Write to CONFIG register
    spi_write(0xFF);               
	t = spi_read() | ONE_SHOT;         
    CS_PT100_1;                            // Disable chip-select for MAX31865
    delay_usec(1);                         // at least 400 nsec. delay

    CS_PT100_0;                            // Set chip-select for MAX31865 active again
    spi_write(MAX31856_CONFIG | 0x80);     // Write to CONFIG register
    spi_write(t);                          // Set one-shot conversion
    CS_PT100_1;                            // Disable chip-select for MAX31865
    delay_msec(65);                        // Wait for conversion-end

    CS_PT100_0;                            // Set chip-select for MAX31865 active again
    spi_write(MAX31856_RTD_MSB);           // MSB of RTD register address
	spi_write(0xFF);
	rtd = spi_read();                      // Read MSB
	rtd <<= 8;
	rtd |= spi_read();                     // Read LSB
	rtd >>= 1;                             // remove fault bit
    CS_PT100_1;                            // Disable chip-select for MAX31865
    delay_usec(1);                         // at least 400 nsec. delay

    //-------------------------------------------------------------------------------------
    // The RTD value read is relative to the 150 Ohm reference resistor. To convert this
    // value to a temperature in E-1 °C, regression is used to find the relation. It is:
    //
    //          RTD - 21868         5*RTD - 109340 + 21   5*RTD - 109319
    //   Temp = ----------- + 0.5 = ------------------- = --------------
    //              8.4                     42                  42
    //
    // Example 1: A value of exactly 100.0 Ohm corresponds with 0 °C. This results in a
    //            RTD value of (100/150)*32767 = 21845
    //            (5*21845-109319)/42 = -94/42 = -2 E-1 °C or an error of -0.2 °C
    //
    // Example 2: 123.24 Ohms (60.0 °C) => RTD = 26921. (5*26921-109319)/42 = 602 E-1 °C
    //-------------------------------------------------------------------------------------
    x = ((int32_t)rtd << 2) + rtd - 109319L;
	x /= 42;
	rtd = (int16_t)x;
	return rtd;
} // max31865_read()