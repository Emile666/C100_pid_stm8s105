/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "c100_pid_main.h"
#include "stdint.h"
#include "delay.h"
#include "stc1000p_lib.h"
#include "scheduler.h"

long delay_val = 100000;
int  irq_cnt   = 0;

// Global variables
bool      probe2 = false;    // cached flag indicating whether 2nd probe is active
uint8_t   leds_out;          // Four LEDs on frontpanel (ALM1, OUT1, ALM2, AT)
int16_t   temp_ntc1;         // The temperature in E-1 °C from NTC probe 1
int16_t   temp_ntc2;         // The temperature in E-1 °C from NTC probe 2
uint8_t   mpx_nr = 0;        // Used in multiplexer() function
int16_t   pwr_on_tmr = 1000;     // Needed for 7-segment display test
uint8_t   top_100,top_10,top_1, top_01;
uint8_t   hc164_val;

// External variables, defined in other files
extern int16_t  @eeprom eedata[]; // Link to .eeprom section
extern uint8_t led_e;                 // value of extra LEDs
extern uint8_t led_10, led_1, led_01; // values of 10s, 1s and 0.1s
extern bool    pwr_on;           // True = power ON, False = power OFF

/*-----------------------------------------------------------------------------
  Purpose  : This routine sets the HC164 shiftregister to a value x.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void set_hc164(uint8_t x)
{
    uint8_t i, j, p = 0x80;
    
    hc164_val = x; // save value
    SET_CLK_0;
    SET_SDIN_0;
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

#define PD_LEDS(x) (((x << 1) & 0x0C) | ((x << 4) & 0x10))
/*-----------------------------------------------------------------------------
  Purpose  : This routine multiplexes the 4 segments of the 7-segment displays.
             It runs at 1 kHz, so there's a full update after every 4 msec.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void multiplexer(void)
{
    LEDS_OFF;             // clear LEDs
    PC_ODR |= PORTC_LEDS; // disable 7-segment displays
    PD_ODR |= PORTD_LEDS; // disable 7-segment displays
    set_hc164(0x00);      // clear 7-segment displays
    
    switch (mpx_nr)
    {
        case 0: // output CA1 BOTTOM display (LSB)
            set_hc164(0x01);
            PC_ODR &= ~(led_e & PORTC_LEDS); // Update PC7..PC3
            PD_ODR &= ~PD_LEDS(led_e);       // Update PD4..PD2
            mpx_nr = 1;
            break;
        case 1: // output CA2 BOTTOM display
            set_hc164(0x02);
            PC_ODR &= ~(led_01 & PORTC_LEDS); // Update PC7..PC3
            PD_ODR &= ~PD_LEDS(led_01);       // Update PD4..PD2
            mpx_nr = 2;
            break;
        case 2: // output CA3 BOTTOM display
            set_hc164(0x04);
            PC_ODR &= ~(led_1 & PORTC_LEDS); // Update PC7..PC3
            PD_ODR &= ~PD_LEDS(led_1);       // Update PD4..PD2
            mpx_nr = 3;
            break;
        case 3: // outputs CA4 BOTTOM display (MSB)
            set_hc164(0x08);
            PC_ODR &= ~(led_10 & PORTC_LEDS); // Update PC7..PC3
            PD_ODR &= ~PD_LEDS(led_10);       // Update PD4..PD2
            mpx_nr = 4;
            break;
        case 4: // set Frontpanel LEDs
            set_hc164(0x00);
            LEDS_ENABLE;
            PC_ODR &= ~(leds_out & (LED_OUT1 | LED_AT));
            PD_ODR &= ~(leds_out & (LED_ALM1 | LED_ALM2));
            mpx_nr = 5;
            break;
        case 5: // output CA1 TOP display (LSB)
            set_hc164(0x10);
            PC_ODR &= ~(top_01 & PORTC_LEDS); // Update PC7..PC3
            PD_ODR &= ~PD_LEDS(top_01);       // Update PD4..PD2
            mpx_nr = 6;
            break;
        case 6: // output CA2 TOP display
            set_hc164(0x20);
            PC_ODR &= ~(top_1 & PORTC_LEDS); // Update PC7..PC3
            PD_ODR &= ~PD_LEDS(top_1);       // Update PD4..PD2
            mpx_nr = 7;
            break;
        case 7: // output CA3 TOP display
            set_hc164(0x40);
            PC_ODR &= ~(top_10 & PORTC_LEDS); // Update PC7..PC3
            PD_ODR &= ~PD_LEDS(top_10);       // Update PD4..PD2
            mpx_nr = 8;
            break;
        case 8: // outputs CA4 TOP display (MSB)
            set_hc164(0x80);
            PC_ODR &= ~(top_100 & PORTC_LEDS); // Update PC7..PC3
            PD_ODR &= ~PD_LEDS(top_100);       // Update PD4..PD2
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
	led_10     = LED_O;
	led_1      = led_01 = LED_F;
        led_e      = LED_OFF;
        pwr_on_tmr = 2000; // 2 seconds
    } // if
    else if (pwr_on_tmr > 0)
    {	// 7-segment display test for 2 seconds
        pwr_on_tmr--;
        led_10 = led_1 = led_01 = led_e = LED_ON;
    } // else if
    multiplexer();    // Run multiplexer for Display and Keys
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
    TIM2_PSCR = 0x04;  //  Prescaler = 16
    TIM2_ARRH = 0x03;  //  High byte of 1000
    TIM2_ARRL = 0xE8;  //  Low  byte of 1000
    TIM2_IER  = TIM2_IER_UIE; //  Enable the update interrupts, disable all others
    TIM2_CR1  = TIM2_CR1_CEN; //  Finally enable the timer
} // setup_timer2()

/*-----------------------------------------------------------------------------
  Purpose  : This routine initialises all the GPIO pins of the STM8 uC.
             See c100_test.h for a detailed description of all pin-functions.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void setup_gpio_ports(void)
{
    PA_ODR      = 0x00; // Turn off all pins from Port A
    PA_DDR     |= (LEDS | CLOCK | SDIN); // Set as output
    PA_CR1     |= (LEDS | CLOCK | SDIN); // Set to Push-Pull

    PB_ODR     &= ~KEYS;  // Turn off all pins from Port B
    PB_DDR     &= ~KEYS;  // Set PB5 as input
    PB_CR1     &= ~KEYS;  // Set PB5 to Floating-Input

    PC_ODR     &= ~PORTC_LEDS; // Turn off all pins from Port C
    PC_DDR     |= PORTC_LEDS;  // Set PC7..PC3 as outputs
    PC_CR1     |= PORTC_LEDS;  // Set PC7..PC3 to Push-Pull

    PD_ODR     &= ~PORTD_LEDS; // Turn off all pins from Port D
    PD_DDR     |= PORTD_LEDS;  // Set PD4..PD2 as outputs
    PD_CR1     |= PORTD_LEDS;  // Set PD4..PD2 to Push-Pull
} // setup_gpio_ports()

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
	
	disable_interrupts();
	initialise_system_clock();
	setup_gpio_ports();
	setup_timer2();

	// Initialise all tasks for the scheduler
    add_task(std_task ,"STD", 50,  100); // every 100 msec.
	enable_interrupts();

	while (1)
	{ 	// background-processes
        dispatch_tasks();     // Run task-scheduler()
        wait_for_interrupt(); // do nothing
	} // while
} // main()