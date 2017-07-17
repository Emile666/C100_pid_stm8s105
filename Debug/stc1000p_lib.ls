   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2523                     .const:	section	.text
2524  0000               _led_lookup:
2525  0000 e7            	dc.b	231
2526  0001 03            	dc.b	3
2527  0002 d6            	dc.b	214
2528  0003 97            	dc.b	151
2529  0004 33            	dc.b	51
2530  0005 b5            	dc.b	181
2531  0006 f5            	dc.b	245
2532  0007 07            	dc.b	7
2533  0008 f7            	dc.b	247
2534  0009 b7            	dc.b	183
2535                     .eeprom:	section	.data
2536  0000               _eedata:
2537  0000 00a0          	dc.w	160
2538  0002 0018          	dc.w	24
2539  0004 00aa          	dc.w	170
2540  0006 0018          	dc.w	24
2541  0008 00b4          	dc.w	180
2542  000a 0018          	dc.w	24
2543  000c 00be          	dc.w	190
2544  000e 0018          	dc.w	24
2545  0010 00c8          	dc.w	200
2546  0012 0090          	dc.w	144
2547  0014 00fa          	dc.w	250
2548  0016 0030          	dc.w	48
2549  0018 0028          	dc.w	40
2550  001a 0000          	dc.w	0
2551  001c 0000          	dc.w	0
2552  001e 0000          	dc.w	0
2553  0020 0000          	dc.w	0
2554  0022 0000          	dc.w	0
2555  0024 0000          	dc.w	0
2556  0026 00a0          	dc.w	160
2557  0028 0018          	dc.w	24
2558  002a 00aa          	dc.w	170
2559  002c 0018          	dc.w	24
2560  002e 00b4          	dc.w	180
2561  0030 0018          	dc.w	24
2562  0032 00be          	dc.w	190
2563  0034 0018          	dc.w	24
2564  0036 00c8          	dc.w	200
2565  0038 0090          	dc.w	144
2566  003a 00fa          	dc.w	250
2567  003c 0030          	dc.w	48
2568  003e 0028          	dc.w	40
2569  0040 0000          	dc.w	0
2570  0042 0000          	dc.w	0
2571  0044 0000          	dc.w	0
2572  0046 0000          	dc.w	0
2573  0048 0000          	dc.w	0
2574  004a 0000          	dc.w	0
2575  004c 00a0          	dc.w	160
2576  004e 0018          	dc.w	24
2577  0050 00aa          	dc.w	170
2578  0052 0018          	dc.w	24
2579  0054 00b4          	dc.w	180
2580  0056 0018          	dc.w	24
2581  0058 00be          	dc.w	190
2582  005a 0018          	dc.w	24
2583  005c 00c8          	dc.w	200
2584  005e 0090          	dc.w	144
2585  0060 00fa          	dc.w	250
2586  0062 0030          	dc.w	48
2587  0064 0028          	dc.w	40
2588  0066 0000          	dc.w	0
2589  0068 0000          	dc.w	0
2590  006a 0000          	dc.w	0
2591  006c 0000          	dc.w	0
2592  006e 0000          	dc.w	0
2593  0070 0000          	dc.w	0
2594  0072 00a0          	dc.w	160
2595  0074 0018          	dc.w	24
2596  0076 00aa          	dc.w	170
2597  0078 0018          	dc.w	24
2598  007a 00b4          	dc.w	180
2599  007c 0018          	dc.w	24
2600  007e 00be          	dc.w	190
2601  0080 0018          	dc.w	24
2602  0082 00c8          	dc.w	200
2603  0084 0090          	dc.w	144
2604  0086 00fa          	dc.w	250
2605  0088 0030          	dc.w	48
2606  008a 0028          	dc.w	40
2607  008c 0000          	dc.w	0
2608  008e 0000          	dc.w	0
2609  0090 0000          	dc.w	0
2610  0092 0000          	dc.w	0
2611  0094 0000          	dc.w	0
2612  0096 0000          	dc.w	0
2613  0098 00a0          	dc.w	160
2614  009a 0018          	dc.w	24
2615  009c 00aa          	dc.w	170
2616  009e 0018          	dc.w	24
2617  00a0 00b4          	dc.w	180
2618  00a2 0018          	dc.w	24
2619  00a4 00be          	dc.w	190
2620  00a6 0018          	dc.w	24
2621  00a8 00c8          	dc.w	200
2622  00aa 0090          	dc.w	144
2623  00ac 00fa          	dc.w	250
2624  00ae 0030          	dc.w	48
2625  00b0 0028          	dc.w	40
2626  00b2 0000          	dc.w	0
2627  00b4 0000          	dc.w	0
2628  00b6 0000          	dc.w	0
2629  00b8 0000          	dc.w	0
2630  00ba 0000          	dc.w	0
2631  00bc 0000          	dc.w	0
2632  00be 00a0          	dc.w	160
2633  00c0 0018          	dc.w	24
2634  00c2 00aa          	dc.w	170
2635  00c4 0018          	dc.w	24
2636  00c6 00b4          	dc.w	180
2637  00c8 0018          	dc.w	24
2638  00ca 00be          	dc.w	190
2639  00cc 0018          	dc.w	24
2640  00ce 00c8          	dc.w	200
2641  00d0 0090          	dc.w	144
2642  00d2 00fa          	dc.w	250
2643  00d4 0030          	dc.w	48
2644  00d6 0028          	dc.w	40
2645  00d8 0000          	dc.w	0
2646  00da 0000          	dc.w	0
2647  00dc 0000          	dc.w	0
2648  00de 0000          	dc.w	0
2649  00e0 0000          	dc.w	0
2650  00e2 0000          	dc.w	0
2651  00e4 00c8          	dc.w	200
2652  00e6 0032          	dc.w	50
2653  00e8 0064          	dc.w	100
2654  00ea 0003          	dc.w	3
2655  00ec fffe          	dc.w	-2
2656  00ee 0000          	dc.w	0
2657  00f0 0000          	dc.w	0
2658  00f2 0000          	dc.w	0
2659  00f4 0005          	dc.w	5
2660  00f6 0002          	dc.w	2
2661  00f8 0001          	dc.w	1
2662  00fa 0000          	dc.w	0
2663  00fc 0000          	dc.w	0
2664  00fe 0001          	dc.w	1
2665  0100 0050          	dc.w	80
2666  0102 0118          	dc.w	280
2667  0104 0014          	dc.w	20
2668  0106 0000          	dc.w	0
2669  0108 0006          	dc.w	6
2670  010a 0001          	dc.w	1
2671                     	bsct
2672  0000               _cooling_delay:
2673  0000 003c          	dc.w	60
2674  0002               _heating_delay:
2675  0002 003c          	dc.w	60
2676  0004               _menustate:
2677  0004 00            	dc.b	0
2678                     .bit:	section	.data,bit
2679  0000               _menu_is_idle:
2680  0000 01            	dc.b	1
2681  0001               _pwr_on:
2682  0001 01            	dc.b	1
2683  0002               _fahrenheit:
2684  0002 00            	dc.b	0
2685  0003               _minutes:
2686  0003 00            	dc.b	0
2687                     	bsct
2688  0005               _menu_item:
2689  0005 00            	dc.b	0
2690  0006               _config_item:
2691  0006 00            	dc.b	0
2692  0007               _m_countdown:
2693  0007 00            	dc.b	0
2694  0008               __buttons:
2695  0008 00            	dc.b	0
2696  0009               _sensor2_selected:
2697  0009 00            	dc.b	0
2698  000a               _curr_dur:
2699  000a 0000          	dc.w	0
2700  000c               _pid_out:
2701  000c 0000          	dc.w	0
2702                     	switch	.const
2703  000a               _menu:
2704  000a b5            	dc.b	181
2705  000b 76            	dc.b	118
2706  000c 00            	dc.b	0
2707  000d 00            	dc.b	0
2708  000e 71            	dc.b	113
2709  000f b3            	dc.b	179
2710  0010 00            	dc.b	0
2711  0011 02            	dc.b	2
2712  0012 71            	dc.b	113
2713  0013 b3            	dc.b	179
2714  0014 d6            	dc.b	214
2715  0015 03            	dc.b	3
2716  0016 f0            	dc.b	240
2717  0017 d0            	dc.b	208
2718  0018 00            	dc.b	0
2719  0019 01            	dc.b	1
2720  001a f0            	dc.b	240
2721  001b d0            	dc.b	208
2722  001c d6            	dc.b	214
2723  001d 01            	dc.b	1
2724  001e b5            	dc.b	181
2725  001f 77            	dc.b	119
2726  0020 00            	dc.b	0
2727  0021 04            	dc.b	4
2728  0022 b5            	dc.b	181
2729  0023 f0            	dc.b	240
2730  0024 00            	dc.b	0
2731  0025 05            	dc.b	5
2732  0026 d3            	dc.b	211
2733  0027 71            	dc.b	113
2734  0028 00            	dc.b	0
2735  0029 08            	dc.b	8
2736  002a d0            	dc.b	208
2737  002b d3            	dc.b	211
2738  002c 00            	dc.b	0
2739  002d 06            	dc.b	6
2740  002e 71            	dc.b	113
2741  002f d3            	dc.b	211
2742  0030 00            	dc.b	0
2743  0031 06            	dc.b	6
2744  0032 50            	dc.b	80
2745  0033 76            	dc.b	118
2746  0034 00            	dc.b	0
2747  0035 09            	dc.b	9
2748  0036 e4            	dc.b	228
2749  0037 74            	dc.b	116
2750  0038 00            	dc.b	0
2751  0039 09            	dc.b	9
2752  003a 76            	dc.b	118
2753  003b f1            	dc.b	241
2754  003c d6            	dc.b	214
2755  003d 09            	dc.b	9
2756  003e 73            	dc.b	115
2757  003f 50            	dc.b	80
2758  0040 b5            	dc.b	181
2759  0041 09            	dc.b	9
2760  0042 73            	dc.b	115
2761  0043 d0            	dc.b	208
2762  0044 00            	dc.b	0
2763  0045 0a            	dc.b	10
2764  0046 f0            	dc.b	240
2765  0047 03            	dc.b	3
2766  0048 00            	dc.b	0
2767  0049 0a            	dc.b	10
2768  004a f0            	dc.b	240
2769  004b d3            	dc.b	211
2770  004c 00            	dc.b	0
2771  004d 0a            	dc.b	10
2772  004e f0            	dc.b	240
2773  004f b5            	dc.b	181
2774  0050 00            	dc.b	0
2775  0051 0a            	dc.b	10
2776  0052 50            	dc.b	80
2777  0053 c1            	dc.b	193
2778  0054 51            	dc.b	81
2779  0055 07            	dc.b	7
2837                     ; 98 uint16_t divu10(uint16_t n) 
2837                     ; 99 {
2839                     	switch	.text
2840  0000               _divu10:
2842  0000 89            	pushw	x
2843  0001 5208          	subw	sp,#8
2844       00000008      OFST:	set	8
2847                     ; 102   q = (n >> 1) + (n >> 2);       // 1/2 + 1/4 = 3/4
2849  0003 54            	srlw	x
2850  0004 54            	srlw	x
2851  0005 1f03          	ldw	(OFST-5,sp),x
2853  0007 1e09          	ldw	x,(OFST+1,sp)
2854  0009 54            	srlw	x
2855  000a 72fb03        	addw	x,(OFST-5,sp)
2856  000d 1f07          	ldw	(OFST-1,sp),x
2858                     ; 103   q = q + (q >> 4);              // 3/4 + 3/64 = 51/64
2860  000f 1e07          	ldw	x,(OFST-1,sp)
2861  0011 54            	srlw	x
2862  0012 54            	srlw	x
2863  0013 54            	srlw	x
2864  0014 54            	srlw	x
2865  0015 72fb07        	addw	x,(OFST-1,sp)
2866  0018 1f07          	ldw	(OFST-1,sp),x
2868                     ; 104   q = q + (q >> 8);              // 51/64 + 51/(16384) = 13107/16384
2870  001a 1e07          	ldw	x,(OFST-1,sp)
2871  001c 4f            	clr	a
2872  001d 01            	rrwa	x,a
2873  001e 72fb07        	addw	x,(OFST-1,sp)
2874  0021 1f07          	ldw	(OFST-1,sp),x
2876                     ; 105   q = q >> 3;                    // 13107 / 131072
2878  0023 a603          	ld	a,#3
2879  0025               L6:
2880  0025 0407          	srl	(OFST-1,sp)
2881  0027 0608          	rrc	(OFST+0,sp)
2882  0029 4a            	dec	a
2883  002a 26f9          	jrne	L6
2885                     ; 106   r = n - ((q << 3) + (q << 1)); // 1 - (13107/16384 + 13107/65536) = 1/65536
2887  002c 1e07          	ldw	x,(OFST-1,sp)
2888  002e 58            	sllw	x
2889  002f 1f03          	ldw	(OFST-5,sp),x
2891  0031 1e07          	ldw	x,(OFST-1,sp)
2892  0033 58            	sllw	x
2893  0034 58            	sllw	x
2894  0035 58            	sllw	x
2895  0036 72fb03        	addw	x,(OFST-5,sp)
2896  0039 1f01          	ldw	(OFST-7,sp),x
2898  003b 1e09          	ldw	x,(OFST+1,sp)
2899  003d 72f001        	subw	x,(OFST-7,sp)
2900  0040 1f05          	ldw	(OFST-3,sp),x
2902                     ; 107   return q + ((r + 6) >> 4);     // 13107/131072 + 1/1048576 = 104857 / 1048576  
2904  0042 1e05          	ldw	x,(OFST-3,sp)
2905  0044 1c0006        	addw	x,#6
2906  0047 54            	srlw	x
2907  0048 54            	srlw	x
2908  0049 54            	srlw	x
2909  004a 54            	srlw	x
2910  004b 72fb07        	addw	x,(OFST-1,sp)
2913  004e 5b0a          	addw	sp,#10
2914  0050 81            	ret
2954                     ; 119 void prx_to_led(uint8_t run_mode)
2954                     ; 120 {
2955                     	switch	.text
2956  0051               _prx_to_led:
2960                     ; 121     bot_100  = LED_OFF;
2962  0051 3f0f          	clr	_bot_100
2963                     ; 122     if (run_mode < THERMOSTAT_MODE)
2965  0053 a106          	cp	a,#6
2966  0055 2411          	jruge	L5761
2967                     ; 124         bot_10 = LED_P; 
2969  0057 3576000e      	mov	_bot_10,#118
2970                     ; 125         bot_1  = LED_r;
2972  005b 3550000d      	mov	_bot_1,#80
2973                     ; 126         bot_01 = led_lookup[run_mode];
2975  005f 5f            	clrw	x
2976  0060 97            	ld	xl,a
2977  0061 d60000        	ld	a,(_led_lookup,x)
2978  0064 b70c          	ld	_bot_01,a
2980  0066 201e          	jra	L7761
2981  0068               L5761:
2982                     ; 128     else if (ts == 0) 
2984  0068 3d00          	tnz	_ts
2985  006a 260e          	jrne	L1071
2986                     ; 130         bot_100 = bot_01 = LED_OFF;
2988  006c 3f0c          	clr	_bot_01
2989  006e 3f0f          	clr	_bot_100
2990                     ; 131         bot_10  = LED_t;
2992  0070 35f0000e      	mov	_bot_10,#240
2993                     ; 132         bot_1   = LED_h;
2995  0074 3571000d      	mov	_bot_1,#113
2997  0078 200c          	jra	L7761
2998  007a               L1071:
2999                     ; 136         bot_10 = LED_P; 
3001  007a 3576000e      	mov	_bot_10,#118
3002                     ; 137         bot_1  = LED_I;
3004  007e 3503000d      	mov	_bot_1,#3
3005                     ; 138         bot_01 = LED_d;
3007  0082 35d3000c      	mov	_bot_01,#211
3008  0086               L7761:
3009                     ; 140 } // prx_to_led()
3012  0086 81            	ret
3085                     ; 151 void val_to_bcd(int16_t *value, uint16_t digit, uint8_t *led, uint8_t lz)
3085                     ; 152 {
3086                     	switch	.text
3087  0087               _val_to_bcd:
3089  0087 89            	pushw	x
3090  0088 88            	push	a
3091       00000001      OFST:	set	1
3094                     ; 155 	if (*value >= digit)
3096  0089 9093          	ldw	y,x
3097  008b 51            	exgw	x,y
3098  008c fe            	ldw	x,(x)
3099  008d 1306          	cpw	x,(OFST+5,sp)
3100  008f 51            	exgw	x,y
3101  0090 2529          	jrult	L3471
3102                     ; 157 	   for(i = 0; *value >= digit; i++)
3104  0092 0f01          	clr	(OFST+0,sp)
3107  0094 200c          	jra	L1571
3108  0096               L5471:
3109                     ; 159 	      *value -= digit;
3111  0096 1e02          	ldw	x,(OFST+1,sp)
3112  0098 9093          	ldw	y,x
3113  009a fe            	ldw	x,(x)
3114  009b 72f006        	subw	x,(OFST+5,sp)
3115  009e 90ff          	ldw	(y),x
3116                     ; 157 	   for(i = 0; *value >= digit; i++)
3118  00a0 0c01          	inc	(OFST+0,sp)
3120  00a2               L1571:
3123  00a2 1e02          	ldw	x,(OFST+1,sp)
3124  00a4 9093          	ldw	y,x
3125  00a6 51            	exgw	x,y
3126  00a7 fe            	ldw	x,(x)
3127  00a8 1306          	cpw	x,(OFST+5,sp)
3128  00aa 51            	exgw	x,y
3129  00ab 24e9          	jruge	L5471
3130                     ; 161 	   *led = led_lookup[i & 0x0f];
3132  00ad 7b01          	ld	a,(OFST+0,sp)
3133  00af a40f          	and	a,#15
3134  00b1 5f            	clrw	x
3135  00b2 97            	ld	xl,a
3136  00b3 d60000        	ld	a,(_led_lookup,x)
3137  00b6 1e08          	ldw	x,(OFST+7,sp)
3138  00b8 f7            	ld	(x),a
3140  00b9 200e          	jra	L5571
3141  00bb               L3471:
3142                     ; 163     else if (lz)
3144  00bb 0d0a          	tnz	(OFST+9,sp)
3145  00bd 2707          	jreq	L7571
3146                     ; 164          *led = LED_0;   // Leading zero
3148  00bf 1e08          	ldw	x,(OFST+7,sp)
3149  00c1 a6e7          	ld	a,#231
3150  00c3 f7            	ld	(x),a
3152  00c4 2003          	jra	L5571
3153  00c6               L7571:
3154                     ; 165     else *led = LED_OFF; // display off
3156  00c6 1e08          	ldw	x,(OFST+7,sp)
3157  00c8 7f            	clr	(x)
3158  00c9               L5571:
3159                     ; 166 } // val_to_bcd()
3162  00c9 5b03          	addw	sp,#3
3163  00cb 81            	ret
3283                     ; 179 void value_to_led(int16_t value, uint8_t decimal, uint8_t row) 
3283                     ; 180 {
3284                     	switch	.text
3285  00cc               _value_to_led:
3287  00cc 89            	pushw	x
3288  00cd 520c          	subw	sp,#12
3289       0000000c      OFST:	set	12
3292                     ; 182     int16_t val = value; // copy of value
3294  00cf 1f0b          	ldw	(OFST-1,sp),x
3296                     ; 186     if (val < 0) 
3298  00d1 9c            	rvf
3299  00d2 1e0b          	ldw	x,(OFST-1,sp)
3300  00d4 2e16          	jrsge	L1402
3301                     ; 188        val  = -val;
3303  00d6 1e0b          	ldw	x,(OFST-1,sp)
3304  00d8 50            	negw	x
3305  00d9 1f0b          	ldw	(OFST-1,sp),x
3307                     ; 189        if (val >= 1000) 
3309  00db 9c            	rvf
3310  00dc 1e0b          	ldw	x,(OFST-1,sp)
3311  00de a303e8        	cpw	x,#1000
3312  00e1 2f09          	jrslt	L1402
3313                     ; 191           val = divu10(val); // loose the decimal
3315  00e3 1e0b          	ldw	x,(OFST-1,sp)
3316  00e5 cd0000        	call	_divu10
3318  00e8 1f0b          	ldw	(OFST-1,sp),x
3320                     ; 192           decimal = 0;       // no decimal point 
3322  00ea 0f11          	clr	(OFST+5,sp)
3323  00ec               L1402:
3324                     ; 195     val2 = val;
3326  00ec 1e0b          	ldw	x,(OFST-1,sp)
3327  00ee 1f03          	ldw	(OFST-9,sp),x
3329                     ; 197     if (row == ROW_TOP)
3331  00f0 7b12          	ld	a,(OFST+6,sp)
3332  00f2 a102          	cp	a,#2
3333  00f4 2616          	jrne	L5402
3334                     ; 199         p100 = &top_100; p10  = &top_10;
3336  00f6 ae0013        	ldw	x,#_top_100
3337  00f9 1f05          	ldw	(OFST-7,sp),x
3341  00fb ae0012        	ldw	x,#_top_10
3342  00fe 1f07          	ldw	(OFST-5,sp),x
3344                     ; 200         p1   = &top_1;   p01  = &top_01;
3346  0100 ae0011        	ldw	x,#_top_1
3347  0103 1f09          	ldw	(OFST-3,sp),x
3351  0105 ae0010        	ldw	x,#_top_01
3352  0108 1f01          	ldw	(OFST-11,sp),x
3355  010a 2014          	jra	L7402
3356  010c               L5402:
3357                     ; 204         p100 = &bot_100; p10  = &bot_10;
3359  010c ae000f        	ldw	x,#_bot_100
3360  010f 1f05          	ldw	(OFST-7,sp),x
3364  0111 ae000e        	ldw	x,#_bot_10
3365  0114 1f07          	ldw	(OFST-5,sp),x
3367                     ; 205         p1   = &bot_1;   p01  = &bot_01;
3369  0116 ae000d        	ldw	x,#_bot_1
3370  0119 1f09          	ldw	(OFST-3,sp),x
3374  011b ae000c        	ldw	x,#_bot_01
3375  011e 1f01          	ldw	(OFST-11,sp),x
3377  0120               L7402:
3378                     ; 209 	val_to_bcd(&val, 1000, p100,0); 
3380  0120 4b00          	push	#0
3381  0122 1e06          	ldw	x,(OFST-6,sp)
3382  0124 89            	pushw	x
3383  0125 ae03e8        	ldw	x,#1000
3384  0128 89            	pushw	x
3385  0129 96            	ldw	x,sp
3386  012a 1c0010        	addw	x,#OFST+4
3387  012d cd0087        	call	_val_to_bcd
3389  0130 5b05          	addw	sp,#5
3390                     ; 210 	val_to_bcd(&val,  100, p10 ,(*p100 != LED_OFF));
3392  0132 1e05          	ldw	x,(OFST-7,sp)
3393  0134 7d            	tnz	(x)
3394  0135 2704          	jreq	L61
3395  0137 a601          	ld	a,#1
3396  0139 2001          	jra	L02
3397  013b               L61:
3398  013b 4f            	clr	a
3399  013c               L02:
3400  013c 88            	push	a
3401  013d 1e08          	ldw	x,(OFST-4,sp)
3402  013f 89            	pushw	x
3403  0140 ae0064        	ldw	x,#100
3404  0143 89            	pushw	x
3405  0144 96            	ldw	x,sp
3406  0145 1c0010        	addw	x,#OFST+4
3407  0148 cd0087        	call	_val_to_bcd
3409  014b 5b05          	addw	sp,#5
3410                     ; 211 	val_to_bcd(&val,   10, p1  ,(*p10  != LED_OFF));
3412  014d 1e07          	ldw	x,(OFST-5,sp)
3413  014f 7d            	tnz	(x)
3414  0150 2704          	jreq	L22
3415  0152 a601          	ld	a,#1
3416  0154 2001          	jra	L42
3417  0156               L22:
3418  0156 4f            	clr	a
3419  0157               L42:
3420  0157 88            	push	a
3421  0158 1e0a          	ldw	x,(OFST-2,sp)
3422  015a 89            	pushw	x
3423  015b ae000a        	ldw	x,#10
3424  015e 89            	pushw	x
3425  015f 96            	ldw	x,sp
3426  0160 1c0010        	addw	x,#OFST+4
3427  0163 cd0087        	call	_val_to_bcd
3429  0166 5b05          	addw	sp,#5
3430                     ; 212 	val_to_bcd(&val,    1, p01 ,1);
3432  0168 4b01          	push	#1
3433  016a 1e02          	ldw	x,(OFST-10,sp)
3434  016c 89            	pushw	x
3435  016d ae0001        	ldw	x,#1
3436  0170 89            	pushw	x
3437  0171 96            	ldw	x,sp
3438  0172 1c0010        	addw	x,#OFST+4
3439  0175 cd0087        	call	_val_to_bcd
3441  0178 5b05          	addw	sp,#5
3442                     ; 214     if (decimal == 1)
3444  017a 7b11          	ld	a,(OFST+5,sp)
3445  017c a101          	cp	a,#1
3446  017e 2610          	jrne	L1502
3447                     ; 216        if (*p1 == LED_OFF) *p1 = LED_0; // add leading zero if needed
3449  0180 1e09          	ldw	x,(OFST-3,sp)
3450  0182 7d            	tnz	(x)
3451  0183 2605          	jrne	L3502
3454  0185 1e09          	ldw	x,(OFST-3,sp)
3455  0187 a6e7          	ld	a,#231
3456  0189 f7            	ld	(x),a
3457  018a               L3502:
3458                     ; 217 	   *p1 |= LED_DP;                   // add decimal point
3460  018a 1e09          	ldw	x,(OFST-3,sp)
3461  018c f6            	ld	a,(x)
3462  018d aa08          	or	a,#8
3463  018f f7            	ld	(x),a
3464  0190               L1502:
3465                     ; 220     if (value < 0)
3467  0190 9c            	rvf
3468  0191 1e0d          	ldw	x,(OFST+1,sp)
3469  0193 2e2f          	jrsge	L5502
3470                     ; 222         if ((val2 < 10) && (decimal == 0)) 
3472  0195 9c            	rvf
3473  0196 1e03          	ldw	x,(OFST-9,sp)
3474  0198 a3000a        	cpw	x,#10
3475  019b 2e0b          	jrsge	L7502
3477  019d 0d11          	tnz	(OFST+5,sp)
3478  019f 2607          	jrne	L7502
3479                     ; 223                               *p1   = LED_MIN;
3481  01a1 1e09          	ldw	x,(OFST-3,sp)
3482  01a3 a610          	ld	a,#16
3483  01a5 f7            	ld	(x),a
3485  01a6 201c          	jra	L5502
3486  01a8               L7502:
3487                     ; 224         else if (val2 < 100)  *p10  = LED_MIN;
3489  01a8 9c            	rvf
3490  01a9 1e03          	ldw	x,(OFST-9,sp)
3491  01ab a30064        	cpw	x,#100
3492  01ae 2e07          	jrsge	L3602
3495  01b0 1e07          	ldw	x,(OFST-5,sp)
3496  01b2 a610          	ld	a,#16
3497  01b4 f7            	ld	(x),a
3499  01b5 200d          	jra	L5502
3500  01b7               L3602:
3501                     ; 225         else if (val2 < 1000) *p100 = LED_MIN;
3503  01b7 9c            	rvf
3504  01b8 1e03          	ldw	x,(OFST-9,sp)
3505  01ba a303e8        	cpw	x,#1000
3506  01bd 2e05          	jrsge	L5502
3509  01bf 1e05          	ldw	x,(OFST-7,sp)
3510  01c1 a610          	ld	a,#16
3511  01c3 f7            	ld	(x),a
3512  01c4               L5502:
3513                     ; 228 } // value_to_led()
3516  01c4 5b0e          	addw	sp,#14
3517  01c6 81            	ret
3630                     ; 239 void update_profile(void)
3630                     ; 240 {
3631                     	switch	.text
3632  01c7               _update_profile:
3634  01c7 520f          	subw	sp,#15
3635       0000000f      OFST:	set	15
3638                     ; 241   uint8_t  profile_no = eeprom_read_config(EEADR_MENU_ITEM(rn));
3640  01c9 a684          	ld	a,#132
3641  01cb cd0000        	call	_eeprom_read_config
3643  01ce 01            	rrwa	x,a
3644  01cf 6b06          	ld	(OFST-9,sp),a
3645  01d1 02            	rlwa	x,a
3647                     ; 252   if (profile_no < THERMOSTAT_MODE) 
3649  01d2 7b06          	ld	a,(OFST-9,sp)
3650  01d4 a106          	cp	a,#6
3651  01d6 2503          	jrult	L23
3652  01d8 cc02f8        	jp	L7412
3653  01db               L23:
3654                     ; 254       curr_step = eeprom_read_config(EEADR_MENU_ITEM(St));
3656  01db a678          	ld	a,#120
3657  01dd cd0000        	call	_eeprom_read_config
3659  01e0 01            	rrwa	x,a
3660  01e1 6b0f          	ld	(OFST+0,sp),a
3661  01e3 02            	rlwa	x,a
3663                     ; 255       if (minutes) // is timing-control in minutes?
3665                     	btst	_minutes
3666  01e9 2409          	jruge	L1512
3667                     ; 256            curr_dur++;
3669  01eb be0a          	ldw	x,_curr_dur
3670  01ed 1c0001        	addw	x,#1
3671  01f0 bf0a          	ldw	_curr_dur,x
3673  01f2 2008          	jra	L3512
3674  01f4               L1512:
3675                     ; 257       else curr_dur = eeprom_read_config(EEADR_MENU_ITEM(dh)) + 1;
3677  01f4 a679          	ld	a,#121
3678  01f6 cd0000        	call	_eeprom_read_config
3680  01f9 5c            	incw	x
3681  01fa bf0a          	ldw	_curr_dur,x
3682  01fc               L3512:
3683                     ; 260       if(curr_step > NO_OF_TT_PAIRS-1) curr_step = NO_OF_TT_PAIRS - 1;
3685  01fc 7b0f          	ld	a,(OFST+0,sp)
3686  01fe a109          	cp	a,#9
3687  0200 2504          	jrult	L5512
3690  0202 a608          	ld	a,#8
3691  0204 6b0f          	ld	(OFST+0,sp),a
3693  0206               L5512:
3694                     ; 262       profile_step_eeaddr  = EEADR_PROFILE_SETPOINT(profile_no, curr_step);
3696  0206 7b0f          	ld	a,(OFST+0,sp)
3697  0208 48            	sll	a
3698  0209 6b01          	ld	(OFST-14,sp),a
3700  020b 7b06          	ld	a,(OFST-9,sp)
3701  020d 97            	ld	xl,a
3702  020e a613          	ld	a,#19
3703  0210 42            	mul	x,a
3704  0211 9f            	ld	a,xl
3705  0212 1b01          	add	a,(OFST-14,sp)
3706  0214 6b06          	ld	(OFST-9,sp),a
3708                     ; 263       profile_step_dur     = eeprom_read_config(profile_step_eeaddr + 1);
3710  0216 7b06          	ld	a,(OFST-9,sp)
3711  0218 4c            	inc	a
3712  0219 cd0000        	call	_eeprom_read_config
3714  021c 1f09          	ldw	(OFST-6,sp),x
3716                     ; 264       profile_next_step_sp = eeprom_read_config(profile_step_eeaddr + 2);
3718  021e 7b06          	ld	a,(OFST-9,sp)
3719  0220 ab02          	add	a,#2
3720  0222 cd0000        	call	_eeprom_read_config
3722  0225 1f04          	ldw	(OFST-11,sp),x
3724                     ; 267       if (curr_dur >= profile_step_dur) 
3726  0227 be0a          	ldw	x,_curr_dur
3727  0229 1309          	cpw	x,(OFST-6,sp)
3728  022b 2546          	jrult	L7512
3729                     ; 269         if (minutes) setpoint = profile_next_step_sp;
3731                     	btst	_minutes
3732  0232 2404          	jruge	L1612
3735  0234 1e04          	ldw	x,(OFST-11,sp)
3736  0236 bf06          	ldw	_setpoint,x
3737  0238               L1612:
3738                     ; 270         eeprom_write_config(EEADR_MENU_ITEM(SP), profile_next_step_sp);
3740  0238 1e04          	ldw	x,(OFST-11,sp)
3741  023a 89            	pushw	x
3742  023b a672          	ld	a,#114
3743  023d cd0000        	call	_eeprom_write_config
3745  0240 85            	popw	x
3746                     ; 272         if ((curr_step == NO_OF_TT_PAIRS-1) || eeprom_read_config(profile_step_eeaddr + 3) == 0) 
3748  0241 7b0f          	ld	a,(OFST+0,sp)
3749  0243 a108          	cp	a,#8
3750  0245 270c          	jreq	L5612
3752  0247 7b06          	ld	a,(OFST-9,sp)
3753  0249 ab03          	add	a,#3
3754  024b cd0000        	call	_eeprom_read_config
3756  024e a30000        	cpw	x,#0
3757  0251 260e          	jrne	L3612
3758  0253               L5612:
3759                     ; 274             eeprom_write_config(EEADR_MENU_ITEM(rn), THERMOSTAT_MODE);
3761  0253 ae0006        	ldw	x,#6
3762  0256 89            	pushw	x
3763  0257 a684          	ld	a,#132
3764  0259 cd0000        	call	_eeprom_write_config
3766  025c 85            	popw	x
3767                     ; 275             return; // Fastest way out...
3769  025d acf802f8      	jpf	L03
3770  0261               L3612:
3771                     ; 277         curr_dur = 0; // Reset duration
3773  0261 5f            	clrw	x
3774  0262 bf0a          	ldw	_curr_dur,x
3775                     ; 278         curr_step++;  // Update step
3777  0264 0c0f          	inc	(OFST+0,sp)
3779                     ; 279         eeprom_write_config(EEADR_MENU_ITEM(St), curr_step);
3781  0266 7b0f          	ld	a,(OFST+0,sp)
3782  0268 5f            	clrw	x
3783  0269 97            	ld	xl,a
3784  026a 89            	pushw	x
3785  026b a678          	ld	a,#120
3786  026d cd0000        	call	_eeprom_write_config
3788  0270 85            	popw	x
3790  0271 2075          	jra	L7612
3791  0273               L7512:
3792                     ; 281       else if (eeprom_read_config(EEADR_MENU_ITEM(rP))) 
3794  0273 a67c          	ld	a,#124
3795  0275 cd0000        	call	_eeprom_read_config
3797  0278 a30000        	cpw	x,#0
3798  027b 276b          	jreq	L7612
3799                     ; 283          profile_step_sp = eeprom_read_config(profile_step_eeaddr);
3801  027d 7b06          	ld	a,(OFST-9,sp)
3802  027f cd0000        	call	_eeprom_read_config
3804  0282 1f02          	ldw	(OFST-13,sp),x
3806                     ; 284          t  = curr_dur << 6;
3808  0284 be0a          	ldw	x,_curr_dur
3809  0286 58            	sllw	x
3810  0287 58            	sllw	x
3811  0288 58            	sllw	x
3812  0289 58            	sllw	x
3813  028a 58            	sllw	x
3814  028b 58            	sllw	x
3815  028c 1f07          	ldw	(OFST-8,sp),x
3817                     ; 285          sp = 32;
3819  028e ae0020        	ldw	x,#32
3820  0291 1f0d          	ldw	(OFST-2,sp),x
3821  0293 ae0000        	ldw	x,#0
3822  0296 1f0b          	ldw	(OFST-4,sp),x
3824                     ; 286          for (i = 0; i < 64; i++) 
3826  0298 0f0f          	clr	(OFST+0,sp)
3828  029a               L3712:
3829                     ; 288              if (t >= profile_step_dur) 
3831  029a 1e07          	ldw	x,(OFST-8,sp)
3832  029c 1309          	cpw	x,(OFST-6,sp)
3833  029e 2515          	jrult	L1022
3834                     ; 290                 t  -= profile_step_dur;
3836  02a0 1e07          	ldw	x,(OFST-8,sp)
3837  02a2 72f009        	subw	x,(OFST-6,sp)
3838  02a5 1f07          	ldw	(OFST-8,sp),x
3840                     ; 291                 sp += profile_next_step_sp;
3842  02a7 1e04          	ldw	x,(OFST-11,sp)
3843  02a9 cd0000        	call	c_itolx
3845  02ac 96            	ldw	x,sp
3846  02ad 1c000b        	addw	x,#OFST-4
3847  02b0 cd0000        	call	c_lgadd
3851  02b3 200c          	jra	L3022
3852  02b5               L1022:
3853                     ; 295                 sp += profile_step_sp;
3855  02b5 1e02          	ldw	x,(OFST-13,sp)
3856  02b7 cd0000        	call	c_itolx
3858  02ba 96            	ldw	x,sp
3859  02bb 1c000b        	addw	x,#OFST-4
3860  02be cd0000        	call	c_lgadd
3863  02c1               L3022:
3864                     ; 286          for (i = 0; i < 64; i++) 
3866  02c1 0c0f          	inc	(OFST+0,sp)
3870  02c3 7b0f          	ld	a,(OFST+0,sp)
3871  02c5 a140          	cp	a,#64
3872  02c7 25d1          	jrult	L3712
3873                     ; 298          sp >>= 6;
3875  02c9 96            	ldw	x,sp
3876  02ca 1c000b        	addw	x,#OFST-4
3877  02cd a606          	ld	a,#6
3878  02cf cd0000        	call	c_lgrsh
3881                     ; 300          if (minutes) // is timing-control in minutes?
3883                     	btst	_minutes
3884  02d7 2406          	jruge	L5022
3885                     ; 301               setpoint = sp;
3887  02d9 1e0d          	ldw	x,(OFST-2,sp)
3888  02db bf06          	ldw	_setpoint,x
3890  02dd 2009          	jra	L7612
3891  02df               L5022:
3892                     ; 302          else eeprom_write_config(EEADR_MENU_ITEM(SP), sp);
3894  02df 1e0d          	ldw	x,(OFST-2,sp)
3895  02e1 89            	pushw	x
3896  02e2 a672          	ld	a,#114
3897  02e4 cd0000        	call	_eeprom_write_config
3899  02e7 85            	popw	x
3900  02e8               L7612:
3901                     ; 304       if (!minutes)
3903                     	btst	_minutes
3904  02ed 2509          	jrult	L7412
3905                     ; 306           eeprom_write_config(EEADR_MENU_ITEM(dh), curr_dur);
3907  02ef be0a          	ldw	x,_curr_dur
3908  02f1 89            	pushw	x
3909  02f2 a679          	ld	a,#121
3910  02f4 cd0000        	call	_eeprom_write_config
3912  02f7 85            	popw	x
3913  02f8               L7412:
3914                     ; 309 } // update_profile()
3915  02f8               L03:
3918  02f8 5b0f          	addw	sp,#15
3919  02fa 81            	ret
3971                     ; 321 int16_t range(int16_t x, int16_t min, int16_t max)
3971                     ; 322 {
3972                     	switch	.text
3973  02fb               _range:
3975  02fb 89            	pushw	x
3976       00000000      OFST:	set	0
3979                     ; 323     if (x > max) return min;
3981  02fc 9c            	rvf
3982  02fd 1307          	cpw	x,(OFST+7,sp)
3983  02ff 2d04          	jrsle	L1422
3986  0301 1e05          	ldw	x,(OFST+5,sp)
3988  0303 2009          	jra	L63
3989  0305               L1422:
3990                     ; 324     if (x < min) return max;
3992  0305 9c            	rvf
3993  0306 1e01          	ldw	x,(OFST+1,sp)
3994  0308 1305          	cpw	x,(OFST+5,sp)
3995  030a 2e05          	jrsge	L3422
3998  030c 1e07          	ldw	x,(OFST+7,sp)
4000  030e               L63:
4002  030e 5b02          	addw	sp,#2
4003  0310 81            	ret
4004  0311               L3422:
4005                     ; 325     return x;
4007  0311 1e01          	ldw	x,(OFST+1,sp)
4009  0313 20f9          	jra	L63
4082                     ; 335 int16_t check_config_value(int16_t config_value, uint8_t eeadr)
4082                     ; 336 {
4083                     	switch	.text
4084  0315               _check_config_value:
4086  0315 89            	pushw	x
4087  0316 5205          	subw	sp,#5
4088       00000005      OFST:	set	5
4091                     ; 337     int16_t t_min = 0, t_max = 999;
4093  0318 5f            	clrw	x
4094  0319 1f01          	ldw	(OFST-4,sp),x
4098  031b ae03e7        	ldw	x,#999
4099  031e 1f04          	ldw	(OFST-1,sp),x
4101                     ; 340     if (eeadr < EEADR_MENU)
4103  0320 7b0a          	ld	a,(OFST+5,sp)
4104  0322 a172          	cp	a,#114
4105  0324 2431          	jruge	L3032
4107  0326 2006          	jra	L7032
4108  0328               L5032:
4109                     ; 344             eeadr -= PROFILE_SIZE;
4111  0328 7b0a          	ld	a,(OFST+5,sp)
4112  032a a013          	sub	a,#19
4113  032c 6b0a          	ld	(OFST+5,sp),a
4114  032e               L7032:
4115                     ; 342         while (eeadr >= PROFILE_SIZE)
4117  032e 7b0a          	ld	a,(OFST+5,sp)
4118  0330 a113          	cp	a,#19
4119  0332 24f4          	jruge	L5032
4120                     ; 346         if (!(eeadr & 0x1))
4122  0334 7b0a          	ld	a,(OFST+5,sp)
4123  0336 a501          	bcp	a,#1
4124  0338 2703          	jreq	L201
4125  033a cc045a        	jp	L5132
4126  033d               L201:
4127                     ; 348             t_min = (fahrenheit ? TEMP_MIN_F : TEMP_MIN_C);
4129  033d aefe70        	ldw	x,#65136
4130  0340 1f01          	ldw	(OFST-4,sp),x
4132                     ; 349             t_max = (fahrenheit ? TEMP_MAX_F : TEMP_MAX_C);
4134                     	btst	_fahrenheit
4135  0347 2405          	jruge	L24
4136  0349 ae09c4        	ldw	x,#2500
4137  034c 2003          	jra	L44
4138  034e               L24:
4139  034e ae0578        	ldw	x,#1400
4140  0351               L44:
4141  0351 1f04          	ldw	(OFST-1,sp),x
4143  0353 ac5a045a      	jpf	L5132
4144  0357               L3032:
4145                     ; 352             type = menu[eeadr - EEADR_MENU].type;
4147  0357 7b0a          	ld	a,(OFST+5,sp)
4148  0359 97            	ld	xl,a
4149  035a a604          	ld	a,#4
4150  035c 42            	mul	x,a
4151  035d 1d01c8        	subw	x,#456
4152  0360 d6000d        	ld	a,(_menu+3,x)
4153  0363 6b03          	ld	(OFST-2,sp),a
4155                     ; 353         if (type == t_temperature)
4157  0365 0d03          	tnz	(OFST-2,sp)
4158  0367 261a          	jrne	L7132
4159                     ; 355             t_min = (fahrenheit ? TEMP_MIN_F : TEMP_MIN_C);
4161  0369 aefe70        	ldw	x,#65136
4162  036c 1f01          	ldw	(OFST-4,sp),x
4164                     ; 356             t_max = (fahrenheit ? TEMP_MAX_F : TEMP_MAX_C);
4166                     	btst	_fahrenheit
4167  0373 2405          	jruge	L64
4168  0375 ae09c4        	ldw	x,#2500
4169  0378 2003          	jra	L05
4170  037a               L64:
4171  037a ae0578        	ldw	x,#1400
4172  037d               L05:
4173  037d 1f04          	ldw	(OFST-1,sp),x
4176  037f ac5a045a      	jpf	L5132
4177  0383               L7132:
4178                     ; 357         } else if (type == t_tempdiff)
4180  0383 7b03          	ld	a,(OFST-2,sp)
4181  0385 a101          	cp	a,#1
4182  0387 2626          	jrne	L3232
4183                     ; 359             t_min = (fahrenheit ? TEMP_CORR_MIN_F : TEMP_CORR_MIN_C);
4185                     	btst	_fahrenheit
4186  038e 2405          	jruge	L25
4187  0390 aeff9c        	ldw	x,#65436
4188  0393 2003          	jra	L45
4189  0395               L25:
4190  0395 aeffce        	ldw	x,#65486
4191  0398               L45:
4192  0398 1f01          	ldw	(OFST-4,sp),x
4194                     ; 360             t_max = (fahrenheit ? TEMP_CORR_MAX_F : TEMP_CORR_MAX_C);
4196                     	btst	_fahrenheit
4197  039f 2405          	jruge	L65
4198  03a1 ae0064        	ldw	x,#100
4199  03a4 2003          	jra	L06
4200  03a6               L65:
4201  03a6 ae0032        	ldw	x,#50
4202  03a9               L06:
4203  03a9 1f04          	ldw	(OFST-1,sp),x
4206  03ab ac5a045a      	jpf	L5132
4207  03af               L3232:
4208                     ; 361         } else if (type == t_parameter)
4210  03af 7b03          	ld	a,(OFST-2,sp)
4211  03b1 a10a          	cp	a,#10
4212  03b3 2616          	jrne	L7232
4213                     ; 363             t_max = 9999;
4215  03b5 ae270f        	ldw	x,#9999
4216  03b8 1f04          	ldw	(OFST-1,sp),x
4218                     ; 364             if (eeadr == EEADR_MENU_ITEM(Hc)) 
4220  03ba 7b0a          	ld	a,(OFST+5,sp)
4221  03bc a180          	cp	a,#128
4222  03be 2703          	jreq	L401
4223  03c0 cc045a        	jp	L5132
4224  03c3               L401:
4225                     ; 366                 t_min = -9999; 
4227  03c3 aed8f1        	ldw	x,#55537
4228  03c6 1f01          	ldw	(OFST-4,sp),x
4230  03c8 cc045a        	jra	L5132
4231  03cb               L7232:
4232                     ; 368         } else if (type == t_boolean)
4234  03cb 7b03          	ld	a,(OFST-2,sp)
4235  03cd a109          	cp	a,#9
4236  03cf 2608          	jrne	L5332
4237                     ; 370             t_max = 1;
4239  03d1 ae0001        	ldw	x,#1
4240  03d4 1f04          	ldw	(OFST-1,sp),x
4243  03d6 cc045a        	jra	L5132
4244  03d9               L5332:
4245                     ; 371         } else if (type == t_hyst_1)
4247  03d9 7b03          	ld	a,(OFST-2,sp)
4248  03db a102          	cp	a,#2
4249  03dd 2613          	jrne	L1432
4250                     ; 373             t_max = (fahrenheit ? TEMP_HYST_1_MAX_F : TEMP_HYST_1_MAX_C);
4252                     	btst	_fahrenheit
4253  03e4 2405          	jruge	L26
4254  03e6 ae0064        	ldw	x,#100
4255  03e9 2003          	jra	L46
4256  03eb               L26:
4257  03eb ae0032        	ldw	x,#50
4258  03ee               L46:
4259  03ee 1f04          	ldw	(OFST-1,sp),x
4262  03f0 2068          	jra	L5132
4263  03f2               L1432:
4264                     ; 374         } else if (type == t_hyst_2)
4266  03f2 7b03          	ld	a,(OFST-2,sp)
4267  03f4 a103          	cp	a,#3
4268  03f6 2613          	jrne	L5432
4269                     ; 376             t_max = (fahrenheit ? TEMP_HYST_2_MAX_F : TEMP_HYST_2_MAX_C);
4271                     	btst	_fahrenheit
4272  03fd 2405          	jruge	L66
4273  03ff ae01f4        	ldw	x,#500
4274  0402 2003          	jra	L07
4275  0404               L66:
4276  0404 ae00fa        	ldw	x,#250
4277  0407               L07:
4278  0407 1f04          	ldw	(OFST-1,sp),x
4281  0409 204f          	jra	L5132
4282  040b               L5432:
4283                     ; 377         } else if (type == t_sp_alarm)
4285  040b 7b03          	ld	a,(OFST-2,sp)
4286  040d a104          	cp	a,#4
4287  040f 2624          	jrne	L1532
4288                     ; 379             t_min = (fahrenheit ? SP_ALARM_MIN_F : SP_ALARM_MIN_C);
4290                     	btst	_fahrenheit
4291  0416 2405          	jruge	L27
4292  0418 aefce0        	ldw	x,#64736
4293  041b 2003          	jra	L47
4294  041d               L27:
4295  041d aefe70        	ldw	x,#65136
4296  0420               L47:
4297  0420 1f01          	ldw	(OFST-4,sp),x
4299                     ; 380             t_max = (fahrenheit ? SP_ALARM_MAX_F : SP_ALARM_MAX_C);
4301                     	btst	_fahrenheit
4302  0427 2405          	jruge	L67
4303  0429 ae0320        	ldw	x,#800
4304  042c 2003          	jra	L001
4305  042e               L67:
4306  042e ae0190        	ldw	x,#400
4307  0431               L001:
4308  0431 1f04          	ldw	(OFST-1,sp),x
4311  0433 2025          	jra	L5132
4312  0435               L1532:
4313                     ; 381         } else if(type == t_step)
4315  0435 7b03          	ld	a,(OFST-2,sp)
4316  0437 a105          	cp	a,#5
4317  0439 2607          	jrne	L5532
4318                     ; 383             t_max = NO_OF_TT_PAIRS;
4320  043b ae0009        	ldw	x,#9
4321  043e 1f04          	ldw	(OFST-1,sp),x
4324  0440 2018          	jra	L5132
4325  0442               L5532:
4326                     ; 384         } else if (type == t_delay)
4328  0442 7b03          	ld	a,(OFST-2,sp)
4329  0444 a106          	cp	a,#6
4330  0446 2607          	jrne	L1632
4331                     ; 386             t_max = 60;
4333  0448 ae003c        	ldw	x,#60
4334  044b 1f04          	ldw	(OFST-1,sp),x
4337  044d 200b          	jra	L5132
4338  044f               L1632:
4339                     ; 387         } else if (type == t_runmode)
4341  044f 7b03          	ld	a,(OFST-2,sp)
4342  0451 a107          	cp	a,#7
4343  0453 2605          	jrne	L5132
4344                     ; 389             t_max = NO_OF_PROFILES;
4346  0455 ae0006        	ldw	x,#6
4347  0458 1f04          	ldw	(OFST-1,sp),x
4349  045a               L5132:
4350                     ; 392     return range(config_value, t_min, t_max);
4352  045a 1e04          	ldw	x,(OFST-1,sp)
4353  045c 89            	pushw	x
4354  045d 1e03          	ldw	x,(OFST-2,sp)
4355  045f 89            	pushw	x
4356  0460 1e0a          	ldw	x,(OFST+5,sp)
4357  0462 cd02fb        	call	_range
4359  0465 5b04          	addw	sp,#4
4362  0467 5b07          	addw	sp,#7
4363  0469 81            	ret
4418                     ; 402 void read_buttons(void)
4418                     ; 403 {
4419                     	switch	.text
4420  046a               _read_buttons:
4422  046a 89            	pushw	x
4423       00000002      OFST:	set	2
4426                     ; 406     disable_interrupts();     // Disable interrups while reading buttons
4429  046b 9b            sim
4431                     ; 408     hc164_state = hc164_val;      // save current hc164_val
4434  046c b600          	ld	a,_hc164_val
4435  046e 6b01          	ld	(OFST-1,sp),a
4437                     ; 409     set_hc164(0x00);
4439  0470 4f            	clr	a
4440  0471 cd0000        	call	_set_hc164
4442                     ; 410     porte   = PE_IDR & SEG7_C;    // Save 7-segment C status
4444  0474 c65015        	ld	a,_PE_IDR
4445  0477 a401          	and	a,#1
4446  0479 b700          	ld	_porte,a
4447                     ; 411     portd   = PD_IDR & PORTD_OUT; // Save other 7-segments
4449  047b c65010        	ld	a,_PD_IDR
4450  047e a4fd          	and	a,#253
4451  0480 b701          	ld	_portd,a
4452                     ; 412     PE_ODR |= SEG7_C;             // disable 7-segment display C
4454  0482 72105014      	bset	_PE_ODR,#0
4455                     ; 413     PD_ODR |= PORTD_OUT;          // disable all other 7-segment displays
4457  0486 c6500f        	ld	a,_PD_ODR
4458  0489 aafd          	or	a,#253
4459  048b c7500f        	ld	_PD_ODR,a
4460                     ; 414     for (i = 0x08; i > 0x00; i >>= 1)
4462  048e a608          	ld	a,#8
4463  0490 6b02          	ld	(OFST+0,sp),a
4465  0492               L1142:
4466                     ; 416        _buttons <<= 1;
4468  0492 3808          	sll	__buttons
4469                     ; 417        _buttons  &= 0xFE; // clear bit 0
4471  0494 72110008      	bres	__buttons,#0
4472                     ; 418        set_hc164(i);
4474  0498 7b02          	ld	a,(OFST+0,sp)
4475  049a cd0000        	call	_set_hc164
4477                     ; 419        if (PC_IDR & KEYS) _buttons |= 0x01;
4479  049d c6500b        	ld	a,_PC_IDR
4480  04a0 a502          	bcp	a,#2
4481  04a2 2704          	jreq	L7142
4484  04a4 72100008      	bset	__buttons,#0
4485  04a8               L7142:
4486                     ; 420        set_hc164(0x00);
4488  04a8 4f            	clr	a
4489  04a9 cd0000        	call	_set_hc164
4491                     ; 414     for (i = 0x08; i > 0x00; i >>= 1)
4493  04ac 0402          	srl	(OFST+0,sp)
4497  04ae 0d02          	tnz	(OFST+0,sp)
4498  04b0 26e0          	jrne	L1142
4499                     ; 424     PD_ODR &= ~PORTD_OUT;
4501  04b2 c6500f        	ld	a,_PD_ODR
4502  04b5 a402          	and	a,#2
4503  04b7 c7500f        	ld	_PD_ODR,a
4504                     ; 425     PD_ODR |= portd;        // restore PORTD
4506  04ba c6500f        	ld	a,_PD_ODR
4507  04bd ba01          	or	a,_portd
4508  04bf c7500f        	ld	_PD_ODR,a
4509                     ; 426     PE_ODR &= ~SEG7_C;
4511  04c2 72115014      	bres	_PE_ODR,#0
4512                     ; 427     PE_ODR |= porte;        // restore PORTE
4514  04c6 c65014        	ld	a,_PE_ODR
4515  04c9 ba00          	or	a,_porte
4516  04cb c75014        	ld	_PE_ODR,a
4517                     ; 428     set_hc164(hc164_state); // restore HC164 state
4519  04ce 7b01          	ld	a,(OFST-1,sp)
4520  04d0 cd0000        	call	_set_hc164
4522                     ; 429     enable_interrupts();    // Re-enable Interrupts
4525  04d3 9a            rim
4527                     ; 430 } // read_buttons()
4531  04d4 85            	popw	x
4532  04d5 81            	ret
4624                     	switch	.const
4625  0056               L031:
4626  0056 04ee          	dc.w	L1242
4627  0058 05cf          	dc.w	L5242
4628  005a 0603          	dc.w	L7242
4629  005c 0642          	dc.w	L1342
4630  005e 0678          	dc.w	L3342
4631  0060 0568          	dc.w	L3242
4632  0062 06c1          	dc.w	L5342
4633  0064 06fe          	dc.w	L7342
4634  0066 075b          	dc.w	L1442
4635  0068 07de          	dc.w	L3442
4636  006a 08b3          	dc.w	L7442
4637  006c 090e          	dc.w	L1542
4638                     ; 439 void menu_fsm(void)
4638                     ; 440 {
4639                     	switch	.text
4640  04d6               _menu_fsm:
4642  04d6 89            	pushw	x
4643       00000002      OFST:	set	2
4646                     ; 443    if (m_countdown) m_countdown--; // countdown counter
4648  04d7 3d07          	tnz	_m_countdown
4649  04d9 2702          	jreq	L1152
4652  04db 3a07          	dec	_m_countdown
4653  04dd               L1152:
4654                     ; 445    switch (menustate)
4656  04dd b604          	ld	a,_menustate
4658                     ; 762             break;
4659  04df a10c          	cp	a,#12
4660  04e1 2407          	jruge	L621
4661  04e3 5f            	clrw	x
4662  04e4 97            	ld	xl,a
4663  04e5 58            	sllw	x
4664  04e6 de0056        	ldw	x,(L031,x)
4665  04e9 fc            	jp	(x)
4666  04ea               L621:
4667  04ea ac240a24      	jpf	L5542
4668  04ee               L1242:
4669                     ; 448         case MENU_IDLE:
4669                     ; 449             leds_out &= ~LED_ALM2;
4671  04ee 72150001      	bres	_leds_out+1,#2
4672                     ; 450             pwr_on = eeprom_read_config(EEADR_POWER_ON);
4674  04f2 a685          	ld	a,#133
4675  04f4 cd0000        	call	_eeprom_read_config
4677  04f7 a30000        	cpw	x,#0
4678  04fa 2602          	jrne	L631
4679  04fc 2006          	jp	L211
4680  04fe               L631:
4681  04fe 72100001      	bset	_pwr_on
4682  0502 2004          	jra	L411
4683  0504               L211:
4684  0504 72110001      	bres	_pwr_on
4685  0508               L411:
4686                     ; 451             if (BTN_PRESSED(BTN_LEFT))
4688  0508 b608          	ld	a,__buttons
4689  050a a444          	and	a,#68
4690  050c a104          	cp	a,#4
4691  050e 260c          	jrne	L7152
4692                     ; 453                 m_countdown = TMR_POWERDOWN;
4694  0510 351e0007      	mov	_m_countdown,#30
4695                     ; 454                 menustate   = MENU_POWER_DOWN_WAIT;
4697  0514 35050004      	mov	_menustate,#5
4699  0518 ac260a26      	jpf	L5152
4700  051c               L7152:
4701                     ; 455             } else if (!pwr_on)
4703                     	btst	_pwr_on
4704  0521 2507          	jrult	L3252
4705                     ; 457                 leds_out = 0x00;
4707  0523 5f            	clrw	x
4708  0524 bf00          	ldw	_leds_out,x
4710  0526 ac260a26      	jpf	L5152
4711  052a               L3252:
4712                     ; 458             } else if (_buttons)
4714  052a 3d08          	tnz	__buttons
4715  052c 2603          	jrne	L041
4716  052e cc0a26        	jp	L5152
4717  0531               L041:
4718                     ; 460                 if (BTN_PRESSED(BTN_UP))
4720  0531 b608          	ld	a,__buttons
4721  0533 a411          	and	a,#17
4722  0535 a101          	cp	a,#1
4723  0537 2608          	jrne	L1352
4724                     ; 462                     menustate = MENU_SHOW_VERSION;
4726  0539 35010004      	mov	_menustate,#1
4728  053d ac260a26      	jpf	L5152
4729  0541               L1352:
4730                     ; 463                 } else if (BTN_PRESSED(BTN_DOWN))
4732  0541 b608          	ld	a,__buttons
4733  0543 a422          	and	a,#34
4734  0545 a102          	cp	a,#2
4735  0547 260c          	jrne	L5352
4736                     ; 465                     m_countdown = TMR_SHOW_PROFILE_ITEM;
4738  0549 350f0007      	mov	_m_countdown,#15
4739                     ; 466                     menustate   = MENU_SHOW_STATE_DOWN;
4741  054d 35020004      	mov	_menustate,#2
4743  0551 ac260a26      	jpf	L5152
4744  0555               L5352:
4745                     ; 467                 } else if (BTN_RELEASED(BTN_SET))
4747  0555 b608          	ld	a,__buttons
4748  0557 a488          	and	a,#136
4749  0559 a180          	cp	a,#128
4750  055b 2703          	jreq	L241
4751  055d cc0a26        	jp	L5152
4752  0560               L241:
4753                     ; 469                     menustate = MENU_SHOW_MENU_ITEM;
4755  0560 35060004      	mov	_menustate,#6
4756  0564 ac260a26      	jpf	L5152
4757  0568               L3242:
4758                     ; 474         case MENU_POWER_DOWN_WAIT:
4758                     ; 475             if (m_countdown == 0)
4760  0568 3d07          	tnz	_m_countdown
4761  056a 2652          	jrne	L3452
4762                     ; 477                 pwr_on = eeprom_read_config(EEADR_POWER_ON);
4764  056c a685          	ld	a,#133
4765  056e cd0000        	call	_eeprom_read_config
4767  0571 a30000        	cpw	x,#0
4768  0574 2602          	jrne	L441
4769  0576 2006          	jp	L611
4770  0578               L441:
4771  0578 72100001      	bset	_pwr_on
4772  057c 2004          	jra	L021
4773  057e               L611:
4774  057e 72110001      	bres	_pwr_on
4775  0582               L021:
4776                     ; 478                 pwr_on = !pwr_on;
4778  0582 90100001      	bcpl	_pwr_on
4779                     ; 479                 eeprom_write_config(EEADR_POWER_ON, pwr_on);
4781  0586 5f            	clrw	x
4782                     	btst	_pwr_on
4783  058c 59            	rlcw	x
4784  058d 89            	pushw	x
4785  058e a685          	ld	a,#133
4786  0590 cd0000        	call	_eeprom_write_config
4788  0593 85            	popw	x
4789                     ; 480                 if (pwr_on)
4791                     	btst	_pwr_on
4792  0599 241d          	jruge	L5452
4793                     ; 482                     heating_delay = 60; // 60 sec.
4795  059b ae003c        	ldw	x,#60
4796  059e bf02          	ldw	_heating_delay,x
4797                     ; 483                     cooling_delay = 60; // 60 sec.
4799  05a0 ae003c        	ldw	x,#60
4800  05a3 bf00          	ldw	_cooling_delay,x
4801                     ; 484                     eeprom_write_config(EEADR_MENU_ITEM(St), 0);
4803  05a5 5f            	clrw	x
4804  05a6 89            	pushw	x
4805  05a7 a678          	ld	a,#120
4806  05a9 cd0000        	call	_eeprom_write_config
4808  05ac 85            	popw	x
4809                     ; 485                     curr_dur = 0;
4811  05ad 5f            	clrw	x
4812  05ae bf0a          	ldw	_curr_dur,x
4813                     ; 486                     eeprom_write_config(EEADR_MENU_ITEM(dh), curr_dur);
4815  05b0 5f            	clrw	x
4816  05b1 89            	pushw	x
4817  05b2 a679          	ld	a,#121
4818  05b4 cd0000        	call	_eeprom_write_config
4820  05b7 85            	popw	x
4821  05b8               L5452:
4822                     ; 488                 menustate = MENU_IDLE;
4824  05b8 3f04          	clr	_menustate
4826  05ba ac260a26      	jpf	L5152
4827  05be               L3452:
4828                     ; 489             } else if(!BTN_HELD(BTN_LEFT))
4830  05be b608          	ld	a,__buttons
4831  05c0 a444          	and	a,#68
4832  05c2 a144          	cp	a,#68
4833  05c4 2603          	jrne	L641
4834  05c6 cc0a26        	jp	L5152
4835  05c9               L641:
4836                     ; 491                 menustate = MENU_IDLE;
4838  05c9 3f04          	clr	_menustate
4839  05cb ac260a26      	jpf	L5152
4840  05cf               L5242:
4841                     ; 495         case MENU_SHOW_VERSION: // Show STC1000p version number
4841                     ; 496             top_100 = LED_S; top_10 = LED_u; top_1 = LED_E; top_01 = LED_r;
4843  05cf 35b50013      	mov	_top_100,#181
4846  05d3 35c10012      	mov	_top_10,#193
4849  05d7 35f40011      	mov	_top_1,#244
4852  05db 35500010      	mov	_top_01,#80
4853                     ; 497             value_to_led(STC1000P_VERSION,LEDS_INT, ROW_BOT);
4855  05df 4b03          	push	#3
4856  05e1 4b00          	push	#0
4857  05e3 ae012c        	ldw	x,#300
4858  05e6 cd00cc        	call	_value_to_led
4860  05e9 85            	popw	x
4861                     ; 498             bot_10 |= LED_DP; bot_1  |= LED_DP;
4863  05ea 7216000e      	bset	_bot_10,#3
4866  05ee 7216000d      	bset	_bot_1,#3
4867                     ; 499             if(!BTN_HELD(BTN_UP)) menustate = MENU_IDLE;
4869  05f2 b608          	ld	a,__buttons
4870  05f4 a411          	and	a,#17
4871  05f6 a111          	cp	a,#17
4872  05f8 2603          	jrne	L051
4873  05fa cc0a26        	jp	L5152
4874  05fd               L051:
4877  05fd 3f04          	clr	_menustate
4878  05ff ac260a26      	jpf	L5152
4879  0603               L7242:
4880                     ; 502         case MENU_SHOW_STATE_DOWN: // Show Profile-number
4880                     ; 503             run_mode = eeprom_read_config(EEADR_MENU_ITEM(rn));
4882  0603 a684          	ld	a,#132
4883  0605 cd0000        	call	_eeprom_read_config
4885  0608 01            	rrwa	x,a
4886  0609 6b02          	ld	(OFST+0,sp),a
4887  060b 02            	rlwa	x,a
4889                     ; 504             top_100 = LED_OFF; top_10 = LED_r; top_1 = LED_u; top_01 = LED_n;
4891  060c 3f13          	clr	_top_100
4894  060e 35500012      	mov	_top_10,#80
4897  0612 35c10011      	mov	_top_1,#193
4900  0616 35510010      	mov	_top_01,#81
4901                     ; 505             prx_to_led(run_mode); // display run_mode on bottom row
4903  061a 7b02          	ld	a,(OFST+0,sp)
4904  061c cd0051        	call	_prx_to_led
4906                     ; 506             if ((run_mode < THERMOSTAT_MODE) && (m_countdown == 0))
4908  061f 7b02          	ld	a,(OFST+0,sp)
4909  0621 a106          	cp	a,#6
4910  0623 240c          	jruge	L5552
4912  0625 3d07          	tnz	_m_countdown
4913  0627 2608          	jrne	L5552
4914                     ; 508                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4916  0629 350f0007      	mov	_m_countdown,#15
4917                     ; 509                 menustate   = MENU_SHOW_STATE_DOWN_2;
4919  062d 35030004      	mov	_menustate,#3
4920  0631               L5552:
4921                     ; 511             if (!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
4923  0631 b608          	ld	a,__buttons
4924  0633 a422          	and	a,#34
4925  0635 a122          	cp	a,#34
4926  0637 2603          	jrne	L251
4927  0639 cc0a26        	jp	L5152
4928  063c               L251:
4931  063c 3f04          	clr	_menustate
4932  063e ac260a26      	jpf	L5152
4933  0642               L1342:
4934                     ; 514         case MENU_SHOW_STATE_DOWN_2: // Show current step number within profile
4934                     ; 515             top_10  = LED_S; top_1 = LED_t; 
4936  0642 35b50012      	mov	_top_10,#181
4939  0646 35f00011      	mov	_top_1,#240
4940                     ; 516             top_100 = top_01 = LED_OFF;
4942  064a 3f10          	clr	_top_01
4943  064c 3f13          	clr	_top_100
4944                     ; 517             value_to_led(eeprom_read_config(EEADR_MENU_ITEM(St)),LEDS_INT, ROW_BOT);
4946  064e 4b03          	push	#3
4947  0650 4b00          	push	#0
4948  0652 a678          	ld	a,#120
4949  0654 cd0000        	call	_eeprom_read_config
4951  0657 cd00cc        	call	_value_to_led
4953  065a 85            	popw	x
4954                     ; 518             if (m_countdown == 0)
4956  065b 3d07          	tnz	_m_countdown
4957  065d 2608          	jrne	L1652
4958                     ; 520                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4960  065f 350f0007      	mov	_m_countdown,#15
4961                     ; 521                 menustate   = MENU_SHOW_STATE_DOWN_3;
4963  0663 35040004      	mov	_menustate,#4
4964  0667               L1652:
4965                     ; 523             if(!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
4967  0667 b608          	ld	a,__buttons
4968  0669 a422          	and	a,#34
4969  066b a122          	cp	a,#34
4970  066d 2603          	jrne	L451
4971  066f cc0a26        	jp	L5152
4972  0672               L451:
4975  0672 3f04          	clr	_menustate
4976  0674 ac260a26      	jpf	L5152
4977  0678               L3342:
4978                     ; 526         case MENU_SHOW_STATE_DOWN_3: // Show current duration of running profile
4978                     ; 527             top_10  = LED_d; top_1 = LED_h; 
4980  0678 35d30012      	mov	_top_10,#211
4983  067c 35710011      	mov	_top_1,#113
4984                     ; 528             top_100 = top_01 = LED_OFF;
4986  0680 3f10          	clr	_top_01
4987  0682 3f13          	clr	_top_100
4988                     ; 529             if (minutes) // is timing-control in minutes?
4990                     	btst	_minutes
4991  0689 240c          	jruge	L5652
4992                     ; 530                  value_to_led(curr_dur,LEDS_INT, ROW_BOT);
4994  068b 4b03          	push	#3
4995  068d 4b00          	push	#0
4996  068f be0a          	ldw	x,_curr_dur
4997  0691 cd00cc        	call	_value_to_led
4999  0694 85            	popw	x
5001  0695 200d          	jra	L7652
5002  0697               L5652:
5003                     ; 531             else value_to_led(eeprom_read_config(EEADR_MENU_ITEM(dh)),LEDS_INT,ROW_BOT);
5005  0697 4b03          	push	#3
5006  0699 4b00          	push	#0
5007  069b a679          	ld	a,#121
5008  069d cd0000        	call	_eeprom_read_config
5010  06a0 cd00cc        	call	_value_to_led
5012  06a3 85            	popw	x
5013  06a4               L7652:
5014                     ; 532             if (m_countdown == 0)
5016  06a4 3d07          	tnz	_m_countdown
5017  06a6 2608          	jrne	L1752
5018                     ; 534                 m_countdown = TMR_SHOW_PROFILE_ITEM;
5020  06a8 350f0007      	mov	_m_countdown,#15
5021                     ; 535                 menustate   = MENU_SHOW_STATE_DOWN;
5023  06ac 35020004      	mov	_menustate,#2
5024  06b0               L1752:
5025                     ; 537             if (!BTN_HELD(BTN_DOWN))
5027  06b0 b608          	ld	a,__buttons
5028  06b2 a422          	and	a,#34
5029  06b4 a122          	cp	a,#34
5030  06b6 2603          	jrne	L651
5031  06b8 cc0a26        	jp	L5152
5032  06bb               L651:
5033                     ; 539                 menustate = MENU_IDLE;
5035  06bb 3f04          	clr	_menustate
5036  06bd ac260a26      	jpf	L5152
5037  06c1               L5342:
5038                     ; 543         case MENU_SHOW_MENU_ITEM: // S-button was pressed
5038                     ; 544             top_100 = LED_S;   top_10  = LED_E; top_1 = LED_t; 
5040  06c1 35b50013      	mov	_top_100,#181
5043  06c5 35f40012      	mov	_top_10,#244
5046  06c9 35f00011      	mov	_top_1,#240
5047                     ; 545             top_01  = bot_01 = LED_OFF; bot_100 = LED_P;
5049  06cd 3f0c          	clr	_bot_01
5050  06cf 3f10          	clr	_top_01
5053  06d1 3576000f      	mov	_bot_100,#118
5054                     ; 546             if (menu_item < NO_OF_PROFILES)
5056  06d5 b605          	ld	a,_menu_item
5057  06d7 a106          	cp	a,#6
5058  06d9 240f          	jruge	L5752
5059                     ; 548                 bot_10 = LED_r;
5061  06db 3550000e      	mov	_bot_10,#80
5062                     ; 549                 bot_1  = led_lookup[menu_item];
5064  06df b605          	ld	a,_menu_item
5065  06e1 5f            	clrw	x
5066  06e2 97            	ld	xl,a
5067  06e3 d60000        	ld	a,(_led_lookup,x)
5068  06e6 b70d          	ld	_bot_1,a
5070  06e8 2008          	jra	L7752
5071  06ea               L5752:
5072                     ; 551                 bot_10 = LED_A;
5074  06ea 3577000e      	mov	_bot_10,#119
5075                     ; 552                 bot_1  = LED_r;
5077  06ee 3550000d      	mov	_bot_1,#80
5078  06f2               L7752:
5079                     ; 554             m_countdown = TMR_NO_KEY_TIMEOUT;
5081  06f2 35960007      	mov	_m_countdown,#150
5082                     ; 555             menustate   = MENU_SET_MENU_ITEM;
5084  06f6 35070004      	mov	_menustate,#7
5085                     ; 556         break; // MENU_SHOW_MENU_ITEM
5087  06fa ac260a26      	jpf	L5152
5088  06fe               L7342:
5089                     ; 558         case MENU_SET_MENU_ITEM:
5089                     ; 559             if (m_countdown == 0 || BTN_RELEASED(BTN_LEFT))
5091  06fe 3d07          	tnz	_m_countdown
5092  0700 2708          	jreq	L3062
5094  0702 b608          	ld	a,__buttons
5095  0704 a444          	and	a,#68
5096  0706 a140          	cp	a,#64
5097  0708 2606          	jrne	L1062
5098  070a               L3062:
5099                     ; 561                 menustate = MENU_IDLE;
5101  070a 3f04          	clr	_menustate
5103  070c ac260a26      	jpf	L5152
5104  0710               L1062:
5105                     ; 562             } else if(BTN_RELEASED(BTN_UP))
5107  0710 b608          	ld	a,__buttons
5108  0712 a411          	and	a,#17
5109  0714 a110          	cp	a,#16
5110  0716 2612          	jrne	L7062
5111                     ; 564                 if(++menu_item > MENU_ITEM_NO) menu_item = 0;
5113  0718 3c05          	inc	_menu_item
5114  071a b605          	ld	a,_menu_item
5115  071c a107          	cp	a,#7
5116  071e 2502          	jrult	L1162
5119  0720 3f05          	clr	_menu_item
5120  0722               L1162:
5121                     ; 565                 menustate = MENU_SHOW_MENU_ITEM;
5123  0722 35060004      	mov	_menustate,#6
5125  0726 ac260a26      	jpf	L5152
5126  072a               L7062:
5127                     ; 566             } else if(BTN_RELEASED(BTN_DOWN))
5129  072a b608          	ld	a,__buttons
5130  072c a422          	and	a,#34
5131  072e a120          	cp	a,#32
5132  0730 2614          	jrne	L5162
5133                     ; 568                 if(--menu_item > MENU_ITEM_NO) menu_item = MENU_ITEM_NO;
5135  0732 3a05          	dec	_menu_item
5136  0734 b605          	ld	a,_menu_item
5137  0736 a107          	cp	a,#7
5138  0738 2504          	jrult	L7162
5141  073a 35060005      	mov	_menu_item,#6
5142  073e               L7162:
5143                     ; 569                 menustate = MENU_SHOW_MENU_ITEM;
5145  073e 35060004      	mov	_menustate,#6
5147  0742 ac260a26      	jpf	L5152
5148  0746               L5162:
5149                     ; 570             } else if(BTN_RELEASED(BTN_SET))
5151  0746 b608          	ld	a,__buttons
5152  0748 a488          	and	a,#136
5153  074a a180          	cp	a,#128
5154  074c 2703          	jreq	L061
5155  074e cc0a26        	jp	L5152
5156  0751               L061:
5157                     ; 572                 config_item = 0;
5159  0751 3f06          	clr	_config_item
5160                     ; 573                 menustate   = MENU_SHOW_CONFIG_ITEM;
5162  0753 35080004      	mov	_menustate,#8
5163  0757 ac260a26      	jpf	L5152
5164  075b               L1442:
5165                     ; 577         case MENU_SHOW_CONFIG_ITEM: // S-button is released
5165                     ; 578             if (menu_item < MENU_ITEM_NO)
5167  075b b605          	ld	a,_menu_item
5168  075d a106          	cp	a,#6
5169  075f 242d          	jruge	L5262
5170                     ; 580                 if(config_item & 0x1) 
5172  0761 b606          	ld	a,_config_item
5173  0763 a501          	bcp	a,#1
5174  0765 270a          	jreq	L7262
5175                     ; 582                     top_100 = LED_d; // duration: 2nd value of a profile-step
5177  0767 35d30013      	mov	_top_100,#211
5178                     ; 583                     top_10  = LED_h;
5180  076b 35710012      	mov	_top_10,#113
5182  076f 2008          	jra	L1362
5183  0771               L7262:
5184                     ; 585                     top_100 = LED_S; // setpoint: 1st value of a profile-step
5186  0771 35b50013      	mov	_top_100,#181
5187                     ; 586                     top_10  = LED_P;
5189  0775 35760012      	mov	_top_10,#118
5190  0779               L1362:
5191                     ; 588                 top_1  = led_lookup[menu_item];
5193  0779 b605          	ld	a,_menu_item
5194  077b 5f            	clrw	x
5195  077c 97            	ld	xl,a
5196  077d d60000        	ld	a,(_led_lookup,x)
5197  0780 b711          	ld	_top_1,a
5198                     ; 589                 top_01 = led_lookup[(config_item >> 1)];
5200  0782 b606          	ld	a,_config_item
5201  0784 44            	srl	a
5202  0785 5f            	clrw	x
5203  0786 97            	ld	xl,a
5204  0787 d60000        	ld	a,(_led_lookup,x)
5205  078a b710          	ld	_top_01,a
5207  078c 2023          	jra	L3362
5208  078e               L5262:
5209                     ; 592                 top_100 = LED_OFF;
5211  078e 3f13          	clr	_top_100
5212                     ; 593                 top_10  = menu[config_item].led_c_10;
5214  0790 b606          	ld	a,_config_item
5215  0792 97            	ld	xl,a
5216  0793 a604          	ld	a,#4
5217  0795 42            	mul	x,a
5218  0796 d6000a        	ld	a,(_menu,x)
5219  0799 b712          	ld	_top_10,a
5220                     ; 594                 top_1   = menu[config_item].led_c_1;
5222  079b b606          	ld	a,_config_item
5223  079d 97            	ld	xl,a
5224  079e a604          	ld	a,#4
5225  07a0 42            	mul	x,a
5226  07a1 d6000b        	ld	a,(_menu+1,x)
5227  07a4 b711          	ld	_top_1,a
5228                     ; 595                 top_01  = menu[config_item].led_c_01;
5230  07a6 b606          	ld	a,_config_item
5231  07a8 97            	ld	xl,a
5232  07a9 a604          	ld	a,#4
5233  07ab 42            	mul	x,a
5234  07ac d6000c        	ld	a,(_menu+2,x)
5235  07af b710          	ld	_top_01,a
5236  07b1               L3362:
5237                     ; 597             adr          = MI_CI_TO_EEADR(menu_item, config_item);
5239  07b1 b605          	ld	a,_menu_item
5240  07b3 97            	ld	xl,a
5241  07b4 a613          	ld	a,#19
5242  07b6 42            	mul	x,a
5243  07b7 9f            	ld	a,xl
5244  07b8 bb06          	add	a,_config_item
5245  07ba 6b01          	ld	(OFST-1,sp),a
5247                     ; 598             config_value = eeprom_read_config(adr);
5249  07bc 7b01          	ld	a,(OFST-1,sp)
5250  07be cd0000        	call	_eeprom_read_config
5252  07c1 bf09          	ldw	_config_value,x
5253                     ; 599             config_value = check_config_value(config_value, adr);
5255  07c3 7b01          	ld	a,(OFST-1,sp)
5256  07c5 88            	push	a
5257  07c6 be09          	ldw	x,_config_value
5258  07c8 cd0315        	call	_check_config_value
5260  07cb 84            	pop	a
5261  07cc bf09          	ldw	_config_value,x
5262                     ; 600             m_countdown  = TMR_NO_KEY_TIMEOUT;
5264  07ce 35960007      	mov	_m_countdown,#150
5265                     ; 601             ret_state    = MENU_SET_CONFIG_ITEM;  // return state
5267  07d2 3509000b      	mov	_ret_state,#9
5268                     ; 602             menustate    = MENU_SHOW_CONFIG_VALUE; // display config value
5270  07d6 350a0004      	mov	_menustate,#10
5271                     ; 603             break;
5273  07da ac260a26      	jpf	L5152
5274  07de               L3442:
5275                     ; 605         case MENU_SET_CONFIG_ITEM:
5275                     ; 606             leds_out = LED_ALM2;
5277  07de ae0004        	ldw	x,#4
5278  07e1 bf00          	ldw	_leds_out,x
5279                     ; 607             if (m_countdown == 0)
5281  07e3 3d07          	tnz	_m_countdown
5282  07e5 2606          	jrne	L5362
5283                     ; 609                     menustate = MENU_IDLE;
5285  07e7 3f04          	clr	_menustate
5287  07e9 ac920892      	jpf	L7362
5288  07ed               L5362:
5289                     ; 610             } else if (BTN_RELEASED(BTN_LEFT))
5291  07ed b608          	ld	a,__buttons
5292  07ef a444          	and	a,#68
5293  07f1 a140          	cp	a,#64
5294  07f3 2608          	jrne	L1462
5295                     ; 612                 menustate = MENU_SHOW_MENU_ITEM;
5297  07f5 35060004      	mov	_menustate,#6
5299  07f9 ac920892      	jpf	L7362
5300  07fd               L1462:
5301                     ; 613             } else if (BTN_RELEASED(BTN_UP))
5303  07fd b608          	ld	a,__buttons
5304  07ff a411          	and	a,#17
5305  0801 a110          	cp	a,#16
5306  0803 2626          	jrne	L5462
5307                     ; 615                 config_item++;
5309  0805 3c06          	inc	_config_item
5310                     ; 616                 if (menu_item < MENU_ITEM_NO)
5312  0807 b605          	ld	a,_menu_item
5313  0809 a106          	cp	a,#6
5314  080b 240a          	jruge	L7462
5315                     ; 618                     if (config_item >= PROFILE_SIZE)
5317  080d b606          	ld	a,_config_item
5318  080f a113          	cp	a,#19
5319  0811 250e          	jrult	L3562
5320                     ; 620                         config_item = 0;
5322  0813 3f06          	clr	_config_item
5323  0815 200a          	jra	L3562
5324  0817               L7462:
5325                     ; 623                     if (config_item >= MENU_SIZE)
5327  0817 b606          	ld	a,_config_item
5328  0819 a113          	cp	a,#19
5329  081b 2534          	jrult	L5442
5330                     ; 625                         config_item = 0;
5332  081d 3f06          	clr	_config_item
5333  081f 2030          	jra	L5442
5334  0821               L3562:
5335                     ; 632                 ret_state = MENU_SHOW_CONFIG_ITEM;  // return state
5337  0821 3508000b      	mov	_ret_state,#8
5338                     ; 633                 menustate = MENU_SHOW_CONFIG_VALUE; // display config value
5340  0825 350a0004      	mov	_menustate,#10
5342  0829 2067          	jra	L7362
5343  082b               L5462:
5344                     ; 634             } else if(BTN_RELEASED(BTN_DOWN))
5346  082b b608          	ld	a,__buttons
5347  082d a422          	and	a,#34
5348  082f a120          	cp	a,#32
5349  0831 264f          	jrne	L1662
5350                     ; 636                 config_item--;
5352  0833 3a06          	dec	_config_item
5353                     ; 637                 if(menu_item < MENU_ITEM_NO)
5355  0835 b605          	ld	a,_menu_item
5356  0837 a106          	cp	a,#6
5357  0839 240c          	jruge	L3662
5358                     ; 639                     if (config_item >= PROFILE_SIZE)
5360  083b b606          	ld	a,_config_item
5361  083d a113          	cp	a,#19
5362  083f 2537          	jrult	L7662
5363                     ; 641                         config_item = PROFILE_SIZE-1;
5365  0841 35120006      	mov	_config_item,#18
5366  0845 2031          	jra	L7662
5367  0847               L3662:
5368                     ; 644                     if (config_item > MENU_SIZE-1)
5370  0847 b606          	ld	a,_config_item
5371  0849 a113          	cp	a,#19
5372  084b 2504          	jrult	L5442
5373                     ; 646                         config_item = MENU_SIZE-1;
5375  084d 35120006      	mov	_config_item,#18
5376  0851               L5442:
5377                     ; 648                     chk_skip_menu_item: // label for goto
5377                     ; 649                     if (!minutes && ((uint8_t)eeprom_read_config(EEADR_MENU_ITEM(rn)) >= THERMOSTAT_MODE))
5379                     	btst	_minutes
5380  0856 2520          	jrult	L7662
5382  0858 a684          	ld	a,#132
5383  085a cd0000        	call	_eeprom_read_config
5385  085d 9f            	ld	a,xl
5386  085e a106          	cp	a,#6
5387  0860 2516          	jrult	L7662
5388                     ; 651                         if (config_item == St)
5390  0862 b606          	ld	a,_config_item
5391  0864 a106          	cp	a,#6
5392  0866 2606          	jrne	L5762
5393                     ; 653                             config_item += 2;
5395  0868 3c06          	inc	_config_item
5396  086a 3c06          	inc	_config_item
5398  086c 200a          	jra	L7662
5399  086e               L5762:
5400                     ; 655                         else if (config_item == dh)
5402  086e b606          	ld	a,_config_item
5403  0870 a107          	cp	a,#7
5404  0872 2604          	jrne	L7662
5405                     ; 657                             config_item -= 2;
5407  0874 3a06          	dec	_config_item
5408  0876 3a06          	dec	_config_item
5409  0878               L7662:
5410                     ; 661                 ret_state = MENU_SHOW_CONFIG_ITEM;  // return to this state
5412  0878 3508000b      	mov	_ret_state,#8
5413                     ; 662                 menustate = MENU_SHOW_CONFIG_VALUE; // display config value
5415  087c 350a0004      	mov	_menustate,#10
5417  0880 2010          	jra	L7362
5418  0882               L1662:
5419                     ; 663             } else if(BTN_RELEASED(BTN_SET))
5421  0882 b608          	ld	a,__buttons
5422  0884 a488          	and	a,#136
5423  0886 a180          	cp	a,#128
5424  0888 2608          	jrne	L7362
5425                     ; 665                 m_countdown  = TMR_NO_KEY_TIMEOUT;
5427  088a 35960007      	mov	_m_countdown,#150
5428                     ; 666                 menustate    = MENU_SET_CONFIG_VALUE;  // display config value
5430  088e 350b0004      	mov	_menustate,#11
5431  0892               L7362:
5432                     ; 668             adr          = MI_CI_TO_EEADR(menu_item, config_item);
5434  0892 b605          	ld	a,_menu_item
5435  0894 97            	ld	xl,a
5436  0895 a613          	ld	a,#19
5437  0897 42            	mul	x,a
5438  0898 9f            	ld	a,xl
5439  0899 bb06          	add	a,_config_item
5440  089b 6b01          	ld	(OFST-1,sp),a
5442                     ; 669             config_value = eeprom_read_config(adr);
5444  089d 7b01          	ld	a,(OFST-1,sp)
5445  089f cd0000        	call	_eeprom_read_config
5447  08a2 bf09          	ldw	_config_value,x
5448                     ; 670             config_value = check_config_value(config_value, adr);
5450  08a4 7b01          	ld	a,(OFST-1,sp)
5451  08a6 88            	push	a
5452  08a7 be09          	ldw	x,_config_value
5453  08a9 cd0315        	call	_check_config_value
5455  08ac 84            	pop	a
5456  08ad bf09          	ldw	_config_value,x
5457                     ; 671        break; // MENU_SET_CONFIG_ITEM
5459  08af ac260a26      	jpf	L5152
5460  08b3               L7442:
5461                     ; 673        case MENU_SHOW_CONFIG_VALUE:
5461                     ; 674             if(menu_item < MENU_ITEM_NO)
5463  08b3 b605          	ld	a,_menu_item
5464  08b5 a106          	cp	a,#6
5465  08b7 2416          	jruge	L7072
5466                     ; 676                 value_to_led(config_value, (config_item & 0x1) ? LEDS_INT : LEDS_TEMP, ROW_BOT);
5468  08b9 4b03          	push	#3
5469  08bb b606          	ld	a,_config_item
5470  08bd a501          	bcp	a,#1
5471  08bf 2703          	jreq	L221
5472  08c1 4f            	clr	a
5473  08c2 2002          	jra	L421
5474  08c4               L221:
5475  08c4 a601          	ld	a,#1
5476  08c6               L421:
5477  08c6 88            	push	a
5478  08c7 be09          	ldw	x,_config_value
5479  08c9 cd00cc        	call	_value_to_led
5481  08cc 85            	popw	x
5483  08cd 2034          	jra	L1172
5484  08cf               L7072:
5485                     ; 679                 type = menu[config_item].type;
5487  08cf b606          	ld	a,_config_item
5488  08d1 97            	ld	xl,a
5489  08d2 a604          	ld	a,#4
5490  08d4 42            	mul	x,a
5491  08d5 d6000d        	ld	a,(_menu+3,x)
5492  08d8 6b02          	ld	(OFST+0,sp),a
5494                     ; 680                 if(MENU_TYPE_IS_TEMPERATURE(type))
5496  08da 7b02          	ld	a,(OFST+0,sp)
5497  08dc a105          	cp	a,#5
5498  08de 240c          	jruge	L3172
5499                     ; 682                     value_to_led(config_value,LEDS_TEMP, ROW_BOT);
5501  08e0 4b03          	push	#3
5502  08e2 4b01          	push	#1
5503  08e4 be09          	ldw	x,_config_value
5504  08e6 cd00cc        	call	_value_to_led
5506  08e9 85            	popw	x
5508  08ea 2017          	jra	L1172
5509  08ec               L3172:
5510                     ; 683                 } else if (type == t_runmode)
5512  08ec 7b02          	ld	a,(OFST+0,sp)
5513  08ee a107          	cp	a,#7
5514  08f0 2607          	jrne	L7172
5515                     ; 685                     prx_to_led(config_value);
5517  08f2 b60a          	ld	a,_config_value+1
5518  08f4 cd0051        	call	_prx_to_led
5521  08f7 200a          	jra	L1172
5522  08f9               L7172:
5523                     ; 687                     value_to_led(config_value,LEDS_INT, ROW_BOT);
5525  08f9 4b03          	push	#3
5526  08fb 4b00          	push	#0
5527  08fd be09          	ldw	x,_config_value
5528  08ff cd00cc        	call	_value_to_led
5530  0902 85            	popw	x
5531  0903               L1172:
5532                     ; 690             m_countdown  = TMR_NO_KEY_TIMEOUT;
5534  0903 35960007      	mov	_m_countdown,#150
5535                     ; 691             menustate    = ret_state; // return to indicated state
5537  0907 450b04        	mov	_menustate,_ret_state
5538                     ; 692             break;
5540  090a ac260a26      	jpf	L5152
5541  090e               L1542:
5542                     ; 694        case MENU_SET_CONFIG_VALUE:
5542                     ; 695             leds_out = LED_ALM2 | LED_ALM2_BLINK;
5544  090e ae000c        	ldw	x,#12
5545  0911 bf00          	ldw	_leds_out,x
5546                     ; 696             adr = MI_CI_TO_EEADR(menu_item, config_item);
5548  0913 b605          	ld	a,_menu_item
5549  0915 97            	ld	xl,a
5550  0916 a613          	ld	a,#19
5551  0918 42            	mul	x,a
5552  0919 9f            	ld	a,xl
5553  091a bb06          	add	a,_config_item
5554  091c 6b01          	ld	(OFST-1,sp),a
5556                     ; 697             if (m_countdown == 0)
5558  091e 3d07          	tnz	_m_countdown
5559  0920 2606          	jrne	L3272
5560                     ; 699                 menustate = MENU_IDLE;
5562  0922 3f04          	clr	_menustate
5564  0924 ac260a26      	jpf	L5152
5565  0928               L3272:
5566                     ; 700             } else if (BTN_RELEASED(BTN_LEFT))
5568  0928 b608          	ld	a,__buttons
5569  092a a444          	and	a,#68
5570  092c a140          	cp	a,#64
5571  092e 2608          	jrne	L7272
5572                     ; 702                 menustate = MENU_SHOW_CONFIG_ITEM;
5574  0930 35080004      	mov	_menustate,#8
5576  0934 ac260a26      	jpf	L5152
5577  0938               L7272:
5578                     ; 703             } else if(BTN_HELD_OR_RELEASED(BTN_UP)) 
5580  0938 b608          	ld	a,__buttons
5581  093a a411          	and	a,#17
5582  093c a5f0          	bcp	a,#240
5583  093e 271d          	jreq	L3372
5584                     ; 705                 config_value++;
5586  0940 be09          	ldw	x,_config_value
5587  0942 1c0001        	addw	x,#1
5588  0945 bf09          	ldw	_config_value,x
5589                     ; 706                 if ((config_value > 1000) || (--key_held_tmr < 0))
5591  0947 9c            	rvf
5592  0948 be09          	ldw	x,_config_value
5593  094a a303e9        	cpw	x,#1001
5594  094d 2e05          	jrsge	L7372
5596  094f 9c            	rvf
5597  0950 3a08          	dec	_key_held_tmr
5598  0952 2e2c          	jrsge	L3542
5599  0954               L7372:
5600                     ; 708                     config_value += 9;
5602  0954 be09          	ldw	x,_config_value
5603  0956 1c0009        	addw	x,#9
5604  0959 bf09          	ldw	_config_value,x
5605  095b 2023          	jra	L3542
5606  095d               L3372:
5607                     ; 712             } else if(BTN_HELD_OR_RELEASED(BTN_DOWN)) 
5609  095d b608          	ld	a,__buttons
5610  095f a422          	and	a,#34
5611  0961 a5f0          	bcp	a,#240
5612  0963 2731          	jreq	L3472
5613                     ; 714                 config_value--;
5615  0965 be09          	ldw	x,_config_value
5616  0967 1d0001        	subw	x,#1
5617  096a bf09          	ldw	_config_value,x
5618                     ; 715                 if ((config_value > 1000) || (--key_held_tmr < 0))
5620  096c 9c            	rvf
5621  096d be09          	ldw	x,_config_value
5622  096f a303e9        	cpw	x,#1001
5623  0972 2e05          	jrsge	L7472
5625  0974 9c            	rvf
5626  0975 3a08          	dec	_key_held_tmr
5627  0977 2e07          	jrsge	L3542
5628  0979               L7472:
5629                     ; 717                     config_value -= 9;
5631  0979 be09          	ldw	x,_config_value
5632  097b 1d0009        	subw	x,#9
5633  097e bf09          	ldw	_config_value,x
5634  0980               L3542:
5635                     ; 719             chk_cfg_acc_label: // label for goto
5635                     ; 720                 config_value = check_config_value(config_value, adr);
5637  0980 7b01          	ld	a,(OFST-1,sp)
5638  0982 88            	push	a
5639  0983 be09          	ldw	x,_config_value
5640  0985 cd0315        	call	_check_config_value
5642  0988 84            	pop	a
5643  0989 bf09          	ldw	_config_value,x
5644                     ; 721                 ret_state    = MENU_SET_CONFIG_VALUE;  // return to this state
5646  098b 350b000b      	mov	_ret_state,#11
5647                     ; 722                 menustate    = MENU_SHOW_CONFIG_VALUE; // show config_value
5649  098f 350a0004      	mov	_menustate,#10
5651  0993 cc0a26        	jra	L5152
5652  0996               L3472:
5653                     ; 723             } else if(BTN_RELEASED(BTN_SET))
5655  0996 b608          	ld	a,__buttons
5656  0998 a488          	and	a,#136
5657  099a a180          	cp	a,#128
5658  099c 2703cc0a1e    	jrne	L3572
5659                     ; 725                 if (menu_item == MENU_ITEM_NO)
5661  09a1 b605          	ld	a,_menu_item
5662  09a3 a106          	cp	a,#6
5663  09a5 2668          	jrne	L5572
5664                     ; 727                     if (config_item == rn)
5666  09a7 b606          	ld	a,_config_item
5667  09a9 a112          	cp	a,#18
5668  09ab 2662          	jrne	L5572
5669                     ; 729                         eeprom_write_config(EEADR_MENU_ITEM(St), 0);
5671  09ad 5f            	clrw	x
5672  09ae 89            	pushw	x
5673  09af a678          	ld	a,#120
5674  09b1 cd0000        	call	_eeprom_write_config
5676  09b4 85            	popw	x
5677                     ; 730                         if (minutes)
5679                     	btst	_minutes
5680  09ba 2405          	jruge	L1672
5681                     ; 731                              curr_dur = 0;
5683  09bc 5f            	clrw	x
5684  09bd bf0a          	ldw	_curr_dur,x
5686  09bf 2008          	jra	L3672
5687  09c1               L1672:
5688                     ; 732                         else eeprom_write_config(EEADR_MENU_ITEM(dh), 0);
5690  09c1 5f            	clrw	x
5691  09c2 89            	pushw	x
5692  09c3 a679          	ld	a,#121
5693  09c5 cd0000        	call	_eeprom_write_config
5695  09c8 85            	popw	x
5696  09c9               L3672:
5697                     ; 733                         if (config_value < THERMOSTAT_MODE)
5699  09c9 9c            	rvf
5700  09ca be09          	ldw	x,_config_value
5701  09cc a30006        	cpw	x,#6
5702  09cf 2e3e          	jrsge	L5572
5703                     ; 735                             eeadr_sp = EEADR_PROFILE_SETPOINT(((uint8_t)config_value), 0);
5705  09d1 b60a          	ld	a,_config_value+1
5706  09d3 97            	ld	xl,a
5707  09d4 a613          	ld	a,#19
5708  09d6 42            	mul	x,a
5709  09d7 9f            	ld	a,xl
5710  09d8 6b02          	ld	(OFST+0,sp),a
5712                     ; 737                             if (minutes)
5714                     	btst	_minutes
5715  09df 2412          	jruge	L7672
5716                     ; 739                                 setpoint = eeprom_read_config(eeadr_sp);
5718  09e1 7b02          	ld	a,(OFST+0,sp)
5719  09e3 cd0000        	call	_eeprom_read_config
5721  09e6 bf06          	ldw	_setpoint,x
5722                     ; 740                                 eeprom_write_config(EEADR_MENU_ITEM(SP), setpoint);
5724  09e8 be06          	ldw	x,_setpoint
5725  09ea 89            	pushw	x
5726  09eb a672          	ld	a,#114
5727  09ed cd0000        	call	_eeprom_write_config
5729  09f0 85            	popw	x
5731  09f1 200c          	jra	L1772
5732  09f3               L7672:
5733                     ; 742                                 eeprom_write_config(EEADR_MENU_ITEM(SP), eeprom_read_config(eeadr_sp));
5735  09f3 7b02          	ld	a,(OFST+0,sp)
5736  09f5 cd0000        	call	_eeprom_read_config
5738  09f8 89            	pushw	x
5739  09f9 a672          	ld	a,#114
5740  09fb cd0000        	call	_eeprom_write_config
5742  09fe 85            	popw	x
5743  09ff               L1772:
5744                     ; 745                             if (eeprom_read_config(eeadr_sp+1) == 0)
5746  09ff 7b02          	ld	a,(OFST+0,sp)
5747  0a01 4c            	inc	a
5748  0a02 cd0000        	call	_eeprom_read_config
5750  0a05 a30000        	cpw	x,#0
5751  0a08 2605          	jrne	L5572
5752                     ; 747                                 config_value = THERMOSTAT_MODE;
5754  0a0a ae0006        	ldw	x,#6
5755  0a0d bf09          	ldw	_config_value,x
5756  0a0f               L5572:
5757                     ; 752                 eeprom_write_config(adr, config_value);
5759  0a0f be09          	ldw	x,_config_value
5760  0a11 89            	pushw	x
5761  0a12 7b03          	ld	a,(OFST+1,sp)
5762  0a14 cd0000        	call	_eeprom_write_config
5764  0a17 85            	popw	x
5765                     ; 753                 menustate = MENU_SHOW_CONFIG_ITEM;
5767  0a18 35080004      	mov	_menustate,#8
5769  0a1c 2008          	jra	L5152
5770  0a1e               L3572:
5771                     ; 756                 key_held_tmr = TMR_KEY_ACC; 
5773  0a1e 35140008      	mov	_key_held_tmr,#20
5774  0a22 2002          	jra	L5152
5775  0a24               L5542:
5776                     ; 760        default:
5776                     ; 761             menustate = MENU_IDLE;
5778  0a24 3f04          	clr	_menustate
5779                     ; 762             break;
5781  0a26               L5152:
5782                     ; 764    menu_is_idle = (menustate == MENU_IDLE); // needed for ctrl_task()
5784  0a26 3d04          	tnz	_menustate
5785  0a28 2702          	jreq	L261
5786  0a2a 2006          	jp	L231
5787  0a2c               L261:
5788  0a2c 72100000      	bset	_menu_is_idle
5789  0a30 2004          	jra	L431
5790  0a32               L231:
5791  0a32 72110000      	bres	_menu_is_idle
5792  0a36               L431:
5793                     ; 765 } // button_menu_fsm()
5796  0a36 85            	popw	x
5797  0a37 81            	ret
5988                     ; 772 uint16_t min_to_sec(enum menu_enum x)
5988                     ; 773 {
5989                     	switch	.text
5990  0a38               _min_to_sec:
5992  0a38 89            	pushw	x
5993       00000002      OFST:	set	2
5996                     ; 776     retv = eeprom_read_config(EEADR_MENU_ITEM(x)) << 6; // * 64
5998  0a39 ab72          	add	a,#114
5999  0a3b cd0000        	call	_eeprom_read_config
6001  0a3e 58            	sllw	x
6002  0a3f 58            	sllw	x
6003  0a40 58            	sllw	x
6004  0a41 58            	sllw	x
6005  0a42 58            	sllw	x
6006  0a43 58            	sllw	x
6007  0a44 1f01          	ldw	(OFST-1,sp),x
6009                     ; 777     retv = retv - (retv >> 4); // 64 - 4 = 60
6011  0a46 1e01          	ldw	x,(OFST-1,sp)
6012  0a48 54            	srlw	x
6013  0a49 54            	srlw	x
6014  0a4a 54            	srlw	x
6015  0a4b 54            	srlw	x
6016  0a4c 72f001        	subw	x,(OFST-1,sp)
6017  0a4f 50            	negw	x
6018  0a50 1f01          	ldw	(OFST-1,sp),x
6020                     ; 778     return retv;
6022  0a52 1e01          	ldw	x,(OFST-1,sp)
6025  0a54 5b02          	addw	sp,#2
6026  0a56 81            	ret
6056                     ; 786 void init_temp_delays(void)
6056                     ; 787 {
6057                     	switch	.text
6058  0a57               _init_temp_delays:
6062                     ; 788     if (!minutes) setpoint = eeprom_read_config(EEADR_MENU_ITEM(SP));
6064                     	btst	_minutes
6065  0a5c 2507          	jrult	L5013
6068  0a5e a672          	ld	a,#114
6069  0a60 cd0000        	call	_eeprom_read_config
6071  0a63 bf06          	ldw	_setpoint,x
6072  0a65               L5013:
6073                     ; 789     hysteresis  = eeprom_read_config(EEADR_MENU_ITEM(hy));
6075  0a65 a673          	ld	a,#115
6076  0a67 cd0000        	call	_eeprom_read_config
6078  0a6a bf04          	ldw	_hysteresis,x
6079                     ; 790     hysteresis2 = eeprom_read_config(EEADR_MENU_ITEM(hy2));
6081  0a6c a674          	ld	a,#116
6082  0a6e cd0000        	call	_eeprom_read_config
6084  0a71 bf02          	ldw	_hysteresis2,x
6085                     ; 792     if (cooling_delay) cooling_delay--;
6087  0a73 be00          	ldw	x,_cooling_delay
6088  0a75 2707          	jreq	L7013
6091  0a77 be00          	ldw	x,_cooling_delay
6092  0a79 1d0001        	subw	x,#1
6093  0a7c bf00          	ldw	_cooling_delay,x
6094  0a7e               L7013:
6095                     ; 793     if (heating_delay) heating_delay--;
6097  0a7e be02          	ldw	x,_heating_delay
6098  0a80 2707          	jreq	L1113
6101  0a82 be02          	ldw	x,_heating_delay
6102  0a84 1d0001        	subw	x,#1
6103  0a87 bf02          	ldw	_heating_delay,x
6104  0a89               L1113:
6105                     ; 794 } // init_temp_delays()
6108  0a89 81            	ret
6133                     ; 802 void temperature_control(void)
6133                     ; 803 {
6134                     	switch	.text
6135  0a8a               _temperature_control:
6139                     ; 804     init_temp_delays();  // Initialise Heating and Cooling delay
6141  0a8a adcb          	call	_init_temp_delays
6143                     ; 805 } // temperature_control()
6146  0a8c 81            	ret
6149                     	bsct
6150  000e               L3213_pid_tmr:
6151  000e 00            	dc.b	0
6152                     	xref	_init_pid
6153                     	xref	_pid_ctrl
6196                     ; 814 void pid_control(void)
6196                     ; 815 {
6197                     	switch	.text
6198  0a8d               _pid_control:
6202                     ; 818     init_temp_delays(); // Initialise Heating and Cooling delay
6204  0a8d adc8          	call	_init_temp_delays
6206                     ; 820     if (kc != eeprom_read_config(EEADR_MENU_ITEM(Hc)) ||
6206                     ; 821         ti != eeprom_read_config(EEADR_MENU_ITEM(Ti)) ||
6206                     ; 822         td != eeprom_read_config(EEADR_MENU_ITEM(Td)))
6208  0a8f a680          	ld	a,#128
6209  0a91 cd0000        	call	_eeprom_read_config
6211  0a94 b300          	cpw	x,_kc
6212  0a96 2612          	jrne	L5413
6214  0a98 a681          	ld	a,#129
6215  0a9a cd0000        	call	_eeprom_read_config
6217  0a9d b300          	cpw	x,_ti
6218  0a9f 2609          	jrne	L5413
6220  0aa1 a682          	ld	a,#130
6221  0aa3 cd0000        	call	_eeprom_read_config
6223  0aa6 b300          	cpw	x,_td
6224  0aa8 2728          	jreq	L3413
6225  0aaa               L5413:
6226                     ; 824        kc = eeprom_read_config(EEADR_MENU_ITEM(Hc));
6228  0aaa a680          	ld	a,#128
6229  0aac cd0000        	call	_eeprom_read_config
6231  0aaf bf00          	ldw	_kc,x
6232                     ; 825        ti = eeprom_read_config(EEADR_MENU_ITEM(Ti));
6234  0ab1 a681          	ld	a,#129
6235  0ab3 cd0000        	call	_eeprom_read_config
6237  0ab6 bf00          	ldw	_ti,x
6238                     ; 826        td = eeprom_read_config(EEADR_MENU_ITEM(Td));
6240  0ab8 a682          	ld	a,#130
6241  0aba cd0000        	call	_eeprom_read_config
6243  0abd bf00          	ldw	_td,x
6244                     ; 827        init_pid(kc,ti,td,ts,temp_tc_pt); // Init PID controller
6246  0abf be00          	ldw	x,_temp_tc_pt
6247  0ac1 89            	pushw	x
6248  0ac2 3b0000        	push	_ts
6249  0ac5 be00          	ldw	x,_td
6250  0ac7 89            	pushw	x
6251  0ac8 be00          	ldw	x,_ti
6252  0aca 89            	pushw	x
6253  0acb be00          	ldw	x,_kc
6254  0acd cd0000        	call	_init_pid
6256  0ad0 5b07          	addw	sp,#7
6257  0ad2               L3413:
6258                     ; 830     if (++pid_tmr >= ts) 
6260  0ad2 3c0e          	inc	L3213_pid_tmr
6261  0ad4 b60e          	ld	a,L3213_pid_tmr
6262  0ad6 b100          	cp	a,_ts
6263  0ad8 250e          	jrult	L1513
6264                     ; 832         pid_ctrl(temp_tc_pt,&pid_out,setpoint);
6266  0ada be06          	ldw	x,_setpoint
6267  0adc 89            	pushw	x
6268  0add 4b0c          	push	#_pid_out
6269  0adf be00          	ldw	x,_temp_tc_pt
6270  0ae1 cd0000        	call	_pid_ctrl
6272  0ae4 5b03          	addw	sp,#3
6273                     ; 833         pid_tmr = 0;
6275  0ae6 3f0e          	clr	L3213_pid_tmr
6276  0ae8               L1513:
6277                     ; 835 } // pid_control()
6280  0ae8 81            	ret
6636                     	xdef	_init_temp_delays
6637                     	xdef	_min_to_sec
6638                     	xdef	_prx_to_led
6639                     	xdef	_menu
6640                     	xref.b	_leds_out
6641                     	xref.b	_hc164_val
6642                     	xref.b	_ts
6643                     	xref.b	_td
6644                     	xref.b	_ti
6645                     	xref.b	_kc
6646                     	xref.b	_temp_tc_pt
6647                     	switch	.ubsct
6648  0000               _porte:
6649  0000 00            	ds.b	1
6650                     	xdef	_porte
6651  0001               _portd:
6652  0001 00            	ds.b	1
6653                     	xdef	_portd
6654  0002               _hysteresis2:
6655  0002 0000          	ds.b	2
6656                     	xdef	_hysteresis2
6657  0004               _hysteresis:
6658  0004 0000          	ds.b	2
6659                     	xdef	_hysteresis
6660                     	xdef	_pid_out
6661                     	xdef	_curr_dur
6662  0006               _setpoint:
6663  0006 0000          	ds.b	2
6664                     	xdef	_setpoint
6665                     	xdef	_sensor2_selected
6666  0008               _key_held_tmr:
6667  0008 00            	ds.b	1
6668                     	xdef	_key_held_tmr
6669  0009               _config_value:
6670  0009 0000          	ds.b	2
6671                     	xdef	_config_value
6672                     	xdef	__buttons
6673                     	xdef	_m_countdown
6674                     	xdef	_config_item
6675                     	xdef	_menu_item
6676                     	xdef	_minutes
6677                     	xdef	_fahrenheit
6678                     	xdef	_pwr_on
6679                     	xdef	_menu_is_idle
6680  000b               _ret_state:
6681  000b 00            	ds.b	1
6682                     	xdef	_ret_state
6683                     	xdef	_menustate
6684                     	xdef	_heating_delay
6685                     	xdef	_cooling_delay
6686  000c               _bot_01:
6687  000c 00            	ds.b	1
6688                     	xdef	_bot_01
6689  000d               _bot_1:
6690  000d 00            	ds.b	1
6691                     	xdef	_bot_1
6692  000e               _bot_10:
6693  000e 00            	ds.b	1
6694                     	xdef	_bot_10
6695  000f               _bot_100:
6696  000f 00            	ds.b	1
6697                     	xdef	_bot_100
6698  0010               _top_01:
6699  0010 00            	ds.b	1
6700                     	xdef	_top_01
6701  0011               _top_1:
6702  0011 00            	ds.b	1
6703                     	xdef	_top_1
6704  0012               _top_10:
6705  0012 00            	ds.b	1
6706                     	xdef	_top_10
6707  0013               _top_100:
6708  0013 00            	ds.b	1
6709                     	xdef	_top_100
6710                     	xdef	_eedata
6711                     	xdef	_led_lookup
6712                     	xdef	_pid_control
6713                     	xdef	_temperature_control
6714                     	xdef	_menu_fsm
6715                     	xdef	_read_buttons
6716                     	xdef	_check_config_value
6717                     	xdef	_range
6718                     	xdef	_update_profile
6719                     	xdef	_value_to_led
6720                     	xdef	_val_to_bcd
6721                     	xdef	_divu10
6722                     	xref	_eeprom_write_config
6723                     	xref	_eeprom_read_config
6724                     	xref	_set_hc164
6744                     	xref	c_lgrsh
6745                     	xref	c_lgadd
6746                     	xref	c_itolx
6747                     	end
