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
  Schematic of the connections to the MCU. NOG UPDATEN!!!
  
                                 STM8S105C6T6
      MCU pin-name            Function |    MCU pin-name        Function
   ------------------------------------|--------------------------------
   01 NRST                             | 13 VDDA
   02 PA1/OSC                 HEAT     | 14 VSSA
   03 PA2/OSCOUT              COOL     | 15 PB7/AIN7            LED3
   04 VSSIO_1                          | 16 PB6/AIN6            LED2
   05 VSS                              | 17 PB5/AIN5[I2C_SDA]   LED1
   06 VCAP                             | 18 PB4/AIN4[I2C_SCL]   -
   07 VDD                              | 19 PB3/AIN3[TIM1_ETR]  NTC1 
   08 VDDIO_1                          | 20 PB2/AIN2[TIM1_CH3N] NTC2
   09 PA3/TIM2_CH3[TIME3_CH1] SSR      | 21 PB1/AIN1[TIM1_CH2N] IO2
   10 PA4                     BUZZER   | 22 PB0/AIN0[TIM1_CH1N] IO1
   11 PA5                     -        | 23 PE7/AIN8            -
   12 PA6                     -        | 24 PE6/AIN9            -
   ------------------------------------|--------------------------------
   25 PE5/SPI_NSS             SPI_NSS  | 37 PE3/TIM1_BKIN       NRF24_CE
   26 PC1/TIM1_CH1/UART2_CK   CC1      | 38 PE2/I2C_SDA         I2C_SDA
   27 PC2/TIM1_CH2            CC2      | 39 PE1/I2C_SCL         I2C_SCL
   28 PC3/TIM1_CH3            CC3      | 40 PE0/CLK_CC0         C
   29 PC4/TIM1_CH4            CC4      | 41 PD0/TIM3_CH2...     B
   30 PC5/SPI_SCK             SPI_SCK  | 42 PD1/SWIM            SWIM
   31 VSSIO_2                          | 43 PD2/TIM3_CH1...     A 
   32 VDDIO_2                          | 44 PD3/TIM2_CH2...     DP_S
   33 PC6/SPI_MOSI            SPI_MOSI | 45 PD4/TIM2_CH1[BEEP]  G_PWR
   34 PC7/SPI_MISO            SPI_MISO | 46 PD5/UART2_TX        F_DOWN
   35 PG0                     -        | 47 PD6/UART2_RX        E_UP
   36 PG1                     -        | 48 PD7/TLI[TIM1_CH4]   D
   ---------------------------------------------------------------------
*/
#include <iostm8s105.h>
#include "stdint.h"

/* Define STC-1000+ version number (XYY, X=major, YY=minor) */
/* Also, keep track of last version that has changes in EEPROM layout */
#define STC1000P_VERSION	    (200)
#define STC1000P_EEPROM_VERSION	 (20)

// Hardware defines for register definitions
// These value were defined in IAR, but not in Cosmic STM8
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

// Defines for all 7-segment LEDs
#define PORTC_LEDS (0xF8)
#define PORTD_LEDS (0x1C)

// Defines for outputs: LEDs = PA1, Clock = PA2, SDIN = PA3, KEYS = PB5
#define LEDS  (0x02)
#define CLOCK (0x04)
#define SDIN  (0x08)
#define KEYS  (0x20)

#define LEDS_OFF     (PA_ODR &= ~LEDS)
#define LEDS_ENABLE  (PA_ODR |=  LEDS)
#define SET_SDIN_1   (PA_ODR |=  SDIN)
#define SET_SDIN_0   (PA_ODR &= ~SDIN)
#define SET_CLK_1    (PA_ODR |=  CLOCK)
#define SET_CLK_0    (PA_ODR &= ~CLOCK)
                          
// Frontpanel LEDs: ALM1 (PD2), OUT1 (PC5), ALM2 (PD3), AT (PC7)
#define LED_ALM1 (0x04)
#define LED_OUT1 (0x20)
#define LED_ALM2 (0x08)
#define LED_AT   (0x80)

// Defines for outputs: Alarm = PD6, S3 = PA3, Cool = PA2, Heat = PA1
#define ALARM    (0x40)
#define S3       (0x08)
#define COOL     (0x04)
#define HEAT     (0x02)

#define ALARM_ON     (PD_ODR |=  ALARM)
#define ALARM_OFF    (PD_ODR &= ~ALARM)
#define ALARM_STATUS ((PD_IDR & ALARM) == ALARM)
#define S3_ON        (PA_ODR |=  S3)
#define S3_OFF       (PA_ODR &= ~S3)
#define COOL_ON      (PA_ODR |=  COOL)
#define COOL_OFF     (PA_ODR &= ~COOL)
#define COOL_STATUS  ((PA_IDR & COOL) == COOL)
#define HEAT_ON      (PA_ODR |=  HEAT)
#define HEAT_OFF     (PA_ODR &= ~HEAT)
#define HEAT_STATUS  ((PA_IDR & HEAT) == HEAT)
#define RELAYS_OFF   (PA_ODR &= ~(HEAT | COOL))

// PC7 PC6 PC5 PC4 PC3 PD3 PD2 PD4
//  D   E   F   G   dp  A   B   C
#define LED_OFF	(0x00)
#define LED_ON  (0xFF)
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

#define LED_HEAT    (0x01)
#define LED_SET     (0x02)
#define LED_COOL    (0x04)
#define LED_DECIMAL (0x08)
#define LED_POINT   (0x10)
#define LED_CELS    (0x20)
#define LED_DEGR    (0x40)
#define LED_NEG     (0x80)

// Function prototypes
void set_hc164(uint8_t x);
void multiplexer(void);
void setup_timer2(void);
void initialise_system_clock(void);
void setup_gpio_ports(void);

#endif // C100_PID_MAIN_H