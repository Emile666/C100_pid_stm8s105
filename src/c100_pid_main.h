#ifndef C100_PID_MAIN_H
#define C100_PID_MAIN_H
/*==================================================================
  File Name    : c100_pid_main.h
  Author       : Emile
  ------------------------------------------------------------------
  This is the main header file for the c100_pid project.
  ------------------------------------------------------------------
  c100_pid is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
 
  c100_pid is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
 
  You should have received a copy of the GNU General Public License
  along with c100_pid.  If not, see <http://www.gnu.org/licenses/>.
  ------------------------------------------------------------------
  Schematic of the connections to the MCU.
  
                                 STM8S105C6T6
      MCU pin-name            Function |    MCU pin-name        Function
   ---------------------------------------|--------------------------------
   01 NRST                                | 13 VDDA
   02 PA1/OSC                 -           | 14 VSSA
   03 PA2/OSCOUT              ALARM       | 15 PB7/AIN7            CS_TC
   04 VSSIO_1                             | 16 PB6/AIN6            CS_PT100
   05 VSS                                 | 17 PB5/AIN5[I2C_SDA]   CS_NRF24L01
   06 VCAP                                | 18 PB4/AIN4[I2C_SCL]   CE_NRF24L01
   07 VDD                                 | 19 PB3/AIN3[TIM1_ETR]  -
   08 VDDIO_1                             | 20 PB2/AIN2[TIM1_CH3N] -
   09 PA3/TIM2_CH3[TIME3_CH1] SSR         | 21 PB1/AIN1[TIM1_CH2N] -
   10 PA4                     -           | 22 PB0/AIN0[TIM1_CH1N] -
   11 PA5                     -           | 23 PE7/AIN8            -
   12 PA6                     -           | 24 PE6/AIN9            -
   ---------------------------------------|--------------------------------
   25 PE5/SPI_NSS             -           | 37 PE3/TIM1_BKIN       -
   26 PC1/TIM1_CH1/UART2_CK   KEYS_COMMON | 38 PE2/I2C_SDA         I2C_SDA
   27 PC2/TIM1_CH2            LEDS_CTRL   | 39 PE1/I2C_SCL         I2C_SCL
   28 PC3/TIM1_CH3            SERIAL_IN   | 40 PE0/CLK_CC0         C
   29 PC4/TIM1_CH4            CLOCK       | 41 PD0/TIM3_CH2...     B
   30 PC5/SPI_SCK             SPI_SCK     | 42 PD1/SWIM            SWIM
   31 VSSIO_2                             | 43 PD2/TIM3_CH1...     A 
   32 VDDIO_2                             | 44 PD3/TIM2_CH2...     DP
   33 PC6/SPI_MOSI            SPI_MOSI    | 45 PD4/TIM2_CH1[BEEP]  G
   34 PC7/SPI_MISO            SPI_MISO    | 46 PD5/UART2_TX        F
   35 PG0                     -           | 47 PD6/UART2_RX        E
   36 PG1                     -           | 48 PD7/TLI[TIM1_CH4]   D
   ---------------------------------------------------------------------
*/
#include <iostm8s105.h>
#include "stdint.h"

/* Define STC-1000+ version number (XYY, X=major, YY=minor) */
/* Also, keep track of last version that has changes in EEPROM layout */
#define STC1000P_VERSION	    (300)
#define STC1000P_EEPROM_VERSION	 (20)

//-----------------------------------------------------------------------
// Hardware defines for register definitions
// These value were defined in IAR, but not in Cosmic STM8
//-----------------------------------------------------------------------
#define TIM2_SR1_UIF      (0x01)
#define CLK_ICKCR_HSIEN   (0x01)
#define CLK_ICKCR_HSIRDY  (0x02)
#define ADC_CR1_SPSEL_MSK (0x70)
#define CLK_SWCR_SWBSY    (0x01)
#define CLK_SWCR_SWEN     (0x02)
#define TIM2_IER_UIE      (0x01)
#define TIM2_CR1_CEN      (0x01)

#define enable_interrupts()  {_asm("rim\n");} /* enable interrupts */
#define disable_interrupts() {_asm("sim\n");} /* disable interrupts */
#define wait_for_interrupt() {_asm("wfi\n");} /* Wait For Interrupt */

//-----------------------------------------------------------------------
// PORTA Inputs and Outputs
//-----------------------------------------------------------------------
#define SSR         (0x08)
#define ALARM       (0x04)

#define SSR_ON        (PA_ODR |=  SSR)
#define SSR_OFF       (PA_ODR &= ~SSR)
#define SSR_STATUS   ((PA_IDR & SSR) == SSR)
#define ALARM_ON      (PA_ODR |=  ALARM)
#define ALARM_OFF     (PA_ODR &= ~ALARM)
#define ALARM_STATUS ((PA_IDR & ALARM) == ALARM)

//-----------------------------------------------------------------------
// PORTB Inputs and Outputs
//-----------------------------------------------------------------------
#define CS_TC       (0x80)
#define CS_PT100    (0x40)
#define CS_NRF24L01 (0x20)
#define CE_NRF24L01 (0x10)
#define PORTB_OUT   (CS_TC | CS_PT100 | CS_NRF24L01 | CE_NRF24L01)

#define CS_TC_0     (PB_ODR &= ~CS_TC)
#define CS_TC_1     (PB_ODR |=  CS_TC)
#define CS_PT100_0  (PB_ODR &= ~CS_PT100)
#define CS_PT100_1  (PB_ODR |=  CS_PT100)

//-----------------------------------------------------------------------
// PORTC Inputs and Outputs
//-----------------------------------------------------------------------
#define SPI_MISO (0x80) /* SPI MISO line */
#define SPI_MOSI (0x40) /* SPI MOSI line */
#define SPI_SCK  (0x20) /* SPI Serial-clock */
#define CLOCK    (0x10) /* Clock pin for HC164 shift-register on frontpanel */
#define SDIN     (0x08) /* Data-in pin for HC164 shift-register */
#define LEDS     (0x04) /* Connected to LED anodes, 0 = enabled LEDs */
#define KEYS     (0x02) /* Connected to buttons */

#define PORTC_OUT    (SPI_MOSI | SPI_SCK | CLOCK | SDIN | LEDS)
#define PORTC_IN     (SPI_MISO | KEYS)

#define LEDS_OFF     (PC_ODR |=  LEDS)
#define LEDS_ENABLE  (PC_ODR &= ~LEDS)
#define SET_SDIN_1   (PC_ODR |=  SDIN)
#define SET_SDIN_0   (PC_ODR &= ~SDIN)
#define SET_CLK_1    (PC_ODR |=  CLOCK)
#define SET_CLK_0    (PC_ODR &= ~CLOCK)

//-----------------------------------------------------------------------
// PORTD Inputs and Outputs
//-----------------------------------------------------------------------
#define SEG7_D   (0x80)
#define SEG7_E   (0x40)
#define SEG7_F   (0x20)
#define SEG7_G   (0x10)
#define SEG7_DP  (0x08)
#define SEG7_A   (0x04)
#define SWIM     (0x02) /* do NOT initialize or debugging will not work */
#define SEG7_B   (0x01)
#define PORTD_OUT (SEG7_D | SEG7_E | SEG7_F | SEG7_G | SEG7_DP | SEG7_A | SEG7_B)

#define PD_LEDS(x) ((x & 0xFC) | ((x >> 1) & 0x01)) /* Convert LED define to PORTD value */

//-----------------------------------------------------------------------
// Frontpanel LEDs: ALM1 (PD0,B), OUT1 (PD5,F), ALM2 (PD2,A), AT (PD7,D)
// Enable LED by setting LEDS_CTRL to 0 (active-low) and PDx port-pin to 0
// Disable CA-lines from 7-segment displays when doing this
//-----------------------------------------------------------------------
#define LED_AT_BLINK_FAST   (0x0800) /* 1 = Fast blinking rate, 0 = slow */
#define LED_OUT1_BLINK_FAST (0x0400) /* 1 = Fast blinking rate, 0 = slow */
#define LED_ALM2_BLINK_FAST (0x0200) /* 1 = Fast blinking rate, 0 = slow */
#define LED_ALM1_BLINK_FAST (0x0100) /* 1 = Fast blinking rate, 0 = slow */
#define LED_AT              (0x0080) /* Frontpanel LED AT,   coupled to SEG7_D, PD7 */
#define LED_AT_BLINK        (0x0040) /* 1 = Blink AT LED,   0 = constant ON/OFF     */
#define LED_OUT1            (0x0020) /* Frontpanel LED OUT1, coupled to SEG7_F, PD5 */
#define LED_OUT1_BLINK      (0x0010) /* 1 = Blink OUT1 LED, 0 = constant ON/OFF     */
#define LED_ALM2_BLINK      (0x0008) /* 1 = Blink ALM2 LED, 0 = constant ON/OFF     */
#define LED_ALM2            (0x0004) /* Frontpanel LED ALM2, coupled to SEG7_A, PD2 */
#define LED_ALM1_BLINK      (0x0002) /* 1 = Blink ALM2 LED, 0 = constant ON/OFF     */
#define LED_ALM1            (0x0001) /* Frontpanel LED ALM1, coupled to SEG7_B, PD0 */

#define LED_BLINK_SLOW (60)   /* LED ON-time, in 9 msec. steps */
#define LED_BLINK_FAST (30)   /* LED ON-time, in 9 msec. steps */

#define STD_LED_OFF    (0)
#define STD_LED_ON     (1)
#define STD_LED_BLINK0 (2)
#define STD_LED_BLINK1 (3)

//-----------------------------------------------------------------------
// PORTE Inputs and Outputs
//-----------------------------------------------------------------------
#define SPI_NSS   (0x20)
#define I2C_SDA   (0x04)
#define I2C_SCL   (0x02)
#define SEG7_C    (0x01)
#define PORTE_OUT (SPI_NSS | I2C_SDA | I2C_SCL | SEG7_C)

#define PE_LEDS(x) (x & 0x01) /* Convert LED define to PORTE value */

//-----------------------------------------------------------------------
// PD7 PD6 PD5 PD4 PD3 PD2 PD0 PE0
//  D   E   F   G   dp  A   B   C
//-----------------------------------------------------------------------
#define LED_OFF	(0x00)
#define LED_ON  (0xFF)
#define LED_MIN (0x10)
#define LED_DP  (0x08)
#define LED_0	(0xE7)
#define LED_1	(0x03)
#define LED_2	(0xD6)
#define LED_3	(0x97)
#define LED_4	(0x33)
#define LED_5	(0xB5)
#define LED_6	(0xF5)
#define LED_7	(0x07)
#define LED_8	(0xF7)
#define LED_9	(0xB7)
#define LED_A	(0x77)
#define LED_a	(0xD7)
#define LED_b	(0xF1)
#define LED_C	(0xE4)
#define LED_c	(0xD0)
#define LED_d	(0xD3)
#define LED_e	(0xF6)
#define LED_E	(0xF4)
#define LED_F	(0x74)
#define LED_H	(0x73)
#define LED_h	(0x71)
#define LED_I	(0x03)
#define LED_J	(0xC3)
#define LED_L	(0xE0)
#define LED_n	(0x51)	
#define LED_O	(0xE7)
#define LED_o	(0xD1)
#define LED_P	(0x76)
#define LED_r	(0x50)	
#define LED_S	(0xB5)
#define LED_t	(0xF0)
#define LED_U	(0xE3)
#define LED_u	(0xC1)
#define LED_y	(0xB3)

// Define for lowpass-filters
#define FILTER_SHIFT  (6)
#define FILTER_ROUND  (1<<(FILTER_SHIFT-1))
#define TEMP_ROOM     (200L<<(FILTER_SHIFT))

// Function prototypes
void set_hc164(uint8_t x);
void multiplexer(void);
void setup_timer2(void);
void initialise_system_clock(void);
void setup_gpio_ports(void);

#endif // C100_PID_MAIN_H