/*==================================================================
  File Name    : stc1000p_lib.c
  Author       : Mats Staffansson / Emile
  ------------------------------------------------------------------
  Purpose : This files contains the relevant functions for the menu,
            thermostat control and other functions needed for th
            STC1000 thermostat hardware WR-032.

            Most of these functions are directly copied from the
            Github library https://github.com/matsstaff/stc1000p.

            The original source is created by Mats Staffansson and
            adapted for the STM8S uC by Emile.
  ------------------------------------------------------------------
  STC1000+ is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
 
  STC1000+ is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
 
  You should have received a copy of the GNU General Public License
  along with STC1000+.  If not, see <http://www.gnu.org/licenses/>.
  ------------------------------------------------------------------
  $Log: $
  ==================================================================
*/ 
#include "stc1000p_lib.h"

// LED character lookup table (0-9)
const uint8_t led_lookup[] = {LED_0,LED_1,LED_2,LED_3,LED_4,LED_5,LED_6,LED_7,LED_8,LED_9};

//----------------------------------------------------------------------------
// These values are stored directly into EEPROM
//----------------------------------------------------------------------------
@eeprom int16_t eedata[] =
{
    // STM8S103F3 with 640 bytes EEPROM
   160, 24, 170, 24, 180, 24, 190, 24, 200, 144, 250, 48, 40, 0, 0, 0, 0, 0, 0, // Pr0 (SP0, dh0, ..., dh8, SP9)
   160, 24, 170, 24, 180, 24, 190, 24, 200, 144, 250, 48, 40, 0, 0, 0, 0, 0, 0, // Pr1 (SP0, dh0, ..., dh8, SP9)
   160, 24, 170, 24, 180, 24, 190, 24, 200, 144, 250, 48, 40, 0, 0, 0, 0, 0, 0, // Pr2 (SP0, dh0, ..., dh8, SP9)
   160, 24, 170, 24, 180, 24, 190, 24, 200, 144, 250, 48, 40, 0, 0, 0, 0, 0, 0, // Pr3 (SP0, dh0, ..., dh8, SP9)
   160, 24, 170, 24, 180, 24, 190, 24, 200, 144, 250, 48, 40, 0, 0, 0, 0, 0, 0, // Pr4 (SP0, dh0, ..., dh8, SP9)
   160, 24, 170, 24, 180, 24, 190, 24, 200, 144, 250, 48, 40, 0, 0, 0, 0, 0, 0, // Pr5 (SP0, dh0, ..., dh8, SP9)
   MENU_DATA(EEPROM_DEFAULTS) 1 // Last one is for POWER_ON
}; // eedata[]

// Global variables to hold LED data (for multiplexing purposes)
uint8_t top_100, top_10, top_1, top_01;  // 7-segments top row: 100s, 10s, 1s and 0.1s
uint8_t bot_100, bot_10, bot_1, bot_01;  // 7-segments bottom row: 100s, 10s, 1s and 0.1s

uint8_t  menustate     = MENU_IDLE; // Current STD state number for menu_fsm()
uint8_t  ret_state;                 // menustate to return to
bool     menu_is_idle  = true;  // No menu active within STD
bool     pwr_on        = true;  // True = power ON, False = power OFF
bool     fahrenheit    = false; // false = Celsius, true = Fahrenheit
bool     minutes       = false; // timing control: false = hours, true = minutes
bool     heating_loop  = true;  // true = heating-loop, false = cooling-loop
uint8_t  menu_item     = 0;     // Current menu-item: [0..NO_OF_PROFILES]
uint8_t  config_item   = 0;     // Current index within profile or parameter menu
uint8_t  m_countdown   = 0;     // Timer used within menu_fsm()
uint8_t  _buttons      = 0;     // Current and previous value of button states
int16_t  config_value;          // Current value of menu-item
int8_t   key_held_tmr;          // Timer for value change acceleration
uint8_t  sensor2_selected = 0;  // DOWN button pressed < 3 sec. shows 2nd temperature / pid_output
int16_t  hysteresis;            // th-mode: hysteresis for temp probe
int16_t  setpoint;              // local copy of SP variable
uint16_t curr_dur = 0;          // local counter for temperature duration
int16_t  pid_out  = 0;          // Output from PID controller in E-1 %
uint8_t  portd, porte;          // Needed for read_buttons()

// External variables, defined in other files
extern int16_t  temp_tc_pt; // Temperature in E-1 °C from TC or PT100
extern int16_t  kc;         // Parameter value for Kc value in %/°C
extern uint16_t ti;         // Parameter value for I action in seconds
extern uint16_t td;         // Parameter value for D action in seconds
extern uint8_t  ts;         // Parameter value for sample time [sec.]
extern uint8_t  hc164_val;  // Backup value for HC164 shift-register on frontpanel
extern uint16_t leds_out;   // Four LEDs on frontpanel (ALM1, OUT1, ALM2, AT)

// This contains the definition of the menu-items for the parameters menu
const struct s_menu menu[] = 
{
    MENU_DATA(TO_STRUCT)
}; // menu[]
#define MENU_SIZE (sizeof(menu)/sizeof(menu[0]))

/*-----------------------------------------------------------------------------
  Purpose  : This routine does a divide by 10 using only shifts
  Variables: n: the number to divide by 10
  Returns  : the result
  ---------------------------------------------------------------------------*/
uint16_t divu10(uint16_t n) 
{
  uint16_t q, r;

  q = (n >> 1) + (n >> 2);       // 1/2 + 1/4 = 3/4
  q = q + (q >> 4);              // 3/4 + 3/64 = 51/64
  q = q + (q >> 8);              // 51/64 + 51/(16384) = 13107/16384
  q = q >> 3;                    // 13107 / 131072
  r = n - ((q << 3) + (q << 1)); // 1 - (13107/16384 + 13107/65536) = 1/65536
  return q + ((r + 6) >> 4);     // 13107/131072 + 1/1048576 = 104857 / 1048576  
} // divu10()

/*-----------------------------------------------------------------------------
  Purpose  : This routine is called by menu_fsm() to show the name of the
             menu-item. This can be either one of the Profiles (Pr0, Pr1, ...),
             the text 'SET' (when in the parameter menu) of the text 'th' when
             in thermostat mode.
  Variables: run_mode: [0..NR_OF_PROFILES]
             is_menu : 0=thermostat mode, 1=within a menu         
  Returns  : -
  ---------------------------------------------------------------------------*/
void prx_to_led(uint8_t run_mode)
{
    bot_100  = LED_OFF;
    if (run_mode < THERMOSTAT_MODE)
    {   // one of the profiles
        bot_10 = LED_P; 
        bot_1  = LED_r;
        bot_01 = led_lookup[run_mode];
    } 
    else if (ts == 0) 
    { // Thermostat Mode
        bot_100 = bot_01 = LED_OFF;
        bot_10  = LED_t;
        bot_1   = LED_h;
    } // else if
    else 
    {   // PID controller mode
        bot_10 = LED_P; 
        bot_1  = LED_I;
        bot_01 = LED_d;
    } // else
} // prx_to_led()

/*-----------------------------------------------------------------------------
  Purpose  : This routine converts the number in value to a BCD digit.
             Which digit to convert is specified by digit (1000, 100, 10).
  Variables: *value  : the value to convert into a BCD code
             digit   : 1000, 100, 10, 1
             *led    : the 7-segment display variable
             lz      : 1 = leading zero, 0 = display off
  Returns  : -
  ---------------------------------------------------------------------------*/
void val_to_bcd(int16_t *value, uint16_t digit, uint8_t *led, uint8_t lz)
{
    uint8_t i;
    
	if (*value >= digit)
    {
	   for(i = 0; *value >= digit; i++)
       {
	      *value -= digit;
	   } // for
	   *led = led_lookup[i & 0x0f];
	} 
    else if (lz)
         *led = LED_0;   // Leading zero
    else *led = LED_OFF; // display off
} // val_to_bcd()

/*-----------------------------------------------------------------------------
  Purpose  : This routine is called by menu_fsm() to show the value of a
             temperature or a non-temperature value.
             In case of a temperature, a decimal point is displayed (for 0.1).
             In case of a non-temperature value, only the value itself is shown.
  Variables: value  : the value to display
             decimal: 0=display as integer, 1=display temperature as xxx.1
             row    : ROW_TOP = display on top row of 7-segment displays
                      ROW_BOT = display on bottom row of 7-segment displays
  Returns  : -
  ---------------------------------------------------------------------------*/
void value_to_led(int16_t value, uint8_t decimal, uint8_t row) 
{
	uint8_t i;           // loop-variable
    int16_t val = value; // copy of value
    int16_t val2;        // copy of val
    uint8_t *p100, *p10, *p1, *p01; // pointers to 7-segment display values
    
    if (val < 0) 
    {  // Handle negative values
       val  = -val;
       if (val >= 1000) 
       {
          val = divu10(val); // loose the decimal
          decimal = 0;       // no decimal point 
       } // if
	} // if
    val2 = val;
    
    if (row == ROW_TOP)
    {
        p100 = &top_100; p10  = &top_10;
        p1   = &top_1;   p01  = &top_01;
    }
    else
    {   // row == ROW_BOT
        p100 = &bot_100; p10  = &bot_10;
        p1   = &bot_1;   p01  = &bot_01;
    } // else
    
	// Convert value to BCD and set LED outputs
	val_to_bcd(&val, 1000, p100,0); 
	val_to_bcd(&val,  100, p10 ,(*p100 != LED_OFF));
	val_to_bcd(&val,   10, p1  ,(*p10  != LED_OFF));
	val_to_bcd(&val,    1, p01 ,1);

    if (decimal == 1)
    {  // this is a temperature
       if (*p1 == LED_OFF) *p1 = LED_0; // add leading zero if needed
	   *p1 |= LED_DP;                   // add decimal point
	} // if

    if (value < 0)
    {   // original value < 0 
        if ((val2 < 10) && (decimal == 0)) 
                              *p1   = LED_MIN;
        else if (val2 < 100)  *p10  = LED_MIN;
        else if (val2 < 1000) *p100 = LED_MIN;
        // else value >= 1000: prevented by divu10()
    } // if
} // value_to_led()

/*-----------------------------------------------------------------------------
  Purpose  : This task updates the current running profile. A profile consists
             of several temperature-time pairs. When a time-out occurs, the
             next temperature-time pair within that profile is selected.
             Updates are stored in the EEPROM configuration.
             It is called once every hour on the hour or every minute.
  Variables: minutes: timing control: false = hours, true = minutes
  Returns  : -
  ---------------------------------------------------------------------------*/
void update_profile(void)
{
  uint8_t  profile_no = eeprom_read_config(EEADR_MENU_ITEM(rn));
  uint8_t  curr_step;            // Current step number within a profile
  uint8_t  profile_step_eeaddr;  // Address index in eeprom for step nr in profile
  uint16_t profile_step_dur;     // Duration of current step
  int16_t  profile_next_step_sp; // Setpoint value of next step in profile
  int16_t  profile_step_sp;      // Setpoint value of current step in profile
  uint16_t t;
  int32_t  sp;
  uint8_t  i;

  // Running profile?
  if (profile_no < THERMOSTAT_MODE) 
  {
      curr_step = eeprom_read_config(EEADR_MENU_ITEM(St));
      if (minutes) // is timing-control in minutes?
           curr_dur++;
      else curr_dur = eeprom_read_config(EEADR_MENU_ITEM(dh)) + 1;

      // Sanity check
      if(curr_step > NO_OF_TT_PAIRS-1) curr_step = NO_OF_TT_PAIRS - 1;

      profile_step_eeaddr  = EEADR_PROFILE_SETPOINT(profile_no, curr_step);
      profile_step_dur     = eeprom_read_config(profile_step_eeaddr + 1);
      profile_next_step_sp = eeprom_read_config(profile_step_eeaddr + 2);

      // Reached end of step?
      if (curr_dur >= profile_step_dur) 
      {   // Update setpoint with value from next step
        if (minutes) setpoint = profile_next_step_sp;
        eeprom_write_config(EEADR_MENU_ITEM(SP), profile_next_step_sp);
        // Is this the last step (next step is number 9 or next step duration is 0)?
        if ((curr_step == NO_OF_TT_PAIRS-1) || eeprom_read_config(profile_step_eeaddr + 3) == 0) 
        {   // Switch to thermostat mode.
            eeprom_write_config(EEADR_MENU_ITEM(rn), THERMOSTAT_MODE);
            return; // Fastest way out...
        } // if
        curr_dur = 0; // Reset duration
        curr_step++;  // Update step
        eeprom_write_config(EEADR_MENU_ITEM(St), curr_step);
      } // if
      else if (eeprom_read_config(EEADR_MENU_ITEM(rP))) 
      {  // Is ramping enabled?
         profile_step_sp = eeprom_read_config(profile_step_eeaddr);
         t  = curr_dur << 6;
         sp = 32;
         for (i = 0; i < 64; i++) 
         {   // Linear interpolation of new setpoint (64 substeps)
             if (t >= profile_step_dur) 
             {
                t  -= profile_step_dur;
                sp += profile_next_step_sp;
             } // if
             else 
             {
                sp += profile_step_sp;
             } // else
         } // for
         sp >>= 6;
         // Update setpoint
         if (minutes) // is timing-control in minutes?
              setpoint = sp;
         else eeprom_write_config(EEADR_MENU_ITEM(SP), sp);
      } // else if
      if (!minutes)
      {   // Update duration
          eeprom_write_config(EEADR_MENU_ITEM(dh), curr_dur);
      } // if
   } // if
} // update_profile()

/*-----------------------------------------------------------------------------
  Purpose  : This routine checks if a value is within a minimum and maximul value.
             If the value is larger than the maximum, the minimum value is 
             returned (roll-over). If the value is smaller than the minimum, 
             the maximum value is returned (roll-over).
  Variables: x  : the value to check
             min: the minimum allowed value         
             max: the maximum allowed value         
  Returns  : the value itself, or the roll-over value in case of a max./min.
  ---------------------------------------------------------------------------*/
int16_t range(int16_t x, int16_t min, int16_t max)
{
    if (x > max) return min;
    if (x < min) return max;
    return x;
} // range()

/*-----------------------------------------------------------------------------
  Purpose  : This routine checks a parameter value and constrains it to a 
             maximum/minimum value.
  Variables: config_value : the value to check for
             eeadr        : the number of a 16-bit variable within the EEPROM.         
  Returns  : the value itself, or the roll-over value in case of a max./min.
  ---------------------------------------------------------------------------*/
int16_t check_config_value(int16_t config_value, uint8_t eeadr)
{
    int16_t t_min = 0, t_max = 999;
    uint8_t type;
    
    if (eeadr < EEADR_MENU)
    {   // One of the Profiles
        while (eeadr >= PROFILE_SIZE)
        {   // Find the eeprom address within a profile
            eeadr -= PROFILE_SIZE;
        } // while
        if (!(eeadr & 0x1))
            {   // Only constrain a temperature
            t_min = (fahrenheit ? TEMP_MIN_F : TEMP_MIN_C);
            t_max = (fahrenheit ? TEMP_MAX_F : TEMP_MAX_C);
        } // if
        } else { // Parameter menu
            type = menu[eeadr - EEADR_MENU].type;
        if (type == t_temperature)
            {
            t_min = (fahrenheit ? TEMP_MIN_F : TEMP_MIN_C);
            t_max = (fahrenheit ? TEMP_MAX_F : TEMP_MAX_C);
        } else if (type == t_tempdiff)
            {   // the temperature correction variables
            t_min = (fahrenheit ? TEMP_CORR_MIN_F : TEMP_CORR_MIN_C);
            t_max = (fahrenheit ? TEMP_CORR_MAX_F : TEMP_CORR_MAX_C);
        } else if (type == t_parameter)
        {
            t_max = 9999;
            if (eeadr == EEADR_MENU_ITEM(Hc)) 
            {   // Kc parameter for PID: enable heating and cooling-loop
                t_min = -9999; 
            } // if
        } else if (type == t_boolean)
            {   // the control variables
            t_max = 1;
        } else if (type == t_hyst_1)
            {
            t_max = (fahrenheit ? TEMP_HYST_1_MAX_F : TEMP_HYST_1_MAX_C);
        } else if (type == t_hyst_2)
            {
            t_max = (fahrenheit ? TEMP_HYST_2_MAX_F : TEMP_HYST_2_MAX_C);
        } else if (type == t_sp_alarm)
            {
            t_min = (fahrenheit ? SP_ALARM_MIN_F : SP_ALARM_MIN_C);
            t_max = (fahrenheit ? SP_ALARM_MAX_F : SP_ALARM_MAX_C);
        } else if(type == t_step)
            {
            t_max = NO_OF_TT_PAIRS;
        } else if (type == t_delay)
            {
            t_max = 60;
        } else if (type == t_runmode)
        {
            t_max = NO_OF_PROFILES;
        } // else if
    } // else
    return range(config_value, t_min, t_max);
} // check_config_value()

/*-----------------------------------------------------------------------------
  Purpose  : This routine reads the values of the buttons and returns the
             result. Routine should be called every 100 msec.
             The result is returned in the global variable _buttons. 
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void read_buttons(void)
{
    uint8_t i,hc164_state;
    
    disable_interrupts();     // Disable interrups while reading buttons
    // Save registers that interferes with keys
    hc164_state = hc164_val;      // save current hc164_val
    set_hc164(0x00);
    porte   = PE_IDR & SEG7_C;    // Save 7-segment C status
    portd   = PD_IDR & PORTD_OUT; // Save other 7-segments
    PE_ODR |= SEG7_C;             // disable 7-segment display C
    PD_ODR |= PORTD_OUT;          // disable all other 7-segment displays
    for (i = 0x08; i > 0x00; i >>= 1)
    {  // Read UP, DOWN, LEFT, S keys
       _buttons <<= 1;
       _buttons  &= 0xFE; // clear bit 0
       set_hc164(i);
       if (PC_IDR & KEYS) _buttons |= 0x01;
       set_hc164(0x00);
    } // for i
    
    // Restore registers that interferes with keys
    PD_ODR &= ~PORTD_OUT;
    PD_ODR |= portd;        // restore PORTD
    PE_ODR &= ~SEG7_C;
    PE_ODR |= porte;        // restore PORTE
    set_hc164(hc164_state); // restore HC164 state
    enable_interrupts();    // Re-enable Interrupts
} // read_buttons()

/*-----------------------------------------------------------------------------
  Purpose  : This routine is the Finite State Machine (FSM) that controls the
             menu for the 7-segment displays and should be called every 100 msec.
             It used a couple of global variables.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void menu_fsm(void)
{
   uint8_t run_mode, adr, type, eeadr_sp;
   
   if (m_countdown) m_countdown--; // countdown counter
    
   switch (menustate)
   {
        //--------------------------------------------------------------------         
        case MENU_IDLE:
            leds_out &= ~LED_ALM2;
            pwr_on = eeprom_read_config(EEADR_POWER_ON);
            if (BTN_PRESSED(BTN_LEFT))
            {
                m_countdown = TMR_POWERDOWN;
                menustate   = MENU_POWER_DOWN_WAIT;
            } else if (!pwr_on)
            {
                leds_out = 0x00;
            } else if (_buttons)
            {
                if (BTN_PRESSED(BTN_UP))
                {   // UP button pressed
                    menustate = MENU_SHOW_VERSION;
                } else if (BTN_PRESSED(BTN_DOWN))
                {   // DOWN button pressed
                    m_countdown = TMR_SHOW_PROFILE_ITEM;
                    menustate   = MENU_SHOW_STATE_DOWN;
                } else if (BTN_RELEASED(BTN_SET))
                {   // S button pressed
                    menustate = MENU_SHOW_MENU_ITEM;
                } // else if
            } // else
	    break;
        //--------------------------------------------------------------------         
        case MENU_POWER_DOWN_WAIT:
            if (m_countdown == 0)
            {
                pwr_on = eeprom_read_config(EEADR_POWER_ON);
                pwr_on = !pwr_on;
                eeprom_write_config(EEADR_POWER_ON, pwr_on);
                if (pwr_on)
                {
                    eeprom_write_config(EEADR_MENU_ITEM(St), 0);
                    curr_dur = 0;
                    eeprom_write_config(EEADR_MENU_ITEM(dh), curr_dur);
                } // if
                menustate = MENU_IDLE;
            } else if(!BTN_HELD(BTN_LEFT))
            {   // 0 = PV + SP display, 1 = pid-output
                if (++sensor2_selected > 1) sensor2_selected = 0;
                menustate = MENU_IDLE;
            } // else if
        break; // MENU_POWER_DOWN_WAIT
        //--------------------------------------------------------------------         
        case MENU_SHOW_VERSION: // Show STC1000p version number
            top_100 = LED_S; top_10 = LED_u; top_1 = LED_E; top_01 = LED_r;
            value_to_led(STC1000P_VERSION,LEDS_INT, ROW_BOT);
            bot_10 |= LED_DP; bot_1  |= LED_DP;
            if(!BTN_HELD(BTN_UP)) menustate = MENU_IDLE;
	    break;
        //--------------------------------------------------------------------         
        case MENU_SHOW_STATE_DOWN: // Show Profile-number
            run_mode = eeprom_read_config(EEADR_MENU_ITEM(rn));
            top_100 = LED_OFF; top_10 = LED_r; top_1 = LED_u; top_01 = LED_n;
            prx_to_led(run_mode); // display run_mode on bottom row
            if ((run_mode < THERMOSTAT_MODE) && (m_countdown == 0))
            {
                m_countdown = TMR_SHOW_PROFILE_ITEM;
                menustate   = MENU_SHOW_STATE_DOWN_2;
            } // if
            if (!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
	    break;
        //--------------------------------------------------------------------         
        case MENU_SHOW_STATE_DOWN_2: // Show current step number within profile
            top_10  = LED_S; top_1 = LED_t; 
            top_100 = top_01 = LED_OFF;
            value_to_led(eeprom_read_config(EEADR_MENU_ITEM(St)),LEDS_INT, ROW_BOT);
            if (m_countdown == 0)
            {
                m_countdown = TMR_SHOW_PROFILE_ITEM;
                menustate   = MENU_SHOW_STATE_DOWN_3;
            }
            if(!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
	    break;
        //--------------------------------------------------------------------         
        case MENU_SHOW_STATE_DOWN_3: // Show current duration of running profile
            top_10  = LED_d; top_1 = LED_h; 
            top_100 = top_01 = LED_OFF;
            if (minutes) // is timing-control in minutes?
                 value_to_led(curr_dur,LEDS_INT, ROW_BOT);
            else value_to_led(eeprom_read_config(EEADR_MENU_ITEM(dh)),LEDS_INT,ROW_BOT);
            if (m_countdown == 0)
            {   // Time-Out
                m_countdown = TMR_SHOW_PROFILE_ITEM;
                menustate   = MENU_SHOW_STATE_DOWN;
            } // if
            if (!BTN_HELD(BTN_DOWN))
            {   // Down button is released again
                menustate = MENU_IDLE;
            } // if
        break; // MENU_SHOW_STATE_DOWN_3
        //--------------------------------------------------------------------         
        case MENU_SHOW_MENU_ITEM: // S-button was pressed
            top_100 = LED_S;   top_10  = LED_E; top_1 = LED_t; 
            top_01  = bot_01 = LED_OFF; bot_100 = LED_P;
            if (menu_item < NO_OF_PROFILES)
            {   // one of the profiles
                bot_10 = LED_r;
                bot_1  = led_lookup[menu_item];
            } else {
                bot_10 = LED_A;
                bot_1  = LED_r;
            } // else
            m_countdown = TMR_NO_KEY_TIMEOUT;
            menustate   = MENU_SET_MENU_ITEM;
        break; // MENU_SHOW_MENU_ITEM
        //--------------------------------------------------------------------         
        case MENU_SET_MENU_ITEM:
            if (m_countdown == 0 || BTN_RELEASED(BTN_LEFT))
            {   // On Time-out of S-button released, go back
                menustate = MENU_IDLE;
            } else if(BTN_RELEASED(BTN_UP))
            {
                if(++menu_item > MENU_ITEM_NO) menu_item = 0;
                menustate = MENU_SHOW_MENU_ITEM;
            } else if(BTN_RELEASED(BTN_DOWN))
            {
                if(--menu_item > MENU_ITEM_NO) menu_item = MENU_ITEM_NO;
                menustate = MENU_SHOW_MENU_ITEM;
            } else if(BTN_RELEASED(BTN_SET))
            {   // only go to next state if S-button is released
                config_item = 0;
                menustate   = MENU_SHOW_CONFIG_ITEM;
            } // else if
        break; // MENU_SET_MENU_ITEM
        //--------------------------------------------------------------------         
        case MENU_SHOW_CONFIG_ITEM: // S-button is released
            if (menu_item < MENU_ITEM_NO)
            {
                if(config_item & 0x1) 
                {   
                    top_100 = LED_d; // duration: 2nd value of a profile-step
                    top_10  = LED_h;
                } else {
                    top_100 = LED_S; // setpoint: 1st value of a profile-step
                    top_10  = LED_P;
                } // else
                top_1  = led_lookup[menu_item];
                top_01 = led_lookup[(config_item >> 1)];
            } else /* if (menu_item == 6) */
            {   // show parameter name
                top_100 = LED_OFF;
                top_10  = menu[config_item].led_c_10;
                top_1   = menu[config_item].led_c_1;
                top_01  = menu[config_item].led_c_01;
            } // else
            adr          = MI_CI_TO_EEADR(menu_item, config_item);
            config_value = eeprom_read_config(adr);
            config_value = check_config_value(config_value, adr);
            m_countdown  = TMR_NO_KEY_TIMEOUT;
            ret_state    = MENU_SET_CONFIG_ITEM;  // return state
            menustate    = MENU_SHOW_CONFIG_VALUE; // display config value
            break;
        //--------------------------------------------------------------------         
        case MENU_SET_CONFIG_ITEM:
            leds_out |= LED_ALM2;
            if (m_countdown == 0)
            {   // Timeout, go back to idle state
                    menustate = MENU_IDLE;
            } else if (BTN_RELEASED(BTN_LEFT))
            {   // Go back
                menustate = MENU_SHOW_MENU_ITEM;
            } else if (BTN_RELEASED(BTN_UP))
            {
                config_item++;
                if (menu_item < MENU_ITEM_NO)
                {
                    if (config_item >= PROFILE_SIZE)
                    {
                        config_item = 0;
                    } // if
                } else {
                    if (config_item >= MENU_SIZE)
                    {
                        config_item = 0;
                    }
                    // Jump to exit code shared with BTN_DOWN case
                    // GOTO's are frowned upon, but avoiding code 
                    // duplication saves precious code space
                    goto chk_skip_menu_item;
                } // else
                ret_state = MENU_SHOW_CONFIG_ITEM;  // return state
                menustate = MENU_SHOW_CONFIG_VALUE; // display config value
            } else if (BTN_RELEASED(BTN_DOWN))
            {
                config_item--;
                if(menu_item < MENU_ITEM_NO)
                {   // One of the profiles
                    if (config_item >= PROFILE_SIZE)
                    {
                        config_item = PROFILE_SIZE-1;
                    } // if
                } else { // Menu with parameters
                    if (config_item > MENU_SIZE-1)
                    {
                        config_item = MENU_SIZE-1;
                    } // if
                    chk_skip_menu_item: // label for goto
                    if (!minutes && ((uint8_t)eeprom_read_config(EEADR_MENU_ITEM(rn)) >= THERMOSTAT_MODE))
                    {
                        if (config_item == St)
                        {   // Skip current profile-step and duration
                            config_item += 2;
                        } 
                        else if (config_item == dh)
                        {   // Skip current profile-step and duration
                            config_item -= 2;
                        } // else if
                    } // if
                } // else
                ret_state = MENU_SHOW_CONFIG_ITEM;  // return to this state
                menustate = MENU_SHOW_CONFIG_VALUE; // display config value
            } else if(BTN_RELEASED(BTN_SET))
            {   // S-button is released again
                m_countdown  = TMR_NO_KEY_TIMEOUT;
                menustate    = MENU_SET_CONFIG_VALUE;  // display config value
            } // else if
            adr          = MI_CI_TO_EEADR(menu_item, config_item);
            config_value = eeprom_read_config(adr);
            config_value = check_config_value(config_value, adr);
       break; // MENU_SET_CONFIG_ITEM
       //--------------------------------------------------------------------         
       case MENU_SHOW_CONFIG_VALUE:
            if(menu_item < MENU_ITEM_NO)
            {   // Display duration as integer, temperature in 0.1
                value_to_led(config_value, (config_item & 0x1) ? LEDS_INT : LEDS_TEMP, ROW_BOT);
            } else 
            {   // menu_item == MENU_ITEM_NO
                type = menu[config_item].type;
                if(MENU_TYPE_IS_TEMPERATURE(type))
                {   // temperature, display in 0.1
                    value_to_led(config_value,LEDS_TEMP, ROW_BOT);
                } else if (type == t_runmode)
                {
                    prx_to_led(config_value);
                } else { // others, display as integer
                    value_to_led(config_value,LEDS_INT, ROW_BOT);
                } // else
            } // else
            m_countdown  = TMR_NO_KEY_TIMEOUT;
            menustate    = ret_state; // return to indicated state
            break;
       //--------------------------------------------------------------------         
       case MENU_SET_CONFIG_VALUE:
            leds_out |= LED_ALM2 | LED_ALM2_BLINK;
            adr = MI_CI_TO_EEADR(menu_item, config_item);
            if (m_countdown == 0)
            {
                menustate = MENU_IDLE;
            } else if (BTN_RELEASED(BTN_LEFT))
            {
                menustate = MENU_SHOW_CONFIG_ITEM;
            } else if(BTN_HELD_OR_RELEASED(BTN_UP)) 
            {
                config_value++;
                if ((config_value > 1000) || (--key_held_tmr < 0))
                {
                    config_value += 9;
                } // if
                /* Jump to exit code shared with BTN_DOWN case */
                goto chk_cfg_acc_label;
            } else if(BTN_HELD_OR_RELEASED(BTN_DOWN)) 
            {
                config_value--;
                if ((config_value > 1000) || (--key_held_tmr < 0))
                {
                    config_value -= 9;
                } // if
            chk_cfg_acc_label: // label for goto
                config_value = check_config_value(config_value, adr);
                ret_state    = MENU_SET_CONFIG_VALUE;  // return to this state
                menustate    = MENU_SHOW_CONFIG_VALUE; // show config_value
            } else if(BTN_RELEASED(BTN_SET))
            {
                if (menu_item == MENU_ITEM_NO)
                {   // We are in the parameter menu
                    if (config_item == rn)
                    {   // When setting run-mode, clear current step & duration
                        eeprom_write_config(EEADR_MENU_ITEM(St), 0);
                        if (minutes)
                             curr_dur = 0;
                        else eeprom_write_config(EEADR_MENU_ITEM(dh), 0);
                        if (config_value < THERMOSTAT_MODE)
                        {
                            eeadr_sp = EEADR_PROFILE_SETPOINT(((uint8_t)config_value), 0);
                            // Set initial value for SP
                            if (minutes)
                            {
                                setpoint = eeprom_read_config(eeadr_sp);
                                eeprom_write_config(EEADR_MENU_ITEM(SP), setpoint);
                            } else {
                                eeprom_write_config(EEADR_MENU_ITEM(SP), eeprom_read_config(eeadr_sp));
                            } // else if
                            // Hack in case inital step duration is '0'
                            if (eeprom_read_config(eeadr_sp+1) == 0)
                            {   // Set to thermostat mode
                                config_value = THERMOSTAT_MODE;
                            } // if
                        } // if
                    } // if
                } // if
                eeprom_write_config(adr, config_value);
                menustate = MENU_SHOW_CONFIG_ITEM;
            } else 
            {   // reset timer to default value
                key_held_tmr = TMR_KEY_ACC; 
            } // else
            break; // MENU_SET_CONFIG_VALUE
       //--------------------------------------------------------------------         
       default:
            menustate = MENU_IDLE;
            break;
   } /* switch(menustate) */
   menu_is_idle = (menustate == MENU_IDLE); // needed for ctrl_task()
} // button_menu_fsm()

/*-----------------------------------------------------------------------------
  Purpose  : This routine converts a menu item in minutes to a value in seconds.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
uint16_t min_to_sec(enum menu_enum x)
{
    uint16_t retv;
   
    retv = eeprom_read_config(EEADR_MENU_ITEM(x)) << 6; // * 64
    retv = retv - (retv >> 4); // 64 - 4 = 60
    return retv;
} // min_to_sec()

/*-----------------------------------------------------------------------------
  Purpose  : This routine initialises the heating and cooling delays.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void init_temp_delays(void)
{
    if (!minutes) setpoint = eeprom_read_config(EEADR_MENU_ITEM(SP));
    hysteresis   = eeprom_read_config(EEADR_MENU_ITEM(hy));
    heating_loop = (eeprom_read_config(EEADR_MENU_ITEM(Hc)) > 0);
} // init_temp_delays()

/*-----------------------------------------------------------------------------
  Purpose  : This routine controls the temperature setpoints. It should be 
             called once every second by ctrl_task().
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void temperature_control(void)
{
    init_temp_delays(); // Initialise Heating and Cooling delay

    // This is the thermostat logic
    if (!pwr_on ||
       ((pid_out < 0) && (temp_tc_pt <= setpoint)) || 
       ((pid_out > 0) && (temp_tc_pt >= setpoint)))
    {
        pid_out = 0; // Disable SSR
    } // if
    else if (pid_out == 0) 
    {
        if (!heating_loop && (temp_tc_pt > setpoint + hysteresis)) 
             pid_out = -1000;
        if (heating_loop && (temp_tc_pt < setpoint - hysteresis))
             pid_out = +1000;
    } // else if
} // temperature_control()

/*-----------------------------------------------------------------------------
  Purpose  : This routine controls the PID controller. It should be 
             called once every second by ctrl_task() as long as TS is not 0. 
             The PID controller itself is called every TS seconds.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void pid_control(bool init)
{
    static uint8_t pid_tmr = 0;
    
    init_temp_delays(); // Initialise Heating and Cooling delay

    if (kc != eeprom_read_config(EEADR_MENU_ITEM(Hc)) ||
        ti != eeprom_read_config(EEADR_MENU_ITEM(Ti)) ||
        td != eeprom_read_config(EEADR_MENU_ITEM(Td)) || init)
    {   // One or more PID parameters have changed
       kc = eeprom_read_config(EEADR_MENU_ITEM(Hc));
       ti = eeprom_read_config(EEADR_MENU_ITEM(Ti));
       td = eeprom_read_config(EEADR_MENU_ITEM(Td));
       init_pid(kc,ti,td,ts,temp_tc_pt); // Init PID controller
    } // if
    
    if (++pid_tmr >= ts) 
    {   // Call PID controller every TS seconds
        pid_ctrl(temp_tc_pt,&pid_out,setpoint);
        pid_tmr = 0;
    } // if
} // pid_control()
