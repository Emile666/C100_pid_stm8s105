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
#include <math.h>

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
    SPI_CR1    = 0x0D;         // MSB first, disable SPI, 4 MHz clock, Master mode, SPI mode 1
	SPI_CR2    = 0x03;         // Select SW Slave Management and Master mode
	SPI_ICR    = 0x00;         // Disable SPI interrupt on error
    SPI_CR1   |=  SPI_CR1_SPE; // Enable SPI
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
  Purpose  : This function reads an 8-bit value from a register of the MAX31865. 
  Variables: 
        reg: the name of the MAX31865 register
  Returns  : the 8-bit data read
  ---------------------------------------------------------------------------*/
uint8_t max31865_read8(uint8_t reg)
{
    uint8_t ret;
    
    CS_PT100_0;            // Set chip-select for MAX31865 active
    delay_usec(1);         // at least 400 nsec. delay
    spi_write(reg & 0x7F); // register address
	ret = spi_read();      // dummy read
    spi_write(0x00);
	ret = spi_read();      // read register value
    CS_PT100_1;            // Disable chip-select for MAX31865
    return ret;
} // max31865_read8()

/*-----------------------------------------------------------------------------
  Purpose  : This function writes an 8-bit value to a register of the MAX31865. 
  Variables: 
        reg: the name of the MAX31865 register
        dat: the 8-bit data to write to the MAX31865 register
  Returns  : -
  ---------------------------------------------------------------------------*/
void max31865_write8(uint8_t reg, uint8_t dat)
{
    CS_PT100_0;            // Set chip-select for MAX31865 active
    delay_usec(1);         // at least 400 nsec. delay
    spi_write(reg | 0x80); // Write to register
    spi_write(dat);        // Write data to register
    CS_PT100_1;            // Disable chip-select for MAX31865
} // max31865_write8()

/*-----------------------------------------------------------------------------
  Purpose  : This function reads a 16-bit value from a register of the MAX31865. 
  Variables: 
        reg: the name of the MAX31865 register
  Returns  : the 16-bit data read
  ---------------------------------------------------------------------------*/
uint16_t max31865_read16(uint8_t reg)
{
    uint16_t ret;
    
    CS_PT100_0;            // Set chip-select for MAX31865 active
    delay_usec(1);         // at least 400 nsec. delay
    spi_write(reg & 0x7F); // register address
	ret = spi_read();      // dummy read
	spi_write(0x00);
	ret = spi_read();      // Read MSB
    ret <<= 8;
	spi_write(0x00);
	ret |= spi_read();     // Read LSB
    CS_PT100_1;            // Disable chip-select for MAX31865
    return ret;
} // max31865_read8()

/*-----------------------------------------------------------------------------
  Purpose  : This function writes a 16-bit value to a register of the MAX31865. 
  Variables: 
        reg: the name of the MAX31865 register
        dat: the 16-bit data to write to the MAX31865 register
  Returns  : -
  ---------------------------------------------------------------------------*/
void max31865_write16(uint8_t reg, uint16_t dat)
{
    uint8_t dat8;
    
    CS_PT100_0;            // Set chip-select for MAX31865 active
    delay_usec(1);         // at least 400 nsec. delay
    spi_write(reg | 0x80); // Write to register
    dat8 = (uint8_t)(dat >> 8);
    spi_write(dat8);       // Write MSB
    dat8 = (uint8_t)(dat & 0x00FF);
    spi_write(dat8);       // Write LSB
    CS_PT100_1;            // Disable chip-select for MAX31865
} // max31865_write8()

/*-----------------------------------------------------------------------------
  Purpose  : This function initialises the MAX31865 device. 
             A PT100 sensor should be connected to the device.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void max31865_init(void)
{
    //uint8_t val8;
    //uint16_t val16;
    
    max31865_write8(MAX31865_CONFIG, 0xC3);
    delay_msec(10);  // Let Vbias settle
    
    // TEST
    //val8 = max31865_read8(MAX31856_CONFIG);
    //max31865_write16(MAX31856_HFLTMSB,0xEDCB);
    //val16 = max31865_read16(MAX31856_HFLTMSB);
} // max31865_init()

/*-----------------------------------------------------------------------------
  Purpose  : This function reads the temperature from the MAX31865 device. 
             A PT100 sensor should be connected to the device.
  Variables: err: 1 = No PT100 sensor present
  Returns  : temperature in E-1 °C
  ---------------------------------------------------------------------------*/
int16_t max31865_read(uint8_t *err)
{
	uint8_t  x;
    uint16_t rtd;
	float    d;
    
    rtd = max31865_read16(MAX31865_RTD_MSB); // Read 16-bit RTD value
    *err = (rtd & 0x0001);                   // Fault bit
    if (*err)
    {
        x  = max31865_read8(MAX31865_CONFIG);
        x |= CLR_FLT;
        max31865_write8(MAX31865_CONFIG,x); // Clear Fault Bit in Config Register
    } // if
    rtd >>= 1;                             // remove fault bit

    //-------------------------------------------------------------------------------------
    // The RTD value read is relative to a 390 Ohm reference resistor. To convert this
    // value to a temperature in E-1 °C, regression is used to find the relation. It is:
    //
    //          RTD - 8404.8        
    //   Temp = ------------ + 0.5     1/3.2353 = 0.309090347
    //            3.2353          
    //
    //-------------------------------------------------------------------------------------
    d  = (float)rtd - 8404.8;
	d *= 0.309090347;
	rtd = (int16_t)(d + 0.5);
	return rtd;
} // max31865_read()