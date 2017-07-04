/*==================================================================
   File Name    : spi.h
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
 
  C100_PID is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
 
  You should have received a copy of the GNU General Public License
  along with C100_PID.  If not, see <http://www.gnu.org/licenses/>.
  ================================================================== */ 
#ifndef _SPI_H
#define _SPI_H   1

#include <iostm8s105.h>
#include <stdbool.h>
#include "stdint.h"

#define SPI_CR1_SPE (0x40)
#define SPI_SR_BSY  (0x80)
#define SPI_SR_TXE  (0x02)
#define SPI_SR_RXNE (0x01)

//----------------------------------------
//Defines for MAX31865 PT100 device
//----------------------------------------
#define MAX31856_CONFIG  (0x00)
#define MAX31856_RTD_MSB (0x01)
#define MAX31856_RTD_LSB (0x01)
#define MAX31856_RTD_MSB (0x01)
#define MAX31856_HFLTMSB (0x03)
#define MAX31856_HFLTLSB (0x04)
#define MAX31856_LFLTMSB (0x05)
#define MAX31856_LFLTLSB (0x06)
#define MAX31856_FLTSTAT (0x07)

#define VBIAS    (0x80)
#define ONE_SHOT (0x20)
#define CLR_FLT  (0x02)
#define FIL_50HZ (0x01)

void    spi_init(void); // Initializes the SPI Interface. Needs to be called only once
void    spi_write(uint8_t data);
uint8_t spi_read(void);
int16_t max31855_read(uint8_t *err);
void    max31865_init(void);
int16_t max31865_read(void);

#endif
