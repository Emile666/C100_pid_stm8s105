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
2652  00e6 0005          	dc.w	5
2653  00e8 0003          	dc.w	3
2654  00ea fffe          	dc.w	-2
2655  00ec 0000          	dc.w	0
2656  00ee 0000          	dc.w	0
2657  00f0 0000          	dc.w	0
2658  00f2 0001          	dc.w	1
2659  00f4 0000          	dc.w	0
2660  00f6 0000          	dc.w	0
2661  00f8 0001          	dc.w	1
2662  00fa 0050          	dc.w	80
2663  00fc 0118          	dc.w	280
2664  00fe 0014          	dc.w	20
2665  0100 0000          	dc.w	0
2666  0102 0006          	dc.w	6
2667  0104 0001          	dc.w	1
2668                     	bsct
2669  0000               _menustate:
2670  0000 00            	dc.b	0
2671                     .bit:	section	.data,bit
2672  0000               _menu_is_idle:
2673  0000 01            	dc.b	1
2674  0001               _pwr_on:
2675  0001 01            	dc.b	1
2676  0002               _fahrenheit:
2677  0002 00            	dc.b	0
2678  0003               _minutes:
2679  0003 00            	dc.b	0
2680  0004               _heating_loop:
2681  0004 01            	dc.b	1
2682                     	bsct
2683  0001               _menu_item:
2684  0001 00            	dc.b	0
2685  0002               _config_item:
2686  0002 00            	dc.b	0
2687  0003               _m_countdown:
2688  0003 00            	dc.b	0
2689  0004               __buttons:
2690  0004 00            	dc.b	0
2691  0005               _sensor2_selected:
2692  0005 00            	dc.b	0
2693  0006               _curr_dur:
2694  0006 0000          	dc.w	0
2695  0008               _pid_out:
2696  0008 0000          	dc.w	0
2697                     	switch	.const
2698  000a               _menu:
2699  000a b5            	dc.b	181
2700  000b 76            	dc.b	118
2701  000c 00            	dc.b	0
2702  000d 00            	dc.b	0
2703  000e 71            	dc.b	113
2704  000f b3            	dc.b	179
2705  0010 00            	dc.b	0
2706  0011 02            	dc.b	2
2707  0012 f0            	dc.b	240
2708  0013 d0            	dc.b	208
2709  0014 00            	dc.b	0
2710  0015 01            	dc.b	1
2711  0016 f0            	dc.b	240
2712  0017 d0            	dc.b	208
2713  0018 d6            	dc.b	214
2714  0019 01            	dc.b	1
2715  001a b5            	dc.b	181
2716  001b 77            	dc.b	119
2717  001c 00            	dc.b	0
2718  001d 04            	dc.b	4
2719  001e b5            	dc.b	181
2720  001f f0            	dc.b	240
2721  0020 00            	dc.b	0
2722  0021 05            	dc.b	5
2723  0022 d3            	dc.b	211
2724  0023 71            	dc.b	113
2725  0024 00            	dc.b	0
2726  0025 08            	dc.b	8
2727  0026 50            	dc.b	80
2728  0027 76            	dc.b	118
2729  0028 00            	dc.b	0
2730  0029 09            	dc.b	9
2731  002a e4            	dc.b	228
2732  002b 74            	dc.b	116
2733  002c 00            	dc.b	0
2734  002d 09            	dc.b	9
2735  002e 77            	dc.b	119
2736  002f f0            	dc.b	240
2737  0030 00            	dc.b	0
2738  0031 09            	dc.b	9
2739  0032 73            	dc.b	115
2740  0033 50            	dc.b	80
2741  0034 b5            	dc.b	181
2742  0035 09            	dc.b	9
2743  0036 73            	dc.b	115
2744  0037 d0            	dc.b	208
2745  0038 00            	dc.b	0
2746  0039 0a            	dc.b	10
2747  003a f0            	dc.b	240
2748  003b 03            	dc.b	3
2749  003c 00            	dc.b	0
2750  003d 0a            	dc.b	10
2751  003e f0            	dc.b	240
2752  003f d3            	dc.b	211
2753  0040 00            	dc.b	0
2754  0041 0a            	dc.b	10
2755  0042 f0            	dc.b	240
2756  0043 b5            	dc.b	181
2757  0044 00            	dc.b	0
2758  0045 0a            	dc.b	10
2759  0046 50            	dc.b	80
2760  0047 c1            	dc.b	193
2761  0048 51            	dc.b	81
2762  0049 07            	dc.b	7
2820                     ; 96 uint16_t divu10(uint16_t n) 
2820                     ; 97 {
2822                     	switch	.text
2823  0000               _divu10:
2825  0000 89            	pushw	x
2826  0001 5208          	subw	sp,#8
2827       00000008      OFST:	set	8
2830                     ; 100   q = (n >> 1) + (n >> 2);       // 1/2 + 1/4 = 3/4
2832  0003 54            	srlw	x
2833  0004 54            	srlw	x
2834  0005 1f03          	ldw	(OFST-5,sp),x
2836  0007 1e09          	ldw	x,(OFST+1,sp)
2837  0009 54            	srlw	x
2838  000a 72fb03        	addw	x,(OFST-5,sp)
2839  000d 1f07          	ldw	(OFST-1,sp),x
2841                     ; 101   q = q + (q >> 4);              // 3/4 + 3/64 = 51/64
2843  000f 1e07          	ldw	x,(OFST-1,sp)
2844  0011 54            	srlw	x
2845  0012 54            	srlw	x
2846  0013 54            	srlw	x
2847  0014 54            	srlw	x
2848  0015 72fb07        	addw	x,(OFST-1,sp)
2849  0018 1f07          	ldw	(OFST-1,sp),x
2851                     ; 102   q = q + (q >> 8);              // 51/64 + 51/(16384) = 13107/16384
2853  001a 1e07          	ldw	x,(OFST-1,sp)
2854  001c 4f            	clr	a
2855  001d 01            	rrwa	x,a
2856  001e 72fb07        	addw	x,(OFST-1,sp)
2857  0021 1f07          	ldw	(OFST-1,sp),x
2859                     ; 103   q = q >> 3;                    // 13107 / 131072
2861  0023 a603          	ld	a,#3
2862  0025               L6:
2863  0025 0407          	srl	(OFST-1,sp)
2864  0027 0608          	rrc	(OFST+0,sp)
2865  0029 4a            	dec	a
2866  002a 26f9          	jrne	L6
2868                     ; 104   r = n - ((q << 3) + (q << 1)); // 1 - (13107/16384 + 13107/65536) = 1/65536
2870  002c 1e07          	ldw	x,(OFST-1,sp)
2871  002e 58            	sllw	x
2872  002f 1f03          	ldw	(OFST-5,sp),x
2874  0031 1e07          	ldw	x,(OFST-1,sp)
2875  0033 58            	sllw	x
2876  0034 58            	sllw	x
2877  0035 58            	sllw	x
2878  0036 72fb03        	addw	x,(OFST-5,sp)
2879  0039 1f01          	ldw	(OFST-7,sp),x
2881  003b 1e09          	ldw	x,(OFST+1,sp)
2882  003d 72f001        	subw	x,(OFST-7,sp)
2883  0040 1f05          	ldw	(OFST-3,sp),x
2885                     ; 105   return q + ((r + 6) >> 4);     // 13107/131072 + 1/1048576 = 104857 / 1048576  
2887  0042 1e05          	ldw	x,(OFST-3,sp)
2888  0044 1c0006        	addw	x,#6
2889  0047 54            	srlw	x
2890  0048 54            	srlw	x
2891  0049 54            	srlw	x
2892  004a 54            	srlw	x
2893  004b 72fb07        	addw	x,(OFST-1,sp)
2896  004e 5b0a          	addw	sp,#10
2897  0050 81            	ret
2937                     ; 117 void prx_to_led(uint8_t run_mode)
2937                     ; 118 {
2938                     	switch	.text
2939  0051               _prx_to_led:
2943                     ; 119     bot_100  = LED_OFF;
2945  0051 3f0d          	clr	_bot_100
2946                     ; 120     if (run_mode < THERMOSTAT_MODE)
2948  0053 a106          	cp	a,#6
2949  0055 2411          	jruge	L5761
2950                     ; 122         bot_10 = LED_P; 
2952  0057 3576000c      	mov	_bot_10,#118
2953                     ; 123         bot_1  = LED_r;
2955  005b 3550000b      	mov	_bot_1,#80
2956                     ; 124         bot_01 = led_lookup[run_mode];
2958  005f 5f            	clrw	x
2959  0060 97            	ld	xl,a
2960  0061 d60000        	ld	a,(_led_lookup,x)
2961  0064 b70a          	ld	_bot_01,a
2963  0066 201e          	jra	L7761
2964  0068               L5761:
2965                     ; 126     else if (ts == 0) 
2967  0068 3d00          	tnz	_ts
2968  006a 260e          	jrne	L1071
2969                     ; 128         bot_100 = bot_01 = LED_OFF;
2971  006c 3f0a          	clr	_bot_01
2972  006e 3f0d          	clr	_bot_100
2973                     ; 129         bot_10  = LED_t;
2975  0070 35f0000c      	mov	_bot_10,#240
2976                     ; 130         bot_1   = LED_h;
2978  0074 3571000b      	mov	_bot_1,#113
2980  0078 200c          	jra	L7761
2981  007a               L1071:
2982                     ; 134         bot_10 = LED_P; 
2984  007a 3576000c      	mov	_bot_10,#118
2985                     ; 135         bot_1  = LED_I;
2987  007e 3503000b      	mov	_bot_1,#3
2988                     ; 136         bot_01 = LED_d;
2990  0082 35d3000a      	mov	_bot_01,#211
2991  0086               L7761:
2992                     ; 138 } // prx_to_led()
2995  0086 81            	ret
3068                     ; 149 void val_to_bcd(int16_t *value, uint16_t digit, uint8_t *led, uint8_t lz)
3068                     ; 150 {
3069                     	switch	.text
3070  0087               _val_to_bcd:
3072  0087 89            	pushw	x
3073  0088 88            	push	a
3074       00000001      OFST:	set	1
3077                     ; 153 	if (*value >= digit)
3079  0089 9093          	ldw	y,x
3080  008b 51            	exgw	x,y
3081  008c fe            	ldw	x,(x)
3082  008d 1306          	cpw	x,(OFST+5,sp)
3083  008f 51            	exgw	x,y
3084  0090 2529          	jrult	L3471
3085                     ; 155 	   for(i = 0; *value >= digit; i++)
3087  0092 0f01          	clr	(OFST+0,sp)
3090  0094 200c          	jra	L1571
3091  0096               L5471:
3092                     ; 157 	      *value -= digit;
3094  0096 1e02          	ldw	x,(OFST+1,sp)
3095  0098 9093          	ldw	y,x
3096  009a fe            	ldw	x,(x)
3097  009b 72f006        	subw	x,(OFST+5,sp)
3098  009e 90ff          	ldw	(y),x
3099                     ; 155 	   for(i = 0; *value >= digit; i++)
3101  00a0 0c01          	inc	(OFST+0,sp)
3103  00a2               L1571:
3106  00a2 1e02          	ldw	x,(OFST+1,sp)
3107  00a4 9093          	ldw	y,x
3108  00a6 51            	exgw	x,y
3109  00a7 fe            	ldw	x,(x)
3110  00a8 1306          	cpw	x,(OFST+5,sp)
3111  00aa 51            	exgw	x,y
3112  00ab 24e9          	jruge	L5471
3113                     ; 159 	   *led = led_lookup[i & 0x0f];
3115  00ad 7b01          	ld	a,(OFST+0,sp)
3116  00af a40f          	and	a,#15
3117  00b1 5f            	clrw	x
3118  00b2 97            	ld	xl,a
3119  00b3 d60000        	ld	a,(_led_lookup,x)
3120  00b6 1e08          	ldw	x,(OFST+7,sp)
3121  00b8 f7            	ld	(x),a
3123  00b9 200e          	jra	L5571
3124  00bb               L3471:
3125                     ; 161     else if (lz)
3127  00bb 0d0a          	tnz	(OFST+9,sp)
3128  00bd 2707          	jreq	L7571
3129                     ; 162          *led = LED_0;   // Leading zero
3131  00bf 1e08          	ldw	x,(OFST+7,sp)
3132  00c1 a6e7          	ld	a,#231
3133  00c3 f7            	ld	(x),a
3135  00c4 2003          	jra	L5571
3136  00c6               L7571:
3137                     ; 163     else *led = LED_OFF; // display off
3139  00c6 1e08          	ldw	x,(OFST+7,sp)
3140  00c8 7f            	clr	(x)
3141  00c9               L5571:
3142                     ; 164 } // val_to_bcd()
3145  00c9 5b03          	addw	sp,#3
3146  00cb 81            	ret
3266                     ; 177 void value_to_led(int16_t value, uint8_t decimal, uint8_t row) 
3266                     ; 178 {
3267                     	switch	.text
3268  00cc               _value_to_led:
3270  00cc 89            	pushw	x
3271  00cd 520c          	subw	sp,#12
3272       0000000c      OFST:	set	12
3275                     ; 180     int16_t val = value; // copy of value
3277  00cf 1f0b          	ldw	(OFST-1,sp),x
3279                     ; 184     if (val < 0) 
3281  00d1 9c            	rvf
3282  00d2 1e0b          	ldw	x,(OFST-1,sp)
3283  00d4 2e16          	jrsge	L1402
3284                     ; 186        val  = -val;
3286  00d6 1e0b          	ldw	x,(OFST-1,sp)
3287  00d8 50            	negw	x
3288  00d9 1f0b          	ldw	(OFST-1,sp),x
3290                     ; 187        if (val >= 1000) 
3292  00db 9c            	rvf
3293  00dc 1e0b          	ldw	x,(OFST-1,sp)
3294  00de a303e8        	cpw	x,#1000
3295  00e1 2f09          	jrslt	L1402
3296                     ; 189           val = divu10(val); // loose the decimal
3298  00e3 1e0b          	ldw	x,(OFST-1,sp)
3299  00e5 cd0000        	call	_divu10
3301  00e8 1f0b          	ldw	(OFST-1,sp),x
3303                     ; 190           decimal = 0;       // no decimal point 
3305  00ea 0f11          	clr	(OFST+5,sp)
3306  00ec               L1402:
3307                     ; 193     val2 = val;
3309  00ec 1e0b          	ldw	x,(OFST-1,sp)
3310  00ee 1f03          	ldw	(OFST-9,sp),x
3312                     ; 195     if (row == ROW_TOP)
3314  00f0 7b12          	ld	a,(OFST+6,sp)
3315  00f2 a102          	cp	a,#2
3316  00f4 2616          	jrne	L5402
3317                     ; 197         p100 = &top_100; p10  = &top_10;
3319  00f6 ae0011        	ldw	x,#_top_100
3320  00f9 1f05          	ldw	(OFST-7,sp),x
3324  00fb ae0010        	ldw	x,#_top_10
3325  00fe 1f07          	ldw	(OFST-5,sp),x
3327                     ; 198         p1   = &top_1;   p01  = &top_01;
3329  0100 ae000f        	ldw	x,#_top_1
3330  0103 1f09          	ldw	(OFST-3,sp),x
3334  0105 ae000e        	ldw	x,#_top_01
3335  0108 1f01          	ldw	(OFST-11,sp),x
3338  010a 2014          	jra	L7402
3339  010c               L5402:
3340                     ; 202         p100 = &bot_100; p10  = &bot_10;
3342  010c ae000d        	ldw	x,#_bot_100
3343  010f 1f05          	ldw	(OFST-7,sp),x
3347  0111 ae000c        	ldw	x,#_bot_10
3348  0114 1f07          	ldw	(OFST-5,sp),x
3350                     ; 203         p1   = &bot_1;   p01  = &bot_01;
3352  0116 ae000b        	ldw	x,#_bot_1
3353  0119 1f09          	ldw	(OFST-3,sp),x
3357  011b ae000a        	ldw	x,#_bot_01
3358  011e 1f01          	ldw	(OFST-11,sp),x
3360  0120               L7402:
3361                     ; 207 	val_to_bcd(&val, 1000, p100,0); 
3363  0120 4b00          	push	#0
3364  0122 1e06          	ldw	x,(OFST-6,sp)
3365  0124 89            	pushw	x
3366  0125 ae03e8        	ldw	x,#1000
3367  0128 89            	pushw	x
3368  0129 96            	ldw	x,sp
3369  012a 1c0010        	addw	x,#OFST+4
3370  012d cd0087        	call	_val_to_bcd
3372  0130 5b05          	addw	sp,#5
3373                     ; 208 	val_to_bcd(&val,  100, p10 ,(*p100 != LED_OFF));
3375  0132 1e05          	ldw	x,(OFST-7,sp)
3376  0134 7d            	tnz	(x)
3377  0135 2704          	jreq	L61
3378  0137 a601          	ld	a,#1
3379  0139 2001          	jra	L02
3380  013b               L61:
3381  013b 4f            	clr	a
3382  013c               L02:
3383  013c 88            	push	a
3384  013d 1e08          	ldw	x,(OFST-4,sp)
3385  013f 89            	pushw	x
3386  0140 ae0064        	ldw	x,#100
3387  0143 89            	pushw	x
3388  0144 96            	ldw	x,sp
3389  0145 1c0010        	addw	x,#OFST+4
3390  0148 cd0087        	call	_val_to_bcd
3392  014b 5b05          	addw	sp,#5
3393                     ; 209 	val_to_bcd(&val,   10, p1  ,(*p10  != LED_OFF));
3395  014d 1e07          	ldw	x,(OFST-5,sp)
3396  014f 7d            	tnz	(x)
3397  0150 2704          	jreq	L22
3398  0152 a601          	ld	a,#1
3399  0154 2001          	jra	L42
3400  0156               L22:
3401  0156 4f            	clr	a
3402  0157               L42:
3403  0157 88            	push	a
3404  0158 1e0a          	ldw	x,(OFST-2,sp)
3405  015a 89            	pushw	x
3406  015b ae000a        	ldw	x,#10
3407  015e 89            	pushw	x
3408  015f 96            	ldw	x,sp
3409  0160 1c0010        	addw	x,#OFST+4
3410  0163 cd0087        	call	_val_to_bcd
3412  0166 5b05          	addw	sp,#5
3413                     ; 210 	val_to_bcd(&val,    1, p01 ,1);
3415  0168 4b01          	push	#1
3416  016a 1e02          	ldw	x,(OFST-10,sp)
3417  016c 89            	pushw	x
3418  016d ae0001        	ldw	x,#1
3419  0170 89            	pushw	x
3420  0171 96            	ldw	x,sp
3421  0172 1c0010        	addw	x,#OFST+4
3422  0175 cd0087        	call	_val_to_bcd
3424  0178 5b05          	addw	sp,#5
3425                     ; 212     if (decimal == 1)
3427  017a 7b11          	ld	a,(OFST+5,sp)
3428  017c a101          	cp	a,#1
3429  017e 2610          	jrne	L1502
3430                     ; 214        if (*p1 == LED_OFF) *p1 = LED_0; // add leading zero if needed
3432  0180 1e09          	ldw	x,(OFST-3,sp)
3433  0182 7d            	tnz	(x)
3434  0183 2605          	jrne	L3502
3437  0185 1e09          	ldw	x,(OFST-3,sp)
3438  0187 a6e7          	ld	a,#231
3439  0189 f7            	ld	(x),a
3440  018a               L3502:
3441                     ; 215 	   *p1 |= LED_DP;                   // add decimal point
3443  018a 1e09          	ldw	x,(OFST-3,sp)
3444  018c f6            	ld	a,(x)
3445  018d aa08          	or	a,#8
3446  018f f7            	ld	(x),a
3447  0190               L1502:
3448                     ; 218     if (value < 0)
3450  0190 9c            	rvf
3451  0191 1e0d          	ldw	x,(OFST+1,sp)
3452  0193 2e2f          	jrsge	L5502
3453                     ; 220         if ((val2 < 10) && (decimal == 0)) 
3455  0195 9c            	rvf
3456  0196 1e03          	ldw	x,(OFST-9,sp)
3457  0198 a3000a        	cpw	x,#10
3458  019b 2e0b          	jrsge	L7502
3460  019d 0d11          	tnz	(OFST+5,sp)
3461  019f 2607          	jrne	L7502
3462                     ; 221                               *p1   = LED_MIN;
3464  01a1 1e09          	ldw	x,(OFST-3,sp)
3465  01a3 a610          	ld	a,#16
3466  01a5 f7            	ld	(x),a
3468  01a6 201c          	jra	L5502
3469  01a8               L7502:
3470                     ; 222         else if (val2 < 100)  *p10  = LED_MIN;
3472  01a8 9c            	rvf
3473  01a9 1e03          	ldw	x,(OFST-9,sp)
3474  01ab a30064        	cpw	x,#100
3475  01ae 2e07          	jrsge	L3602
3478  01b0 1e07          	ldw	x,(OFST-5,sp)
3479  01b2 a610          	ld	a,#16
3480  01b4 f7            	ld	(x),a
3482  01b5 200d          	jra	L5502
3483  01b7               L3602:
3484                     ; 223         else if (val2 < 1000) *p100 = LED_MIN;
3486  01b7 9c            	rvf
3487  01b8 1e03          	ldw	x,(OFST-9,sp)
3488  01ba a303e8        	cpw	x,#1000
3489  01bd 2e05          	jrsge	L5502
3492  01bf 1e05          	ldw	x,(OFST-7,sp)
3493  01c1 a610          	ld	a,#16
3494  01c3 f7            	ld	(x),a
3495  01c4               L5502:
3496                     ; 226 } // value_to_led()
3499  01c4 5b0e          	addw	sp,#14
3500  01c6 81            	ret
3613                     ; 237 void update_profile(void)
3613                     ; 238 {
3614                     	switch	.text
3615  01c7               _update_profile:
3617  01c7 520f          	subw	sp,#15
3618       0000000f      OFST:	set	15
3621                     ; 239   uint8_t  profile_no = eeprom_read_config(EEADR_MENU_ITEM(rn));
3623  01c9 a681          	ld	a,#129
3624  01cb cd0000        	call	_eeprom_read_config
3626  01ce 01            	rrwa	x,a
3627  01cf 6b06          	ld	(OFST-9,sp),a
3628  01d1 02            	rlwa	x,a
3630                     ; 250   if (profile_no < THERMOSTAT_MODE) 
3632  01d2 7b06          	ld	a,(OFST-9,sp)
3633  01d4 a106          	cp	a,#6
3634  01d6 2503          	jrult	L23
3635  01d8 cc02f8        	jp	L7412
3636  01db               L23:
3637                     ; 252       curr_step = eeprom_read_config(EEADR_MENU_ITEM(St));
3639  01db a677          	ld	a,#119
3640  01dd cd0000        	call	_eeprom_read_config
3642  01e0 01            	rrwa	x,a
3643  01e1 6b0f          	ld	(OFST+0,sp),a
3644  01e3 02            	rlwa	x,a
3646                     ; 253       if (minutes) // is timing-control in minutes?
3648                     	btst	_minutes
3649  01e9 2409          	jruge	L1512
3650                     ; 254            curr_dur++;
3652  01eb be06          	ldw	x,_curr_dur
3653  01ed 1c0001        	addw	x,#1
3654  01f0 bf06          	ldw	_curr_dur,x
3656  01f2 2008          	jra	L3512
3657  01f4               L1512:
3658                     ; 255       else curr_dur = eeprom_read_config(EEADR_MENU_ITEM(dh)) + 1;
3660  01f4 a678          	ld	a,#120
3661  01f6 cd0000        	call	_eeprom_read_config
3663  01f9 5c            	incw	x
3664  01fa bf06          	ldw	_curr_dur,x
3665  01fc               L3512:
3666                     ; 258       if(curr_step > NO_OF_TT_PAIRS-1) curr_step = NO_OF_TT_PAIRS - 1;
3668  01fc 7b0f          	ld	a,(OFST+0,sp)
3669  01fe a109          	cp	a,#9
3670  0200 2504          	jrult	L5512
3673  0202 a608          	ld	a,#8
3674  0204 6b0f          	ld	(OFST+0,sp),a
3676  0206               L5512:
3677                     ; 260       profile_step_eeaddr  = EEADR_PROFILE_SETPOINT(profile_no, curr_step);
3679  0206 7b0f          	ld	a,(OFST+0,sp)
3680  0208 48            	sll	a
3681  0209 6b01          	ld	(OFST-14,sp),a
3683  020b 7b06          	ld	a,(OFST-9,sp)
3684  020d 97            	ld	xl,a
3685  020e a613          	ld	a,#19
3686  0210 42            	mul	x,a
3687  0211 9f            	ld	a,xl
3688  0212 1b01          	add	a,(OFST-14,sp)
3689  0214 6b06          	ld	(OFST-9,sp),a
3691                     ; 261       profile_step_dur     = eeprom_read_config(profile_step_eeaddr + 1);
3693  0216 7b06          	ld	a,(OFST-9,sp)
3694  0218 4c            	inc	a
3695  0219 cd0000        	call	_eeprom_read_config
3697  021c 1f09          	ldw	(OFST-6,sp),x
3699                     ; 262       profile_next_step_sp = eeprom_read_config(profile_step_eeaddr + 2);
3701  021e 7b06          	ld	a,(OFST-9,sp)
3702  0220 ab02          	add	a,#2
3703  0222 cd0000        	call	_eeprom_read_config
3705  0225 1f04          	ldw	(OFST-11,sp),x
3707                     ; 265       if (curr_dur >= profile_step_dur) 
3709  0227 be06          	ldw	x,_curr_dur
3710  0229 1309          	cpw	x,(OFST-6,sp)
3711  022b 2546          	jrult	L7512
3712                     ; 267         if (minutes) setpoint = profile_next_step_sp;
3714                     	btst	_minutes
3715  0232 2404          	jruge	L1612
3718  0234 1e04          	ldw	x,(OFST-11,sp)
3719  0236 bf02          	ldw	_setpoint,x
3720  0238               L1612:
3721                     ; 268         eeprom_write_config(EEADR_MENU_ITEM(SP), profile_next_step_sp);
3723  0238 1e04          	ldw	x,(OFST-11,sp)
3724  023a 89            	pushw	x
3725  023b a672          	ld	a,#114
3726  023d cd0000        	call	_eeprom_write_config
3728  0240 85            	popw	x
3729                     ; 270         if ((curr_step == NO_OF_TT_PAIRS-1) || eeprom_read_config(profile_step_eeaddr + 3) == 0) 
3731  0241 7b0f          	ld	a,(OFST+0,sp)
3732  0243 a108          	cp	a,#8
3733  0245 270c          	jreq	L5612
3735  0247 7b06          	ld	a,(OFST-9,sp)
3736  0249 ab03          	add	a,#3
3737  024b cd0000        	call	_eeprom_read_config
3739  024e a30000        	cpw	x,#0
3740  0251 260e          	jrne	L3612
3741  0253               L5612:
3742                     ; 272             eeprom_write_config(EEADR_MENU_ITEM(rn), THERMOSTAT_MODE);
3744  0253 ae0006        	ldw	x,#6
3745  0256 89            	pushw	x
3746  0257 a681          	ld	a,#129
3747  0259 cd0000        	call	_eeprom_write_config
3749  025c 85            	popw	x
3750                     ; 273             return; // Fastest way out...
3752  025d acf802f8      	jpf	L03
3753  0261               L3612:
3754                     ; 275         curr_dur = 0; // Reset duration
3756  0261 5f            	clrw	x
3757  0262 bf06          	ldw	_curr_dur,x
3758                     ; 276         curr_step++;  // Update step
3760  0264 0c0f          	inc	(OFST+0,sp)
3762                     ; 277         eeprom_write_config(EEADR_MENU_ITEM(St), curr_step);
3764  0266 7b0f          	ld	a,(OFST+0,sp)
3765  0268 5f            	clrw	x
3766  0269 97            	ld	xl,a
3767  026a 89            	pushw	x
3768  026b a677          	ld	a,#119
3769  026d cd0000        	call	_eeprom_write_config
3771  0270 85            	popw	x
3773  0271 2075          	jra	L7612
3774  0273               L7512:
3775                     ; 279       else if (eeprom_read_config(EEADR_MENU_ITEM(rP))) 
3777  0273 a679          	ld	a,#121
3778  0275 cd0000        	call	_eeprom_read_config
3780  0278 a30000        	cpw	x,#0
3781  027b 276b          	jreq	L7612
3782                     ; 281          profile_step_sp = eeprom_read_config(profile_step_eeaddr);
3784  027d 7b06          	ld	a,(OFST-9,sp)
3785  027f cd0000        	call	_eeprom_read_config
3787  0282 1f02          	ldw	(OFST-13,sp),x
3789                     ; 282          t  = curr_dur << 6;
3791  0284 be06          	ldw	x,_curr_dur
3792  0286 58            	sllw	x
3793  0287 58            	sllw	x
3794  0288 58            	sllw	x
3795  0289 58            	sllw	x
3796  028a 58            	sllw	x
3797  028b 58            	sllw	x
3798  028c 1f07          	ldw	(OFST-8,sp),x
3800                     ; 283          sp = 32;
3802  028e ae0020        	ldw	x,#32
3803  0291 1f0d          	ldw	(OFST-2,sp),x
3804  0293 ae0000        	ldw	x,#0
3805  0296 1f0b          	ldw	(OFST-4,sp),x
3807                     ; 284          for (i = 0; i < 64; i++) 
3809  0298 0f0f          	clr	(OFST+0,sp)
3811  029a               L3712:
3812                     ; 286              if (t >= profile_step_dur) 
3814  029a 1e07          	ldw	x,(OFST-8,sp)
3815  029c 1309          	cpw	x,(OFST-6,sp)
3816  029e 2515          	jrult	L1022
3817                     ; 288                 t  -= profile_step_dur;
3819  02a0 1e07          	ldw	x,(OFST-8,sp)
3820  02a2 72f009        	subw	x,(OFST-6,sp)
3821  02a5 1f07          	ldw	(OFST-8,sp),x
3823                     ; 289                 sp += profile_next_step_sp;
3825  02a7 1e04          	ldw	x,(OFST-11,sp)
3826  02a9 cd0000        	call	c_itolx
3828  02ac 96            	ldw	x,sp
3829  02ad 1c000b        	addw	x,#OFST-4
3830  02b0 cd0000        	call	c_lgadd
3834  02b3 200c          	jra	L3022
3835  02b5               L1022:
3836                     ; 293                 sp += profile_step_sp;
3838  02b5 1e02          	ldw	x,(OFST-13,sp)
3839  02b7 cd0000        	call	c_itolx
3841  02ba 96            	ldw	x,sp
3842  02bb 1c000b        	addw	x,#OFST-4
3843  02be cd0000        	call	c_lgadd
3846  02c1               L3022:
3847                     ; 284          for (i = 0; i < 64; i++) 
3849  02c1 0c0f          	inc	(OFST+0,sp)
3853  02c3 7b0f          	ld	a,(OFST+0,sp)
3854  02c5 a140          	cp	a,#64
3855  02c7 25d1          	jrult	L3712
3856                     ; 296          sp >>= 6;
3858  02c9 96            	ldw	x,sp
3859  02ca 1c000b        	addw	x,#OFST-4
3860  02cd a606          	ld	a,#6
3861  02cf cd0000        	call	c_lgrsh
3864                     ; 298          if (minutes) // is timing-control in minutes?
3866                     	btst	_minutes
3867  02d7 2406          	jruge	L5022
3868                     ; 299               setpoint = sp;
3870  02d9 1e0d          	ldw	x,(OFST-2,sp)
3871  02db bf02          	ldw	_setpoint,x
3873  02dd 2009          	jra	L7612
3874  02df               L5022:
3875                     ; 300          else eeprom_write_config(EEADR_MENU_ITEM(SP), sp);
3877  02df 1e0d          	ldw	x,(OFST-2,sp)
3878  02e1 89            	pushw	x
3879  02e2 a672          	ld	a,#114
3880  02e4 cd0000        	call	_eeprom_write_config
3882  02e7 85            	popw	x
3883  02e8               L7612:
3884                     ; 302       if (!minutes)
3886                     	btst	_minutes
3887  02ed 2509          	jrult	L7412
3888                     ; 304           eeprom_write_config(EEADR_MENU_ITEM(dh), curr_dur);
3890  02ef be06          	ldw	x,_curr_dur
3891  02f1 89            	pushw	x
3892  02f2 a678          	ld	a,#120
3893  02f4 cd0000        	call	_eeprom_write_config
3895  02f7 85            	popw	x
3896  02f8               L7412:
3897                     ; 307 } // update_profile()
3898  02f8               L03:
3901  02f8 5b0f          	addw	sp,#15
3902  02fa 81            	ret
3954                     ; 319 int16_t range(int16_t x, int16_t min, int16_t max)
3954                     ; 320 {
3955                     	switch	.text
3956  02fb               _range:
3958  02fb 89            	pushw	x
3959       00000000      OFST:	set	0
3962                     ; 321     if (x > max) return min;
3964  02fc 9c            	rvf
3965  02fd 1307          	cpw	x,(OFST+7,sp)
3966  02ff 2d04          	jrsle	L1422
3969  0301 1e05          	ldw	x,(OFST+5,sp)
3971  0303 2009          	jra	L63
3972  0305               L1422:
3973                     ; 322     if (x < min) return max;
3975  0305 9c            	rvf
3976  0306 1e01          	ldw	x,(OFST+1,sp)
3977  0308 1305          	cpw	x,(OFST+5,sp)
3978  030a 2e05          	jrsge	L3422
3981  030c 1e07          	ldw	x,(OFST+7,sp)
3983  030e               L63:
3985  030e 5b02          	addw	sp,#2
3986  0310 81            	ret
3987  0311               L3422:
3988                     ; 323     return x;
3990  0311 1e01          	ldw	x,(OFST+1,sp)
3992  0313 20f9          	jra	L63
4065                     ; 333 int16_t check_config_value(int16_t config_value, uint8_t eeadr)
4065                     ; 334 {
4066                     	switch	.text
4067  0315               _check_config_value:
4069  0315 89            	pushw	x
4070  0316 5205          	subw	sp,#5
4071       00000005      OFST:	set	5
4074                     ; 335     int16_t t_min = 0, t_max = 999;
4076  0318 5f            	clrw	x
4077  0319 1f01          	ldw	(OFST-4,sp),x
4081  031b ae03e7        	ldw	x,#999
4082  031e 1f04          	ldw	(OFST-1,sp),x
4084                     ; 338     if (eeadr < EEADR_MENU)
4086  0320 7b0a          	ld	a,(OFST+5,sp)
4087  0322 a172          	cp	a,#114
4088  0324 2431          	jruge	L3032
4090  0326 2006          	jra	L7032
4091  0328               L5032:
4092                     ; 342             eeadr -= PROFILE_SIZE;
4094  0328 7b0a          	ld	a,(OFST+5,sp)
4095  032a a013          	sub	a,#19
4096  032c 6b0a          	ld	(OFST+5,sp),a
4097  032e               L7032:
4098                     ; 340         while (eeadr >= PROFILE_SIZE)
4100  032e 7b0a          	ld	a,(OFST+5,sp)
4101  0330 a113          	cp	a,#19
4102  0332 24f4          	jruge	L5032
4103                     ; 344         if (!(eeadr & 0x1))
4105  0334 7b0a          	ld	a,(OFST+5,sp)
4106  0336 a501          	bcp	a,#1
4107  0338 2703          	jreq	L201
4108  033a cc045a        	jp	L5132
4109  033d               L201:
4110                     ; 346             t_min = (fahrenheit ? TEMP_MIN_F : TEMP_MIN_C);
4112  033d aefe70        	ldw	x,#65136
4113  0340 1f01          	ldw	(OFST-4,sp),x
4115                     ; 347             t_max = (fahrenheit ? TEMP_MAX_F : TEMP_MAX_C);
4117                     	btst	_fahrenheit
4118  0347 2405          	jruge	L24
4119  0349 ae09c4        	ldw	x,#2500
4120  034c 2003          	jra	L44
4121  034e               L24:
4122  034e ae0578        	ldw	x,#1400
4123  0351               L44:
4124  0351 1f04          	ldw	(OFST-1,sp),x
4126  0353 ac5a045a      	jpf	L5132
4127  0357               L3032:
4128                     ; 350             type = menu[eeadr - EEADR_MENU].type;
4130  0357 7b0a          	ld	a,(OFST+5,sp)
4131  0359 97            	ld	xl,a
4132  035a a604          	ld	a,#4
4133  035c 42            	mul	x,a
4134  035d 1d01c8        	subw	x,#456
4135  0360 d6000d        	ld	a,(_menu+3,x)
4136  0363 6b03          	ld	(OFST-2,sp),a
4138                     ; 351         if (type == t_temperature)
4140  0365 0d03          	tnz	(OFST-2,sp)
4141  0367 261a          	jrne	L7132
4142                     ; 353             t_min = (fahrenheit ? TEMP_MIN_F : TEMP_MIN_C);
4144  0369 aefe70        	ldw	x,#65136
4145  036c 1f01          	ldw	(OFST-4,sp),x
4147                     ; 354             t_max = (fahrenheit ? TEMP_MAX_F : TEMP_MAX_C);
4149                     	btst	_fahrenheit
4150  0373 2405          	jruge	L64
4151  0375 ae09c4        	ldw	x,#2500
4152  0378 2003          	jra	L05
4153  037a               L64:
4154  037a ae0578        	ldw	x,#1400
4155  037d               L05:
4156  037d 1f04          	ldw	(OFST-1,sp),x
4159  037f ac5a045a      	jpf	L5132
4160  0383               L7132:
4161                     ; 355         } else if (type == t_tempdiff)
4163  0383 7b03          	ld	a,(OFST-2,sp)
4164  0385 a101          	cp	a,#1
4165  0387 2626          	jrne	L3232
4166                     ; 357             t_min = (fahrenheit ? TEMP_CORR_MIN_F : TEMP_CORR_MIN_C);
4168                     	btst	_fahrenheit
4169  038e 2405          	jruge	L25
4170  0390 aeff9c        	ldw	x,#65436
4171  0393 2003          	jra	L45
4172  0395               L25:
4173  0395 aeffce        	ldw	x,#65486
4174  0398               L45:
4175  0398 1f01          	ldw	(OFST-4,sp),x
4177                     ; 358             t_max = (fahrenheit ? TEMP_CORR_MAX_F : TEMP_CORR_MAX_C);
4179                     	btst	_fahrenheit
4180  039f 2405          	jruge	L65
4181  03a1 ae0064        	ldw	x,#100
4182  03a4 2003          	jra	L06
4183  03a6               L65:
4184  03a6 ae0032        	ldw	x,#50
4185  03a9               L06:
4186  03a9 1f04          	ldw	(OFST-1,sp),x
4189  03ab ac5a045a      	jpf	L5132
4190  03af               L3232:
4191                     ; 359         } else if (type == t_parameter)
4193  03af 7b03          	ld	a,(OFST-2,sp)
4194  03b1 a10a          	cp	a,#10
4195  03b3 2616          	jrne	L7232
4196                     ; 361             t_max = 9999;
4198  03b5 ae270f        	ldw	x,#9999
4199  03b8 1f04          	ldw	(OFST-1,sp),x
4201                     ; 362             if (eeadr == EEADR_MENU_ITEM(Hc)) 
4203  03ba 7b0a          	ld	a,(OFST+5,sp)
4204  03bc a17d          	cp	a,#125
4205  03be 2703          	jreq	L401
4206  03c0 cc045a        	jp	L5132
4207  03c3               L401:
4208                     ; 364                 t_min = -9999; 
4210  03c3 aed8f1        	ldw	x,#55537
4211  03c6 1f01          	ldw	(OFST-4,sp),x
4213  03c8 cc045a        	jra	L5132
4214  03cb               L7232:
4215                     ; 366         } else if (type == t_boolean)
4217  03cb 7b03          	ld	a,(OFST-2,sp)
4218  03cd a109          	cp	a,#9
4219  03cf 2608          	jrne	L5332
4220                     ; 368             t_max = 1;
4222  03d1 ae0001        	ldw	x,#1
4223  03d4 1f04          	ldw	(OFST-1,sp),x
4226  03d6 cc045a        	jra	L5132
4227  03d9               L5332:
4228                     ; 369         } else if (type == t_hyst_1)
4230  03d9 7b03          	ld	a,(OFST-2,sp)
4231  03db a102          	cp	a,#2
4232  03dd 2613          	jrne	L1432
4233                     ; 371             t_max = (fahrenheit ? TEMP_HYST_1_MAX_F : TEMP_HYST_1_MAX_C);
4235                     	btst	_fahrenheit
4236  03e4 2405          	jruge	L26
4237  03e6 ae0064        	ldw	x,#100
4238  03e9 2003          	jra	L46
4239  03eb               L26:
4240  03eb ae0032        	ldw	x,#50
4241  03ee               L46:
4242  03ee 1f04          	ldw	(OFST-1,sp),x
4245  03f0 2068          	jra	L5132
4246  03f2               L1432:
4247                     ; 372         } else if (type == t_hyst_2)
4249  03f2 7b03          	ld	a,(OFST-2,sp)
4250  03f4 a103          	cp	a,#3
4251  03f6 2613          	jrne	L5432
4252                     ; 374             t_max = (fahrenheit ? TEMP_HYST_2_MAX_F : TEMP_HYST_2_MAX_C);
4254                     	btst	_fahrenheit
4255  03fd 2405          	jruge	L66
4256  03ff ae01f4        	ldw	x,#500
4257  0402 2003          	jra	L07
4258  0404               L66:
4259  0404 ae00fa        	ldw	x,#250
4260  0407               L07:
4261  0407 1f04          	ldw	(OFST-1,sp),x
4264  0409 204f          	jra	L5132
4265  040b               L5432:
4266                     ; 375         } else if (type == t_sp_alarm)
4268  040b 7b03          	ld	a,(OFST-2,sp)
4269  040d a104          	cp	a,#4
4270  040f 2624          	jrne	L1532
4271                     ; 377             t_min = (fahrenheit ? SP_ALARM_MIN_F : SP_ALARM_MIN_C);
4273                     	btst	_fahrenheit
4274  0416 2405          	jruge	L27
4275  0418 aefce0        	ldw	x,#64736
4276  041b 2003          	jra	L47
4277  041d               L27:
4278  041d aefe70        	ldw	x,#65136
4279  0420               L47:
4280  0420 1f01          	ldw	(OFST-4,sp),x
4282                     ; 378             t_max = (fahrenheit ? SP_ALARM_MAX_F : SP_ALARM_MAX_C);
4284                     	btst	_fahrenheit
4285  0427 2405          	jruge	L67
4286  0429 ae0320        	ldw	x,#800
4287  042c 2003          	jra	L001
4288  042e               L67:
4289  042e ae0190        	ldw	x,#400
4290  0431               L001:
4291  0431 1f04          	ldw	(OFST-1,sp),x
4294  0433 2025          	jra	L5132
4295  0435               L1532:
4296                     ; 379         } else if(type == t_step)
4298  0435 7b03          	ld	a,(OFST-2,sp)
4299  0437 a105          	cp	a,#5
4300  0439 2607          	jrne	L5532
4301                     ; 381             t_max = NO_OF_TT_PAIRS;
4303  043b ae0009        	ldw	x,#9
4304  043e 1f04          	ldw	(OFST-1,sp),x
4307  0440 2018          	jra	L5132
4308  0442               L5532:
4309                     ; 382         } else if (type == t_delay)
4311  0442 7b03          	ld	a,(OFST-2,sp)
4312  0444 a106          	cp	a,#6
4313  0446 2607          	jrne	L1632
4314                     ; 384             t_max = 60;
4316  0448 ae003c        	ldw	x,#60
4317  044b 1f04          	ldw	(OFST-1,sp),x
4320  044d 200b          	jra	L5132
4321  044f               L1632:
4322                     ; 385         } else if (type == t_runmode)
4324  044f 7b03          	ld	a,(OFST-2,sp)
4325  0451 a107          	cp	a,#7
4326  0453 2605          	jrne	L5132
4327                     ; 387             t_max = NO_OF_PROFILES;
4329  0455 ae0006        	ldw	x,#6
4330  0458 1f04          	ldw	(OFST-1,sp),x
4332  045a               L5132:
4333                     ; 390     return range(config_value, t_min, t_max);
4335  045a 1e04          	ldw	x,(OFST-1,sp)
4336  045c 89            	pushw	x
4337  045d 1e03          	ldw	x,(OFST-2,sp)
4338  045f 89            	pushw	x
4339  0460 1e0a          	ldw	x,(OFST+5,sp)
4340  0462 cd02fb        	call	_range
4342  0465 5b04          	addw	sp,#4
4345  0467 5b07          	addw	sp,#7
4346  0469 81            	ret
4401                     ; 400 void read_buttons(void)
4401                     ; 401 {
4402                     	switch	.text
4403  046a               _read_buttons:
4405  046a 89            	pushw	x
4406       00000002      OFST:	set	2
4409                     ; 404     disable_interrupts();     // Disable interrups while reading buttons
4412  046b 9b            sim
4414                     ; 406     hc164_state = hc164_val;      // save current hc164_val
4417  046c b600          	ld	a,_hc164_val
4418  046e 6b01          	ld	(OFST-1,sp),a
4420                     ; 407     set_hc164(0x00);
4422  0470 4f            	clr	a
4423  0471 cd0000        	call	_set_hc164
4425                     ; 408     porte   = PE_IDR & SEG7_C;    // Save 7-segment C status
4427  0474 c65015        	ld	a,_PE_IDR
4428  0477 a401          	and	a,#1
4429  0479 b700          	ld	_porte,a
4430                     ; 409     portd   = PD_IDR & PORTD_OUT; // Save other 7-segments
4432  047b c65010        	ld	a,_PD_IDR
4433  047e a4fd          	and	a,#253
4434  0480 b701          	ld	_portd,a
4435                     ; 410     PE_ODR |= SEG7_C;             // disable 7-segment display C
4437  0482 72105014      	bset	_PE_ODR,#0
4438                     ; 411     PD_ODR |= PORTD_OUT;          // disable all other 7-segment displays
4440  0486 c6500f        	ld	a,_PD_ODR
4441  0489 aafd          	or	a,#253
4442  048b c7500f        	ld	_PD_ODR,a
4443                     ; 412     for (i = 0x08; i > 0x00; i >>= 1)
4445  048e a608          	ld	a,#8
4446  0490 6b02          	ld	(OFST+0,sp),a
4448  0492               L1142:
4449                     ; 414        _buttons <<= 1;
4451  0492 3804          	sll	__buttons
4452                     ; 415        _buttons  &= 0xFE; // clear bit 0
4454  0494 72110004      	bres	__buttons,#0
4455                     ; 416        set_hc164(i);
4457  0498 7b02          	ld	a,(OFST+0,sp)
4458  049a cd0000        	call	_set_hc164
4460                     ; 417        if (PC_IDR & KEYS) _buttons |= 0x01;
4462  049d c6500b        	ld	a,_PC_IDR
4463  04a0 a502          	bcp	a,#2
4464  04a2 2704          	jreq	L7142
4467  04a4 72100004      	bset	__buttons,#0
4468  04a8               L7142:
4469                     ; 418        set_hc164(0x00);
4471  04a8 4f            	clr	a
4472  04a9 cd0000        	call	_set_hc164
4474                     ; 412     for (i = 0x08; i > 0x00; i >>= 1)
4476  04ac 0402          	srl	(OFST+0,sp)
4480  04ae 0d02          	tnz	(OFST+0,sp)
4481  04b0 26e0          	jrne	L1142
4482                     ; 422     PD_ODR &= ~PORTD_OUT;
4484  04b2 c6500f        	ld	a,_PD_ODR
4485  04b5 a402          	and	a,#2
4486  04b7 c7500f        	ld	_PD_ODR,a
4487                     ; 423     PD_ODR |= portd;        // restore PORTD
4489  04ba c6500f        	ld	a,_PD_ODR
4490  04bd ba01          	or	a,_portd
4491  04bf c7500f        	ld	_PD_ODR,a
4492                     ; 424     PE_ODR &= ~SEG7_C;
4494  04c2 72115014      	bres	_PE_ODR,#0
4495                     ; 425     PE_ODR |= porte;        // restore PORTE
4497  04c6 c65014        	ld	a,_PE_ODR
4498  04c9 ba00          	or	a,_porte
4499  04cb c75014        	ld	_PE_ODR,a
4500                     ; 426     set_hc164(hc164_state); // restore HC164 state
4502  04ce 7b01          	ld	a,(OFST-1,sp)
4503  04d0 cd0000        	call	_set_hc164
4505                     ; 427     enable_interrupts();    // Re-enable Interrupts
4508  04d3 9a            rim
4510                     ; 428 } // read_buttons()
4514  04d4 85            	popw	x
4515  04d5 81            	ret
4606                     	switch	.const
4607  004a               L031:
4608  004a 04ee          	dc.w	L1242
4609  004c 05cf          	dc.w	L5242
4610  004e 0603          	dc.w	L7242
4611  0050 0642          	dc.w	L1342
4612  0052 0678          	dc.w	L3342
4613  0054 0568          	dc.w	L3242
4614  0056 06c1          	dc.w	L5342
4615  0058 06fe          	dc.w	L7342
4616  005a 075b          	dc.w	L1442
4617  005c 07de          	dc.w	L3442
4618  005e 08b2          	dc.w	L7442
4619  0060 090d          	dc.w	L1542
4620                     ; 437 void menu_fsm(void)
4620                     ; 438 {
4621                     	switch	.text
4622  04d6               _menu_fsm:
4624  04d6 89            	pushw	x
4625       00000002      OFST:	set	2
4628                     ; 441    if (m_countdown) m_countdown--; // countdown counter
4630  04d7 3d03          	tnz	_m_countdown
4631  04d9 2702          	jreq	L1152
4634  04db 3a03          	dec	_m_countdown
4635  04dd               L1152:
4636                     ; 443    switch (menustate)
4638  04dd b600          	ld	a,_menustate
4640                     ; 759             break;
4641  04df a10c          	cp	a,#12
4642  04e1 2407          	jruge	L621
4643  04e3 5f            	clrw	x
4644  04e4 97            	ld	xl,a
4645  04e5 58            	sllw	x
4646  04e6 de004a        	ldw	x,(L031,x)
4647  04e9 fc            	jp	(x)
4648  04ea               L621:
4649  04ea ac240a24      	jpf	L5542
4650  04ee               L1242:
4651                     ; 446         case MENU_IDLE:
4651                     ; 447             leds_out &= ~LED_ALM2;
4653  04ee 72150001      	bres	_leds_out+1,#2
4654                     ; 448             pwr_on = eeprom_read_config(EEADR_POWER_ON);
4656  04f2 a682          	ld	a,#130
4657  04f4 cd0000        	call	_eeprom_read_config
4659  04f7 a30000        	cpw	x,#0
4660  04fa 2602          	jrne	L631
4661  04fc 2006          	jp	L211
4662  04fe               L631:
4663  04fe 72100001      	bset	_pwr_on
4664  0502 2004          	jra	L411
4665  0504               L211:
4666  0504 72110001      	bres	_pwr_on
4667  0508               L411:
4668                     ; 449             if (BTN_PRESSED(BTN_LEFT))
4670  0508 b604          	ld	a,__buttons
4671  050a a444          	and	a,#68
4672  050c a104          	cp	a,#4
4673  050e 260c          	jrne	L7152
4674                     ; 451                 m_countdown = TMR_POWERDOWN;
4676  0510 351e0003      	mov	_m_countdown,#30
4677                     ; 452                 menustate   = MENU_POWER_DOWN_WAIT;
4679  0514 35050000      	mov	_menustate,#5
4681  0518 ac260a26      	jpf	L5152
4682  051c               L7152:
4683                     ; 453             } else if (!pwr_on)
4685                     	btst	_pwr_on
4686  0521 2507          	jrult	L3252
4687                     ; 455                 leds_out = 0x00;
4689  0523 5f            	clrw	x
4690  0524 bf00          	ldw	_leds_out,x
4692  0526 ac260a26      	jpf	L5152
4693  052a               L3252:
4694                     ; 456             } else if (_buttons)
4696  052a 3d04          	tnz	__buttons
4697  052c 2603          	jrne	L041
4698  052e cc0a26        	jp	L5152
4699  0531               L041:
4700                     ; 458                 if (BTN_PRESSED(BTN_UP))
4702  0531 b604          	ld	a,__buttons
4703  0533 a411          	and	a,#17
4704  0535 a101          	cp	a,#1
4705  0537 2608          	jrne	L1352
4706                     ; 460                     menustate = MENU_SHOW_VERSION;
4708  0539 35010000      	mov	_menustate,#1
4710  053d ac260a26      	jpf	L5152
4711  0541               L1352:
4712                     ; 461                 } else if (BTN_PRESSED(BTN_DOWN))
4714  0541 b604          	ld	a,__buttons
4715  0543 a422          	and	a,#34
4716  0545 a102          	cp	a,#2
4717  0547 260c          	jrne	L5352
4718                     ; 463                     m_countdown = TMR_SHOW_PROFILE_ITEM;
4720  0549 350f0003      	mov	_m_countdown,#15
4721                     ; 464                     menustate   = MENU_SHOW_STATE_DOWN;
4723  054d 35020000      	mov	_menustate,#2
4725  0551 ac260a26      	jpf	L5152
4726  0555               L5352:
4727                     ; 465                 } else if (BTN_RELEASED(BTN_SET))
4729  0555 b604          	ld	a,__buttons
4730  0557 a488          	and	a,#136
4731  0559 a180          	cp	a,#128
4732  055b 2703          	jreq	L241
4733  055d cc0a26        	jp	L5152
4734  0560               L241:
4735                     ; 467                     menustate = MENU_SHOW_MENU_ITEM;
4737  0560 35060000      	mov	_menustate,#6
4738  0564 ac260a26      	jpf	L5152
4739  0568               L3242:
4740                     ; 472         case MENU_POWER_DOWN_WAIT:
4740                     ; 473             if (m_countdown == 0)
4742  0568 3d03          	tnz	_m_countdown
4743  056a 2648          	jrne	L3452
4744                     ; 475                 pwr_on = eeprom_read_config(EEADR_POWER_ON);
4746  056c a682          	ld	a,#130
4747  056e cd0000        	call	_eeprom_read_config
4749  0571 a30000        	cpw	x,#0
4750  0574 2602          	jrne	L441
4751  0576 2006          	jp	L611
4752  0578               L441:
4753  0578 72100001      	bset	_pwr_on
4754  057c 2004          	jra	L021
4755  057e               L611:
4756  057e 72110001      	bres	_pwr_on
4757  0582               L021:
4758                     ; 476                 pwr_on = !pwr_on;
4760  0582 90100001      	bcpl	_pwr_on
4761                     ; 477                 eeprom_write_config(EEADR_POWER_ON, pwr_on);
4763  0586 5f            	clrw	x
4764                     	btst	_pwr_on
4765  058c 59            	rlcw	x
4766  058d 89            	pushw	x
4767  058e a682          	ld	a,#130
4768  0590 cd0000        	call	_eeprom_write_config
4770  0593 85            	popw	x
4771                     ; 478                 if (pwr_on)
4773                     	btst	_pwr_on
4774  0599 2413          	jruge	L5452
4775                     ; 480                     eeprom_write_config(EEADR_MENU_ITEM(St), 0);
4777  059b 5f            	clrw	x
4778  059c 89            	pushw	x
4779  059d a677          	ld	a,#119
4780  059f cd0000        	call	_eeprom_write_config
4782  05a2 85            	popw	x
4783                     ; 481                     curr_dur = 0;
4785  05a3 5f            	clrw	x
4786  05a4 bf06          	ldw	_curr_dur,x
4787                     ; 482                     eeprom_write_config(EEADR_MENU_ITEM(dh), curr_dur);
4789  05a6 5f            	clrw	x
4790  05a7 89            	pushw	x
4791  05a8 a678          	ld	a,#120
4792  05aa cd0000        	call	_eeprom_write_config
4794  05ad 85            	popw	x
4795  05ae               L5452:
4796                     ; 484                 menustate = MENU_IDLE;
4798  05ae 3f00          	clr	_menustate
4800  05b0 ac260a26      	jpf	L5152
4801  05b4               L3452:
4802                     ; 485             } else if(!BTN_HELD(BTN_LEFT))
4804  05b4 b604          	ld	a,__buttons
4805  05b6 a444          	and	a,#68
4806  05b8 a144          	cp	a,#68
4807  05ba 2603          	jrne	L641
4808  05bc cc0a26        	jp	L5152
4809  05bf               L641:
4810                     ; 487                 if (++sensor2_selected > 1) sensor2_selected = 0;
4812  05bf 3c05          	inc	_sensor2_selected
4813  05c1 b605          	ld	a,_sensor2_selected
4814  05c3 a102          	cp	a,#2
4815  05c5 2502          	jrult	L3552
4818  05c7 3f05          	clr	_sensor2_selected
4819  05c9               L3552:
4820                     ; 488                 menustate = MENU_IDLE;
4822  05c9 3f00          	clr	_menustate
4823  05cb ac260a26      	jpf	L5152
4824  05cf               L5242:
4825                     ; 492         case MENU_SHOW_VERSION: // Show STC1000p version number
4825                     ; 493             top_100 = LED_S; top_10 = LED_u; top_1 = LED_E; top_01 = LED_r;
4827  05cf 35b50011      	mov	_top_100,#181
4830  05d3 35c10010      	mov	_top_10,#193
4833  05d7 35f4000f      	mov	_top_1,#244
4836  05db 3550000e      	mov	_top_01,#80
4837                     ; 494             value_to_led(STC1000P_VERSION,LEDS_INT, ROW_BOT);
4839  05df 4b03          	push	#3
4840  05e1 4b00          	push	#0
4841  05e3 ae012c        	ldw	x,#300
4842  05e6 cd00cc        	call	_value_to_led
4844  05e9 85            	popw	x
4845                     ; 495             bot_10 |= LED_DP; bot_1  |= LED_DP;
4847  05ea 7216000c      	bset	_bot_10,#3
4850  05ee 7216000b      	bset	_bot_1,#3
4851                     ; 496             if(!BTN_HELD(BTN_UP)) menustate = MENU_IDLE;
4853  05f2 b604          	ld	a,__buttons
4854  05f4 a411          	and	a,#17
4855  05f6 a111          	cp	a,#17
4856  05f8 2603          	jrne	L051
4857  05fa cc0a26        	jp	L5152
4858  05fd               L051:
4861  05fd 3f00          	clr	_menustate
4862  05ff ac260a26      	jpf	L5152
4863  0603               L7242:
4864                     ; 499         case MENU_SHOW_STATE_DOWN: // Show Profile-number
4864                     ; 500             run_mode = eeprom_read_config(EEADR_MENU_ITEM(rn));
4866  0603 a681          	ld	a,#129
4867  0605 cd0000        	call	_eeprom_read_config
4869  0608 01            	rrwa	x,a
4870  0609 6b02          	ld	(OFST+0,sp),a
4871  060b 02            	rlwa	x,a
4873                     ; 501             top_100 = LED_OFF; top_10 = LED_r; top_1 = LED_u; top_01 = LED_n;
4875  060c 3f11          	clr	_top_100
4878  060e 35500010      	mov	_top_10,#80
4881  0612 35c1000f      	mov	_top_1,#193
4884  0616 3551000e      	mov	_top_01,#81
4885                     ; 502             prx_to_led(run_mode); // display run_mode on bottom row
4887  061a 7b02          	ld	a,(OFST+0,sp)
4888  061c cd0051        	call	_prx_to_led
4890                     ; 503             if ((run_mode < THERMOSTAT_MODE) && (m_countdown == 0))
4892  061f 7b02          	ld	a,(OFST+0,sp)
4893  0621 a106          	cp	a,#6
4894  0623 240c          	jruge	L7552
4896  0625 3d03          	tnz	_m_countdown
4897  0627 2608          	jrne	L7552
4898                     ; 505                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4900  0629 350f0003      	mov	_m_countdown,#15
4901                     ; 506                 menustate   = MENU_SHOW_STATE_DOWN_2;
4903  062d 35030000      	mov	_menustate,#3
4904  0631               L7552:
4905                     ; 508             if (!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
4907  0631 b604          	ld	a,__buttons
4908  0633 a422          	and	a,#34
4909  0635 a122          	cp	a,#34
4910  0637 2603          	jrne	L251
4911  0639 cc0a26        	jp	L5152
4912  063c               L251:
4915  063c 3f00          	clr	_menustate
4916  063e ac260a26      	jpf	L5152
4917  0642               L1342:
4918                     ; 511         case MENU_SHOW_STATE_DOWN_2: // Show current step number within profile
4918                     ; 512             top_10  = LED_S; top_1 = LED_t; 
4920  0642 35b50010      	mov	_top_10,#181
4923  0646 35f0000f      	mov	_top_1,#240
4924                     ; 513             top_100 = top_01 = LED_OFF;
4926  064a 3f0e          	clr	_top_01
4927  064c 3f11          	clr	_top_100
4928                     ; 514             value_to_led(eeprom_read_config(EEADR_MENU_ITEM(St)),LEDS_INT, ROW_BOT);
4930  064e 4b03          	push	#3
4931  0650 4b00          	push	#0
4932  0652 a677          	ld	a,#119
4933  0654 cd0000        	call	_eeprom_read_config
4935  0657 cd00cc        	call	_value_to_led
4937  065a 85            	popw	x
4938                     ; 515             if (m_countdown == 0)
4940  065b 3d03          	tnz	_m_countdown
4941  065d 2608          	jrne	L3652
4942                     ; 517                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4944  065f 350f0003      	mov	_m_countdown,#15
4945                     ; 518                 menustate   = MENU_SHOW_STATE_DOWN_3;
4947  0663 35040000      	mov	_menustate,#4
4948  0667               L3652:
4949                     ; 520             if(!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
4951  0667 b604          	ld	a,__buttons
4952  0669 a422          	and	a,#34
4953  066b a122          	cp	a,#34
4954  066d 2603          	jrne	L451
4955  066f cc0a26        	jp	L5152
4956  0672               L451:
4959  0672 3f00          	clr	_menustate
4960  0674 ac260a26      	jpf	L5152
4961  0678               L3342:
4962                     ; 523         case MENU_SHOW_STATE_DOWN_3: // Show current duration of running profile
4962                     ; 524             top_10  = LED_d; top_1 = LED_h; 
4964  0678 35d30010      	mov	_top_10,#211
4967  067c 3571000f      	mov	_top_1,#113
4968                     ; 525             top_100 = top_01 = LED_OFF;
4970  0680 3f0e          	clr	_top_01
4971  0682 3f11          	clr	_top_100
4972                     ; 526             if (minutes) // is timing-control in minutes?
4974                     	btst	_minutes
4975  0689 240c          	jruge	L7652
4976                     ; 527                  value_to_led(curr_dur,LEDS_INT, ROW_BOT);
4978  068b 4b03          	push	#3
4979  068d 4b00          	push	#0
4980  068f be06          	ldw	x,_curr_dur
4981  0691 cd00cc        	call	_value_to_led
4983  0694 85            	popw	x
4985  0695 200d          	jra	L1752
4986  0697               L7652:
4987                     ; 528             else value_to_led(eeprom_read_config(EEADR_MENU_ITEM(dh)),LEDS_INT,ROW_BOT);
4989  0697 4b03          	push	#3
4990  0699 4b00          	push	#0
4991  069b a678          	ld	a,#120
4992  069d cd0000        	call	_eeprom_read_config
4994  06a0 cd00cc        	call	_value_to_led
4996  06a3 85            	popw	x
4997  06a4               L1752:
4998                     ; 529             if (m_countdown == 0)
5000  06a4 3d03          	tnz	_m_countdown
5001  06a6 2608          	jrne	L3752
5002                     ; 531                 m_countdown = TMR_SHOW_PROFILE_ITEM;
5004  06a8 350f0003      	mov	_m_countdown,#15
5005                     ; 532                 menustate   = MENU_SHOW_STATE_DOWN;
5007  06ac 35020000      	mov	_menustate,#2
5008  06b0               L3752:
5009                     ; 534             if (!BTN_HELD(BTN_DOWN))
5011  06b0 b604          	ld	a,__buttons
5012  06b2 a422          	and	a,#34
5013  06b4 a122          	cp	a,#34
5014  06b6 2603          	jrne	L651
5015  06b8 cc0a26        	jp	L5152
5016  06bb               L651:
5017                     ; 536                 menustate = MENU_IDLE;
5019  06bb 3f00          	clr	_menustate
5020  06bd ac260a26      	jpf	L5152
5021  06c1               L5342:
5022                     ; 540         case MENU_SHOW_MENU_ITEM: // S-button was pressed
5022                     ; 541             top_100 = LED_S;   top_10  = LED_E; top_1 = LED_t; 
5024  06c1 35b50011      	mov	_top_100,#181
5027  06c5 35f40010      	mov	_top_10,#244
5030  06c9 35f0000f      	mov	_top_1,#240
5031                     ; 542             top_01  = bot_01 = LED_OFF; bot_100 = LED_P;
5033  06cd 3f0a          	clr	_bot_01
5034  06cf 3f0e          	clr	_top_01
5037  06d1 3576000d      	mov	_bot_100,#118
5038                     ; 543             if (menu_item < NO_OF_PROFILES)
5040  06d5 b601          	ld	a,_menu_item
5041  06d7 a106          	cp	a,#6
5042  06d9 240f          	jruge	L7752
5043                     ; 545                 bot_10 = LED_r;
5045  06db 3550000c      	mov	_bot_10,#80
5046                     ; 546                 bot_1  = led_lookup[menu_item];
5048  06df b601          	ld	a,_menu_item
5049  06e1 5f            	clrw	x
5050  06e2 97            	ld	xl,a
5051  06e3 d60000        	ld	a,(_led_lookup,x)
5052  06e6 b70b          	ld	_bot_1,a
5054  06e8 2008          	jra	L1062
5055  06ea               L7752:
5056                     ; 548                 bot_10 = LED_A;
5058  06ea 3577000c      	mov	_bot_10,#119
5059                     ; 549                 bot_1  = LED_r;
5061  06ee 3550000b      	mov	_bot_1,#80
5062  06f2               L1062:
5063                     ; 551             m_countdown = TMR_NO_KEY_TIMEOUT;
5065  06f2 35960003      	mov	_m_countdown,#150
5066                     ; 552             menustate   = MENU_SET_MENU_ITEM;
5068  06f6 35070000      	mov	_menustate,#7
5069                     ; 553         break; // MENU_SHOW_MENU_ITEM
5071  06fa ac260a26      	jpf	L5152
5072  06fe               L7342:
5073                     ; 555         case MENU_SET_MENU_ITEM:
5073                     ; 556             if (m_countdown == 0 || BTN_RELEASED(BTN_LEFT))
5075  06fe 3d03          	tnz	_m_countdown
5076  0700 2708          	jreq	L5062
5078  0702 b604          	ld	a,__buttons
5079  0704 a444          	and	a,#68
5080  0706 a140          	cp	a,#64
5081  0708 2606          	jrne	L3062
5082  070a               L5062:
5083                     ; 558                 menustate = MENU_IDLE;
5085  070a 3f00          	clr	_menustate
5087  070c ac260a26      	jpf	L5152
5088  0710               L3062:
5089                     ; 559             } else if(BTN_RELEASED(BTN_UP))
5091  0710 b604          	ld	a,__buttons
5092  0712 a411          	and	a,#17
5093  0714 a110          	cp	a,#16
5094  0716 2612          	jrne	L1162
5095                     ; 561                 if(++menu_item > MENU_ITEM_NO) menu_item = 0;
5097  0718 3c01          	inc	_menu_item
5098  071a b601          	ld	a,_menu_item
5099  071c a107          	cp	a,#7
5100  071e 2502          	jrult	L3162
5103  0720 3f01          	clr	_menu_item
5104  0722               L3162:
5105                     ; 562                 menustate = MENU_SHOW_MENU_ITEM;
5107  0722 35060000      	mov	_menustate,#6
5109  0726 ac260a26      	jpf	L5152
5110  072a               L1162:
5111                     ; 563             } else if(BTN_RELEASED(BTN_DOWN))
5113  072a b604          	ld	a,__buttons
5114  072c a422          	and	a,#34
5115  072e a120          	cp	a,#32
5116  0730 2614          	jrne	L7162
5117                     ; 565                 if(--menu_item > MENU_ITEM_NO) menu_item = MENU_ITEM_NO;
5119  0732 3a01          	dec	_menu_item
5120  0734 b601          	ld	a,_menu_item
5121  0736 a107          	cp	a,#7
5122  0738 2504          	jrult	L1262
5125  073a 35060001      	mov	_menu_item,#6
5126  073e               L1262:
5127                     ; 566                 menustate = MENU_SHOW_MENU_ITEM;
5129  073e 35060000      	mov	_menustate,#6
5131  0742 ac260a26      	jpf	L5152
5132  0746               L7162:
5133                     ; 567             } else if(BTN_RELEASED(BTN_SET))
5135  0746 b604          	ld	a,__buttons
5136  0748 a488          	and	a,#136
5137  074a a180          	cp	a,#128
5138  074c 2703          	jreq	L061
5139  074e cc0a26        	jp	L5152
5140  0751               L061:
5141                     ; 569                 config_item = 0;
5143  0751 3f02          	clr	_config_item
5144                     ; 570                 menustate   = MENU_SHOW_CONFIG_ITEM;
5146  0753 35080000      	mov	_menustate,#8
5147  0757 ac260a26      	jpf	L5152
5148  075b               L1442:
5149                     ; 574         case MENU_SHOW_CONFIG_ITEM: // S-button is released
5149                     ; 575             if (menu_item < MENU_ITEM_NO)
5151  075b b601          	ld	a,_menu_item
5152  075d a106          	cp	a,#6
5153  075f 242d          	jruge	L7262
5154                     ; 577                 if(config_item & 0x1) 
5156  0761 b602          	ld	a,_config_item
5157  0763 a501          	bcp	a,#1
5158  0765 270a          	jreq	L1362
5159                     ; 579                     top_100 = LED_d; // duration: 2nd value of a profile-step
5161  0767 35d30011      	mov	_top_100,#211
5162                     ; 580                     top_10  = LED_h;
5164  076b 35710010      	mov	_top_10,#113
5166  076f 2008          	jra	L3362
5167  0771               L1362:
5168                     ; 582                     top_100 = LED_S; // setpoint: 1st value of a profile-step
5170  0771 35b50011      	mov	_top_100,#181
5171                     ; 583                     top_10  = LED_P;
5173  0775 35760010      	mov	_top_10,#118
5174  0779               L3362:
5175                     ; 585                 top_1  = led_lookup[menu_item];
5177  0779 b601          	ld	a,_menu_item
5178  077b 5f            	clrw	x
5179  077c 97            	ld	xl,a
5180  077d d60000        	ld	a,(_led_lookup,x)
5181  0780 b70f          	ld	_top_1,a
5182                     ; 586                 top_01 = led_lookup[(config_item >> 1)];
5184  0782 b602          	ld	a,_config_item
5185  0784 44            	srl	a
5186  0785 5f            	clrw	x
5187  0786 97            	ld	xl,a
5188  0787 d60000        	ld	a,(_led_lookup,x)
5189  078a b70e          	ld	_top_01,a
5191  078c 2023          	jra	L5362
5192  078e               L7262:
5193                     ; 589                 top_100 = LED_OFF;
5195  078e 3f11          	clr	_top_100
5196                     ; 590                 top_10  = menu[config_item].led_c_10;
5198  0790 b602          	ld	a,_config_item
5199  0792 97            	ld	xl,a
5200  0793 a604          	ld	a,#4
5201  0795 42            	mul	x,a
5202  0796 d6000a        	ld	a,(_menu,x)
5203  0799 b710          	ld	_top_10,a
5204                     ; 591                 top_1   = menu[config_item].led_c_1;
5206  079b b602          	ld	a,_config_item
5207  079d 97            	ld	xl,a
5208  079e a604          	ld	a,#4
5209  07a0 42            	mul	x,a
5210  07a1 d6000b        	ld	a,(_menu+1,x)
5211  07a4 b70f          	ld	_top_1,a
5212                     ; 592                 top_01  = menu[config_item].led_c_01;
5214  07a6 b602          	ld	a,_config_item
5215  07a8 97            	ld	xl,a
5216  07a9 a604          	ld	a,#4
5217  07ab 42            	mul	x,a
5218  07ac d6000c        	ld	a,(_menu+2,x)
5219  07af b70e          	ld	_top_01,a
5220  07b1               L5362:
5221                     ; 594             adr          = MI_CI_TO_EEADR(menu_item, config_item);
5223  07b1 b601          	ld	a,_menu_item
5224  07b3 97            	ld	xl,a
5225  07b4 a613          	ld	a,#19
5226  07b6 42            	mul	x,a
5227  07b7 9f            	ld	a,xl
5228  07b8 bb02          	add	a,_config_item
5229  07ba 6b01          	ld	(OFST-1,sp),a
5231                     ; 595             config_value = eeprom_read_config(adr);
5233  07bc 7b01          	ld	a,(OFST-1,sp)
5234  07be cd0000        	call	_eeprom_read_config
5236  07c1 bf07          	ldw	_config_value,x
5237                     ; 596             config_value = check_config_value(config_value, adr);
5239  07c3 7b01          	ld	a,(OFST-1,sp)
5240  07c5 88            	push	a
5241  07c6 be07          	ldw	x,_config_value
5242  07c8 cd0315        	call	_check_config_value
5244  07cb 84            	pop	a
5245  07cc bf07          	ldw	_config_value,x
5246                     ; 597             m_countdown  = TMR_NO_KEY_TIMEOUT;
5248  07ce 35960003      	mov	_m_countdown,#150
5249                     ; 598             ret_state    = MENU_SET_CONFIG_ITEM;  // return state
5251  07d2 35090009      	mov	_ret_state,#9
5252                     ; 599             menustate    = MENU_SHOW_CONFIG_VALUE; // display config value
5254  07d6 350a0000      	mov	_menustate,#10
5255                     ; 600             break;
5257  07da ac260a26      	jpf	L5152
5258  07de               L3442:
5259                     ; 602         case MENU_SET_CONFIG_ITEM:
5259                     ; 603             leds_out |= LED_ALM2;
5261  07de 72140001      	bset	_leds_out+1,#2
5262                     ; 604             if (m_countdown == 0)
5264  07e2 3d03          	tnz	_m_countdown
5265  07e4 2606          	jrne	L7362
5266                     ; 606                     menustate = MENU_IDLE;
5268  07e6 3f00          	clr	_menustate
5270  07e8 ac910891      	jpf	L1462
5271  07ec               L7362:
5272                     ; 607             } else if (BTN_RELEASED(BTN_LEFT))
5274  07ec b604          	ld	a,__buttons
5275  07ee a444          	and	a,#68
5276  07f0 a140          	cp	a,#64
5277  07f2 2608          	jrne	L3462
5278                     ; 609                 menustate = MENU_SHOW_MENU_ITEM;
5280  07f4 35060000      	mov	_menustate,#6
5282  07f8 ac910891      	jpf	L1462
5283  07fc               L3462:
5284                     ; 610             } else if (BTN_RELEASED(BTN_UP))
5286  07fc b604          	ld	a,__buttons
5287  07fe a411          	and	a,#17
5288  0800 a110          	cp	a,#16
5289  0802 2626          	jrne	L7462
5290                     ; 612                 config_item++;
5292  0804 3c02          	inc	_config_item
5293                     ; 613                 if (menu_item < MENU_ITEM_NO)
5295  0806 b601          	ld	a,_menu_item
5296  0808 a106          	cp	a,#6
5297  080a 240a          	jruge	L1562
5298                     ; 615                     if (config_item >= PROFILE_SIZE)
5300  080c b602          	ld	a,_config_item
5301  080e a113          	cp	a,#19
5302  0810 250e          	jrult	L5562
5303                     ; 617                         config_item = 0;
5305  0812 3f02          	clr	_config_item
5306  0814 200a          	jra	L5562
5307  0816               L1562:
5308                     ; 620                     if (config_item >= MENU_SIZE)
5310  0816 b602          	ld	a,_config_item
5311  0818 a110          	cp	a,#16
5312  081a 2534          	jrult	L5442
5313                     ; 622                         config_item = 0;
5315  081c 3f02          	clr	_config_item
5316  081e 2030          	jra	L5442
5317  0820               L5562:
5318                     ; 629                 ret_state = MENU_SHOW_CONFIG_ITEM;  // return state
5320  0820 35080009      	mov	_ret_state,#8
5321                     ; 630                 menustate = MENU_SHOW_CONFIG_VALUE; // display config value
5323  0824 350a0000      	mov	_menustate,#10
5325  0828 2067          	jra	L1462
5326  082a               L7462:
5327                     ; 631             } else if (BTN_RELEASED(BTN_DOWN))
5329  082a b604          	ld	a,__buttons
5330  082c a422          	and	a,#34
5331  082e a120          	cp	a,#32
5332  0830 264f          	jrne	L3662
5333                     ; 633                 config_item--;
5335  0832 3a02          	dec	_config_item
5336                     ; 634                 if(menu_item < MENU_ITEM_NO)
5338  0834 b601          	ld	a,_menu_item
5339  0836 a106          	cp	a,#6
5340  0838 240c          	jruge	L5662
5341                     ; 636                     if (config_item >= PROFILE_SIZE)
5343  083a b602          	ld	a,_config_item
5344  083c a113          	cp	a,#19
5345  083e 2537          	jrult	L1762
5346                     ; 638                         config_item = PROFILE_SIZE-1;
5348  0840 35120002      	mov	_config_item,#18
5349  0844 2031          	jra	L1762
5350  0846               L5662:
5351                     ; 641                     if (config_item > MENU_SIZE-1)
5353  0846 b602          	ld	a,_config_item
5354  0848 a110          	cp	a,#16
5355  084a 2504          	jrult	L5442
5356                     ; 643                         config_item = MENU_SIZE-1;
5358  084c 350f0002      	mov	_config_item,#15
5359  0850               L5442:
5360                     ; 645                     chk_skip_menu_item: // label for goto
5360                     ; 646                     if (!minutes && ((uint8_t)eeprom_read_config(EEADR_MENU_ITEM(rn)) >= THERMOSTAT_MODE))
5362                     	btst	_minutes
5363  0855 2520          	jrult	L1762
5365  0857 a681          	ld	a,#129
5366  0859 cd0000        	call	_eeprom_read_config
5368  085c 9f            	ld	a,xl
5369  085d a106          	cp	a,#6
5370  085f 2516          	jrult	L1762
5371                     ; 648                         if (config_item == St)
5373  0861 b602          	ld	a,_config_item
5374  0863 a105          	cp	a,#5
5375  0865 2606          	jrne	L7762
5376                     ; 650                             config_item += 2;
5378  0867 3c02          	inc	_config_item
5379  0869 3c02          	inc	_config_item
5381  086b 200a          	jra	L1762
5382  086d               L7762:
5383                     ; 652                         else if (config_item == dh)
5385  086d b602          	ld	a,_config_item
5386  086f a106          	cp	a,#6
5387  0871 2604          	jrne	L1762
5388                     ; 654                             config_item -= 2;
5390  0873 3a02          	dec	_config_item
5391  0875 3a02          	dec	_config_item
5392  0877               L1762:
5393                     ; 658                 ret_state = MENU_SHOW_CONFIG_ITEM;  // return to this state
5395  0877 35080009      	mov	_ret_state,#8
5396                     ; 659                 menustate = MENU_SHOW_CONFIG_VALUE; // display config value
5398  087b 350a0000      	mov	_menustate,#10
5400  087f 2010          	jra	L1462
5401  0881               L3662:
5402                     ; 660             } else if(BTN_RELEASED(BTN_SET))
5404  0881 b604          	ld	a,__buttons
5405  0883 a488          	and	a,#136
5406  0885 a180          	cp	a,#128
5407  0887 2608          	jrne	L1462
5408                     ; 662                 m_countdown  = TMR_NO_KEY_TIMEOUT;
5410  0889 35960003      	mov	_m_countdown,#150
5411                     ; 663                 menustate    = MENU_SET_CONFIG_VALUE;  // display config value
5413  088d 350b0000      	mov	_menustate,#11
5414  0891               L1462:
5415                     ; 665             adr          = MI_CI_TO_EEADR(menu_item, config_item);
5417  0891 b601          	ld	a,_menu_item
5418  0893 97            	ld	xl,a
5419  0894 a613          	ld	a,#19
5420  0896 42            	mul	x,a
5421  0897 9f            	ld	a,xl
5422  0898 bb02          	add	a,_config_item
5423  089a 6b01          	ld	(OFST-1,sp),a
5425                     ; 666             config_value = eeprom_read_config(adr);
5427  089c 7b01          	ld	a,(OFST-1,sp)
5428  089e cd0000        	call	_eeprom_read_config
5430  08a1 bf07          	ldw	_config_value,x
5431                     ; 667             config_value = check_config_value(config_value, adr);
5433  08a3 7b01          	ld	a,(OFST-1,sp)
5434  08a5 88            	push	a
5435  08a6 be07          	ldw	x,_config_value
5436  08a8 cd0315        	call	_check_config_value
5438  08ab 84            	pop	a
5439  08ac bf07          	ldw	_config_value,x
5440                     ; 668        break; // MENU_SET_CONFIG_ITEM
5442  08ae ac260a26      	jpf	L5152
5443  08b2               L7442:
5444                     ; 670        case MENU_SHOW_CONFIG_VALUE:
5444                     ; 671             if(menu_item < MENU_ITEM_NO)
5446  08b2 b601          	ld	a,_menu_item
5447  08b4 a106          	cp	a,#6
5448  08b6 2416          	jruge	L1172
5449                     ; 673                 value_to_led(config_value, (config_item & 0x1) ? LEDS_INT : LEDS_TEMP, ROW_BOT);
5451  08b8 4b03          	push	#3
5452  08ba b602          	ld	a,_config_item
5453  08bc a501          	bcp	a,#1
5454  08be 2703          	jreq	L221
5455  08c0 4f            	clr	a
5456  08c1 2002          	jra	L421
5457  08c3               L221:
5458  08c3 a601          	ld	a,#1
5459  08c5               L421:
5460  08c5 88            	push	a
5461  08c6 be07          	ldw	x,_config_value
5462  08c8 cd00cc        	call	_value_to_led
5464  08cb 85            	popw	x
5466  08cc 2034          	jra	L3172
5467  08ce               L1172:
5468                     ; 676                 type = menu[config_item].type;
5470  08ce b602          	ld	a,_config_item
5471  08d0 97            	ld	xl,a
5472  08d1 a604          	ld	a,#4
5473  08d3 42            	mul	x,a
5474  08d4 d6000d        	ld	a,(_menu+3,x)
5475  08d7 6b02          	ld	(OFST+0,sp),a
5477                     ; 677                 if(MENU_TYPE_IS_TEMPERATURE(type))
5479  08d9 7b02          	ld	a,(OFST+0,sp)
5480  08db a105          	cp	a,#5
5481  08dd 240c          	jruge	L5172
5482                     ; 679                     value_to_led(config_value,LEDS_TEMP, ROW_BOT);
5484  08df 4b03          	push	#3
5485  08e1 4b01          	push	#1
5486  08e3 be07          	ldw	x,_config_value
5487  08e5 cd00cc        	call	_value_to_led
5489  08e8 85            	popw	x
5491  08e9 2017          	jra	L3172
5492  08eb               L5172:
5493                     ; 680                 } else if (type == t_runmode)
5495  08eb 7b02          	ld	a,(OFST+0,sp)
5496  08ed a107          	cp	a,#7
5497  08ef 2607          	jrne	L1272
5498                     ; 682                     prx_to_led(config_value);
5500  08f1 b608          	ld	a,_config_value+1
5501  08f3 cd0051        	call	_prx_to_led
5504  08f6 200a          	jra	L3172
5505  08f8               L1272:
5506                     ; 684                     value_to_led(config_value,LEDS_INT, ROW_BOT);
5508  08f8 4b03          	push	#3
5509  08fa 4b00          	push	#0
5510  08fc be07          	ldw	x,_config_value
5511  08fe cd00cc        	call	_value_to_led
5513  0901 85            	popw	x
5514  0902               L3172:
5515                     ; 687             m_countdown  = TMR_NO_KEY_TIMEOUT;
5517  0902 35960003      	mov	_m_countdown,#150
5518                     ; 688             menustate    = ret_state; // return to indicated state
5520  0906 450900        	mov	_menustate,_ret_state
5521                     ; 689             break;
5523  0909 ac260a26      	jpf	L5152
5524  090d               L1542:
5525                     ; 691        case MENU_SET_CONFIG_VALUE:
5525                     ; 692             leds_out |= LED_ALM2 | LED_ALM2_BLINK;
5527  090d b601          	ld	a,_leds_out+1
5528  090f aa0c          	or	a,#12
5529  0911 b701          	ld	_leds_out+1,a
5530                     ; 693             adr = MI_CI_TO_EEADR(menu_item, config_item);
5532  0913 b601          	ld	a,_menu_item
5533  0915 97            	ld	xl,a
5534  0916 a613          	ld	a,#19
5535  0918 42            	mul	x,a
5536  0919 9f            	ld	a,xl
5537  091a bb02          	add	a,_config_item
5538  091c 6b01          	ld	(OFST-1,sp),a
5540                     ; 694             if (m_countdown == 0)
5542  091e 3d03          	tnz	_m_countdown
5543  0920 2606          	jrne	L5272
5544                     ; 696                 menustate = MENU_IDLE;
5546  0922 3f00          	clr	_menustate
5548  0924 ac260a26      	jpf	L5152
5549  0928               L5272:
5550                     ; 697             } else if (BTN_RELEASED(BTN_LEFT))
5552  0928 b604          	ld	a,__buttons
5553  092a a444          	and	a,#68
5554  092c a140          	cp	a,#64
5555  092e 2608          	jrne	L1372
5556                     ; 699                 menustate = MENU_SHOW_CONFIG_ITEM;
5558  0930 35080000      	mov	_menustate,#8
5560  0934 ac260a26      	jpf	L5152
5561  0938               L1372:
5562                     ; 700             } else if(BTN_HELD_OR_RELEASED(BTN_UP)) 
5564  0938 b604          	ld	a,__buttons
5565  093a a411          	and	a,#17
5566  093c a5f0          	bcp	a,#240
5567  093e 271d          	jreq	L5372
5568                     ; 702                 config_value++;
5570  0940 be07          	ldw	x,_config_value
5571  0942 1c0001        	addw	x,#1
5572  0945 bf07          	ldw	_config_value,x
5573                     ; 703                 if ((config_value > 1000) || (--key_held_tmr < 0))
5575  0947 9c            	rvf
5576  0948 be07          	ldw	x,_config_value
5577  094a a303e9        	cpw	x,#1001
5578  094d 2e05          	jrsge	L1472
5580  094f 9c            	rvf
5581  0950 3a06          	dec	_key_held_tmr
5582  0952 2e2c          	jrsge	L3542
5583  0954               L1472:
5584                     ; 705                     config_value += 9;
5586  0954 be07          	ldw	x,_config_value
5587  0956 1c0009        	addw	x,#9
5588  0959 bf07          	ldw	_config_value,x
5589  095b 2023          	jra	L3542
5590  095d               L5372:
5591                     ; 709             } else if(BTN_HELD_OR_RELEASED(BTN_DOWN)) 
5593  095d b604          	ld	a,__buttons
5594  095f a422          	and	a,#34
5595  0961 a5f0          	bcp	a,#240
5596  0963 2731          	jreq	L5472
5597                     ; 711                 config_value--;
5599  0965 be07          	ldw	x,_config_value
5600  0967 1d0001        	subw	x,#1
5601  096a bf07          	ldw	_config_value,x
5602                     ; 712                 if ((config_value > 1000) || (--key_held_tmr < 0))
5604  096c 9c            	rvf
5605  096d be07          	ldw	x,_config_value
5606  096f a303e9        	cpw	x,#1001
5607  0972 2e05          	jrsge	L1572
5609  0974 9c            	rvf
5610  0975 3a06          	dec	_key_held_tmr
5611  0977 2e07          	jrsge	L3542
5612  0979               L1572:
5613                     ; 714                     config_value -= 9;
5615  0979 be07          	ldw	x,_config_value
5616  097b 1d0009        	subw	x,#9
5617  097e bf07          	ldw	_config_value,x
5618  0980               L3542:
5619                     ; 716             chk_cfg_acc_label: // label for goto
5619                     ; 717                 config_value = check_config_value(config_value, adr);
5621  0980 7b01          	ld	a,(OFST-1,sp)
5622  0982 88            	push	a
5623  0983 be07          	ldw	x,_config_value
5624  0985 cd0315        	call	_check_config_value
5626  0988 84            	pop	a
5627  0989 bf07          	ldw	_config_value,x
5628                     ; 718                 ret_state    = MENU_SET_CONFIG_VALUE;  // return to this state
5630  098b 350b0009      	mov	_ret_state,#11
5631                     ; 719                 menustate    = MENU_SHOW_CONFIG_VALUE; // show config_value
5633  098f 350a0000      	mov	_menustate,#10
5635  0993 cc0a26        	jra	L5152
5636  0996               L5472:
5637                     ; 720             } else if(BTN_RELEASED(BTN_SET))
5639  0996 b604          	ld	a,__buttons
5640  0998 a488          	and	a,#136
5641  099a a180          	cp	a,#128
5642  099c 2703cc0a1e    	jrne	L5572
5643                     ; 722                 if (menu_item == MENU_ITEM_NO)
5645  09a1 b601          	ld	a,_menu_item
5646  09a3 a106          	cp	a,#6
5647  09a5 2668          	jrne	L7572
5648                     ; 724                     if (config_item == rn)
5650  09a7 b602          	ld	a,_config_item
5651  09a9 a10f          	cp	a,#15
5652  09ab 2662          	jrne	L7572
5653                     ; 726                         eeprom_write_config(EEADR_MENU_ITEM(St), 0);
5655  09ad 5f            	clrw	x
5656  09ae 89            	pushw	x
5657  09af a677          	ld	a,#119
5658  09b1 cd0000        	call	_eeprom_write_config
5660  09b4 85            	popw	x
5661                     ; 727                         if (minutes)
5663                     	btst	_minutes
5664  09ba 2405          	jruge	L3672
5665                     ; 728                              curr_dur = 0;
5667  09bc 5f            	clrw	x
5668  09bd bf06          	ldw	_curr_dur,x
5670  09bf 2008          	jra	L5672
5671  09c1               L3672:
5672                     ; 729                         else eeprom_write_config(EEADR_MENU_ITEM(dh), 0);
5674  09c1 5f            	clrw	x
5675  09c2 89            	pushw	x
5676  09c3 a678          	ld	a,#120
5677  09c5 cd0000        	call	_eeprom_write_config
5679  09c8 85            	popw	x
5680  09c9               L5672:
5681                     ; 730                         if (config_value < THERMOSTAT_MODE)
5683  09c9 9c            	rvf
5684  09ca be07          	ldw	x,_config_value
5685  09cc a30006        	cpw	x,#6
5686  09cf 2e3e          	jrsge	L7572
5687                     ; 732                             eeadr_sp = EEADR_PROFILE_SETPOINT(((uint8_t)config_value), 0);
5689  09d1 b608          	ld	a,_config_value+1
5690  09d3 97            	ld	xl,a
5691  09d4 a613          	ld	a,#19
5692  09d6 42            	mul	x,a
5693  09d7 9f            	ld	a,xl
5694  09d8 6b02          	ld	(OFST+0,sp),a
5696                     ; 734                             if (minutes)
5698                     	btst	_minutes
5699  09df 2412          	jruge	L1772
5700                     ; 736                                 setpoint = eeprom_read_config(eeadr_sp);
5702  09e1 7b02          	ld	a,(OFST+0,sp)
5703  09e3 cd0000        	call	_eeprom_read_config
5705  09e6 bf02          	ldw	_setpoint,x
5706                     ; 737                                 eeprom_write_config(EEADR_MENU_ITEM(SP), setpoint);
5708  09e8 be02          	ldw	x,_setpoint
5709  09ea 89            	pushw	x
5710  09eb a672          	ld	a,#114
5711  09ed cd0000        	call	_eeprom_write_config
5713  09f0 85            	popw	x
5715  09f1 200c          	jra	L3772
5716  09f3               L1772:
5717                     ; 739                                 eeprom_write_config(EEADR_MENU_ITEM(SP), eeprom_read_config(eeadr_sp));
5719  09f3 7b02          	ld	a,(OFST+0,sp)
5720  09f5 cd0000        	call	_eeprom_read_config
5722  09f8 89            	pushw	x
5723  09f9 a672          	ld	a,#114
5724  09fb cd0000        	call	_eeprom_write_config
5726  09fe 85            	popw	x
5727  09ff               L3772:
5728                     ; 742                             if (eeprom_read_config(eeadr_sp+1) == 0)
5730  09ff 7b02          	ld	a,(OFST+0,sp)
5731  0a01 4c            	inc	a
5732  0a02 cd0000        	call	_eeprom_read_config
5734  0a05 a30000        	cpw	x,#0
5735  0a08 2605          	jrne	L7572
5736                     ; 744                                 config_value = THERMOSTAT_MODE;
5738  0a0a ae0006        	ldw	x,#6
5739  0a0d bf07          	ldw	_config_value,x
5740  0a0f               L7572:
5741                     ; 749                 eeprom_write_config(adr, config_value);
5743  0a0f be07          	ldw	x,_config_value
5744  0a11 89            	pushw	x
5745  0a12 7b03          	ld	a,(OFST+1,sp)
5746  0a14 cd0000        	call	_eeprom_write_config
5748  0a17 85            	popw	x
5749                     ; 750                 menustate = MENU_SHOW_CONFIG_ITEM;
5751  0a18 35080000      	mov	_menustate,#8
5753  0a1c 2008          	jra	L5152
5754  0a1e               L5572:
5755                     ; 753                 key_held_tmr = TMR_KEY_ACC; 
5757  0a1e 35140006      	mov	_key_held_tmr,#20
5758  0a22 2002          	jra	L5152
5759  0a24               L5542:
5760                     ; 757        default:
5760                     ; 758             menustate = MENU_IDLE;
5762  0a24 3f00          	clr	_menustate
5763                     ; 759             break;
5765  0a26               L5152:
5766                     ; 761    menu_is_idle = (menustate == MENU_IDLE); // needed for ctrl_task()
5768  0a26 3d00          	tnz	_menustate
5769  0a28 2702          	jreq	L261
5770  0a2a 2006          	jp	L231
5771  0a2c               L261:
5772  0a2c 72100000      	bset	_menu_is_idle
5773  0a30 2004          	jra	L431
5774  0a32               L231:
5775  0a32 72110000      	bres	_menu_is_idle
5776  0a36               L431:
5777                     ; 762 } // button_menu_fsm()
5780  0a36 85            	popw	x
5781  0a37 81            	ret
5951                     ; 769 uint16_t min_to_sec(enum menu_enum x)
5951                     ; 770 {
5952                     	switch	.text
5953  0a38               _min_to_sec:
5955  0a38 89            	pushw	x
5956       00000002      OFST:	set	2
5959                     ; 773     retv = eeprom_read_config(EEADR_MENU_ITEM(x)) << 6; // * 64
5961  0a39 ab72          	add	a,#114
5962  0a3b cd0000        	call	_eeprom_read_config
5964  0a3e 58            	sllw	x
5965  0a3f 58            	sllw	x
5966  0a40 58            	sllw	x
5967  0a41 58            	sllw	x
5968  0a42 58            	sllw	x
5969  0a43 58            	sllw	x
5970  0a44 1f01          	ldw	(OFST-1,sp),x
5972                     ; 774     retv = retv - (retv >> 4); // 64 - 4 = 60
5974  0a46 1e01          	ldw	x,(OFST-1,sp)
5975  0a48 54            	srlw	x
5976  0a49 54            	srlw	x
5977  0a4a 54            	srlw	x
5978  0a4b 54            	srlw	x
5979  0a4c 72f001        	subw	x,(OFST-1,sp)
5980  0a4f 50            	negw	x
5981  0a50 1f01          	ldw	(OFST-1,sp),x
5983                     ; 775     return retv;
5985  0a52 1e01          	ldw	x,(OFST-1,sp)
5988  0a54 5b02          	addw	sp,#2
5989  0a56 81            	ret
6017                     ; 783 void init_temp_delays(void)
6017                     ; 784 {
6018                     	switch	.text
6019  0a57               _init_temp_delays:
6023                     ; 785     if (!minutes) setpoint = eeprom_read_config(EEADR_MENU_ITEM(SP));
6025                     	btst	_minutes
6026  0a5c 2507          	jrult	L1013
6029  0a5e a672          	ld	a,#114
6030  0a60 cd0000        	call	_eeprom_read_config
6032  0a63 bf02          	ldw	_setpoint,x
6033  0a65               L1013:
6034                     ; 786     hysteresis   = eeprom_read_config(EEADR_MENU_ITEM(hy));
6036  0a65 a673          	ld	a,#115
6037  0a67 cd0000        	call	_eeprom_read_config
6039  0a6a bf04          	ldw	_hysteresis,x
6040                     ; 787     heating_loop = (eeprom_read_config(EEADR_MENU_ITEM(Hc)) > 0);
6042  0a6c a67d          	ld	a,#125
6043  0a6e cd0000        	call	_eeprom_read_config
6045  0a71 a30000        	cpw	x,#0
6046  0a74 2602          	jrne	L471
6047  0a76 2006          	jp	L071
6048  0a78               L471:
6049  0a78 72100004      	bset	_heating_loop
6050  0a7c 2004          	jra	L271
6051  0a7e               L071:
6052  0a7e 72110004      	bres	_heating_loop
6053  0a82               L271:
6054                     ; 788 } // init_temp_delays()
6057  0a82 81            	ret
6088                     ; 796 void temperature_control(void)
6088                     ; 797 {
6089                     	switch	.text
6090  0a83               _temperature_control:
6094                     ; 798     init_temp_delays(); // Initialise Heating and Cooling delay
6096  0a83 add2          	call	_init_temp_delays
6098                     ; 801     if (!pwr_on ||
6098                     ; 802        ((pid_out < 0) && (temp_tc_pt <= setpoint)) || 
6098                     ; 803        ((pid_out > 0) && (temp_tc_pt >= setpoint)))
6100                     	btst	_pwr_on
6101  0a8a 2418          	jruge	L5113
6103  0a8c 9c            	rvf
6104  0a8d be08          	ldw	x,_pid_out
6105  0a8f 2e07          	jrsge	L1213
6107  0a91 9c            	rvf
6108  0a92 be00          	ldw	x,_temp_tc_pt
6109  0a94 b302          	cpw	x,_setpoint
6110  0a96 2d0c          	jrsle	L5113
6111  0a98               L1213:
6113  0a98 9c            	rvf
6114  0a99 be08          	ldw	x,_pid_out
6115  0a9b 2d0b          	jrsle	L3113
6117  0a9d 9c            	rvf
6118  0a9e be00          	ldw	x,_temp_tc_pt
6119  0aa0 b302          	cpw	x,_setpoint
6120  0aa2 2f04          	jrslt	L3113
6121  0aa4               L5113:
6122                     ; 805         pid_out = 0; // Disable SSR
6124  0aa4 5f            	clrw	x
6125  0aa5 bf08          	ldw	_pid_out,x
6127  0aa7               L3213:
6128                     ; 814 } // temperature_control()
6131  0aa7 81            	ret
6132  0aa8               L3113:
6133                     ; 807     else if (pid_out == 0) 
6135  0aa8 be08          	ldw	x,_pid_out
6136  0aaa 26fb          	jrne	L3213
6137                     ; 809         if (!heating_loop && (temp_tc_pt > setpoint + hysteresis)) 
6139                     	btst	_heating_loop
6140  0ab1 2510          	jrult	L7213
6142  0ab3 9c            	rvf
6143  0ab4 be02          	ldw	x,_setpoint
6144  0ab6 72bb0004      	addw	x,_hysteresis
6145  0aba b300          	cpw	x,_temp_tc_pt
6146  0abc 2e05          	jrsge	L7213
6147                     ; 810              pid_out = -1000;
6149  0abe aefc18        	ldw	x,#64536
6150  0ac1 bf08          	ldw	_pid_out,x
6151  0ac3               L7213:
6152                     ; 811         if (heating_loop && (temp_tc_pt < setpoint - hysteresis))
6154                     	btst	_heating_loop
6155  0ac8 24dd          	jruge	L3213
6157  0aca 9c            	rvf
6158  0acb be02          	ldw	x,_setpoint
6159  0acd 72b00004      	subw	x,_hysteresis
6160  0ad1 b300          	cpw	x,_temp_tc_pt
6161  0ad3 2dd2          	jrsle	L3213
6162                     ; 812              pid_out = +1000;
6164  0ad5 ae03e8        	ldw	x,#1000
6165  0ad8 bf08          	ldw	_pid_out,x
6166  0ada 20cb          	jra	L3213
6169                     	bsct
6170  000a               L3313_pid_tmr:
6171  000a 00            	dc.b	0
6224                     ; 823 void pid_control(bool init)
6224                     ; 824 {
6225                     	switch	.text
6226  0adc               _pid_control:
6228  0adc 88            	push	a
6229       00000000      OFST:	set	0
6232                     ; 827     init_temp_delays(); // Initialise Heating and Cooling delay
6234  0add cd0a57        	call	_init_temp_delays
6236                     ; 829     if (kc != eeprom_read_config(EEADR_MENU_ITEM(Hc)) ||
6236                     ; 830         ti != eeprom_read_config(EEADR_MENU_ITEM(Ti)) ||
6236                     ; 831         td != eeprom_read_config(EEADR_MENU_ITEM(Td)) || init)
6238  0ae0 a67d          	ld	a,#125
6239  0ae2 cd0000        	call	_eeprom_read_config
6241  0ae5 b300          	cpw	x,_kc
6242  0ae7 2618          	jrne	L1613
6244  0ae9 a67e          	ld	a,#126
6245  0aeb cd0000        	call	_eeprom_read_config
6247  0aee b300          	cpw	x,_ti
6248  0af0 260f          	jrne	L1613
6250  0af2 a67f          	ld	a,#127
6251  0af4 cd0000        	call	_eeprom_read_config
6253  0af7 b300          	cpw	x,_td
6254  0af9 2606          	jrne	L1613
6256  0afb 7b01          	ld	a,(OFST+1,sp)
6257  0afd a501          	bcp	a,#1
6258  0aff 2728          	jreq	L7513
6259  0b01               L1613:
6260                     ; 833        kc = eeprom_read_config(EEADR_MENU_ITEM(Hc));
6262  0b01 a67d          	ld	a,#125
6263  0b03 cd0000        	call	_eeprom_read_config
6265  0b06 bf00          	ldw	_kc,x
6266                     ; 834        ti = eeprom_read_config(EEADR_MENU_ITEM(Ti));
6268  0b08 a67e          	ld	a,#126
6269  0b0a cd0000        	call	_eeprom_read_config
6271  0b0d bf00          	ldw	_ti,x
6272                     ; 835        td = eeprom_read_config(EEADR_MENU_ITEM(Td));
6274  0b0f a67f          	ld	a,#127
6275  0b11 cd0000        	call	_eeprom_read_config
6277  0b14 bf00          	ldw	_td,x
6278                     ; 836        init_pid(kc,ti,td,ts,temp_tc_pt); // Init PID controller
6280  0b16 be00          	ldw	x,_temp_tc_pt
6281  0b18 89            	pushw	x
6282  0b19 3b0000        	push	_ts
6283  0b1c be00          	ldw	x,_td
6284  0b1e 89            	pushw	x
6285  0b1f be00          	ldw	x,_ti
6286  0b21 89            	pushw	x
6287  0b22 be00          	ldw	x,_kc
6288  0b24 cd0000        	call	_init_pid
6290  0b27 5b07          	addw	sp,#7
6291  0b29               L7513:
6292                     ; 839     if (++pid_tmr >= ts) 
6294  0b29 3c0a          	inc	L3313_pid_tmr
6295  0b2b b60a          	ld	a,L3313_pid_tmr
6296  0b2d b100          	cp	a,_ts
6297  0b2f 2510          	jrult	L7613
6298                     ; 841         pid_ctrl(temp_tc_pt,&pid_out,setpoint);
6300  0b31 be02          	ldw	x,_setpoint
6301  0b33 89            	pushw	x
6302  0b34 ae0008        	ldw	x,#_pid_out
6303  0b37 89            	pushw	x
6304  0b38 be00          	ldw	x,_temp_tc_pt
6305  0b3a cd0000        	call	_pid_ctrl
6307  0b3d 5b04          	addw	sp,#4
6308                     ; 842         pid_tmr = 0;
6310  0b3f 3f0a          	clr	L3313_pid_tmr
6311  0b41               L7613:
6312                     ; 844 } // pid_control()
6315  0b41 84            	pop	a
6316  0b42 81            	ret
6655                     	xdef	_init_temp_delays
6656                     	xdef	_min_to_sec
6657                     	xdef	_prx_to_led
6658                     	xdef	_menu
6659                     	xref.b	_leds_out
6660                     	xref.b	_hc164_val
6661                     	xref.b	_ts
6662                     	xref.b	_td
6663                     	xref.b	_ti
6664                     	xref.b	_kc
6665                     	xref.b	_temp_tc_pt
6666                     	switch	.ubsct
6667  0000               _porte:
6668  0000 00            	ds.b	1
6669                     	xdef	_porte
6670  0001               _portd:
6671  0001 00            	ds.b	1
6672                     	xdef	_portd
6673                     	xdef	_pid_out
6674                     	xdef	_curr_dur
6675  0002               _setpoint:
6676  0002 0000          	ds.b	2
6677                     	xdef	_setpoint
6678  0004               _hysteresis:
6679  0004 0000          	ds.b	2
6680                     	xdef	_hysteresis
6681                     	xdef	_sensor2_selected
6682  0006               _key_held_tmr:
6683  0006 00            	ds.b	1
6684                     	xdef	_key_held_tmr
6685  0007               _config_value:
6686  0007 0000          	ds.b	2
6687                     	xdef	_config_value
6688                     	xdef	__buttons
6689                     	xdef	_m_countdown
6690                     	xdef	_config_item
6691                     	xdef	_menu_item
6692                     	xdef	_heating_loop
6693                     	xdef	_minutes
6694                     	xdef	_fahrenheit
6695                     	xdef	_pwr_on
6696                     	xdef	_menu_is_idle
6697  0009               _ret_state:
6698  0009 00            	ds.b	1
6699                     	xdef	_ret_state
6700                     	xdef	_menustate
6701  000a               _bot_01:
6702  000a 00            	ds.b	1
6703                     	xdef	_bot_01
6704  000b               _bot_1:
6705  000b 00            	ds.b	1
6706                     	xdef	_bot_1
6707  000c               _bot_10:
6708  000c 00            	ds.b	1
6709                     	xdef	_bot_10
6710  000d               _bot_100:
6711  000d 00            	ds.b	1
6712                     	xdef	_bot_100
6713  000e               _top_01:
6714  000e 00            	ds.b	1
6715                     	xdef	_top_01
6716  000f               _top_1:
6717  000f 00            	ds.b	1
6718                     	xdef	_top_1
6719  0010               _top_10:
6720  0010 00            	ds.b	1
6721                     	xdef	_top_10
6722  0011               _top_100:
6723  0011 00            	ds.b	1
6724                     	xdef	_top_100
6725                     	xdef	_eedata
6726                     	xdef	_led_lookup
6727                     	xdef	_pid_control
6728                     	xdef	_temperature_control
6729                     	xdef	_menu_fsm
6730                     	xdef	_read_buttons
6731                     	xdef	_check_config_value
6732                     	xdef	_range
6733                     	xdef	_update_profile
6734                     	xdef	_value_to_led
6735                     	xdef	_val_to_bcd
6736                     	xdef	_divu10
6737                     	xref	_pid_ctrl
6738                     	xref	_init_pid
6739                     	xref	_eeprom_write_config
6740                     	xref	_eeprom_read_config
6741                     	xref	_set_hc164
6761                     	xref	c_lgrsh
6762                     	xref	c_lgadd
6763                     	xref	c_itolx
6764                     	end
