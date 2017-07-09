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
2837                     ; 100 uint16_t divu10(uint16_t n) 
2837                     ; 101 {
2839                     	switch	.text
2840  0000               _divu10:
2842  0000 89            	pushw	x
2843  0001 5208          	subw	sp,#8
2844       00000008      OFST:	set	8
2847                     ; 104   q = (n >> 1) + (n >> 2);       // 1/2 + 1/4 = 3/4
2849  0003 54            	srlw	x
2850  0004 54            	srlw	x
2851  0005 1f03          	ldw	(OFST-5,sp),x
2853  0007 1e09          	ldw	x,(OFST+1,sp)
2854  0009 54            	srlw	x
2855  000a 72fb03        	addw	x,(OFST-5,sp)
2856  000d 1f07          	ldw	(OFST-1,sp),x
2858                     ; 105   q = q + (q >> 4);              // 3/4 + 3/64 = 51/64
2860  000f 1e07          	ldw	x,(OFST-1,sp)
2861  0011 54            	srlw	x
2862  0012 54            	srlw	x
2863  0013 54            	srlw	x
2864  0014 54            	srlw	x
2865  0015 72fb07        	addw	x,(OFST-1,sp)
2866  0018 1f07          	ldw	(OFST-1,sp),x
2868                     ; 106   q = q + (q >> 8);              // 51/64 + 51/(16384) = 13107/16384
2870  001a 1e07          	ldw	x,(OFST-1,sp)
2871  001c 4f            	clr	a
2872  001d 01            	rrwa	x,a
2873  001e 72fb07        	addw	x,(OFST-1,sp)
2874  0021 1f07          	ldw	(OFST-1,sp),x
2876                     ; 107   q = q >> 3;                    // 13107 / 131072
2878  0023 a603          	ld	a,#3
2879  0025               L6:
2880  0025 0407          	srl	(OFST-1,sp)
2881  0027 0608          	rrc	(OFST+0,sp)
2882  0029 4a            	dec	a
2883  002a 26f9          	jrne	L6
2885                     ; 108   r = n - ((q << 3) + (q << 1)); // 1 - (13107/16384 + 13107/65536) = 1/65536
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
2902                     ; 109   return q + ((r + 6) >> 4);     // 13107/131072 + 1/1048576 = 104857 / 1048576  
2904  0042 1e05          	ldw	x,(OFST-3,sp)
2905  0044 1c0006        	addw	x,#6
2906  0047 54            	srlw	x
2907  0048 54            	srlw	x
2908  0049 54            	srlw	x
2909  004a 54            	srlw	x
2910  004b 72fb07        	addw	x,(OFST-1,sp)
2913  004e 5b0a          	addw	sp,#10
2914  0050 81            	ret
2954                     ; 121 void prx_to_led(uint8_t run_mode)
2954                     ; 122 {
2955                     	switch	.text
2956  0051               _prx_to_led:
2960                     ; 123     bot_100  = LED_OFF;
2962  0051 3f0f          	clr	_bot_100
2963                     ; 124     if (run_mode < THERMOSTAT_MODE)
2965  0053 a106          	cp	a,#6
2966  0055 2411          	jruge	L5761
2967                     ; 126         bot_10 = LED_P; 
2969  0057 3576000e      	mov	_bot_10,#118
2970                     ; 127         bot_1  = LED_r;
2972  005b 3550000d      	mov	_bot_1,#80
2973                     ; 128         bot_01 = led_lookup[run_mode];
2975  005f 5f            	clrw	x
2976  0060 97            	ld	xl,a
2977  0061 d60000        	ld	a,(_led_lookup,x)
2978  0064 b70c          	ld	_bot_01,a
2980  0066 201e          	jra	L7761
2981  0068               L5761:
2982                     ; 130     else if (ts == 0) 
2984  0068 3d00          	tnz	_ts
2985  006a 260e          	jrne	L1071
2986                     ; 132         bot_100 = bot_01 = LED_OFF;
2988  006c 3f0c          	clr	_bot_01
2989  006e 3f0f          	clr	_bot_100
2990                     ; 133         bot_10  = LED_t;
2992  0070 35f0000e      	mov	_bot_10,#240
2993                     ; 134         bot_1   = LED_h;
2995  0074 3571000d      	mov	_bot_1,#113
2997  0078 200c          	jra	L7761
2998  007a               L1071:
2999                     ; 138         bot_10 = LED_P; 
3001  007a 3576000e      	mov	_bot_10,#118
3002                     ; 139         bot_1  = LED_I;
3004  007e 3503000d      	mov	_bot_1,#3
3005                     ; 140         bot_01 = LED_d;
3007  0082 35d3000c      	mov	_bot_01,#211
3008  0086               L7761:
3009                     ; 142 } // prx_to_led()
3012  0086 81            	ret
3085                     ; 153 void val_to_bcd(int16_t *value, uint16_t digit, uint8_t *led, uint8_t lz)
3085                     ; 154 {
3086                     	switch	.text
3087  0087               _val_to_bcd:
3089  0087 89            	pushw	x
3090  0088 88            	push	a
3091       00000001      OFST:	set	1
3094                     ; 157 	if (*value >= digit)
3096  0089 9093          	ldw	y,x
3097  008b 51            	exgw	x,y
3098  008c fe            	ldw	x,(x)
3099  008d 1306          	cpw	x,(OFST+5,sp)
3100  008f 51            	exgw	x,y
3101  0090 2529          	jrult	L3471
3102                     ; 159 	   for(i = 0; *value >= digit; i++)
3104  0092 0f01          	clr	(OFST+0,sp)
3107  0094 200c          	jra	L1571
3108  0096               L5471:
3109                     ; 161 	      *value -= digit;
3111  0096 1e02          	ldw	x,(OFST+1,sp)
3112  0098 9093          	ldw	y,x
3113  009a fe            	ldw	x,(x)
3114  009b 72f006        	subw	x,(OFST+5,sp)
3115  009e 90ff          	ldw	(y),x
3116                     ; 159 	   for(i = 0; *value >= digit; i++)
3118  00a0 0c01          	inc	(OFST+0,sp)
3120  00a2               L1571:
3123  00a2 1e02          	ldw	x,(OFST+1,sp)
3124  00a4 9093          	ldw	y,x
3125  00a6 51            	exgw	x,y
3126  00a7 fe            	ldw	x,(x)
3127  00a8 1306          	cpw	x,(OFST+5,sp)
3128  00aa 51            	exgw	x,y
3129  00ab 24e9          	jruge	L5471
3130                     ; 163 	   *led = led_lookup[i & 0x0f];
3132  00ad 7b01          	ld	a,(OFST+0,sp)
3133  00af a40f          	and	a,#15
3134  00b1 5f            	clrw	x
3135  00b2 97            	ld	xl,a
3136  00b3 d60000        	ld	a,(_led_lookup,x)
3137  00b6 1e08          	ldw	x,(OFST+7,sp)
3138  00b8 f7            	ld	(x),a
3140  00b9 200e          	jra	L5571
3141  00bb               L3471:
3142                     ; 165     else if (lz)
3144  00bb 0d0a          	tnz	(OFST+9,sp)
3145  00bd 2707          	jreq	L7571
3146                     ; 166          *led = LED_0;   // Leading zero
3148  00bf 1e08          	ldw	x,(OFST+7,sp)
3149  00c1 a6e7          	ld	a,#231
3150  00c3 f7            	ld	(x),a
3152  00c4 2003          	jra	L5571
3153  00c6               L7571:
3154                     ; 167     else *led = LED_OFF; // display off
3156  00c6 1e08          	ldw	x,(OFST+7,sp)
3157  00c8 7f            	clr	(x)
3158  00c9               L5571:
3159                     ; 168 } // val_to_bcd()
3162  00c9 5b03          	addw	sp,#3
3163  00cb 81            	ret
3273                     ; 181 void value_to_led(int16_t value, uint8_t decimal, uint8_t row) 
3273                     ; 182 {
3274                     	switch	.text
3275  00cc               _value_to_led:
3277  00cc 89            	pushw	x
3278  00cd 520a          	subw	sp,#10
3279       0000000a      OFST:	set	10
3282                     ; 184     int16_t val = value; // copy of value
3284  00cf 1f07          	ldw	(OFST-3,sp),x
3286                     ; 187     if (val < 0) 
3288  00d1 9c            	rvf
3289  00d2 1e07          	ldw	x,(OFST-3,sp)
3290  00d4 2e05          	jrsge	L5302
3291                     ; 189        val  = -value;
3293  00d6 1e0b          	ldw	x,(OFST+1,sp)
3294  00d8 50            	negw	x
3295  00d9 1f07          	ldw	(OFST-3,sp),x
3297  00db               L5302:
3298                     ; 192     if (row == ROW_TOP)
3300  00db 7b10          	ld	a,(OFST+6,sp)
3301  00dd a102          	cp	a,#2
3302  00df 2616          	jrne	L7302
3303                     ; 194         p100 = &top_100; p10  = &top_10;
3305  00e1 ae0013        	ldw	x,#_top_100
3306  00e4 1f03          	ldw	(OFST-7,sp),x
3310  00e6 ae0012        	ldw	x,#_top_10
3311  00e9 1f05          	ldw	(OFST-5,sp),x
3313                     ; 195         p1   = &top_1;   p01  = &top_01;
3315  00eb ae0011        	ldw	x,#_top_1
3316  00ee 1f09          	ldw	(OFST-1,sp),x
3320  00f0 ae0010        	ldw	x,#_top_01
3321  00f3 1f01          	ldw	(OFST-9,sp),x
3324  00f5 2014          	jra	L1402
3325  00f7               L7302:
3326                     ; 199         p100 = &bot_100; p10  = &bot_10;
3328  00f7 ae000f        	ldw	x,#_bot_100
3329  00fa 1f03          	ldw	(OFST-7,sp),x
3333  00fc ae000e        	ldw	x,#_bot_10
3334  00ff 1f05          	ldw	(OFST-5,sp),x
3336                     ; 200         p1   = &bot_1;   p01  = &bot_01;
3338  0101 ae000d        	ldw	x,#_bot_1
3339  0104 1f09          	ldw	(OFST-1,sp),x
3343  0106 ae000c        	ldw	x,#_bot_01
3344  0109 1f01          	ldw	(OFST-9,sp),x
3346  010b               L1402:
3347                     ; 204 	val_to_bcd(&val, 1000, p100,0); 
3349  010b 4b00          	push	#0
3350  010d 1e04          	ldw	x,(OFST-6,sp)
3351  010f 89            	pushw	x
3352  0110 ae03e8        	ldw	x,#1000
3353  0113 89            	pushw	x
3354  0114 96            	ldw	x,sp
3355  0115 1c000c        	addw	x,#OFST+2
3356  0118 cd0087        	call	_val_to_bcd
3358  011b 5b05          	addw	sp,#5
3359                     ; 205 	val_to_bcd(&val,  100, p10 ,(*p100 != LED_OFF));
3361  011d 1e03          	ldw	x,(OFST-7,sp)
3362  011f 7d            	tnz	(x)
3363  0120 2704          	jreq	L61
3364  0122 a601          	ld	a,#1
3365  0124 2001          	jra	L02
3366  0126               L61:
3367  0126 4f            	clr	a
3368  0127               L02:
3369  0127 88            	push	a
3370  0128 1e06          	ldw	x,(OFST-4,sp)
3371  012a 89            	pushw	x
3372  012b ae0064        	ldw	x,#100
3373  012e 89            	pushw	x
3374  012f 96            	ldw	x,sp
3375  0130 1c000c        	addw	x,#OFST+2
3376  0133 cd0087        	call	_val_to_bcd
3378  0136 5b05          	addw	sp,#5
3379                     ; 206 	val_to_bcd(&val,   10, p1  ,(*p10  != LED_OFF));
3381  0138 1e05          	ldw	x,(OFST-5,sp)
3382  013a 7d            	tnz	(x)
3383  013b 2704          	jreq	L22
3384  013d a601          	ld	a,#1
3385  013f 2001          	jra	L42
3386  0141               L22:
3387  0141 4f            	clr	a
3388  0142               L42:
3389  0142 88            	push	a
3390  0143 1e0a          	ldw	x,(OFST+0,sp)
3391  0145 89            	pushw	x
3392  0146 ae000a        	ldw	x,#10
3393  0149 89            	pushw	x
3394  014a 96            	ldw	x,sp
3395  014b 1c000c        	addw	x,#OFST+2
3396  014e cd0087        	call	_val_to_bcd
3398  0151 5b05          	addw	sp,#5
3399                     ; 207 	val_to_bcd(&val,    1, p01 ,1);
3401  0153 4b01          	push	#1
3402  0155 1e02          	ldw	x,(OFST-8,sp)
3403  0157 89            	pushw	x
3404  0158 ae0001        	ldw	x,#1
3405  015b 89            	pushw	x
3406  015c 96            	ldw	x,sp
3407  015d 1c000c        	addw	x,#OFST+2
3408  0160 cd0087        	call	_val_to_bcd
3410  0163 5b05          	addw	sp,#5
3411                     ; 209     if (decimal == 1)
3413  0165 7b0f          	ld	a,(OFST+5,sp)
3414  0167 a101          	cp	a,#1
3415  0169 2610          	jrne	L3402
3416                     ; 211        if (*p1 == LED_OFF) *p1 = LED_0; // add leading zero if needed
3418  016b 1e09          	ldw	x,(OFST-1,sp)
3419  016d 7d            	tnz	(x)
3420  016e 2605          	jrne	L5402
3423  0170 1e09          	ldw	x,(OFST-1,sp)
3424  0172 a6e7          	ld	a,#231
3425  0174 f7            	ld	(x),a
3426  0175               L5402:
3427                     ; 212 	   *p1 |= LED_DP;                   // add decimal point
3429  0175 1e09          	ldw	x,(OFST-1,sp)
3430  0177 f6            	ld	a,(x)
3431  0178 aa08          	or	a,#8
3432  017a f7            	ld	(x),a
3433  017b               L3402:
3434                     ; 215     if (value < 0)
3436  017b 9c            	rvf
3437  017c 1e0b          	ldw	x,(OFST+1,sp)
3438  017e 2e2f          	jrsge	L7402
3439                     ; 217         if ((value > -10) && (decimal == 0)) 
3441  0180 9c            	rvf
3442  0181 1e0b          	ldw	x,(OFST+1,sp)
3443  0183 a3fff7        	cpw	x,#65527
3444  0186 2f0b          	jrslt	L1502
3446  0188 0d0f          	tnz	(OFST+5,sp)
3447  018a 2607          	jrne	L1502
3448                     ; 218                                 *p1   = LED_MIN;
3450  018c 1e09          	ldw	x,(OFST-1,sp)
3451  018e a610          	ld	a,#16
3452  0190 f7            	ld	(x),a
3454  0191 201c          	jra	L7402
3455  0193               L1502:
3456                     ; 219         else if (value > -100)  *p10  = LED_MIN;
3458  0193 9c            	rvf
3459  0194 1e0b          	ldw	x,(OFST+1,sp)
3460  0196 a3ff9d        	cpw	x,#65437
3461  0199 2f07          	jrslt	L5502
3464  019b 1e05          	ldw	x,(OFST-5,sp)
3465  019d a610          	ld	a,#16
3466  019f f7            	ld	(x),a
3468  01a0 200d          	jra	L7402
3469  01a2               L5502:
3470                     ; 220         else if (value > -1000) *p100 = LED_MIN;
3472  01a2 9c            	rvf
3473  01a3 1e0b          	ldw	x,(OFST+1,sp)
3474  01a5 a3fc19        	cpw	x,#64537
3475  01a8 2f05          	jrslt	L7402
3478  01aa 1e03          	ldw	x,(OFST-7,sp)
3479  01ac a610          	ld	a,#16
3480  01ae f7            	ld	(x),a
3481  01af               L7402:
3482                     ; 223 } // value_to_led()
3485  01af 5b0c          	addw	sp,#12
3486  01b1 81            	ret
3599                     ; 234 void update_profile(void)
3599                     ; 235 {
3600                     	switch	.text
3601  01b2               _update_profile:
3603  01b2 520f          	subw	sp,#15
3604       0000000f      OFST:	set	15
3607                     ; 236   uint8_t  profile_no = eeprom_read_config(EEADR_MENU_ITEM(rn));
3609  01b4 a684          	ld	a,#132
3610  01b6 cd0000        	call	_eeprom_read_config
3612  01b9 01            	rrwa	x,a
3613  01ba 6b06          	ld	(OFST-9,sp),a
3614  01bc 02            	rlwa	x,a
3616                     ; 247   if (profile_no < THERMOSTAT_MODE) 
3618  01bd 7b06          	ld	a,(OFST-9,sp)
3619  01bf a106          	cp	a,#6
3620  01c1 2503          	jrult	L23
3621  01c3 cc02e3        	jp	L1412
3622  01c6               L23:
3623                     ; 249       curr_step = eeprom_read_config(EEADR_MENU_ITEM(St));
3625  01c6 a678          	ld	a,#120
3626  01c8 cd0000        	call	_eeprom_read_config
3628  01cb 01            	rrwa	x,a
3629  01cc 6b0f          	ld	(OFST+0,sp),a
3630  01ce 02            	rlwa	x,a
3632                     ; 250       if (minutes) // is timing-control in minutes?
3634                     	btst	_minutes
3635  01d4 2409          	jruge	L3412
3636                     ; 251            curr_dur++;
3638  01d6 be0a          	ldw	x,_curr_dur
3639  01d8 1c0001        	addw	x,#1
3640  01db bf0a          	ldw	_curr_dur,x
3642  01dd 2008          	jra	L5412
3643  01df               L3412:
3644                     ; 252       else curr_dur = eeprom_read_config(EEADR_MENU_ITEM(dh)) + 1;
3646  01df a679          	ld	a,#121
3647  01e1 cd0000        	call	_eeprom_read_config
3649  01e4 5c            	incw	x
3650  01e5 bf0a          	ldw	_curr_dur,x
3651  01e7               L5412:
3652                     ; 255       if(curr_step > NO_OF_TT_PAIRS-1) curr_step = NO_OF_TT_PAIRS - 1;
3654  01e7 7b0f          	ld	a,(OFST+0,sp)
3655  01e9 a109          	cp	a,#9
3656  01eb 2504          	jrult	L7412
3659  01ed a608          	ld	a,#8
3660  01ef 6b0f          	ld	(OFST+0,sp),a
3662  01f1               L7412:
3663                     ; 257       profile_step_eeaddr  = EEADR_PROFILE_SETPOINT(profile_no, curr_step);
3665  01f1 7b0f          	ld	a,(OFST+0,sp)
3666  01f3 48            	sll	a
3667  01f4 6b01          	ld	(OFST-14,sp),a
3669  01f6 7b06          	ld	a,(OFST-9,sp)
3670  01f8 97            	ld	xl,a
3671  01f9 a613          	ld	a,#19
3672  01fb 42            	mul	x,a
3673  01fc 9f            	ld	a,xl
3674  01fd 1b01          	add	a,(OFST-14,sp)
3675  01ff 6b06          	ld	(OFST-9,sp),a
3677                     ; 258       profile_step_dur     = eeprom_read_config(profile_step_eeaddr + 1);
3679  0201 7b06          	ld	a,(OFST-9,sp)
3680  0203 4c            	inc	a
3681  0204 cd0000        	call	_eeprom_read_config
3683  0207 1f09          	ldw	(OFST-6,sp),x
3685                     ; 259       profile_next_step_sp = eeprom_read_config(profile_step_eeaddr + 2);
3687  0209 7b06          	ld	a,(OFST-9,sp)
3688  020b ab02          	add	a,#2
3689  020d cd0000        	call	_eeprom_read_config
3691  0210 1f04          	ldw	(OFST-11,sp),x
3693                     ; 262       if (curr_dur >= profile_step_dur) 
3695  0212 be0a          	ldw	x,_curr_dur
3696  0214 1309          	cpw	x,(OFST-6,sp)
3697  0216 2546          	jrult	L1512
3698                     ; 264         if (minutes) setpoint = profile_next_step_sp;
3700                     	btst	_minutes
3701  021d 2404          	jruge	L3512
3704  021f 1e04          	ldw	x,(OFST-11,sp)
3705  0221 bf06          	ldw	_setpoint,x
3706  0223               L3512:
3707                     ; 265         eeprom_write_config(EEADR_MENU_ITEM(SP), profile_next_step_sp);
3709  0223 1e04          	ldw	x,(OFST-11,sp)
3710  0225 89            	pushw	x
3711  0226 a672          	ld	a,#114
3712  0228 cd0000        	call	_eeprom_write_config
3714  022b 85            	popw	x
3715                     ; 267         if ((curr_step == NO_OF_TT_PAIRS-1) || eeprom_read_config(profile_step_eeaddr + 3) == 0) 
3717  022c 7b0f          	ld	a,(OFST+0,sp)
3718  022e a108          	cp	a,#8
3719  0230 270c          	jreq	L7512
3721  0232 7b06          	ld	a,(OFST-9,sp)
3722  0234 ab03          	add	a,#3
3723  0236 cd0000        	call	_eeprom_read_config
3725  0239 a30000        	cpw	x,#0
3726  023c 260e          	jrne	L5512
3727  023e               L7512:
3728                     ; 269             eeprom_write_config(EEADR_MENU_ITEM(rn), THERMOSTAT_MODE);
3730  023e ae0006        	ldw	x,#6
3731  0241 89            	pushw	x
3732  0242 a684          	ld	a,#132
3733  0244 cd0000        	call	_eeprom_write_config
3735  0247 85            	popw	x
3736                     ; 270             return; // Fastest way out...
3738  0248 ace302e3      	jpf	L03
3739  024c               L5512:
3740                     ; 272         curr_dur = 0; // Reset duration
3742  024c 5f            	clrw	x
3743  024d bf0a          	ldw	_curr_dur,x
3744                     ; 273         curr_step++;  // Update step
3746  024f 0c0f          	inc	(OFST+0,sp)
3748                     ; 274         eeprom_write_config(EEADR_MENU_ITEM(St), curr_step);
3750  0251 7b0f          	ld	a,(OFST+0,sp)
3751  0253 5f            	clrw	x
3752  0254 97            	ld	xl,a
3753  0255 89            	pushw	x
3754  0256 a678          	ld	a,#120
3755  0258 cd0000        	call	_eeprom_write_config
3757  025b 85            	popw	x
3759  025c 2075          	jra	L1612
3760  025e               L1512:
3761                     ; 276       else if (eeprom_read_config(EEADR_MENU_ITEM(rP))) 
3763  025e a67c          	ld	a,#124
3764  0260 cd0000        	call	_eeprom_read_config
3766  0263 a30000        	cpw	x,#0
3767  0266 276b          	jreq	L1612
3768                     ; 278          profile_step_sp = eeprom_read_config(profile_step_eeaddr);
3770  0268 7b06          	ld	a,(OFST-9,sp)
3771  026a cd0000        	call	_eeprom_read_config
3773  026d 1f02          	ldw	(OFST-13,sp),x
3775                     ; 279          t  = curr_dur << 6;
3777  026f be0a          	ldw	x,_curr_dur
3778  0271 58            	sllw	x
3779  0272 58            	sllw	x
3780  0273 58            	sllw	x
3781  0274 58            	sllw	x
3782  0275 58            	sllw	x
3783  0276 58            	sllw	x
3784  0277 1f07          	ldw	(OFST-8,sp),x
3786                     ; 280          sp = 32;
3788  0279 ae0020        	ldw	x,#32
3789  027c 1f0d          	ldw	(OFST-2,sp),x
3790  027e ae0000        	ldw	x,#0
3791  0281 1f0b          	ldw	(OFST-4,sp),x
3793                     ; 281          for (i = 0; i < 64; i++) 
3795  0283 0f0f          	clr	(OFST+0,sp)
3797  0285               L5612:
3798                     ; 283              if (t >= profile_step_dur) 
3800  0285 1e07          	ldw	x,(OFST-8,sp)
3801  0287 1309          	cpw	x,(OFST-6,sp)
3802  0289 2515          	jrult	L3712
3803                     ; 285                 t  -= profile_step_dur;
3805  028b 1e07          	ldw	x,(OFST-8,sp)
3806  028d 72f009        	subw	x,(OFST-6,sp)
3807  0290 1f07          	ldw	(OFST-8,sp),x
3809                     ; 286                 sp += profile_next_step_sp;
3811  0292 1e04          	ldw	x,(OFST-11,sp)
3812  0294 cd0000        	call	c_itolx
3814  0297 96            	ldw	x,sp
3815  0298 1c000b        	addw	x,#OFST-4
3816  029b cd0000        	call	c_lgadd
3820  029e 200c          	jra	L5712
3821  02a0               L3712:
3822                     ; 290                 sp += profile_step_sp;
3824  02a0 1e02          	ldw	x,(OFST-13,sp)
3825  02a2 cd0000        	call	c_itolx
3827  02a5 96            	ldw	x,sp
3828  02a6 1c000b        	addw	x,#OFST-4
3829  02a9 cd0000        	call	c_lgadd
3832  02ac               L5712:
3833                     ; 281          for (i = 0; i < 64; i++) 
3835  02ac 0c0f          	inc	(OFST+0,sp)
3839  02ae 7b0f          	ld	a,(OFST+0,sp)
3840  02b0 a140          	cp	a,#64
3841  02b2 25d1          	jrult	L5612
3842                     ; 293          sp >>= 6;
3844  02b4 96            	ldw	x,sp
3845  02b5 1c000b        	addw	x,#OFST-4
3846  02b8 a606          	ld	a,#6
3847  02ba cd0000        	call	c_lgrsh
3850                     ; 295          if (minutes) // is timing-control in minutes?
3852                     	btst	_minutes
3853  02c2 2406          	jruge	L7712
3854                     ; 296               setpoint = sp;
3856  02c4 1e0d          	ldw	x,(OFST-2,sp)
3857  02c6 bf06          	ldw	_setpoint,x
3859  02c8 2009          	jra	L1612
3860  02ca               L7712:
3861                     ; 297          else eeprom_write_config(EEADR_MENU_ITEM(SP), sp);
3863  02ca 1e0d          	ldw	x,(OFST-2,sp)
3864  02cc 89            	pushw	x
3865  02cd a672          	ld	a,#114
3866  02cf cd0000        	call	_eeprom_write_config
3868  02d2 85            	popw	x
3869  02d3               L1612:
3870                     ; 299       if (!minutes)
3872                     	btst	_minutes
3873  02d8 2509          	jrult	L1412
3874                     ; 301           eeprom_write_config(EEADR_MENU_ITEM(dh), curr_dur);
3876  02da be0a          	ldw	x,_curr_dur
3877  02dc 89            	pushw	x
3878  02dd a679          	ld	a,#121
3879  02df cd0000        	call	_eeprom_write_config
3881  02e2 85            	popw	x
3882  02e3               L1412:
3883                     ; 304 } // update_profile()
3884  02e3               L03:
3887  02e3 5b0f          	addw	sp,#15
3888  02e5 81            	ret
3940                     ; 316 int16_t range(int16_t x, int16_t min, int16_t max)
3940                     ; 317 {
3941                     	switch	.text
3942  02e6               _range:
3944  02e6 89            	pushw	x
3945       00000000      OFST:	set	0
3948                     ; 318     if (x > max) return min;
3950  02e7 9c            	rvf
3951  02e8 1307          	cpw	x,(OFST+7,sp)
3952  02ea 2d04          	jrsle	L3322
3955  02ec 1e05          	ldw	x,(OFST+5,sp)
3957  02ee 2009          	jra	L63
3958  02f0               L3322:
3959                     ; 319     if (x < min) return max;
3961  02f0 9c            	rvf
3962  02f1 1e01          	ldw	x,(OFST+1,sp)
3963  02f3 1305          	cpw	x,(OFST+5,sp)
3964  02f5 2e05          	jrsge	L5322
3967  02f7 1e07          	ldw	x,(OFST+7,sp)
3969  02f9               L63:
3971  02f9 5b02          	addw	sp,#2
3972  02fb 81            	ret
3973  02fc               L5322:
3974                     ; 320     return x;
3976  02fc 1e01          	ldw	x,(OFST+1,sp)
3978  02fe 20f9          	jra	L63
4051                     ; 330 int16_t check_config_value(int16_t config_value, uint8_t eeadr)
4051                     ; 331 {
4052                     	switch	.text
4053  0300               _check_config_value:
4055  0300 89            	pushw	x
4056  0301 5205          	subw	sp,#5
4057       00000005      OFST:	set	5
4060                     ; 332     int16_t t_min = 0, t_max = 999;
4062  0303 5f            	clrw	x
4063  0304 1f01          	ldw	(OFST-4,sp),x
4067  0306 ae03e7        	ldw	x,#999
4068  0309 1f04          	ldw	(OFST-1,sp),x
4070                     ; 335     if (eeadr < EEADR_MENU)
4072  030b 7b0a          	ld	a,(OFST+5,sp)
4073  030d a172          	cp	a,#114
4074  030f 2431          	jruge	L5722
4076  0311 2006          	jra	L1032
4077  0313               L7722:
4078                     ; 339             eeadr -= PROFILE_SIZE;
4080  0313 7b0a          	ld	a,(OFST+5,sp)
4081  0315 a013          	sub	a,#19
4082  0317 6b0a          	ld	(OFST+5,sp),a
4083  0319               L1032:
4084                     ; 337         while (eeadr >= PROFILE_SIZE)
4086  0319 7b0a          	ld	a,(OFST+5,sp)
4087  031b a113          	cp	a,#19
4088  031d 24f4          	jruge	L7722
4089                     ; 341         if (!(eeadr & 0x1))
4091  031f 7b0a          	ld	a,(OFST+5,sp)
4092  0321 a501          	bcp	a,#1
4093  0323 2703          	jreq	L201
4094  0325 cc0445        	jp	L7032
4095  0328               L201:
4096                     ; 343             t_min = (fahrenheit ? TEMP_MIN_F : TEMP_MIN_C);
4098  0328 aefe70        	ldw	x,#65136
4099  032b 1f01          	ldw	(OFST-4,sp),x
4101                     ; 344             t_max = (fahrenheit ? TEMP_MAX_F : TEMP_MAX_C);
4103                     	btst	_fahrenheit
4104  0332 2405          	jruge	L24
4105  0334 ae09c4        	ldw	x,#2500
4106  0337 2003          	jra	L44
4107  0339               L24:
4108  0339 ae0578        	ldw	x,#1400
4109  033c               L44:
4110  033c 1f04          	ldw	(OFST-1,sp),x
4112  033e ac450445      	jpf	L7032
4113  0342               L5722:
4114                     ; 347             type = menu[eeadr - EEADR_MENU].type;
4116  0342 7b0a          	ld	a,(OFST+5,sp)
4117  0344 97            	ld	xl,a
4118  0345 a604          	ld	a,#4
4119  0347 42            	mul	x,a
4120  0348 1d01c8        	subw	x,#456
4121  034b d6000d        	ld	a,(_menu+3,x)
4122  034e 6b03          	ld	(OFST-2,sp),a
4124                     ; 348         if (type == t_temperature)
4126  0350 0d03          	tnz	(OFST-2,sp)
4127  0352 261a          	jrne	L1132
4128                     ; 350             t_min = (fahrenheit ? TEMP_MIN_F : TEMP_MIN_C);
4130  0354 aefe70        	ldw	x,#65136
4131  0357 1f01          	ldw	(OFST-4,sp),x
4133                     ; 351             t_max = (fahrenheit ? TEMP_MAX_F : TEMP_MAX_C);
4135                     	btst	_fahrenheit
4136  035e 2405          	jruge	L64
4137  0360 ae09c4        	ldw	x,#2500
4138  0363 2003          	jra	L05
4139  0365               L64:
4140  0365 ae0578        	ldw	x,#1400
4141  0368               L05:
4142  0368 1f04          	ldw	(OFST-1,sp),x
4145  036a ac450445      	jpf	L7032
4146  036e               L1132:
4147                     ; 352         } else if (type == t_tempdiff)
4149  036e 7b03          	ld	a,(OFST-2,sp)
4150  0370 a101          	cp	a,#1
4151  0372 2626          	jrne	L5132
4152                     ; 354             t_min = (fahrenheit ? TEMP_CORR_MIN_F : TEMP_CORR_MIN_C);
4154                     	btst	_fahrenheit
4155  0379 2405          	jruge	L25
4156  037b aeff9c        	ldw	x,#65436
4157  037e 2003          	jra	L45
4158  0380               L25:
4159  0380 aeffce        	ldw	x,#65486
4160  0383               L45:
4161  0383 1f01          	ldw	(OFST-4,sp),x
4163                     ; 355             t_max = (fahrenheit ? TEMP_CORR_MAX_F : TEMP_CORR_MAX_C);
4165                     	btst	_fahrenheit
4166  038a 2405          	jruge	L65
4167  038c ae0064        	ldw	x,#100
4168  038f 2003          	jra	L06
4169  0391               L65:
4170  0391 ae0032        	ldw	x,#50
4171  0394               L06:
4172  0394 1f04          	ldw	(OFST-1,sp),x
4175  0396 ac450445      	jpf	L7032
4176  039a               L5132:
4177                     ; 356         } else if (type == t_parameter)
4179  039a 7b03          	ld	a,(OFST-2,sp)
4180  039c a10a          	cp	a,#10
4181  039e 2616          	jrne	L1232
4182                     ; 358             t_max = 9999;
4184  03a0 ae270f        	ldw	x,#9999
4185  03a3 1f04          	ldw	(OFST-1,sp),x
4187                     ; 359             if (eeadr == EEADR_MENU_ITEM(Hc)) 
4189  03a5 7b0a          	ld	a,(OFST+5,sp)
4190  03a7 a180          	cp	a,#128
4191  03a9 2703          	jreq	L401
4192  03ab cc0445        	jp	L7032
4193  03ae               L401:
4194                     ; 361                 t_min = -9999; 
4196  03ae aed8f1        	ldw	x,#55537
4197  03b1 1f01          	ldw	(OFST-4,sp),x
4199  03b3 cc0445        	jra	L7032
4200  03b6               L1232:
4201                     ; 363         } else if (type == t_boolean)
4203  03b6 7b03          	ld	a,(OFST-2,sp)
4204  03b8 a109          	cp	a,#9
4205  03ba 2608          	jrne	L7232
4206                     ; 365             t_max = 1;
4208  03bc ae0001        	ldw	x,#1
4209  03bf 1f04          	ldw	(OFST-1,sp),x
4212  03c1 cc0445        	jra	L7032
4213  03c4               L7232:
4214                     ; 366         } else if (type == t_hyst_1)
4216  03c4 7b03          	ld	a,(OFST-2,sp)
4217  03c6 a102          	cp	a,#2
4218  03c8 2613          	jrne	L3332
4219                     ; 368             t_max = (fahrenheit ? TEMP_HYST_1_MAX_F : TEMP_HYST_1_MAX_C);
4221                     	btst	_fahrenheit
4222  03cf 2405          	jruge	L26
4223  03d1 ae0064        	ldw	x,#100
4224  03d4 2003          	jra	L46
4225  03d6               L26:
4226  03d6 ae0032        	ldw	x,#50
4227  03d9               L46:
4228  03d9 1f04          	ldw	(OFST-1,sp),x
4231  03db 2068          	jra	L7032
4232  03dd               L3332:
4233                     ; 369         } else if (type == t_hyst_2)
4235  03dd 7b03          	ld	a,(OFST-2,sp)
4236  03df a103          	cp	a,#3
4237  03e1 2613          	jrne	L7332
4238                     ; 371             t_max = (fahrenheit ? TEMP_HYST_2_MAX_F : TEMP_HYST_2_MAX_C);
4240                     	btst	_fahrenheit
4241  03e8 2405          	jruge	L66
4242  03ea ae01f4        	ldw	x,#500
4243  03ed 2003          	jra	L07
4244  03ef               L66:
4245  03ef ae00fa        	ldw	x,#250
4246  03f2               L07:
4247  03f2 1f04          	ldw	(OFST-1,sp),x
4250  03f4 204f          	jra	L7032
4251  03f6               L7332:
4252                     ; 372         } else if (type == t_sp_alarm)
4254  03f6 7b03          	ld	a,(OFST-2,sp)
4255  03f8 a104          	cp	a,#4
4256  03fa 2624          	jrne	L3432
4257                     ; 374             t_min = (fahrenheit ? SP_ALARM_MIN_F : SP_ALARM_MIN_C);
4259                     	btst	_fahrenheit
4260  0401 2405          	jruge	L27
4261  0403 aefce0        	ldw	x,#64736
4262  0406 2003          	jra	L47
4263  0408               L27:
4264  0408 aefe70        	ldw	x,#65136
4265  040b               L47:
4266  040b 1f01          	ldw	(OFST-4,sp),x
4268                     ; 375             t_max = (fahrenheit ? SP_ALARM_MAX_F : SP_ALARM_MAX_C);
4270                     	btst	_fahrenheit
4271  0412 2405          	jruge	L67
4272  0414 ae0320        	ldw	x,#800
4273  0417 2003          	jra	L001
4274  0419               L67:
4275  0419 ae0190        	ldw	x,#400
4276  041c               L001:
4277  041c 1f04          	ldw	(OFST-1,sp),x
4280  041e 2025          	jra	L7032
4281  0420               L3432:
4282                     ; 376         } else if(type == t_step)
4284  0420 7b03          	ld	a,(OFST-2,sp)
4285  0422 a105          	cp	a,#5
4286  0424 2607          	jrne	L7432
4287                     ; 378             t_max = NO_OF_TT_PAIRS;
4289  0426 ae0009        	ldw	x,#9
4290  0429 1f04          	ldw	(OFST-1,sp),x
4293  042b 2018          	jra	L7032
4294  042d               L7432:
4295                     ; 379         } else if (type == t_delay)
4297  042d 7b03          	ld	a,(OFST-2,sp)
4298  042f a106          	cp	a,#6
4299  0431 2607          	jrne	L3532
4300                     ; 381             t_max = 60;
4302  0433 ae003c        	ldw	x,#60
4303  0436 1f04          	ldw	(OFST-1,sp),x
4306  0438 200b          	jra	L7032
4307  043a               L3532:
4308                     ; 382         } else if (type == t_runmode)
4310  043a 7b03          	ld	a,(OFST-2,sp)
4311  043c a107          	cp	a,#7
4312  043e 2605          	jrne	L7032
4313                     ; 384             t_max = NO_OF_PROFILES;
4315  0440 ae0006        	ldw	x,#6
4316  0443 1f04          	ldw	(OFST-1,sp),x
4318  0445               L7032:
4319                     ; 387     return range(config_value, t_min, t_max);
4321  0445 1e04          	ldw	x,(OFST-1,sp)
4322  0447 89            	pushw	x
4323  0448 1e03          	ldw	x,(OFST-2,sp)
4324  044a 89            	pushw	x
4325  044b 1e0a          	ldw	x,(OFST+5,sp)
4326  044d cd02e6        	call	_range
4328  0450 5b04          	addw	sp,#4
4331  0452 5b07          	addw	sp,#7
4332  0454 81            	ret
4387                     ; 397 void read_buttons(void)
4387                     ; 398 {
4388                     	switch	.text
4389  0455               _read_buttons:
4391  0455 89            	pushw	x
4392       00000002      OFST:	set	2
4395                     ; 401     disable_interrupts();     // Disable interrups while reading buttons
4398  0456 9b            sim
4400                     ; 403     porte   = PE_IDR & SEG7_C;    // Save 7-segment C status
4403  0457 c65015        	ld	a,_PE_IDR
4404  045a a401          	and	a,#1
4405  045c b700          	ld	_porte,a
4406                     ; 404     portd   = PD_IDR & PORTD_OUT; // Save other 7-segments
4408  045e c65010        	ld	a,_PD_IDR
4409  0461 a4fd          	and	a,#253
4410  0463 b701          	ld	_portd,a
4411                     ; 405     PE_ODR |= SEG7_C;             // disable 7-segment display C
4413  0465 72105014      	bset	_PE_ODR,#0
4414                     ; 406     PD_ODR |= PORTD_OUT;          // disable all other 7-segment displays
4416  0469 c6500f        	ld	a,_PD_ODR
4417  046c aafd          	or	a,#253
4418  046e c7500f        	ld	_PD_ODR,a
4419                     ; 407     hc164_state = hc164_val;      // save current hc164_val
4421  0471 b600          	ld	a,_hc164_val
4422  0473 6b01          	ld	(OFST-1,sp),a
4424                     ; 408     set_hc164(0x00);
4426  0475 4f            	clr	a
4427  0476 cd0000        	call	_set_hc164
4429                     ; 409     for (i = 0x88; i > 0x0F; i >>= 1)
4431  0479 a688          	ld	a,#136
4432  047b 6b02          	ld	(OFST+0,sp),a
4434  047d               L3042:
4435                     ; 411        set_hc164(i);
4437  047d 7b02          	ld	a,(OFST+0,sp)
4438  047f cd0000        	call	_set_hc164
4440                     ; 412        _buttons <<= 1;
4442  0482 3808          	sll	__buttons
4443                     ; 413        _buttons  &= 0xFE; // clear bit 0
4445  0484 72110008      	bres	__buttons,#0
4446                     ; 414        if (PC_IDR & KEYS) _buttons |= 0x01;
4448  0488 c6500b        	ld	a,_PC_IDR
4449  048b a502          	bcp	a,#2
4450  048d 2704          	jreq	L1142
4453  048f 72100008      	bset	__buttons,#0
4454  0493               L1142:
4455                     ; 415        set_hc164(0x00);
4457  0493 4f            	clr	a
4458  0494 cd0000        	call	_set_hc164
4460                     ; 409     for (i = 0x88; i > 0x0F; i >>= 1)
4462  0497 0402          	srl	(OFST+0,sp)
4466  0499 7b02          	ld	a,(OFST+0,sp)
4467  049b a110          	cp	a,#16
4468  049d 24de          	jruge	L3042
4469                     ; 419     set_hc164(hc164_state); // restore HC164 state
4471  049f 7b01          	ld	a,(OFST-1,sp)
4472  04a1 cd0000        	call	_set_hc164
4474                     ; 420     PD_ODR &= ~PORTD_OUT;
4476  04a4 c6500f        	ld	a,_PD_ODR
4477  04a7 a402          	and	a,#2
4478  04a9 c7500f        	ld	_PD_ODR,a
4479                     ; 421     PD_ODR |= portd;        // restore PORTD
4481  04ac c6500f        	ld	a,_PD_ODR
4482  04af ba01          	or	a,_portd
4483  04b1 c7500f        	ld	_PD_ODR,a
4484                     ; 422     PE_ODR &= ~SEG7_C;
4486  04b4 72115014      	bres	_PE_ODR,#0
4487                     ; 423     PE_ODR |= porte;        // restore PORTE
4489  04b8 c65014        	ld	a,_PE_ODR
4490  04bb ba00          	or	a,_porte
4491  04bd c75014        	ld	_PE_ODR,a
4492                     ; 424     enable_interrupts();    // Re-enable Interrupts
4495  04c0 9a            rim
4497                     ; 425 } // read_buttons()
4501  04c1 85            	popw	x
4502  04c2 81            	ret
4596                     	switch	.const
4597  0056               L431:
4598  0056 04db          	dc.w	L3142
4599  0058 05d9          	dc.w	L7142
4600  005a 060d          	dc.w	L1242
4601  005c 064c          	dc.w	L3242
4602  005e 0682          	dc.w	L5242
4603  0060 0555          	dc.w	L5142
4604  0062 06cb          	dc.w	L7242
4605  0064 0708          	dc.w	L1342
4606  0066 0765          	dc.w	L3342
4607  0068 07e8          	dc.w	L5342
4608  006a 08bd          	dc.w	L1442
4609  006c 0918          	dc.w	L3442
4610                     ; 434 void menu_fsm(void)
4610                     ; 435 {
4611                     	switch	.text
4612  04c3               _menu_fsm:
4614  04c3 89            	pushw	x
4615       00000002      OFST:	set	2
4618                     ; 438    if (m_countdown) m_countdown--; // countdown counter
4620  04c4 3d07          	tnz	_m_countdown
4621  04c6 2702          	jreq	L3052
4624  04c8 3a07          	dec	_m_countdown
4625  04ca               L3052:
4626                     ; 440    switch (menustate)
4628  04ca b604          	ld	a,_menustate
4630                     ; 758             break;
4631  04cc a10c          	cp	a,#12
4632  04ce 2407          	jruge	L231
4633  04d0 5f            	clrw	x
4634  04d1 97            	ld	xl,a
4635  04d2 58            	sllw	x
4636  04d3 de0056        	ldw	x,(L431,x)
4637  04d6 fc            	jp	(x)
4638  04d7               L231:
4639  04d7 ac2e0a2e      	jpf	L7442
4640  04db               L3142:
4641                     ; 443         case MENU_IDLE:
4641                     ; 444             leds_out &= ~LED_ALM2;
4643  04db 72150001      	bres	_leds_out+1,#2
4644                     ; 445             pwr_on = eeprom_read_config(EEADR_POWER_ON);
4646  04df a685          	ld	a,#133
4647  04e1 cd0000        	call	_eeprom_read_config
4649  04e4 a30000        	cpw	x,#0
4650  04e7 2602          	jrne	L241
4651  04e9 2006          	jp	L211
4652  04eb               L241:
4653  04eb 72100001      	bset	_pwr_on
4654  04ef 2004          	jra	L411
4655  04f1               L211:
4656  04f1 72110001      	bres	_pwr_on
4657  04f5               L411:
4658                     ; 446             if (BTN_PRESSED(BTN_LEFT))
4660  04f5 b608          	ld	a,__buttons
4661  04f7 a444          	and	a,#68
4662  04f9 a104          	cp	a,#4
4663  04fb 260c          	jrne	L1152
4664                     ; 448                 m_countdown = TMR_POWERDOWN;
4666  04fd 351e0007      	mov	_m_countdown,#30
4667                     ; 449                 menustate   = MENU_POWER_DOWN_WAIT;
4669  0501 35050004      	mov	_menustate,#5
4671  0505 ac300a30      	jpf	L7052
4672  0509               L1152:
4673                     ; 450             } else if (!pwr_on)
4675                     	btst	_pwr_on
4676  050e 2507          	jrult	L5152
4677                     ; 452                 leds_out = 0x00;
4679  0510 5f            	clrw	x
4680  0511 bf00          	ldw	_leds_out,x
4682  0513 ac300a30      	jpf	L7052
4683  0517               L5152:
4684                     ; 453             } else if (_buttons)
4686  0517 3d08          	tnz	__buttons
4687  0519 2603          	jrne	L441
4688  051b cc0a30        	jp	L7052
4689  051e               L441:
4690                     ; 455                 if (BTN_PRESSED(BTN_UP))
4692  051e b608          	ld	a,__buttons
4693  0520 a411          	and	a,#17
4694  0522 a101          	cp	a,#1
4695  0524 2608          	jrne	L3252
4696                     ; 457                     menustate = MENU_SHOW_VERSION;
4698  0526 35010004      	mov	_menustate,#1
4700  052a ac300a30      	jpf	L7052
4701  052e               L3252:
4702                     ; 458                 } else if (BTN_PRESSED(BTN_DOWN))
4704  052e b608          	ld	a,__buttons
4705  0530 a422          	and	a,#34
4706  0532 a102          	cp	a,#2
4707  0534 260c          	jrne	L7252
4708                     ; 460                     m_countdown = TMR_SHOW_PROFILE_ITEM;
4710  0536 350f0007      	mov	_m_countdown,#15
4711                     ; 461                     menustate   = MENU_SHOW_STATE_DOWN;
4713  053a 35020004      	mov	_menustate,#2
4715  053e ac300a30      	jpf	L7052
4716  0542               L7252:
4717                     ; 462                 } else if (BTN_RELEASED(BTN_SET))
4719  0542 b608          	ld	a,__buttons
4720  0544 a488          	and	a,#136
4721  0546 a180          	cp	a,#128
4722  0548 2703          	jreq	L641
4723  054a cc0a30        	jp	L7052
4724  054d               L641:
4725                     ; 464                     menustate = MENU_SHOW_MENU_ITEM;
4727  054d 35060004      	mov	_menustate,#6
4728  0551 ac300a30      	jpf	L7052
4729  0555               L5142:
4730                     ; 469         case MENU_POWER_DOWN_WAIT:
4730                     ; 470             if (m_countdown == 0)
4732  0555 3d07          	tnz	_m_countdown
4733  0557 2652          	jrne	L5352
4734                     ; 472                 pwr_on = eeprom_read_config(EEADR_POWER_ON);
4736  0559 a685          	ld	a,#133
4737  055b cd0000        	call	_eeprom_read_config
4739  055e a30000        	cpw	x,#0
4740  0561 2602          	jrne	L051
4741  0563 2006          	jp	L611
4742  0565               L051:
4743  0565 72100001      	bset	_pwr_on
4744  0569 2004          	jra	L021
4745  056b               L611:
4746  056b 72110001      	bres	_pwr_on
4747  056f               L021:
4748                     ; 473                 pwr_on = !pwr_on;
4750  056f 90100001      	bcpl	_pwr_on
4751                     ; 474                 eeprom_write_config(EEADR_POWER_ON, pwr_on);
4753  0573 5f            	clrw	x
4754                     	btst	_pwr_on
4755  0579 59            	rlcw	x
4756  057a 89            	pushw	x
4757  057b a685          	ld	a,#133
4758  057d cd0000        	call	_eeprom_write_config
4760  0580 85            	popw	x
4761                     ; 475                 if (pwr_on)
4763                     	btst	_pwr_on
4764  0586 241d          	jruge	L7352
4765                     ; 477                     heating_delay = 60; // 60 sec.
4767  0588 ae003c        	ldw	x,#60
4768  058b bf02          	ldw	_heating_delay,x
4769                     ; 478                     cooling_delay = 60; // 60 sec.
4771  058d ae003c        	ldw	x,#60
4772  0590 bf00          	ldw	_cooling_delay,x
4773                     ; 479                     eeprom_write_config(EEADR_MENU_ITEM(St), 0);
4775  0592 5f            	clrw	x
4776  0593 89            	pushw	x
4777  0594 a678          	ld	a,#120
4778  0596 cd0000        	call	_eeprom_write_config
4780  0599 85            	popw	x
4781                     ; 480                     curr_dur = 0;
4783  059a 5f            	clrw	x
4784  059b bf0a          	ldw	_curr_dur,x
4785                     ; 481                     eeprom_write_config(EEADR_MENU_ITEM(dh), curr_dur);
4787  059d 5f            	clrw	x
4788  059e 89            	pushw	x
4789  059f a679          	ld	a,#121
4790  05a1 cd0000        	call	_eeprom_write_config
4792  05a4 85            	popw	x
4793  05a5               L7352:
4794                     ; 483                 menustate = MENU_IDLE;
4796  05a5 3f04          	clr	_menustate
4798  05a7 ac300a30      	jpf	L7052
4799  05ab               L5352:
4800                     ; 484             } else if(!BTN_HELD(BTN_LEFT))
4802  05ab b608          	ld	a,__buttons
4803  05ad a444          	and	a,#68
4804  05af a144          	cp	a,#68
4805  05b1 2603          	jrne	L251
4806  05b3 cc0a30        	jp	L7052
4807  05b6               L251:
4808                     ; 486                 if (++sensor2_selected > 1 + (ts > 0)) sensor2_selected = 0;
4810  05b6 9c            	rvf
4811  05b7 3d00          	tnz	_ts
4812  05b9 2705          	jreq	L221
4813  05bb ae0001        	ldw	x,#1
4814  05be 2001          	jra	L421
4815  05c0               L221:
4816  05c0 5f            	clrw	x
4817  05c1               L421:
4818  05c1 5c            	incw	x
4819  05c2 3c09          	inc	_sensor2_selected
4820  05c4 b609          	ld	a,_sensor2_selected
4821  05c6 905f          	clrw	y
4822  05c8 9097          	ld	yl,a
4823  05ca bf00          	ldw	c_x,x
4824  05cc 90b300        	cpw	y,c_x
4825  05cf 2d02          	jrsle	L5452
4828  05d1 3f09          	clr	_sensor2_selected
4829  05d3               L5452:
4830                     ; 487                 menustate = MENU_IDLE;
4832  05d3 3f04          	clr	_menustate
4833  05d5 ac300a30      	jpf	L7052
4834  05d9               L7142:
4835                     ; 491         case MENU_SHOW_VERSION: // Show STC1000p version number
4835                     ; 492             top_100 = LED_S; top_10 = LED_u; top_1 = LED_E; top_01 = LED_r;
4837  05d9 35b50013      	mov	_top_100,#181
4840  05dd 35c10012      	mov	_top_10,#193
4843  05e1 35f40011      	mov	_top_1,#244
4846  05e5 35500010      	mov	_top_01,#80
4847                     ; 493             value_to_led(STC1000P_VERSION,LEDS_INT, ROW_BOT);
4849  05e9 4b03          	push	#3
4850  05eb 4b00          	push	#0
4851  05ed ae012c        	ldw	x,#300
4852  05f0 cd00cc        	call	_value_to_led
4854  05f3 85            	popw	x
4855                     ; 494             bot_10 |= LED_DP; bot_1  |= LED_DP;
4857  05f4 7216000e      	bset	_bot_10,#3
4860  05f8 7216000d      	bset	_bot_1,#3
4861                     ; 495             if(!BTN_HELD(BTN_UP)) menustate = MENU_IDLE;
4863  05fc b608          	ld	a,__buttons
4864  05fe a411          	and	a,#17
4865  0600 a111          	cp	a,#17
4866  0602 2603          	jrne	L451
4867  0604 cc0a30        	jp	L7052
4868  0607               L451:
4871  0607 3f04          	clr	_menustate
4872  0609 ac300a30      	jpf	L7052
4873  060d               L1242:
4874                     ; 498         case MENU_SHOW_STATE_DOWN: // Show Profile-number
4874                     ; 499             run_mode = eeprom_read_config(EEADR_MENU_ITEM(rn));
4876  060d a684          	ld	a,#132
4877  060f cd0000        	call	_eeprom_read_config
4879  0612 01            	rrwa	x,a
4880  0613 6b02          	ld	(OFST+0,sp),a
4881  0615 02            	rlwa	x,a
4883                     ; 500             top_100 = LED_OFF; top_10 = LED_r; top_1 = LED_u; top_01 = LED_n;
4885  0616 3f13          	clr	_top_100
4888  0618 35500012      	mov	_top_10,#80
4891  061c 35c10011      	mov	_top_1,#193
4894  0620 35510010      	mov	_top_01,#81
4895                     ; 501             prx_to_led(run_mode); // display run_mode on bottom row
4897  0624 7b02          	ld	a,(OFST+0,sp)
4898  0626 cd0051        	call	_prx_to_led
4900                     ; 502             if ((run_mode < THERMOSTAT_MODE) && (m_countdown == 0))
4902  0629 7b02          	ld	a,(OFST+0,sp)
4903  062b a106          	cp	a,#6
4904  062d 240c          	jruge	L1552
4906  062f 3d07          	tnz	_m_countdown
4907  0631 2608          	jrne	L1552
4908                     ; 504                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4910  0633 350f0007      	mov	_m_countdown,#15
4911                     ; 505                 menustate   = MENU_SHOW_STATE_DOWN_2;
4913  0637 35030004      	mov	_menustate,#3
4914  063b               L1552:
4915                     ; 507             if (!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
4917  063b b608          	ld	a,__buttons
4918  063d a422          	and	a,#34
4919  063f a122          	cp	a,#34
4920  0641 2603          	jrne	L651
4921  0643 cc0a30        	jp	L7052
4922  0646               L651:
4925  0646 3f04          	clr	_menustate
4926  0648 ac300a30      	jpf	L7052
4927  064c               L3242:
4928                     ; 510         case MENU_SHOW_STATE_DOWN_2: // Show current step number within profile
4928                     ; 511             top_10  = LED_S; top_1 = LED_t; 
4930  064c 35b50012      	mov	_top_10,#181
4933  0650 35f00011      	mov	_top_1,#240
4934                     ; 512             top_100 = top_01 = LED_OFF;
4936  0654 3f10          	clr	_top_01
4937  0656 3f13          	clr	_top_100
4938                     ; 513             value_to_led(eeprom_read_config(EEADR_MENU_ITEM(St)),LEDS_INT, ROW_BOT);
4940  0658 4b03          	push	#3
4941  065a 4b00          	push	#0
4942  065c a678          	ld	a,#120
4943  065e cd0000        	call	_eeprom_read_config
4945  0661 cd00cc        	call	_value_to_led
4947  0664 85            	popw	x
4948                     ; 514             if (m_countdown == 0)
4950  0665 3d07          	tnz	_m_countdown
4951  0667 2608          	jrne	L5552
4952                     ; 516                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4954  0669 350f0007      	mov	_m_countdown,#15
4955                     ; 517                 menustate   = MENU_SHOW_STATE_DOWN_3;
4957  066d 35040004      	mov	_menustate,#4
4958  0671               L5552:
4959                     ; 519             if(!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
4961  0671 b608          	ld	a,__buttons
4962  0673 a422          	and	a,#34
4963  0675 a122          	cp	a,#34
4964  0677 2603          	jrne	L061
4965  0679 cc0a30        	jp	L7052
4966  067c               L061:
4969  067c 3f04          	clr	_menustate
4970  067e ac300a30      	jpf	L7052
4971  0682               L5242:
4972                     ; 522         case MENU_SHOW_STATE_DOWN_3: // Show current duration of running profile
4972                     ; 523             top_10  = LED_d; top_1 = LED_h; 
4974  0682 35d30012      	mov	_top_10,#211
4977  0686 35710011      	mov	_top_1,#113
4978                     ; 524             top_100 = top_01 = LED_OFF;
4980  068a 3f10          	clr	_top_01
4981  068c 3f13          	clr	_top_100
4982                     ; 525             if (minutes) // is timing-control in minutes?
4984                     	btst	_minutes
4985  0693 240c          	jruge	L1652
4986                     ; 526                  value_to_led(curr_dur,LEDS_INT, ROW_BOT);
4988  0695 4b03          	push	#3
4989  0697 4b00          	push	#0
4990  0699 be0a          	ldw	x,_curr_dur
4991  069b cd00cc        	call	_value_to_led
4993  069e 85            	popw	x
4995  069f 200d          	jra	L3652
4996  06a1               L1652:
4997                     ; 527             else value_to_led(eeprom_read_config(EEADR_MENU_ITEM(dh)),LEDS_INT,ROW_BOT);
4999  06a1 4b03          	push	#3
5000  06a3 4b00          	push	#0
5001  06a5 a679          	ld	a,#121
5002  06a7 cd0000        	call	_eeprom_read_config
5004  06aa cd00cc        	call	_value_to_led
5006  06ad 85            	popw	x
5007  06ae               L3652:
5008                     ; 528             if (m_countdown == 0)
5010  06ae 3d07          	tnz	_m_countdown
5011  06b0 2608          	jrne	L5652
5012                     ; 530                 m_countdown = TMR_SHOW_PROFILE_ITEM;
5014  06b2 350f0007      	mov	_m_countdown,#15
5015                     ; 531                 menustate   = MENU_SHOW_STATE_DOWN;
5017  06b6 35020004      	mov	_menustate,#2
5018  06ba               L5652:
5019                     ; 533             if (!BTN_HELD(BTN_DOWN))
5021  06ba b608          	ld	a,__buttons
5022  06bc a422          	and	a,#34
5023  06be a122          	cp	a,#34
5024  06c0 2603          	jrne	L261
5025  06c2 cc0a30        	jp	L7052
5026  06c5               L261:
5027                     ; 535                 menustate = MENU_IDLE;
5029  06c5 3f04          	clr	_menustate
5030  06c7 ac300a30      	jpf	L7052
5031  06cb               L7242:
5032                     ; 539         case MENU_SHOW_MENU_ITEM: // S-button was pressed
5032                     ; 540             top_100 = LED_S;   top_10  = LED_E; top_1 = LED_t; 
5034  06cb 35b50013      	mov	_top_100,#181
5037  06cf 35f40012      	mov	_top_10,#244
5040  06d3 35f00011      	mov	_top_1,#240
5041                     ; 541             top_01  = bot_01 = LED_OFF; bot_100 = LED_P;
5043  06d7 3f0c          	clr	_bot_01
5044  06d9 3f10          	clr	_top_01
5047  06db 3576000f      	mov	_bot_100,#118
5048                     ; 542             if (menu_item < NO_OF_PROFILES)
5050  06df b605          	ld	a,_menu_item
5051  06e1 a106          	cp	a,#6
5052  06e3 240f          	jruge	L1752
5053                     ; 544                 bot_10 = LED_r;
5055  06e5 3550000e      	mov	_bot_10,#80
5056                     ; 545                 bot_1  = led_lookup[menu_item];
5058  06e9 b605          	ld	a,_menu_item
5059  06eb 5f            	clrw	x
5060  06ec 97            	ld	xl,a
5061  06ed d60000        	ld	a,(_led_lookup,x)
5062  06f0 b70d          	ld	_bot_1,a
5064  06f2 2008          	jra	L3752
5065  06f4               L1752:
5066                     ; 547                 bot_10 = LED_A;
5068  06f4 3577000e      	mov	_bot_10,#119
5069                     ; 548                 bot_1  = LED_r;
5071  06f8 3550000d      	mov	_bot_1,#80
5072  06fc               L3752:
5073                     ; 550             m_countdown = TMR_NO_KEY_TIMEOUT;
5075  06fc 35960007      	mov	_m_countdown,#150
5076                     ; 551             menustate   = MENU_SET_MENU_ITEM;
5078  0700 35070004      	mov	_menustate,#7
5079                     ; 552         break; // MENU_SHOW_MENU_ITEM
5081  0704 ac300a30      	jpf	L7052
5082  0708               L1342:
5083                     ; 554         case MENU_SET_MENU_ITEM:
5083                     ; 555             if (m_countdown == 0 || BTN_RELEASED(BTN_LEFT))
5085  0708 3d07          	tnz	_m_countdown
5086  070a 2708          	jreq	L7752
5088  070c b608          	ld	a,__buttons
5089  070e a444          	and	a,#68
5090  0710 a140          	cp	a,#64
5091  0712 2606          	jrne	L5752
5092  0714               L7752:
5093                     ; 557                 menustate = MENU_IDLE;
5095  0714 3f04          	clr	_menustate
5097  0716 ac300a30      	jpf	L7052
5098  071a               L5752:
5099                     ; 558             } else if(BTN_RELEASED(BTN_UP))
5101  071a b608          	ld	a,__buttons
5102  071c a411          	and	a,#17
5103  071e a110          	cp	a,#16
5104  0720 2612          	jrne	L3062
5105                     ; 560                 if(++menu_item > MENU_ITEM_NO) menu_item = 0;
5107  0722 3c05          	inc	_menu_item
5108  0724 b605          	ld	a,_menu_item
5109  0726 a107          	cp	a,#7
5110  0728 2502          	jrult	L5062
5113  072a 3f05          	clr	_menu_item
5114  072c               L5062:
5115                     ; 561                 menustate = MENU_SHOW_MENU_ITEM;
5117  072c 35060004      	mov	_menustate,#6
5119  0730 ac300a30      	jpf	L7052
5120  0734               L3062:
5121                     ; 562             } else if(BTN_RELEASED(BTN_DOWN))
5123  0734 b608          	ld	a,__buttons
5124  0736 a422          	and	a,#34
5125  0738 a120          	cp	a,#32
5126  073a 2614          	jrne	L1162
5127                     ; 564                 if(--menu_item > MENU_ITEM_NO) menu_item = MENU_ITEM_NO;
5129  073c 3a05          	dec	_menu_item
5130  073e b605          	ld	a,_menu_item
5131  0740 a107          	cp	a,#7
5132  0742 2504          	jrult	L3162
5135  0744 35060005      	mov	_menu_item,#6
5136  0748               L3162:
5137                     ; 565                 menustate = MENU_SHOW_MENU_ITEM;
5139  0748 35060004      	mov	_menustate,#6
5141  074c ac300a30      	jpf	L7052
5142  0750               L1162:
5143                     ; 566             } else if(BTN_RELEASED(BTN_SET))
5145  0750 b608          	ld	a,__buttons
5146  0752 a488          	and	a,#136
5147  0754 a180          	cp	a,#128
5148  0756 2703          	jreq	L461
5149  0758 cc0a30        	jp	L7052
5150  075b               L461:
5151                     ; 568                 config_item = 0;
5153  075b 3f06          	clr	_config_item
5154                     ; 569                 menustate   = MENU_SHOW_CONFIG_ITEM;
5156  075d 35080004      	mov	_menustate,#8
5157  0761 ac300a30      	jpf	L7052
5158  0765               L3342:
5159                     ; 573         case MENU_SHOW_CONFIG_ITEM: // S-button is released
5159                     ; 574             if (menu_item < MENU_ITEM_NO)
5161  0765 b605          	ld	a,_menu_item
5162  0767 a106          	cp	a,#6
5163  0769 242d          	jruge	L1262
5164                     ; 576                 if(config_item & 0x1) 
5166  076b b606          	ld	a,_config_item
5167  076d a501          	bcp	a,#1
5168  076f 270a          	jreq	L3262
5169                     ; 578                     top_100 = LED_d; // duration: 2nd value of a profile-step
5171  0771 35d30013      	mov	_top_100,#211
5172                     ; 579                     top_10  = LED_h;
5174  0775 35710012      	mov	_top_10,#113
5176  0779 2008          	jra	L5262
5177  077b               L3262:
5178                     ; 581                     top_100 = LED_S; // setpoint: 1st value of a profile-step
5180  077b 35b50013      	mov	_top_100,#181
5181                     ; 582                     top_10  = LED_P;
5183  077f 35760012      	mov	_top_10,#118
5184  0783               L5262:
5185                     ; 584                 top_1  = led_lookup[menu_item];
5187  0783 b605          	ld	a,_menu_item
5188  0785 5f            	clrw	x
5189  0786 97            	ld	xl,a
5190  0787 d60000        	ld	a,(_led_lookup,x)
5191  078a b711          	ld	_top_1,a
5192                     ; 585                 top_01 = led_lookup[(config_item >> 1)];
5194  078c b606          	ld	a,_config_item
5195  078e 44            	srl	a
5196  078f 5f            	clrw	x
5197  0790 97            	ld	xl,a
5198  0791 d60000        	ld	a,(_led_lookup,x)
5199  0794 b710          	ld	_top_01,a
5201  0796 2023          	jra	L7262
5202  0798               L1262:
5203                     ; 588                 top_100 = LED_OFF;
5205  0798 3f13          	clr	_top_100
5206                     ; 589                 top_10  = menu[config_item].led_c_10;
5208  079a b606          	ld	a,_config_item
5209  079c 97            	ld	xl,a
5210  079d a604          	ld	a,#4
5211  079f 42            	mul	x,a
5212  07a0 d6000a        	ld	a,(_menu,x)
5213  07a3 b712          	ld	_top_10,a
5214                     ; 590                 top_1   = menu[config_item].led_c_1;
5216  07a5 b606          	ld	a,_config_item
5217  07a7 97            	ld	xl,a
5218  07a8 a604          	ld	a,#4
5219  07aa 42            	mul	x,a
5220  07ab d6000b        	ld	a,(_menu+1,x)
5221  07ae b711          	ld	_top_1,a
5222                     ; 591                 top_01  = menu[config_item].led_c_01;
5224  07b0 b606          	ld	a,_config_item
5225  07b2 97            	ld	xl,a
5226  07b3 a604          	ld	a,#4
5227  07b5 42            	mul	x,a
5228  07b6 d6000c        	ld	a,(_menu+2,x)
5229  07b9 b710          	ld	_top_01,a
5230  07bb               L7262:
5231                     ; 593             adr          = MI_CI_TO_EEADR(menu_item, config_item);
5233  07bb b605          	ld	a,_menu_item
5234  07bd 97            	ld	xl,a
5235  07be a613          	ld	a,#19
5236  07c0 42            	mul	x,a
5237  07c1 9f            	ld	a,xl
5238  07c2 bb06          	add	a,_config_item
5239  07c4 6b01          	ld	(OFST-1,sp),a
5241                     ; 594             config_value = eeprom_read_config(adr);
5243  07c6 7b01          	ld	a,(OFST-1,sp)
5244  07c8 cd0000        	call	_eeprom_read_config
5246  07cb bf09          	ldw	_config_value,x
5247                     ; 595             config_value = check_config_value(config_value, adr);
5249  07cd 7b01          	ld	a,(OFST-1,sp)
5250  07cf 88            	push	a
5251  07d0 be09          	ldw	x,_config_value
5252  07d2 cd0300        	call	_check_config_value
5254  07d5 84            	pop	a
5255  07d6 bf09          	ldw	_config_value,x
5256                     ; 596             m_countdown  = TMR_NO_KEY_TIMEOUT;
5258  07d8 35960007      	mov	_m_countdown,#150
5259                     ; 597             ret_state    = MENU_SET_CONFIG_ITEM;  // return state
5261  07dc 3509000b      	mov	_ret_state,#9
5262                     ; 598             menustate    = MENU_SHOW_CONFIG_VALUE; // display config value
5264  07e0 350a0004      	mov	_menustate,#10
5265                     ; 599             break;
5267  07e4 ac300a30      	jpf	L7052
5268  07e8               L5342:
5269                     ; 601         case MENU_SET_CONFIG_ITEM:
5269                     ; 602             leds_out = LED_ALM2;
5271  07e8 ae0004        	ldw	x,#4
5272  07eb bf00          	ldw	_leds_out,x
5273                     ; 603             if (m_countdown == 0)
5275  07ed 3d07          	tnz	_m_countdown
5276  07ef 2606          	jrne	L1362
5277                     ; 605                     menustate = MENU_IDLE;
5279  07f1 3f04          	clr	_menustate
5281  07f3 ac9c089c      	jpf	L3362
5282  07f7               L1362:
5283                     ; 606             } else if (BTN_RELEASED(BTN_LEFT))
5285  07f7 b608          	ld	a,__buttons
5286  07f9 a444          	and	a,#68
5287  07fb a140          	cp	a,#64
5288  07fd 2608          	jrne	L5362
5289                     ; 608                 menustate = MENU_SHOW_MENU_ITEM;
5291  07ff 35060004      	mov	_menustate,#6
5293  0803 ac9c089c      	jpf	L3362
5294  0807               L5362:
5295                     ; 609             } else if (BTN_RELEASED(BTN_UP))
5297  0807 b608          	ld	a,__buttons
5298  0809 a411          	and	a,#17
5299  080b a110          	cp	a,#16
5300  080d 2626          	jrne	L1462
5301                     ; 611                 config_item++;
5303  080f 3c06          	inc	_config_item
5304                     ; 612                 if (menu_item < MENU_ITEM_NO)
5306  0811 b605          	ld	a,_menu_item
5307  0813 a106          	cp	a,#6
5308  0815 240a          	jruge	L3462
5309                     ; 614                     if (config_item >= PROFILE_SIZE)
5311  0817 b606          	ld	a,_config_item
5312  0819 a113          	cp	a,#19
5313  081b 250e          	jrult	L7462
5314                     ; 616                         config_item = 0;
5316  081d 3f06          	clr	_config_item
5317  081f 200a          	jra	L7462
5318  0821               L3462:
5319                     ; 619                     if (config_item >= MENU_SIZE)
5321  0821 b606          	ld	a,_config_item
5322  0823 a113          	cp	a,#19
5323  0825 2534          	jrult	L7342
5324                     ; 621                         config_item = 0;
5326  0827 3f06          	clr	_config_item
5327  0829 2030          	jra	L7342
5328  082b               L7462:
5329                     ; 628                 ret_state = MENU_SHOW_CONFIG_ITEM;  // return state
5331  082b 3508000b      	mov	_ret_state,#8
5332                     ; 629                 menustate = MENU_SHOW_CONFIG_VALUE; // display config value
5334  082f 350a0004      	mov	_menustate,#10
5336  0833 2067          	jra	L3362
5337  0835               L1462:
5338                     ; 630             } else if(BTN_RELEASED(BTN_DOWN))
5340  0835 b608          	ld	a,__buttons
5341  0837 a422          	and	a,#34
5342  0839 a120          	cp	a,#32
5343  083b 264f          	jrne	L5562
5344                     ; 632                 config_item--;
5346  083d 3a06          	dec	_config_item
5347                     ; 633                 if(menu_item < MENU_ITEM_NO)
5349  083f b605          	ld	a,_menu_item
5350  0841 a106          	cp	a,#6
5351  0843 240c          	jruge	L7562
5352                     ; 635                     if (config_item >= PROFILE_SIZE)
5354  0845 b606          	ld	a,_config_item
5355  0847 a113          	cp	a,#19
5356  0849 2537          	jrult	L3662
5357                     ; 637                         config_item = PROFILE_SIZE-1;
5359  084b 35120006      	mov	_config_item,#18
5360  084f 2031          	jra	L3662
5361  0851               L7562:
5362                     ; 640                     if (config_item > MENU_SIZE-1)
5364  0851 b606          	ld	a,_config_item
5365  0853 a113          	cp	a,#19
5366  0855 2504          	jrult	L7342
5367                     ; 642                         config_item = MENU_SIZE-1;
5369  0857 35120006      	mov	_config_item,#18
5370  085b               L7342:
5371                     ; 644                     chk_skip_menu_item: // label for goto
5371                     ; 645                     if (!minutes && ((uint8_t)eeprom_read_config(EEADR_MENU_ITEM(rn)) >= THERMOSTAT_MODE))
5373                     	btst	_minutes
5374  0860 2520          	jrult	L3662
5376  0862 a684          	ld	a,#132
5377  0864 cd0000        	call	_eeprom_read_config
5379  0867 9f            	ld	a,xl
5380  0868 a106          	cp	a,#6
5381  086a 2516          	jrult	L3662
5382                     ; 647                         if (config_item == St)
5384  086c b606          	ld	a,_config_item
5385  086e a106          	cp	a,#6
5386  0870 2606          	jrne	L1762
5387                     ; 649                             config_item += 2;
5389  0872 3c06          	inc	_config_item
5390  0874 3c06          	inc	_config_item
5392  0876 200a          	jra	L3662
5393  0878               L1762:
5394                     ; 651                         else if (config_item == dh)
5396  0878 b606          	ld	a,_config_item
5397  087a a107          	cp	a,#7
5398  087c 2604          	jrne	L3662
5399                     ; 653                             config_item -= 2;
5401  087e 3a06          	dec	_config_item
5402  0880 3a06          	dec	_config_item
5403  0882               L3662:
5404                     ; 657                 ret_state = MENU_SHOW_CONFIG_ITEM;  // return to this state
5406  0882 3508000b      	mov	_ret_state,#8
5407                     ; 658                 menustate = MENU_SHOW_CONFIG_VALUE; // display config value
5409  0886 350a0004      	mov	_menustate,#10
5411  088a 2010          	jra	L3362
5412  088c               L5562:
5413                     ; 659             } else if(BTN_RELEASED(BTN_SET))
5415  088c b608          	ld	a,__buttons
5416  088e a488          	and	a,#136
5417  0890 a180          	cp	a,#128
5418  0892 2608          	jrne	L3362
5419                     ; 661                 m_countdown  = TMR_NO_KEY_TIMEOUT;
5421  0894 35960007      	mov	_m_countdown,#150
5422                     ; 662                 menustate    = MENU_SET_CONFIG_VALUE;  // display config value
5424  0898 350b0004      	mov	_menustate,#11
5425  089c               L3362:
5426                     ; 664             adr          = MI_CI_TO_EEADR(menu_item, config_item);
5428  089c b605          	ld	a,_menu_item
5429  089e 97            	ld	xl,a
5430  089f a613          	ld	a,#19
5431  08a1 42            	mul	x,a
5432  08a2 9f            	ld	a,xl
5433  08a3 bb06          	add	a,_config_item
5434  08a5 6b01          	ld	(OFST-1,sp),a
5436                     ; 665             config_value = eeprom_read_config(adr);
5438  08a7 7b01          	ld	a,(OFST-1,sp)
5439  08a9 cd0000        	call	_eeprom_read_config
5441  08ac bf09          	ldw	_config_value,x
5442                     ; 666             config_value = check_config_value(config_value, adr);
5444  08ae 7b01          	ld	a,(OFST-1,sp)
5445  08b0 88            	push	a
5446  08b1 be09          	ldw	x,_config_value
5447  08b3 cd0300        	call	_check_config_value
5449  08b6 84            	pop	a
5450  08b7 bf09          	ldw	_config_value,x
5451                     ; 667        break; // MENU_SET_CONFIG_ITEM
5453  08b9 ac300a30      	jpf	L7052
5454  08bd               L1442:
5455                     ; 669        case MENU_SHOW_CONFIG_VALUE:
5455                     ; 670             if(menu_item < MENU_ITEM_NO)
5457  08bd b605          	ld	a,_menu_item
5458  08bf a106          	cp	a,#6
5459  08c1 2416          	jruge	L3072
5460                     ; 672                 value_to_led(config_value, (config_item & 0x1) ? LEDS_INT : LEDS_TEMP, ROW_BOT);
5462  08c3 4b03          	push	#3
5463  08c5 b606          	ld	a,_config_item
5464  08c7 a501          	bcp	a,#1
5465  08c9 2703          	jreq	L621
5466  08cb 4f            	clr	a
5467  08cc 2002          	jra	L031
5468  08ce               L621:
5469  08ce a601          	ld	a,#1
5470  08d0               L031:
5471  08d0 88            	push	a
5472  08d1 be09          	ldw	x,_config_value
5473  08d3 cd00cc        	call	_value_to_led
5475  08d6 85            	popw	x
5477  08d7 2034          	jra	L5072
5478  08d9               L3072:
5479                     ; 675                 type = menu[config_item].type;
5481  08d9 b606          	ld	a,_config_item
5482  08db 97            	ld	xl,a
5483  08dc a604          	ld	a,#4
5484  08de 42            	mul	x,a
5485  08df d6000d        	ld	a,(_menu+3,x)
5486  08e2 6b02          	ld	(OFST+0,sp),a
5488                     ; 676                 if(MENU_TYPE_IS_TEMPERATURE(type))
5490  08e4 7b02          	ld	a,(OFST+0,sp)
5491  08e6 a105          	cp	a,#5
5492  08e8 240c          	jruge	L7072
5493                     ; 678                     value_to_led(config_value,LEDS_TEMP, ROW_BOT);
5495  08ea 4b03          	push	#3
5496  08ec 4b01          	push	#1
5497  08ee be09          	ldw	x,_config_value
5498  08f0 cd00cc        	call	_value_to_led
5500  08f3 85            	popw	x
5502  08f4 2017          	jra	L5072
5503  08f6               L7072:
5504                     ; 679                 } else if (type == t_runmode)
5506  08f6 7b02          	ld	a,(OFST+0,sp)
5507  08f8 a107          	cp	a,#7
5508  08fa 2607          	jrne	L3172
5509                     ; 681                     prx_to_led(config_value);
5511  08fc b60a          	ld	a,_config_value+1
5512  08fe cd0051        	call	_prx_to_led
5515  0901 200a          	jra	L5072
5516  0903               L3172:
5517                     ; 683                     value_to_led(config_value,LEDS_INT, ROW_BOT);
5519  0903 4b03          	push	#3
5520  0905 4b00          	push	#0
5521  0907 be09          	ldw	x,_config_value
5522  0909 cd00cc        	call	_value_to_led
5524  090c 85            	popw	x
5525  090d               L5072:
5526                     ; 686             m_countdown  = TMR_NO_KEY_TIMEOUT;
5528  090d 35960007      	mov	_m_countdown,#150
5529                     ; 687             menustate    = ret_state; // return to indicated state
5531  0911 450b04        	mov	_menustate,_ret_state
5532                     ; 688             break;
5534  0914 ac300a30      	jpf	L7052
5535  0918               L3442:
5536                     ; 690        case MENU_SET_CONFIG_VALUE:
5536                     ; 691             leds_out = LED_ALM2 | LED_ALM2_BLINK;
5538  0918 ae000c        	ldw	x,#12
5539  091b bf00          	ldw	_leds_out,x
5540                     ; 692             adr = MI_CI_TO_EEADR(menu_item, config_item);
5542  091d b605          	ld	a,_menu_item
5543  091f 97            	ld	xl,a
5544  0920 a613          	ld	a,#19
5545  0922 42            	mul	x,a
5546  0923 9f            	ld	a,xl
5547  0924 bb06          	add	a,_config_item
5548  0926 6b01          	ld	(OFST-1,sp),a
5550                     ; 693             if (m_countdown == 0)
5552  0928 3d07          	tnz	_m_countdown
5553  092a 2606          	jrne	L7172
5554                     ; 695                 menustate = MENU_IDLE;
5556  092c 3f04          	clr	_menustate
5558  092e ac300a30      	jpf	L7052
5559  0932               L7172:
5560                     ; 696             } else if (BTN_RELEASED(BTN_LEFT))
5562  0932 b608          	ld	a,__buttons
5563  0934 a444          	and	a,#68
5564  0936 a140          	cp	a,#64
5565  0938 2608          	jrne	L3272
5566                     ; 698                 menustate = MENU_SHOW_CONFIG_ITEM;
5568  093a 35080004      	mov	_menustate,#8
5570  093e ac300a30      	jpf	L7052
5571  0942               L3272:
5572                     ; 699             } else if(BTN_HELD_OR_RELEASED(BTN_UP)) 
5574  0942 b608          	ld	a,__buttons
5575  0944 a411          	and	a,#17
5576  0946 a5f0          	bcp	a,#240
5577  0948 271d          	jreq	L7272
5578                     ; 701                 config_value++;
5580  094a be09          	ldw	x,_config_value
5581  094c 1c0001        	addw	x,#1
5582  094f bf09          	ldw	_config_value,x
5583                     ; 702                 if ((config_value > 1000) || (--key_held_tmr < 0))
5585  0951 9c            	rvf
5586  0952 be09          	ldw	x,_config_value
5587  0954 a303e9        	cpw	x,#1001
5588  0957 2e05          	jrsge	L3372
5590  0959 9c            	rvf
5591  095a 3a08          	dec	_key_held_tmr
5592  095c 2e2c          	jrsge	L5442
5593  095e               L3372:
5594                     ; 704                     config_value += 9;
5596  095e be09          	ldw	x,_config_value
5597  0960 1c0009        	addw	x,#9
5598  0963 bf09          	ldw	_config_value,x
5599  0965 2023          	jra	L5442
5600  0967               L7272:
5601                     ; 708             } else if(BTN_HELD_OR_RELEASED(BTN_DOWN)) 
5603  0967 b608          	ld	a,__buttons
5604  0969 a422          	and	a,#34
5605  096b a5f0          	bcp	a,#240
5606  096d 2731          	jreq	L7372
5607                     ; 710                 config_value--;
5609  096f be09          	ldw	x,_config_value
5610  0971 1d0001        	subw	x,#1
5611  0974 bf09          	ldw	_config_value,x
5612                     ; 711                 if ((config_value > 1000) || (--key_held_tmr < 0))
5614  0976 9c            	rvf
5615  0977 be09          	ldw	x,_config_value
5616  0979 a303e9        	cpw	x,#1001
5617  097c 2e05          	jrsge	L3472
5619  097e 9c            	rvf
5620  097f 3a08          	dec	_key_held_tmr
5621  0981 2e07          	jrsge	L5442
5622  0983               L3472:
5623                     ; 713                     config_value -= 9;
5625  0983 be09          	ldw	x,_config_value
5626  0985 1d0009        	subw	x,#9
5627  0988 bf09          	ldw	_config_value,x
5628  098a               L5442:
5629                     ; 715             chk_cfg_acc_label: // label for goto
5629                     ; 716                 config_value = check_config_value(config_value, adr);
5631  098a 7b01          	ld	a,(OFST-1,sp)
5632  098c 88            	push	a
5633  098d be09          	ldw	x,_config_value
5634  098f cd0300        	call	_check_config_value
5636  0992 84            	pop	a
5637  0993 bf09          	ldw	_config_value,x
5638                     ; 717                 ret_state    = MENU_SET_CONFIG_VALUE;  // return to this state
5640  0995 350b000b      	mov	_ret_state,#11
5641                     ; 718                 menustate    = MENU_SHOW_CONFIG_VALUE; // show config_value
5643  0999 350a0004      	mov	_menustate,#10
5645  099d cc0a30        	jra	L7052
5646  09a0               L7372:
5647                     ; 719             } else if(BTN_RELEASED(BTN_SET))
5649  09a0 b608          	ld	a,__buttons
5650  09a2 a488          	and	a,#136
5651  09a4 a180          	cp	a,#128
5652  09a6 2703cc0a28    	jrne	L7472
5653                     ; 721                 if (menu_item == MENU_ITEM_NO)
5655  09ab b605          	ld	a,_menu_item
5656  09ad a106          	cp	a,#6
5657  09af 2668          	jrne	L1572
5658                     ; 723                     if (config_item == rn)
5660  09b1 b606          	ld	a,_config_item
5661  09b3 a112          	cp	a,#18
5662  09b5 2662          	jrne	L1572
5663                     ; 725                         eeprom_write_config(EEADR_MENU_ITEM(St), 0);
5665  09b7 5f            	clrw	x
5666  09b8 89            	pushw	x
5667  09b9 a678          	ld	a,#120
5668  09bb cd0000        	call	_eeprom_write_config
5670  09be 85            	popw	x
5671                     ; 726                         if (minutes)
5673                     	btst	_minutes
5674  09c4 2405          	jruge	L5572
5675                     ; 727                              curr_dur = 0;
5677  09c6 5f            	clrw	x
5678  09c7 bf0a          	ldw	_curr_dur,x
5680  09c9 2008          	jra	L7572
5681  09cb               L5572:
5682                     ; 728                         else eeprom_write_config(EEADR_MENU_ITEM(dh), 0);
5684  09cb 5f            	clrw	x
5685  09cc 89            	pushw	x
5686  09cd a679          	ld	a,#121
5687  09cf cd0000        	call	_eeprom_write_config
5689  09d2 85            	popw	x
5690  09d3               L7572:
5691                     ; 729                         if (config_value < THERMOSTAT_MODE)
5693  09d3 9c            	rvf
5694  09d4 be09          	ldw	x,_config_value
5695  09d6 a30006        	cpw	x,#6
5696  09d9 2e3e          	jrsge	L1572
5697                     ; 731                             eeadr_sp = EEADR_PROFILE_SETPOINT(((uint8_t)config_value), 0);
5699  09db b60a          	ld	a,_config_value+1
5700  09dd 97            	ld	xl,a
5701  09de a613          	ld	a,#19
5702  09e0 42            	mul	x,a
5703  09e1 9f            	ld	a,xl
5704  09e2 6b02          	ld	(OFST+0,sp),a
5706                     ; 733                             if (minutes)
5708                     	btst	_minutes
5709  09e9 2412          	jruge	L3672
5710                     ; 735                                 setpoint = eeprom_read_config(eeadr_sp);
5712  09eb 7b02          	ld	a,(OFST+0,sp)
5713  09ed cd0000        	call	_eeprom_read_config
5715  09f0 bf06          	ldw	_setpoint,x
5716                     ; 736                                 eeprom_write_config(EEADR_MENU_ITEM(SP), setpoint);
5718  09f2 be06          	ldw	x,_setpoint
5719  09f4 89            	pushw	x
5720  09f5 a672          	ld	a,#114
5721  09f7 cd0000        	call	_eeprom_write_config
5723  09fa 85            	popw	x
5725  09fb 200c          	jra	L5672
5726  09fd               L3672:
5727                     ; 738                                 eeprom_write_config(EEADR_MENU_ITEM(SP), eeprom_read_config(eeadr_sp));
5729  09fd 7b02          	ld	a,(OFST+0,sp)
5730  09ff cd0000        	call	_eeprom_read_config
5732  0a02 89            	pushw	x
5733  0a03 a672          	ld	a,#114
5734  0a05 cd0000        	call	_eeprom_write_config
5736  0a08 85            	popw	x
5737  0a09               L5672:
5738                     ; 741                             if (eeprom_read_config(eeadr_sp+1) == 0)
5740  0a09 7b02          	ld	a,(OFST+0,sp)
5741  0a0b 4c            	inc	a
5742  0a0c cd0000        	call	_eeprom_read_config
5744  0a0f a30000        	cpw	x,#0
5745  0a12 2605          	jrne	L1572
5746                     ; 743                                 config_value = THERMOSTAT_MODE;
5748  0a14 ae0006        	ldw	x,#6
5749  0a17 bf09          	ldw	_config_value,x
5750  0a19               L1572:
5751                     ; 748                 eeprom_write_config(adr, config_value);
5753  0a19 be09          	ldw	x,_config_value
5754  0a1b 89            	pushw	x
5755  0a1c 7b03          	ld	a,(OFST+1,sp)
5756  0a1e cd0000        	call	_eeprom_write_config
5758  0a21 85            	popw	x
5759                     ; 749                 menustate = MENU_SHOW_CONFIG_ITEM;
5761  0a22 35080004      	mov	_menustate,#8
5763  0a26 2008          	jra	L7052
5764  0a28               L7472:
5765                     ; 752                 key_held_tmr = TMR_KEY_ACC; 
5767  0a28 35140008      	mov	_key_held_tmr,#20
5768  0a2c 2002          	jra	L7052
5769  0a2e               L7442:
5770                     ; 756        default:
5770                     ; 757             menustate = MENU_IDLE;
5772  0a2e 3f04          	clr	_menustate
5773                     ; 758             break;
5775  0a30               L7052:
5776                     ; 760    menu_is_idle = (menustate == MENU_IDLE); // needed for ctrl_task()
5778  0a30 3d04          	tnz	_menustate
5779  0a32 2702          	jreq	L661
5780  0a34 2006          	jp	L631
5781  0a36               L661:
5782  0a36 72100000      	bset	_menu_is_idle
5783  0a3a 2004          	jra	L041
5784  0a3c               L631:
5785  0a3c 72110000      	bres	_menu_is_idle
5786  0a40               L041:
5787                     ; 761 } // button_menu_fsm()
5790  0a40 85            	popw	x
5791  0a41 81            	ret
5982                     ; 768 uint16_t min_to_sec(enum menu_enum x)
5982                     ; 769 {
5983                     	switch	.text
5984  0a42               _min_to_sec:
5986  0a42 89            	pushw	x
5987       00000002      OFST:	set	2
5990                     ; 772     retv = eeprom_read_config(EEADR_MENU_ITEM(x)) << 6; // * 64
5992  0a43 ab72          	add	a,#114
5993  0a45 cd0000        	call	_eeprom_read_config
5995  0a48 58            	sllw	x
5996  0a49 58            	sllw	x
5997  0a4a 58            	sllw	x
5998  0a4b 58            	sllw	x
5999  0a4c 58            	sllw	x
6000  0a4d 58            	sllw	x
6001  0a4e 1f01          	ldw	(OFST-1,sp),x
6003                     ; 773     retv = retv - (retv >> 4); // 64 - 4 = 60
6005  0a50 1e01          	ldw	x,(OFST-1,sp)
6006  0a52 54            	srlw	x
6007  0a53 54            	srlw	x
6008  0a54 54            	srlw	x
6009  0a55 54            	srlw	x
6010  0a56 72f001        	subw	x,(OFST-1,sp)
6011  0a59 50            	negw	x
6012  0a5a 1f01          	ldw	(OFST-1,sp),x
6014                     ; 774     return retv;
6016  0a5c 1e01          	ldw	x,(OFST-1,sp)
6019  0a5e 5b02          	addw	sp,#2
6020  0a60 81            	ret
6050                     ; 782 void init_temp_delays(void)
6050                     ; 783 {
6051                     	switch	.text
6052  0a61               _init_temp_delays:
6056                     ; 784     if (!minutes) setpoint = eeprom_read_config(EEADR_MENU_ITEM(SP));
6058                     	btst	_minutes
6059  0a66 2507          	jrult	L1013
6062  0a68 a672          	ld	a,#114
6063  0a6a cd0000        	call	_eeprom_read_config
6065  0a6d bf06          	ldw	_setpoint,x
6066  0a6f               L1013:
6067                     ; 785     hysteresis  = eeprom_read_config(EEADR_MENU_ITEM(hy));
6069  0a6f a673          	ld	a,#115
6070  0a71 cd0000        	call	_eeprom_read_config
6072  0a74 bf04          	ldw	_hysteresis,x
6073                     ; 786     hysteresis2 = eeprom_read_config(EEADR_MENU_ITEM(hy2));
6075  0a76 a674          	ld	a,#116
6076  0a78 cd0000        	call	_eeprom_read_config
6078  0a7b bf02          	ldw	_hysteresis2,x
6079                     ; 788     if (cooling_delay) cooling_delay--;
6081  0a7d be00          	ldw	x,_cooling_delay
6082  0a7f 2707          	jreq	L3013
6085  0a81 be00          	ldw	x,_cooling_delay
6086  0a83 1d0001        	subw	x,#1
6087  0a86 bf00          	ldw	_cooling_delay,x
6088  0a88               L3013:
6089                     ; 789     if (heating_delay) heating_delay--;
6091  0a88 be02          	ldw	x,_heating_delay
6092  0a8a 2707          	jreq	L5013
6095  0a8c be02          	ldw	x,_heating_delay
6096  0a8e 1d0001        	subw	x,#1
6097  0a91 bf02          	ldw	_heating_delay,x
6098  0a93               L5013:
6099                     ; 790 } // init_temp_delays()
6102  0a93 81            	ret
6127                     ; 798 void temperature_control(void)
6127                     ; 799 {
6128                     	switch	.text
6129  0a94               _temperature_control:
6133                     ; 800     init_temp_delays();  // Initialise Heating and Cooling delay
6135  0a94 adcb          	call	_init_temp_delays
6137                     ; 801 } // temperature_control()
6140  0a96 81            	ret
6143                     	bsct
6144  000e               L7113_pid_tmr:
6145  000e 00            	dc.b	0
6146                     	xref	_init_pid
6147                     	xref	_pid_ctrl
6190                     ; 810 void pid_control(void)
6190                     ; 811 {
6191                     	switch	.text
6192  0a97               _pid_control:
6196                     ; 814     init_temp_delays(); // Initialise Heating and Cooling delay
6198  0a97 adc8          	call	_init_temp_delays
6200                     ; 816     if (kc != eeprom_read_config(EEADR_MENU_ITEM(Hc)) ||
6200                     ; 817         ti != eeprom_read_config(EEADR_MENU_ITEM(Ti)) ||
6200                     ; 818         td != eeprom_read_config(EEADR_MENU_ITEM(Td)))
6202  0a99 a680          	ld	a,#128
6203  0a9b cd0000        	call	_eeprom_read_config
6205  0a9e b300          	cpw	x,_kc
6206  0aa0 2612          	jrne	L1413
6208  0aa2 a681          	ld	a,#129
6209  0aa4 cd0000        	call	_eeprom_read_config
6211  0aa7 b300          	cpw	x,_ti
6212  0aa9 2609          	jrne	L1413
6214  0aab a682          	ld	a,#130
6215  0aad cd0000        	call	_eeprom_read_config
6217  0ab0 b300          	cpw	x,_td
6218  0ab2 2728          	jreq	L7313
6219  0ab4               L1413:
6220                     ; 820        kc = eeprom_read_config(EEADR_MENU_ITEM(Hc));
6222  0ab4 a680          	ld	a,#128
6223  0ab6 cd0000        	call	_eeprom_read_config
6225  0ab9 bf00          	ldw	_kc,x
6226                     ; 821        ti = eeprom_read_config(EEADR_MENU_ITEM(Ti));
6228  0abb a681          	ld	a,#129
6229  0abd cd0000        	call	_eeprom_read_config
6231  0ac0 bf00          	ldw	_ti,x
6232                     ; 822        td = eeprom_read_config(EEADR_MENU_ITEM(Td));
6234  0ac2 a682          	ld	a,#130
6235  0ac4 cd0000        	call	_eeprom_read_config
6237  0ac7 bf00          	ldw	_td,x
6238                     ; 823        init_pid(kc,ti,td,ts,temp_ntc1); // Init PID controller
6240  0ac9 be00          	ldw	x,_temp_ntc1
6241  0acb 89            	pushw	x
6242  0acc 3b0000        	push	_ts
6243  0acf be00          	ldw	x,_td
6244  0ad1 89            	pushw	x
6245  0ad2 be00          	ldw	x,_ti
6246  0ad4 89            	pushw	x
6247  0ad5 be00          	ldw	x,_kc
6248  0ad7 cd0000        	call	_init_pid
6250  0ada 5b07          	addw	sp,#7
6251  0adc               L7313:
6252                     ; 826     if (++pid_tmr >= ts) 
6254  0adc 3c0e          	inc	L7113_pid_tmr
6255  0ade b60e          	ld	a,L7113_pid_tmr
6256  0ae0 b100          	cp	a,_ts
6257  0ae2 250e          	jrult	L5413
6258                     ; 828         pid_ctrl(temp_ntc1,&pid_out,setpoint);
6260  0ae4 be06          	ldw	x,_setpoint
6261  0ae6 89            	pushw	x
6262  0ae7 4b0c          	push	#_pid_out
6263  0ae9 be00          	ldw	x,_temp_ntc1
6264  0aeb cd0000        	call	_pid_ctrl
6266  0aee 5b03          	addw	sp,#3
6267                     ; 829         pid_tmr = 0;
6269  0af0 3f0e          	clr	L7113_pid_tmr
6270  0af2               L5413:
6271                     ; 831 } // pid_control()
6274  0af2 81            	ret
6630                     	xdef	_init_temp_delays
6631                     	xdef	_min_to_sec
6632                     	xdef	_prx_to_led
6633                     	xdef	_menu
6634                     	xref.b	_leds_out
6635                     	xref.b	_hc164_val
6636                     	xref.b	_ts
6637                     	xref.b	_td
6638                     	xref.b	_ti
6639                     	xref.b	_kc
6640                     	xref.b	_temp_ntc1
6641                     	switch	.ubsct
6642  0000               _porte:
6643  0000 00            	ds.b	1
6644                     	xdef	_porte
6645  0001               _portd:
6646  0001 00            	ds.b	1
6647                     	xdef	_portd
6648  0002               _hysteresis2:
6649  0002 0000          	ds.b	2
6650                     	xdef	_hysteresis2
6651  0004               _hysteresis:
6652  0004 0000          	ds.b	2
6653                     	xdef	_hysteresis
6654                     	xdef	_pid_out
6655                     	xdef	_curr_dur
6656  0006               _setpoint:
6657  0006 0000          	ds.b	2
6658                     	xdef	_setpoint
6659                     	xdef	_sensor2_selected
6660  0008               _key_held_tmr:
6661  0008 00            	ds.b	1
6662                     	xdef	_key_held_tmr
6663  0009               _config_value:
6664  0009 0000          	ds.b	2
6665                     	xdef	_config_value
6666                     	xdef	__buttons
6667                     	xdef	_m_countdown
6668                     	xdef	_config_item
6669                     	xdef	_menu_item
6670                     	xdef	_minutes
6671                     	xdef	_fahrenheit
6672                     	xdef	_pwr_on
6673                     	xdef	_menu_is_idle
6674  000b               _ret_state:
6675  000b 00            	ds.b	1
6676                     	xdef	_ret_state
6677                     	xdef	_menustate
6678                     	xdef	_heating_delay
6679                     	xdef	_cooling_delay
6680  000c               _bot_01:
6681  000c 00            	ds.b	1
6682                     	xdef	_bot_01
6683  000d               _bot_1:
6684  000d 00            	ds.b	1
6685                     	xdef	_bot_1
6686  000e               _bot_10:
6687  000e 00            	ds.b	1
6688                     	xdef	_bot_10
6689  000f               _bot_100:
6690  000f 00            	ds.b	1
6691                     	xdef	_bot_100
6692  0010               _top_01:
6693  0010 00            	ds.b	1
6694                     	xdef	_top_01
6695  0011               _top_1:
6696  0011 00            	ds.b	1
6697                     	xdef	_top_1
6698  0012               _top_10:
6699  0012 00            	ds.b	1
6700                     	xdef	_top_10
6701  0013               _top_100:
6702  0013 00            	ds.b	1
6703                     	xdef	_top_100
6704                     	xdef	_eedata
6705                     	xdef	_led_lookup
6706                     	xdef	_pid_control
6707                     	xdef	_temperature_control
6708                     	xdef	_menu_fsm
6709                     	xdef	_read_buttons
6710                     	xdef	_check_config_value
6711                     	xdef	_range
6712                     	xdef	_update_profile
6713                     	xdef	_value_to_led
6714                     	xdef	_val_to_bcd
6715                     	xdef	_divu10
6716                     	xref	_eeprom_write_config
6717                     	xref	_eeprom_read_config
6718                     	xref	_set_hc164
6719                     	xref.b	c_x
6739                     	xref	c_lgrsh
6740                     	xref	c_lgadd
6741                     	xref	c_itolx
6742                     	end
