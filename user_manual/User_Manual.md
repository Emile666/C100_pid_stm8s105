C100-PID STM8 USER MANUAL<br>
=====================

Emile

© 2017

# Changelog

2017:	First version of C100 PID with ported firmware from STC1000p<br>

# Features

* Fahrenheit or Celsius display selectable with **CF** parameter
* Minutes or hours time-base selectable with **Hrs** parameter
* PID-controller selectable with adjustable **Kc**, **Ti**, **Td** and **Ts** parameters
* PID-output polarity selectable with **Kc** parameter. Forward-acting (heating-loop) or reverse-acting (cooling-loop)
* PID-output signal (slow PWM, T=12.5 sec) present at **SSR output** for connection to a Solid-State Relay (SSR)
* K-type thermocouple and PT100 sensor are supported
* Up to 6 profiles with up to 10 setpoints
* Each setpoint can be held for 1-999 hours (i.e. up to ~41 days) or 1-999 minutes (i.e. up to ~16 hours).
* Approximative ramping
* Intuitive menus for configuring
* User definable alarm relay when temperature is out of or within range
* Easy displaying of setpoint, actual temperature and PID-output (%)

# Using the C100 PID firmware

## Navigation and menus

By default the current temperature is displayed in °C or °F on the top row of the display, depending on the **CF** parameter. Pressing the 'Set' button enters the menu. Pressing button 'Up' and 'Down' scrolls through the menu items. 
Button 'Set' selects and 'Left' button steps back or cancels current selection.

The menu is divided in two steps. When first pressing 'Set', the following choices are presented:

|Menu item|Description|
|--------|-------|
|Pr0|Set parameters for profile 0|
|Pr1|Set parameters for profile 1|
|Pr2|Set parameters for profile 2|
|Pr3|Set parameters for profile 3|
|Pr4|Set parameters for profile 4|
|Pr5|Set parameters for profile 5|
|Par|Parameter settings menu|
*Table 2: Menu items*

Selecting one of the profiles enters the submenu for that profile.

Pr0-5 submenus have the following items (x is the number of the profile itself):

|Sub menu item|Description|Values|
|--------|-------|-------|
|SPx0|Set setpoint 0|-40.0 to 140͒°C or -40.0 to 250°F|
|dhx0|Set duration 0|0 to 999 hours|
|...|Set setpoint/duration x|...|
|dhx8|Set duration 8|0 to 999 hours|
|SPx9|Set setpoint 9|-40.0 to 140°C or -40.0 to 250°F|
*Table 3: Profile sub-menu items*

You can change all the setpoints and durations associated with that profile from here. When running the programmed profile, *SPx0* will be the initial setpoint, it will be held for *dhx0* hours (unless ramping is used). 
After that *SPx1* will be used as setpoint for dhx1 hours. The profile will stop running when a duration (*dh*) of 0 hours OR last step is reached (consider *dh8* implicitly 0). When the profile has ended, C10-PID will automatically continu using the last reached setpoint. (So I guess you could also consider a *dh* value of 0 as infinite hours).

The settings menu has the following items:

|Sub menu item|Description|Values|
|---|---|---|
|SP|Set setpoint|-40 to 140°C or -40 to 250°F|
|hy|Set hysteresis|0.0 to 5.0°C or 0.0 to 10.0°F|
|tc|Set temperature correction for thermocouple sensor|-5.0 to 5.0°C or -10.0 to 10.0°F|
|tc2|Set temperature correction for PT100 sensor|-5.0 to 5.0°C or -10.0 to 10.0°F|
|SA|Setpoint alarm|0 = off, -40 to 40°C or -80 to 80°F|
|St|Set current profile step|0 to 4 (8)|
|dh|Set current profile duration|0 to 999 hours|
|rP|Ramping|0 = off, 1 = on|
|cF|Celsius or Fahrenheit display|0 = Celsius, 1 = Fahrenheit|
|At|Enable auto-tuning for PID-controller|0 = off, 1 = on|
|HrS|Select Hours or Minutes time-base|0 = minutes, 1 = hours|
|Hc|Kc parameter for PID-controller in %/°C|-9999 to 9999|
|Ti|Ti parameter for PID-controller in seconds|0 to 9999|
|Td|Td parameter for PID-controller in seconds|0 to 9999|
|Ts|Ts parameter for PID-controller in seconds|0 to 9999|
|rn|Set run mode|Pr0 to Pr5 and th|
*Table 4: Settings sub-menu items*

**Setpoint**, well... The desired temperature to keep. The way C100-PID firmware works, setpoint is *always* the value the PID-controller strives towards, even when running a profile. What the profile does is simply setting the setpoint at given times.

**Hysteresis**: This parameter is used when the thermostat controls the temperature (**Ts** is set to 0). This parameter then controls the allowable temperature range around the setpoint where the thermostat will not change state. For example: in a cooling-loop (**Hc** < 0) and the temperature is greater than setpoint + hysteresis, then the SSR-output will be engaged. Once the temperature reaches setpoint again, the SSR-output will be disengaged.
Similarly: in a heating-loop (**Hc** > 0) and the temperature is smaller than setpoint - hysteresis, then the SSR-output will be engaged. Once the temperature reaches setpoint again, the SSR-output will be disengaged.

**Temperature correction**, will be added to the thermocouple temperature sensor, this allows the user to calibrate the temperature reading. A K-type thermocouple sensor is the default sensor to use for the C100-PID. 

**Temperature correction 2**, same as *temperature correction*, but for the PT100 temperature sensor. A PT100 temperature sensor is more precise than a thermocouple, so if you want accurate temperature readings, it is better to buy a PT100 sensor and connect this to the C100-PID.

**Setpoint alarm**, if setpoint alarm is greater than 0.0, then the alarm will sound once temperature differs from *SP* by more than *SA* degrees (this can be useful to warn against malfunctions, such as fridge door not closed or probe not attached to carboy). If *SA* is less than 0.0, then the alarm will sound if the temperature does **NOT** differ by more than (-) *SA* degrees (this could be used as an indication that wort has finally reached pitching temp). If *SA* is set to 0.0, the alarm will be disabled. If the alarm is tripped, then the buzzer will sound and the display will flash between temperature display and showing "SA", it will not however disengage the outputs and the unit will continue to work as normal. Please note, that care needs to be taken when running a profile (especially when not using ramping or with steep ramps) to allow for a sufficiently large margin, or the alarm could be tripped when setpoint changes.

**Current profile step** and **current profile duration**, allows 'jumping' in the profile. Step and duration are updated automatically when running the profile, but can also be set manually at any time. Note that profile step and profile duration are the variables directly used to keep track of progress in a profile. Little or no validation is made of what values are entered. It is up to the user to know what he/she is doing by changing these values. Changing these values will not take effect until next point in profile is calculated, which could be as much as one hour. Every hour, current duration, *dh* (and if next step is reached, also current step, *St*) is updated with new value(s). That means in case of a power outage, STC-1000p-STM8 will pick up (to within the hour) from where it left off. Current profile step and current profile duration are only available in the menu when a profile is currently running.

**Ramping** can be used to gradually increase the setpoint when going from one setpoint to another. See below for a more detailed explanation.

**Celsius or Fahrenheit** can be used to set display mode for temperatures to Celsius or Fahrenheit. Note that the values stored in EEPROM are not directly changed with it, so if you change this, you need to make sure that the stored parameters are updated!

**Auto Tuning** modus is a separate process where the C100-PID tries to find optimum settings for **Hc**, **Ti** and **Td**. Note that the **Ts** needs to be set to a non-zero value first. The auto-tuning algorithm forces the pid-output to certain values and observes the temperature. From this, optimum settings are calculated for the PID parameter. This does not work for every plant, so use this with care! This is a future option and not implemented yet in this firmware.

**Hours or Minutes** can be used to select between a time-mode in hours or minutes. Typically the minutes time-mode is selected when you want to control a brewing-session. When controlling a fermentation in a climate controlled chamber, you typically select hours.

**Hc**, this is the proportional gain for the PID controller. It also selects the PID-mode: **forward-acting** (**Hc** > 0) or **reverse-acting** (**Hc** < 0). See below for a more detailed explanation.

**Ti**, this is the integral time-constant in seconds for the PID controller. See below for a more detailed explanation.

**Td**, this is the differential time-constant in seconds for the PID controller. See below for a more detailed explanation.

**Ts**, this is the sample-time in seconds for the PID controller. The PID-controller runs every **Ts** seconds. When set to 0, the PID-controller is disabled and normal thermostat (on-off) control is enabled. If you set this time too small, the pid-controller becomes too sensitive for changes in temperature. A decent value for temperature control is around 20-30 seconds (yes, that slow! It's temperature remember, doesn't change that quick). See below for a more detailed explanation.

**Run mode**, selecting *Pr0* to *Pr5* will start the corresponding profile running from step 0, duration 0. Selecting *th* (when **Ts** = 0) or *PId* (when **Ts** > 0) will switch to thermostat/PID mode, the last setpoint from the previously running profile will be retained as the current setpoint when switching from a profile to thermostat/PID mode.


## Thermostat mode (**Ts** = 0)

When mode is set to thermostat (the **Ts** parameter needs to be set to 0), setpoint, *SP*, will not change and the controller will aim to keep the temperature to within the range of *SP* ± *hy*. Much like how the normal STC-1000 firmware works. The thermostat control runs once every second. The PID-controller output with the **SSR output** is set to 100 % (fully-on) and 0 % (fully-off).

## PID-Control mode (**Ts** > 0)

When the **Ts** parameter is set to a value > 0, the PID-controller is enabled and thermostat-control is disabled. The PID-controller uses a sophisticated algorithm (a Takahashi Type C velocity algorithm) where the new output value is based upon the previous output value. The derivation of the algorithm for this controller is given in the .pdf document [PID Controller Calculus](./PID_Controller_Calculus.pdf).
The PID-controller is controlled with the *proportional gain*, *integral time-constant*, *differential time-constant* and the *Sample-Time*. They all work closely together. For more information on how to select optimum settings for a PID-controller, please refer to http://www.vandelogt.nl/uk_regelen_pid.php

The pid-output is a percentage between 0.0 and +100.0 %. It is in E-1 %, so a value of 123 actually means 12.3 %. This value can be seen by pressing the LEFT button. This is where the polarity of the **Hc** parameter comes into play. Set **Hc** to a positive value for a so-called **direct-acting** process loop. This means that when the PID-output increases, the temperature (which is the process variable, or PV) also eventually increases. Of course, a true process is usually a complex transfer function that includes time delays. Here, we are only interested in the direction of change of the process variable in response to a PID-output change. Most process loops will be **direct-acting**, such as a temperature loop. An increase in the heat applied increases the temperature. Accordingly, direct-acting loops are sometimes called heating loops.

![Direct-Acting](img/direct_acting.png)<br>
*A Direct-Acting process control loop*

If the **Hc** parameter is set to a negative value, a so-called **reverse-acting** process loop is selected. A **reverse-acting** loop is one in which the process has a negative gain, as shown below. An increase in the control output results in a decrease in temperature. This is commonly found in refrigeration controls, where an increase in the cooling input causes a decrease in the process variable (the temperature). Accordingly, reverse-acting loops are sometimes called cooling loops.

![Reverse-Acting](img/reverse_acting.png)<br>
*A Reverse-Acting process control loop*

**Source:** the above text and both images are copied from (and slightly adapted) from the DL05 Micro PLC User Manual, which has an excellent chapter (chapter 8) on PID-control.

The pid-output percentage is available at the **SSR output** as a slow PWM signal (period-time is 12.5 seconds), with the duty-cycle corresponding with the PID-output percentage.
For example: if the pid-output is equal to 200 (20.0 %), the **SSR output** is low (0 V) for 2.5 seconds and high (+5 V) for 10 seconds. This repeats continuously until another pid-output percentage is calculated. The Heating LED (when **Hc** is > 0) or the Cooling LED (when **Hc** is < 0) blinks at the same rate, so you can always see if the SSR is switched on.

## Running profiles

By entering the 'rn' submenu under settings and selecting a profile, the current duration, *dh*, and current step, *St*, is reset to zero and the initial setpoint for that profile, *SP0*, is loaded into *SP*. Even when running a profile, *SP* will always be the value the controller aims to keep. The profile simple updates *SP* during its course. When a profile is running the 'Set' LED on the display will be lit as an indication.

From the instant the profile is started a timer will be running, and every time that timer indicates that one hour has passed, current duration, *dh*, will be incremented. If and only if, it has reached the current step duration, *dhx*, current duration will be reset to zero and the current step, *St*, will be incremented and the next setpoint in the profile will be loaded into *SP*.  Note that all this only happens on one hour marks after the profile is started.

So, what will happen if the profile data is updated while the profile is running? Well, if that point has not been reached the data will be used. For example profile is running step 3 (with the first step being step 0). Then *SP3* has already been loaded into *SP*, so changing *SP0* - *SP3* will not have any effect on the current run. However, the duration *dh3* is still being evaluated every hour against the current duration, so changing it will have effect. 

Changing the current duration, *dh*, and current step, *St*, will also have effect, but the change will not be immediate, only on the next one hour mark will these new values be used in the calculation. You will need to know what you are doing when changing these values manually, but correctly used, it could come in handy.

Changing the setpoint, *SP*, when running a profile, will have immediate effect (as it is used by thermostat control), but it will be overwritten by profile when it reaches a new step.

Once the profile reaches the final setpoint, *SP5*, or a duration of zero hours, it will switch over to thermostat mode and maintain the last known setpoint indefinitely.

Finally, to stop a running profile, simply switch to thermostat mode.

## Ramping

The essence of ramping is to interpolate between the setpoints in a profile. This allows temperature changes to occur gradually instead of in steps.

Unfortunately, due to hardware limitations, true ramping (or true interpolation), is not feasible. So instead, an approximative approach is used.

Each step is divided into (at most) 64 substeps and on each substep, setpoint is updated by linear interpolation. The substeps only occur on one hour marks, so if the duration of the step is less than 64 hours, not all substeps will be used, if the duration is greater than 64 hours, setpoint will not be updated on every one hour mark, for example if duration is 192 hours (that is 8 days), setpoint will be updated every third hour).

Note, that in order to keep a constant temperature with ramping enabled, an extra setpoint with the same value will be needed (C100-PID will attempt to ramp between all setpoints, but if the setpoints are the same, then the setpoint will remain constant during the step).

You can think of the ramping as being true, even if this approximation is being used, the only caveat is, if you need a long ramp (over several days or weeks) and require it to be smoother. Then you may need to split it over several steps.

Another tip would be to try to design your profiles with ramping in mind, if possible (that is include the extra setpoints when keeping constant temperature is desired), even if you will not use ramping. That way, the profiles will work as expected even if ramping is enabled.

## Additional features

**Sensor alarm**, if the measured temperature is out of range (indicating the sensor is not connected properly or broken), the alarm-relay is enabled and display will show 'AL01'.

**Power off**, pressing and holding LEFT button for a few seconds when the controller is not in menu (showing current temperature), will disable everything and show 'OFF' on the display. To really power off, you need to cut mains power to the device. The soft power off state will remain after a power cycle. Long pressing the power off button again will bring it out of soft power off mode.

By pressing and holding 'up' button when temperature is showing, the firmware version number will be displayed.

By pressing and holding 'down' button when temperature is showing, *th* will be displayed if the controller is in thermostat mode or *PId* when in PID-mode. If a profile is running, it will cycle through *Prx* (where *x* is the profile number), current profile step and current profile duration, to indicate which profile is running and the progress made.

# Frontpanel LEDs
The C100-PID has four frontpanel LEDs and have the following meaning:
- ALM1: this LED corresponds to the alarm relay and lights when no temperaturesensor is connected. It also lights when the **SA** parameter is set and the temperature is out of range.
- OUT1: this corresponds to the SSR output. If the PID-output is 10 %, this LED is on for 1.25 seconds and off for 11.25 seconds
- ALM2: this LED is set upon entering a parameter change menu. It starts to blink when you are about to save a new value for a parameter
- AT: this LED blinks when a temperature profile is active

# Development

C100-PID is written in C and compiled using STVD with the Cosmic SMT8 C compiler. Best thing to do is to ask for a free license (www.cosmic-software.com), install the toolset and then install the STVD IDE. In this way, STVD integrates the Cosmic toolchain in its IDE.

## Useful tips for development

* You will need the STM8 reference-manual (the datasheet merely lists the hardware related issues).

* The Cosmic STM8 compiler has a code-size limit of 32 Kbytes, which is sufficient for our STM8 µC.

* The STVD IDE organises the source-files in projects (.stp) and workspaces (.stw). Use only 1 project per workspace. The default workspace file for C100-PID is C100_pid_stm8s105.stw.

* A separate scheduler (non pre-emptive) has been added to address all timing issues. See the source files scheduler.c and scheduler.h

* Hardware routines (interrupts, ADC, eeprom) have been copied from the STC1000p project.

# Other resources

Project home at [Github](https://github.com/Emile666/stc1000_stm8/)

# Acknowledgements

Many thanks to Mats Staffansson (https://github.com/matsstaff/stc1000p) for initial development of a STC1000p on the A400_P hardware (containing a **PIC16F1828** microcontroller). The **STM8S003F3** device is a bit more advanced and I was intrigued by the idea of doing the same as Mats has done. In the end I ended with a few more features than he had (and also fewer, since he had more different firmwares).

