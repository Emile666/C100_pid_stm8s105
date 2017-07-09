/*==================================================================
  File Name    : c100_pid_main.c
  Author       : Emile
  ------------------------------------------------------------------
  Purpose : This is the main-file for the c100_pid project.

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
  ------------------------------------------------------------------
  $Log: $
  ==================================================================
*/ 
#include "c100_pid_main.h"
#include "stdint.h"
#include "delay.h"
#include "stc1000p_lib.h"
#include "scheduler.h"

// Global variables
bool      ad_err1 = false; // used for adc range checking
bool      ad_err2 = false; // used for adc range checking
bool      probe2  = false; // cached flag indicating whether 2nd probe is active
bool      show_sa_alarm = false; // true = display alarm
bool      sound_alarm   = false; // true = sound alarm
uint16_t  leds_out;              // Four LEDs on frontpanel (ALM1, OUT1, ALM2, AT)
int16_t   temp_ntc1;             // The temperature in E-1 °C from NTC probe 1
int16_t   temp_ntc2;             // The temperature in E-1 °C from NTC probe 2
uint8_t   mpx_nr = 0;            // Used in multiplexer() function
int16_t   pwr_on_tmr = 1000;     // Needed for 7-segment display test
uint8_t   hc164_val;

uint8_t std[4] = {STD_LED_OFF, STD_LED_OFF, STD_LED_OFF, STD_LED_OFF};
uint8_t blink_tmr[4];

// External variables, defined in other files
extern int16_t  @eeprom eedata[];                // Link to .eeprom section
extern uint8_t  top_100, top_10, top_1, top_01;  // 7-segments top row: 100s, 10s, 1s and 0.1s
extern uint8_t  bot_100, bot_10, bot_1, bot_01;  // 7-segments bottom row: 100s, 10s, 1s and 0.1s
extern bool     pwr_on;                          // True = power ON, False = power OFF
extern uint8_t  sensor2_selected; // DOWN button pressed < 3 sec. shows 2nd temperature / pid_output
extern bool     minutes;          // timing control: false = hours, true = minutes
extern bool     menu_is_idle;     // No menus in STD active
extern bool     fahrenheit;       // false = Celsius, true = Fahrenheit
extern uint16_t cooling_delay;   // Initial cooling delay
extern uint16_t heating_delay;   // Initial heating delay
extern int16_t  setpoint;        // local copy of SP variable
extern int16_t  kc;              // Parameter value for Kc value in %/°C
extern uint8_t  ts;              // Parameter value for sample time [sec.]
extern int16_t  pid_out;         // Output from PID controller in E-1 %

/*-----------------------------------------------------------------------------
  Purpose  : This routine sets the HC164 shiftregister to a value x.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void set_hc164(uint8_t x)
{
    uint8_t i, j, p = 0x80;
    
    hc164_val = x; // save value for read_buttons() function
    SET_CLK_0;     // CLK  = 0
    SET_SDIN_0;    // SDIN = 0
    for (i = 0; i < 8; i++)
    {
        if (x & p) SET_SDIN_1;
        else       SET_SDIN_0;
        SET_CLK_1;
        p >>= 1;
        for (j = 0; j < 10; j++); // small delay
        SET_CLK_0;
    } // for i
} // set_hc164()

/*-----------------------------------------------------------------------------
  Purpose  : This routine set one frontpanel LED ON, OFF or Blinking.
             Blinking-rate can be set fast or slow
  Variables: nr: unique number for LED [0..3]
            led: bit-define in leds_out for one of 4 LEDs: 1 = ON, 0 = OFF
      blink_msk: bit-define in leds_out for one of 4 LEDs: 1 = Blinking, 0 = not
 blink_rate_msk: bit-define in leds_out for one of 4 LEDs: 1 = Blink fast, 0 = Blink slow
  Returns  : -
  ---------------------------------------------------------------------------*/
void set_one_led(uint8_t nr, uint16_t led, uint16_t blink_msk, uint16_t blink_rate_msk)
{   
   uint8_t blink_rate;
   
   if (leds_out & blink_rate_msk)
        blink_rate = LED_BLINK_FAST;
   else blink_rate = LED_BLINK_SLOW;
   
   switch (std[nr])
   {
       case STD_LED_OFF:
          PD_ODR |= led; // LED off
          if (leds_out & led)
          {
             if (leds_out & blink_msk)
             {
                  std[nr]       = STD_LED_BLINK1;
                  blink_tmr[nr] = 0;
             }
             else std[nr] = STD_LED_ON;
          } // if
          // else remain in this state
          break;
       case STD_LED_ON:
          PD_ODR &= ~led; // LED on
          if (!(leds_out & led))
             std[nr] = STD_LED_OFF;
          else if (leds_out & blink_msk)
          {
             std[nr]       = STD_LED_BLINK1;
             blink_tmr[nr] = 0;
          } // else if
          break;
       case STD_LED_BLINK1:
          PD_ODR &= ~led; // LED on
          if (!(leds_out & led))
             std[nr] = STD_LED_OFF;
          else if (!(leds_out & blink_msk))
             std[nr] = STD_LED_ON;
          else if (++blink_tmr[nr] > blink_rate)
          {
             std[nr]       = STD_LED_BLINK0;
             blink_tmr[nr] = 0;
          } // else if 
          break;
       case STD_LED_BLINK0:
          PD_ODR |= led; // LED off
          if (!(leds_out & blink_msk))
             std[nr] = STD_LED_OFF;
          else if (++blink_tmr[nr] > blink_rate)
          {
             std[nr]       = STD_LED_BLINK1;
             blink_tmr[nr] = 0;
          } // else if 
          break;  
   } // switch
} // set_one_led()

/*-----------------------------------------------------------------------------
  Purpose  : This routine multiplexes the 4 segments of the 7-segment displays.
             It runs at 1 kHz, so there's a full update after every 4 msec.
             The HC164 outputs are connected to the Command-Anodes of the 
             7-segment displays, so setting a 1 will enable that 7-segment.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void multiplexer(void)
{
    LEDS_OFF;             // clear LEDs
    PE_ODR |= SEG7_C;     // disable 7-segment display C
    PD_ODR |= PORTD_OUT;  // disable all other 7-segment displays
    set_hc164(0x00);      // disable CA-lines of 7-segment displays
    
    switch (mpx_nr)
    {
        case 0: // output CA1 BOTTOM display (LSB)
            set_hc164(0x01);
            PE_ODR &= ~PE_LEDS(bot_01);   // Update PE0 (SEG7_C)
            PD_ODR &= ~PD_LEDS(bot_01);   // Update all other segments
            mpx_nr = 1;
            break;
        case 1: // output CA2 BOTTOM display
            set_hc164(0x02);
            PE_ODR &= ~PE_LEDS(bot_1);   // Update PE0 (SEG7_C)
            PD_ODR &= ~PD_LEDS(bot_1);   // Update all other segments
            mpx_nr = 2;
            break;
        case 2: // output CA3 BOTTOM display
            set_hc164(0x04);
            PE_ODR &= ~PE_LEDS(bot_10);   // Update PE0 (SEG7_C)
            PD_ODR &= ~PD_LEDS(bot_10);   // Update all other segments
            mpx_nr = 3;
            break;
        case 3: // outputs CA4 BOTTOM display (MSB)
            set_hc164(0x08);
            PE_ODR &= ~PE_LEDS(bot_100);  // Update PE0 (SEG7_C)
            PD_ODR &= ~PD_LEDS(bot_100);  // Update all other segments
            mpx_nr = 4;
            break;
        case 4: // set Frontpanel LEDs
            set_hc164(0x00);
            LEDS_ENABLE;
            set_one_led(0,LED_ALM1, LED_ALM1_BLINK, LED_ALM1_BLINK_FAST);
            set_one_led(1,LED_ALM2, LED_ALM2_BLINK, LED_ALM2_BLINK_FAST);
            set_one_led(2,LED_OUT1, LED_OUT1_BLINK, LED_OUT1_BLINK_FAST);
            set_one_led(3,LED_AT  , LED_AT_BLINK  , LED_AT_BLINK_FAST);
            mpx_nr = 5;
            break;
        case 5: // output CA1 TOP display (LSB)
            set_hc164(0x10);
            PE_ODR &= ~PE_LEDS(top_01);  // Update PE0 (SEG7_C)
            PD_ODR &= ~PD_LEDS(top_01);  // Update all other segments
            mpx_nr = 6;
            break;
        case 6: // output CA2 TOP display
            set_hc164(0x20);
            PE_ODR &= ~PE_LEDS(top_1);   // Update PE0 (SEG7_C)
            PD_ODR &= ~PD_LEDS(top_1);   // Update all other segments
            mpx_nr = 7;
            break;
        case 7: // output CA3 TOP display
            set_hc164(0x40);
            PE_ODR &= ~PE_LEDS(top_10);  // Update PE0 (SEG7_C)
            PD_ODR &= ~PD_LEDS(top_10);  // Update all other segments
            mpx_nr = 8;
            break;
        case 8: // outputs CA4 TOP display (MSB)
            set_hc164(0x80);
            PE_ODR &= ~PE_LEDS(top_100); // Update PE0 (SEG7_C)
            PD_ODR &= ~PD_LEDS(top_100); // Update all other segments
        default: // FALL-THROUGH (less code-size)
            mpx_nr = 0;
            break;
    } // switch            
} // multiplexer()

/*-----------------------------------------------------------------------------
  Purpose  : This is the interrupt routine for the Timer 2 Overflow handler.
             It runs at 1 kHz and drives the scheduler and the multiplexer.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
#pragma vector = TIM2_OVR_UIF_vector
@interrupt void TIM2_UPD_OVF_IRQHandler(void)
{
    scheduler_isr();  // Run scheduler interrupt function
    if (!pwr_on)
    {   // Display OFF on dispay
        top_100    = top_10 = top_1 = top_01 = bot_01 = LED_OFF;
        bot_100    = LED_O; 
        bot_10     = bot_1 = LED_F;
        pwr_on_tmr = 2000; // 2 seconds
    } // if
    else if (pwr_on_tmr > 0)
    {	// 7-segment display test for 2 seconds
        pwr_on_tmr--;
        top_100 = LED_C; top_10 = LED_1; top_1 = top_01 = LED_0;
        bot_100 = LED_P; bot_10 = LED_I; bot_1 = LED_d; bot_01 = LED_c;
    } // else if
    multiplexer();             // Run multiplexer for Display and Keys
    TIM2_SR1 &= ~TIM2_SR1_UIF; // Reset interrupt (UIF bit) so it will not fire again straight away.
} // TIM2_UPD_OVF_IRQHandler()

/*-----------------------------------------------------------------------------
  Purpose  : This routine initialises Timer 2 to generate a 1 kHz interrupt.
             16 MHz / (  16 *  1000) = 1000 Hz (1000 = 0x03E8)
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void setup_timer2(void)
{
    TIM2_PSCR = 0x04;         //  Prescaler = 16
    TIM2_ARRH = 0x03;         //  High byte of 1000
    TIM2_ARRL = 0xE8;         //  Low  byte of 1000
    TIM2_IER  = TIM2_IER_UIE; //  Enable the update interrupts, disable all others
    TIM2_CR1  = TIM2_CR1_CEN; //  Finally enable the timer
} // setup_timer2()

/*-----------------------------------------------------------------------------
  Purpose  : This routine initialises all the GPIO pins of the STM8 uC.
             See c100_pid_main.h for a detailed description of all pin-functions.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void setup_gpio_ports(void)
{
    //-------------------------------------------------------------------
    // Initialise all PORTA IO: SSR and Alarm outputs
    //-------------------------------------------------------------------
    PA_DDR     |=   SSR | ALARM;         // Set PORTA pins as outputs
    PA_CR1     |=   SSR | ALARM;         // Set output pins to Push-Pull
    PA_ODR     &= ~(SSR | ALARM);        // Disable SSR and Alarm outputs
    
    //-------------------------------------------------------------------
    // Initialise all PORTB IO: SPI Chip-selects and Enable
    //-------------------------------------------------------------------
    PB_DDR     |=  PORTB_OUT;            // Set PORTB pins as outputs
    PB_CR1     |=  PORTB_OUT;            // Set output pins to Push-Pull
    PB_ODR     |= (CS_TC | CS_PT100 | CS_NRF24L01); // Disable SPI Chip-Selects
    PB_ODR     &= ~CE_NRF24L01;          // Set CE for NRF24L01 low
    
    //-------------------------------------------------------------------
    // Initialise all PORTC IO: SPI IO, HC164 controls, LEDS, KEYS
    //-------------------------------------------------------------------
    PC_ODR     &= ~PORTC_OUT;            // Turn off all pins from Port C
    PC_DDR     |= PORTC_OUT;             // Set PORTC pins as outputs
    PC_CR1     |= PORTC_OUT;             // Set output pins to Push-Pull
	PC_CR2     |=  (SPI_MOSI | SPI_SCK); // Set to 10 MHz
    PC_ODR     &= ~(SPI_MOSI | SPI_SCK); // MOSI = 0, SPI_CLK = 0
    PC_DDR     &= ~PORTC_IN;             // set PORTC pins as inputs
	PC_CR1     &= ~PORTC_IN;             // set input pins to Floating
    LEDS_OFF;                            // Disable frontpanel LEDs
    SET_SDIN_0;                          // Disable SDIN for HC164
    SET_CLK_0;                           // Disable CLK for HC164

    //-------------------------------------------------------------------
    // Initialise all PORTD IO: 7-segment display (and SWIM debug)
    //-------------------------------------------------------------------
    PD_DDR     |=  PORTD_OUT;            // Set PORTD pins as outputs
    PD_CR1     |=  PORTD_OUT;            // Set output pins to Push-Pull
    PD_ODR     &= ~PORTD_OUT;            // Disable 7-segment displays

    //-------------------------------------------------------------------
    // Initialise all PORTD IO: 1 7-segment display and I2C bus
    //-------------------------------------------------------------------
    PE_ODR     |=  (I2C_SCL | I2C_SDA);           // Must be set here, or I2C will not work
    PE_DDR     |=  (I2C_SCL | I2C_SDA | SEG7_C);  // Set as outputs
    PE_CR1     |=  SEG7_C;                        // Set output pin to Push-Pull
    PE_ODR     &= ~SEG7_C;                        // Disable 7-segment display
} // setup_gpio_ports()

/*-----------------------------------------------------------------------------
  Purpose  : This task is called every 500 msec. and processes the NTC 
             temperature probes from NTC1 (PD3/AIN4) and NTC2 (PD2/AIN3)
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void adc_task(void)
{
} // adc_task()

/*-----------------------------------------------------------------------------
  Purpose  : This task is called every 100 msec. and reads the buttons, runs
             the STD and updates the 7-segment display.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void std_task(void)
{
    read_buttons(); // reads the buttons keys, result is stored in _buttons
    menu_fsm();     // Finite State Machine menu
    //pid_to_time();  // Make Slow-PWM signal and send to S3 output-port
} // std_task()

/*-----------------------------------------------------------------------------
  Purpose  : This task is called every second and contains the main control
             task for the device. It also calls temperature_control().
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void ctrl_task(void)
{
   int16_t sa, diff;
   
    if (eeprom_read_config(EEADR_MENU_ITEM(CF))) // true = Fahrenheit
         fahrenheit = true;
    else fahrenheit = false;
    if (eeprom_read_config(EEADR_MENU_ITEM(HrS))) // true = hours
         minutes = false; // control-timing is in hours 
    else minutes = true;  // control-timing is in minutes

   // Start with updating the alarm
   // cache whether the 2nd probe is enabled or not.
      if (eeprom_read_config(EEADR_MENU_ITEM(Pb2))) 
        probe2 = true;
   else probe2 = false;
   if (ad_err1 || (ad_err2 && probe2))
   {
       sound_alarm = true;
       if (menu_is_idle)
       {  // Make it less anoying to nagivate menu during alarm
          top_100 = LED_A;
          top_10  = LED_L;
          top_1   = LED_S; // sensor not connected alarm
          if (ad_err1) top_01 = LED_1;
          else         top_01 = LED_2;
       } // if
       cooling_delay = heating_delay = 60;
   } else {
       sound_alarm = false; // reset the piezo buzzer
       if(((uint8_t)eeprom_read_config(EEADR_MENU_ITEM(rn))) < THERMOSTAT_MODE)
            leds_out |=  (LED_AT | LED_AT_BLINK); // Indicate profile mode
       else leds_out &= ~(LED_AT | LED_AT_BLINK);
 
       ts = eeprom_read_config(EEADR_MENU_ITEM(Ts)); // Read Ts [seconds]
       sa = eeprom_read_config(EEADR_MENU_ITEM(SA)); // Show Alarm parameter
       if (sa)
       {
            if (minutes) // is timing-control in minutes?
                 diff = temp_ntc1 - setpoint;
            else diff = temp_ntc1 - eeprom_read_config(EEADR_MENU_ITEM(SP));
            if (diff < 0) 
                 diff = -diff;
            if (sa < 0)
            {
                 sa = -sa;
                 sound_alarm = (diff <= sa); // enable buzzer if diff is small
            } else {
                 sound_alarm = (diff >= sa); // enable buzzer if diff is large
            } // if
       } // if
       if (ts == 0)                // PID Ts parameter is 0?
       {
           temperature_control();  // Run thermostat
           pid_out = 0;            // Disable PID-output
       } // if
       else 
       {
           pid_control();          // Run PID controller
       } // else
       if (menu_is_idle)           // show temperature if menu is idle
       {
           if (sound_alarm && show_sa_alarm)
           {
                top_100 = LED_A;
                top_10  = LED_L;
                top_1   = LED_d;
           } else {
               value_to_led(setpoint,LEDS_TEMP, ROW_BOT); // display setpoint on top-row
               switch (sensor2_selected)
               {
                   case 0: value_to_led(temp_ntc1,LEDS_TEMP,ROW_TOP); 
                           break;
                   case 1: value_to_led(temp_ntc2,LEDS_TEMP,ROW_TOP); 
                           break;
                   case 2: value_to_led(pid_out  ,LEDS_INT,ROW_TOP); 
                           break;
               } // switch
           } // else
           show_sa_alarm = !show_sa_alarm;
       } // if
   } // else
} // ctrl_task()

/*-----------------------------------------------------------------------------
  Purpose  : This task is called every minute or every hour and updates the
             current running temperature profile.
  Variables: minutes: timing control: false = hours, true = minutes
  Returns  : -
  ---------------------------------------------------------------------------*/
void prfl_task(void)
{
    static uint8_t min = 0;
    
    if (minutes)
    {   // call every minute
        update_profile();
        min = 0;
    } else {
        if (++min >= 60)
        {   // call every hour
            min = 0;
            update_profile(); 
        } // if
    } // else
} // prfl_task();

/*-----------------------------------------------------------------------------
  Purpose  : This routine initialises the system clock to run at 16 MHz.
             It uses the internal HSI oscillator.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void initialise_system_clock(void)
{
	CLK_ICKCR  = 0;                //  Reset the Internal Clock Register.
    CLK_ICKCR |= CLK_ICKCR_HSIEN;  //  Enable the HSI.
    while ((CLK_ICKCR & CLK_ICKCR_HSIRDY) == 0); //  Wait for the HSI to be ready for use.
    CLK_CKDIVR     = 0;            //  Ensure the clocks are running at full speed.
 
    // The datasheet lists that the max. ADC clock is equal to 6 MHz (4 MHz when on 3.3V).
    // Because fMASTER is now at 16 MHz, we need to set the ADC-prescaler to 4.
    ADC_CR1     &= ~ADC_CR1_SPSEL_MSK;
    ADC_CR1     |= 0x20;          //  Set prescaler (SPSEL bits) to 4, fADC = 4 MHz
    CLK_SWIMCCR  = 0x00;          //  Set SWIM to run at clock / 2.
    CLK_SWR      = 0xE1;          //  Use HSI as the clock source.
    CLK_SWCR     = 0x00;          //  Reset the clock switch control register.
    CLK_SWCR    |= CLK_SWCR_SWEN; //  Enable switching.
    while ((CLK_SWCR & CLK_SWCR_SWBSY) != 0);  //  Pause while the clock switch is busy.
} // initialise_system_clock()

/*-----------------------------------------------------------------------------
  Purpose  : This is the main entry-point for the entire program.
             It initialises everything, starts the scheduler and dispatches
             all tasks.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
int main(void)
{
	long i;
	int ee = eedata[0]; // This is to prevent the linker from removing .eeprom section
	
	disable_interrupts();      // no interrupts yet
	initialise_system_clock(); // set main-clock to 16 MHz
	setup_gpio_ports();        // Initialise all GPIO ports
	setup_timer2();            // set TMR2 clock to 1 kHz for interrupt

	// Initialise all tasks for the scheduler
    scheduler_init();                    // init. task scheduler
    add_task(adc_task ,"ADC",  0,  500); // every 500 msec.
    add_task(std_task ,"STD", 50,  100); // every 100 msec.
    add_task(ctrl_task,"CTL",200, 1000); // every second
    add_task(prfl_task,"PRF",300,60000); // every minute / hour
	enable_interrupts();                 // enable interrupts

	while (1)
	{ 	// background-processes
        dispatch_tasks();     // Run task-scheduler()
        wait_for_interrupt(); // do nothing
	} // while
} // main()