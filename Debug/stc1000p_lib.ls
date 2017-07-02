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
2672  0000               _led_e:
2673  0000 00            	dc.b	0
2674  0001               _cooling_delay:
2675  0001 003c          	dc.w	60
2676  0003               _heating_delay:
2677  0003 003c          	dc.w	60
2678  0005               _menustate:
2679  0005 00            	dc.b	0
2680                     .bit:	section	.data,bit
2681  0000               _menu_is_idle:
2682  0000 01            	dc.b	1
2683  0001               _pwr_on:
2684  0001 01            	dc.b	1
2685  0002               _fahrenheit:
2686  0002 00            	dc.b	0
2687  0003               _minutes:
2688  0003 00            	dc.b	0
2689                     	bsct
2690  0006               _menu_item:
2691  0006 00            	dc.b	0
2692  0007               _config_item:
2693  0007 00            	dc.b	0
2694  0008               _m_countdown:
2695  0008 00            	dc.b	0
2696  0009               __buttons:
2697  0009 00            	dc.b	0
2698  000a               _sensor2_selected:
2699  000a 00            	dc.b	0
2700  000b               _curr_dur:
2701  000b 0000          	dc.w	0
2702  000d               _pid_out:
2703  000d 0000          	dc.w	0
2704                     	switch	.const
2705  000a               _menu:
2706  000a b5            	dc.b	181
2707  000b 76            	dc.b	118
2708  000c 00            	dc.b	0
2709  000d 00            	dc.b	0
2710  000e 71            	dc.b	113
2711  000f b3            	dc.b	179
2712  0010 00            	dc.b	0
2713  0011 02            	dc.b	2
2714  0012 71            	dc.b	113
2715  0013 b3            	dc.b	179
2716  0014 d6            	dc.b	214
2717  0015 03            	dc.b	3
2718  0016 f0            	dc.b	240
2719  0017 d0            	dc.b	208
2720  0018 00            	dc.b	0
2721  0019 01            	dc.b	1
2722  001a f0            	dc.b	240
2723  001b d0            	dc.b	208
2724  001c d6            	dc.b	214
2725  001d 01            	dc.b	1
2726  001e b5            	dc.b	181
2727  001f 77            	dc.b	119
2728  0020 00            	dc.b	0
2729  0021 04            	dc.b	4
2730  0022 b5            	dc.b	181
2731  0023 f0            	dc.b	240
2732  0024 00            	dc.b	0
2733  0025 05            	dc.b	5
2734  0026 d3            	dc.b	211
2735  0027 71            	dc.b	113
2736  0028 00            	dc.b	0
2737  0029 08            	dc.b	8
2738  002a d0            	dc.b	208
2739  002b d3            	dc.b	211
2740  002c 00            	dc.b	0
2741  002d 06            	dc.b	6
2742  002e 71            	dc.b	113
2743  002f d3            	dc.b	211
2744  0030 00            	dc.b	0
2745  0031 06            	dc.b	6
2746  0032 50            	dc.b	80
2747  0033 76            	dc.b	118
2748  0034 00            	dc.b	0
2749  0035 09            	dc.b	9
2750  0036 e4            	dc.b	228
2751  0037 74            	dc.b	116
2752  0038 00            	dc.b	0
2753  0039 09            	dc.b	9
2754  003a 76            	dc.b	118
2755  003b f1            	dc.b	241
2756  003c d6            	dc.b	214
2757  003d 09            	dc.b	9
2758  003e 73            	dc.b	115
2759  003f 50            	dc.b	80
2760  0040 b5            	dc.b	181
2761  0041 09            	dc.b	9
2762  0042 73            	dc.b	115
2763  0043 d0            	dc.b	208
2764  0044 00            	dc.b	0
2765  0045 0a            	dc.b	10
2766  0046 f0            	dc.b	240
2767  0047 03            	dc.b	3
2768  0048 00            	dc.b	0
2769  0049 0a            	dc.b	10
2770  004a f0            	dc.b	240
2771  004b d3            	dc.b	211
2772  004c 00            	dc.b	0
2773  004d 0a            	dc.b	10
2774  004e f0            	dc.b	240
2775  004f b5            	dc.b	181
2776  0050 00            	dc.b	0
2777  0051 0a            	dc.b	10
2778  0052 50            	dc.b	80
2779  0053 51            	dc.b	81
2780  0054 00            	dc.b	0
2781  0055 07            	dc.b	7
2839                     ; 99 uint16_t divu10(uint16_t n) 
2839                     ; 100 {
2841                     	switch	.text
2842  0000               _divu10:
2844  0000 89            	pushw	x
2845  0001 5208          	subw	sp,#8
2846       00000008      OFST:	set	8
2849                     ; 103   q = (n >> 1) + (n >> 2);       // 1/2 + 1/4 = 3/4
2851  0003 54            	srlw	x
2852  0004 54            	srlw	x
2853  0005 1f03          	ldw	(OFST-5,sp),x
2855  0007 1e09          	ldw	x,(OFST+1,sp)
2856  0009 54            	srlw	x
2857  000a 72fb03        	addw	x,(OFST-5,sp)
2858  000d 1f07          	ldw	(OFST-1,sp),x
2860                     ; 104   q = q + (q >> 4);              // 3/4 + 3/64 = 51/64
2862  000f 1e07          	ldw	x,(OFST-1,sp)
2863  0011 54            	srlw	x
2864  0012 54            	srlw	x
2865  0013 54            	srlw	x
2866  0014 54            	srlw	x
2867  0015 72fb07        	addw	x,(OFST-1,sp)
2868  0018 1f07          	ldw	(OFST-1,sp),x
2870                     ; 105   q = q + (q >> 8);              // 51/64 + 51/(16384) = 13107/16384
2872  001a 1e07          	ldw	x,(OFST-1,sp)
2873  001c 4f            	clr	a
2874  001d 01            	rrwa	x,a
2875  001e 72fb07        	addw	x,(OFST-1,sp)
2876  0021 1f07          	ldw	(OFST-1,sp),x
2878                     ; 106   q = q >> 3;                    // 13107 / 131072
2880  0023 a603          	ld	a,#3
2881  0025               L6:
2882  0025 0407          	srl	(OFST-1,sp)
2883  0027 0608          	rrc	(OFST+0,sp)
2884  0029 4a            	dec	a
2885  002a 26f9          	jrne	L6
2887                     ; 107   r = n - ((q << 3) + (q << 1)); // 1 - (13107/16384 + 13107/65536) = 1/65536
2889  002c 1e07          	ldw	x,(OFST-1,sp)
2890  002e 58            	sllw	x
2891  002f 1f03          	ldw	(OFST-5,sp),x
2893  0031 1e07          	ldw	x,(OFST-1,sp)
2894  0033 58            	sllw	x
2895  0034 58            	sllw	x
2896  0035 58            	sllw	x
2897  0036 72fb03        	addw	x,(OFST-5,sp)
2898  0039 1f01          	ldw	(OFST-7,sp),x
2900  003b 1e09          	ldw	x,(OFST+1,sp)
2901  003d 72f001        	subw	x,(OFST-7,sp)
2902  0040 1f05          	ldw	(OFST-3,sp),x
2904                     ; 108   return q + ((r + 6) >> 4);     // 13107/131072 + 1/1048576 = 104857 / 1048576  
2906  0042 1e05          	ldw	x,(OFST-3,sp)
2907  0044 1c0006        	addw	x,#6
2908  0047 54            	srlw	x
2909  0048 54            	srlw	x
2910  0049 54            	srlw	x
2911  004a 54            	srlw	x
2912  004b 72fb07        	addw	x,(OFST-1,sp)
2915  004e 5b0a          	addw	sp,#10
2916  0050 81            	ret
2965                     ; 120 void prx_to_led(uint8_t run_mode, uint8_t is_menu)
2965                     ; 121 {
2966                     	switch	.text
2967  0051               _prx_to_led:
2969  0051 89            	pushw	x
2970       00000000      OFST:	set	0
2973                     ; 123     led_e &= ~(LED_NEG | LED_DEGR | LED_CELS | LED_POINT);  
2975  0052 b600          	ld	a,_led_e
2976  0054 a40f          	and	a,#15
2977  0056 b700          	ld	_led_e,a
2978                     ; 124     if(run_mode < NO_OF_PROFILES)
2980  0058 9e            	ld	a,xh
2981  0059 a106          	cp	a,#6
2982  005b 2412          	jruge	L1071
2983                     ; 126 	led_10 = LED_P;
2985  005d 3576000d      	mov	_led_10,#118
2986                     ; 127 	led_1  = LED_r;
2988  0061 3550000c      	mov	_led_1,#80
2989                     ; 128 	led_01 = led_lookup[run_mode];
2991  0065 9e            	ld	a,xh
2992  0066 5f            	clrw	x
2993  0067 97            	ld	xl,a
2994  0068 d60000        	ld	a,(_led_lookup,x)
2995  006b b70b          	ld	_led_01,a
2997  006d 202e          	jra	L3071
2998  006f               L1071:
2999                     ; 130 	if (is_menu)
3001  006f 0d02          	tnz	(OFST+2,sp)
3002  0071 270e          	jreq	L5071
3003                     ; 132 	    led_10 = LED_S;
3005  0073 35b5000d      	mov	_led_10,#181
3006                     ; 133 	    led_1  = LED_E;
3008  0077 35f4000c      	mov	_led_1,#244
3009                     ; 134 	    led_01 = LED_t;
3011  007b 35f0000b      	mov	_led_01,#240
3013  007f 201c          	jra	L3071
3014  0081               L5071:
3015                     ; 135 	} else if (ts == 0) 
3017  0081 3d00          	tnz	_ts
3018  0083 260c          	jrne	L1171
3019                     ; 137 	    led_10 = LED_t; 
3021  0085 35f0000d      	mov	_led_10,#240
3022                     ; 138 	    led_1  = LED_h;
3024  0089 3571000c      	mov	_led_1,#113
3025                     ; 139 	    led_01 = LED_OFF;
3027  008d 3f0b          	clr	_led_01
3029  008f 200c          	jra	L3071
3030  0091               L1171:
3031                     ; 143 	    led_10 = LED_P; 
3033  0091 3576000d      	mov	_led_10,#118
3034                     ; 144 	    led_1  = LED_I;
3036  0095 3503000c      	mov	_led_1,#3
3037                     ; 145 	    led_01 = LED_d;
3039  0099 35d3000b      	mov	_led_01,#211
3040  009d               L3071:
3041                     ; 148 } // prx_to_led()
3044  009d 85            	popw	x
3045  009e 81            	ret
3104                     ; 159 void value_to_led(int value, uint8_t decimal) 
3104                     ; 160 {
3105                     	switch	.text
3106  009f               _value_to_led:
3108  009f 89            	pushw	x
3109  00a0 88            	push	a
3110       00000001      OFST:	set	1
3113                     ; 163 	led_e &= ~(LED_NEG | LED_DEGR | LED_CELS); // clear negative, ° and Celsius symbols
3115  00a1 b600          	ld	a,_led_e
3116  00a3 a41f          	and	a,#31
3117  00a5 b700          	ld	_led_e,a
3118                     ; 164         if (value < 0) 
3120  00a7 9c            	rvf
3121  00a8 a30000        	cpw	x,#0
3122  00ab 2e09          	jrsge	L3471
3123                     ; 166            led_e |= LED_NEG;
3125  00ad 721e0000      	bset	_led_e,#7
3126                     ; 167 	   value  = -value;
3128  00b1 1e02          	ldw	x,(OFST+1,sp)
3129  00b3 50            	negw	x
3130  00b4 1f02          	ldw	(OFST+1,sp),x
3131  00b6               L3471:
3132                     ; 170         if(decimal == 1)
3134  00b6 7b06          	ld	a,(OFST+5,sp)
3135  00b8 a101          	cp	a,#1
3136  00ba 260f          	jrne	L5471
3137                     ; 172 	   led_e |= LED_DEGR;
3139  00bc 721c0000      	bset	_led_e,#6
3140                     ; 173            if (!fahrenheit) led_e |= LED_CELS; // Celsius symbol
3142                     	btst	_fahrenheit
3143  00c5 2504          	jrult	L5471
3146  00c7 721a0000      	bset	_led_e,#5
3147  00cb               L5471:
3148                     ; 177 	if (value >= 1000) 
3150  00cb 9c            	rvf
3151  00cc 1e02          	ldw	x,(OFST+1,sp)
3152  00ce a303e8        	cpw	x,#1000
3153  00d1 2f09          	jrslt	L1571
3154                     ; 179 	   value   = divu10((uint16_t) value);
3156  00d3 1e02          	ldw	x,(OFST+1,sp)
3157  00d5 cd0000        	call	_divu10
3159  00d8 1f02          	ldw	(OFST+1,sp),x
3160                     ; 180 	   decimal = 0;
3162  00da 0f06          	clr	(OFST+5,sp)
3163  00dc               L1571:
3164                     ; 184 	if(value >= 100)
3166  00dc 9c            	rvf
3167  00dd 1e02          	ldw	x,(OFST+1,sp)
3168  00df a30064        	cpw	x,#100
3169  00e2 2f22          	jrslt	L3571
3170                     ; 186 	   for(i = 0; value >= 100; i++)
3172  00e4 0f01          	clr	(OFST+0,sp)
3175  00e6 2009          	jra	L1671
3176  00e8               L5571:
3177                     ; 188 	      value -= 100;
3179  00e8 1e02          	ldw	x,(OFST+1,sp)
3180  00ea 1d0064        	subw	x,#100
3181  00ed 1f02          	ldw	(OFST+1,sp),x
3182                     ; 186 	   for(i = 0; value >= 100; i++)
3184  00ef 0c01          	inc	(OFST+0,sp)
3186  00f1               L1671:
3189  00f1 9c            	rvf
3190  00f2 1e02          	ldw	x,(OFST+1,sp)
3191  00f4 a30064        	cpw	x,#100
3192  00f7 2eef          	jrsge	L5571
3193                     ; 190 	   led_10 = led_lookup[i & 0x0f];
3195  00f9 7b01          	ld	a,(OFST+0,sp)
3196  00fb a40f          	and	a,#15
3197  00fd 5f            	clrw	x
3198  00fe 97            	ld	xl,a
3199  00ff d60000        	ld	a,(_led_lookup,x)
3200  0102 b70d          	ld	_led_10,a
3202  0104 2002          	jra	L5671
3203  0106               L3571:
3204                     ; 192 	   led_10 = LED_OFF; // Turn off led if zero (loose leading zeros)
3206  0106 3f0d          	clr	_led_10
3207  0108               L5671:
3208                     ; 194 	if (value >= 10 || decimal || led_10 != LED_OFF)
3210  0108 9c            	rvf
3211  0109 1e02          	ldw	x,(OFST+1,sp)
3212  010b a3000a        	cpw	x,#10
3213  010e 2e08          	jrsge	L1771
3215  0110 0d06          	tnz	(OFST+5,sp)
3216  0112 2604          	jrne	L1771
3218  0114 3d0d          	tnz	_led_10
3219  0116 2728          	jreq	L7671
3220  0118               L1771:
3221                     ; 196 	   for(i = 0; value >= 10; i++)
3223  0118 0f01          	clr	(OFST+0,sp)
3226  011a 2009          	jra	L1002
3227  011c               L5771:
3228                     ; 198 	      value -= 10;
3230  011c 1e02          	ldw	x,(OFST+1,sp)
3231  011e 1d000a        	subw	x,#10
3232  0121 1f02          	ldw	(OFST+1,sp),x
3233                     ; 196 	   for(i = 0; value >= 10; i++)
3235  0123 0c01          	inc	(OFST+0,sp)
3237  0125               L1002:
3240  0125 9c            	rvf
3241  0126 1e02          	ldw	x,(OFST+1,sp)
3242  0128 a3000a        	cpw	x,#10
3243  012b 2eef          	jrsge	L5771
3244                     ; 200 	   led_1 = led_lookup[i];
3246  012d 7b01          	ld	a,(OFST+0,sp)
3247  012f 5f            	clrw	x
3248  0130 97            	ld	xl,a
3249  0131 d60000        	ld	a,(_led_lookup,x)
3250  0134 b70c          	ld	_led_1,a
3251                     ; 201 	   if (decimal)
3253  0136 0d06          	tnz	(OFST+5,sp)
3254  0138 2708          	jreq	L7002
3255                     ; 203 	      led_1 |= LED_DECIMAL;
3257  013a 7216000c      	bset	_led_1,#3
3258  013e 2002          	jra	L7002
3259  0140               L7671:
3260                     ; 206 	   led_1 = LED_OFF; // Turn off led if zero (loose leading zeros)
3262  0140 3f0c          	clr	_led_1
3263  0142               L7002:
3264                     ; 208 	led_01 = led_lookup[(uint8_t)value];
3266  0142 7b03          	ld	a,(OFST+2,sp)
3267  0144 5f            	clrw	x
3268  0145 97            	ld	xl,a
3269  0146 d60000        	ld	a,(_led_lookup,x)
3270  0149 b70b          	ld	_led_01,a
3271                     ; 209 } // value_to_led()
3274  014b 5b03          	addw	sp,#3
3275  014d 81            	ret
3388                     ; 220 void update_profile(void)
3388                     ; 221 {
3389                     	switch	.text
3390  014e               _update_profile:
3392  014e 520f          	subw	sp,#15
3393       0000000f      OFST:	set	15
3396                     ; 222   uint8_t  profile_no = eeprom_read_config(EEADR_MENU_ITEM(rn));
3398  0150 a684          	ld	a,#132
3399  0152 cd0000        	call	_eeprom_read_config
3401  0155 01            	rrwa	x,a
3402  0156 6b06          	ld	(OFST-9,sp),a
3403  0158 02            	rlwa	x,a
3405                     ; 233   if (profile_no < THERMOSTAT_MODE) 
3407  0159 7b06          	ld	a,(OFST-9,sp)
3408  015b a106          	cp	a,#6
3409  015d 2503          	jrult	L02
3410  015f cc027f        	jp	L7602
3411  0162               L02:
3412                     ; 235       curr_step = eeprom_read_config(EEADR_MENU_ITEM(St));
3414  0162 a678          	ld	a,#120
3415  0164 cd0000        	call	_eeprom_read_config
3417  0167 01            	rrwa	x,a
3418  0168 6b0f          	ld	(OFST+0,sp),a
3419  016a 02            	rlwa	x,a
3421                     ; 236       if (minutes) // is timing-control in minutes?
3423                     	btst	_minutes
3424  0170 2409          	jruge	L1702
3425                     ; 237            curr_dur++;
3427  0172 be0b          	ldw	x,_curr_dur
3428  0174 1c0001        	addw	x,#1
3429  0177 bf0b          	ldw	_curr_dur,x
3431  0179 2008          	jra	L3702
3432  017b               L1702:
3433                     ; 238       else curr_dur = eeprom_read_config(EEADR_MENU_ITEM(dh)) + 1;
3435  017b a679          	ld	a,#121
3436  017d cd0000        	call	_eeprom_read_config
3438  0180 5c            	incw	x
3439  0181 bf0b          	ldw	_curr_dur,x
3440  0183               L3702:
3441                     ; 241       if(curr_step > NO_OF_TT_PAIRS-1) curr_step = NO_OF_TT_PAIRS - 1;
3443  0183 7b0f          	ld	a,(OFST+0,sp)
3444  0185 a109          	cp	a,#9
3445  0187 2504          	jrult	L5702
3448  0189 a608          	ld	a,#8
3449  018b 6b0f          	ld	(OFST+0,sp),a
3451  018d               L5702:
3452                     ; 243       profile_step_eeaddr  = EEADR_PROFILE_SETPOINT(profile_no, curr_step);
3454  018d 7b0f          	ld	a,(OFST+0,sp)
3455  018f 48            	sll	a
3456  0190 6b01          	ld	(OFST-14,sp),a
3458  0192 7b06          	ld	a,(OFST-9,sp)
3459  0194 97            	ld	xl,a
3460  0195 a613          	ld	a,#19
3461  0197 42            	mul	x,a
3462  0198 9f            	ld	a,xl
3463  0199 1b01          	add	a,(OFST-14,sp)
3464  019b 6b06          	ld	(OFST-9,sp),a
3466                     ; 244       profile_step_dur     = eeprom_read_config(profile_step_eeaddr + 1);
3468  019d 7b06          	ld	a,(OFST-9,sp)
3469  019f 4c            	inc	a
3470  01a0 cd0000        	call	_eeprom_read_config
3472  01a3 1f09          	ldw	(OFST-6,sp),x
3474                     ; 245       profile_next_step_sp = eeprom_read_config(profile_step_eeaddr + 2);
3476  01a5 7b06          	ld	a,(OFST-9,sp)
3477  01a7 ab02          	add	a,#2
3478  01a9 cd0000        	call	_eeprom_read_config
3480  01ac 1f04          	ldw	(OFST-11,sp),x
3482                     ; 248       if (curr_dur >= profile_step_dur) 
3484  01ae be0b          	ldw	x,_curr_dur
3485  01b0 1309          	cpw	x,(OFST-6,sp)
3486  01b2 2546          	jrult	L7702
3487                     ; 250 	  if (minutes) setpoint = profile_next_step_sp;
3489                     	btst	_minutes
3490  01b9 2404          	jruge	L1012
3493  01bb 1e04          	ldw	x,(OFST-11,sp)
3494  01bd bf06          	ldw	_setpoint,x
3495  01bf               L1012:
3496                     ; 251 	  eeprom_write_config(EEADR_MENU_ITEM(SP), profile_next_step_sp);
3498  01bf 1e04          	ldw	x,(OFST-11,sp)
3499  01c1 89            	pushw	x
3500  01c2 a672          	ld	a,#114
3501  01c4 cd0000        	call	_eeprom_write_config
3503  01c7 85            	popw	x
3504                     ; 253 	  if ((curr_step == NO_OF_TT_PAIRS-1) || eeprom_read_config(profile_step_eeaddr + 3) == 0) 
3506  01c8 7b0f          	ld	a,(OFST+0,sp)
3507  01ca a108          	cp	a,#8
3508  01cc 270c          	jreq	L5012
3510  01ce 7b06          	ld	a,(OFST-9,sp)
3511  01d0 ab03          	add	a,#3
3512  01d2 cd0000        	call	_eeprom_read_config
3514  01d5 a30000        	cpw	x,#0
3515  01d8 260e          	jrne	L3012
3516  01da               L5012:
3517                     ; 255               eeprom_write_config(EEADR_MENU_ITEM(rn), THERMOSTAT_MODE);
3519  01da ae0006        	ldw	x,#6
3520  01dd 89            	pushw	x
3521  01de a684          	ld	a,#132
3522  01e0 cd0000        	call	_eeprom_write_config
3524  01e3 85            	popw	x
3525                     ; 256               return; // Fastest way out...
3527  01e4 ac7f027f      	jpf	L61
3528  01e8               L3012:
3529                     ; 258           curr_dur = 0; // Reset duration
3531  01e8 5f            	clrw	x
3532  01e9 bf0b          	ldw	_curr_dur,x
3533                     ; 259 	  curr_step++;  // Update step
3535  01eb 0c0f          	inc	(OFST+0,sp)
3537                     ; 260 	  eeprom_write_config(EEADR_MENU_ITEM(St), curr_step);
3539  01ed 7b0f          	ld	a,(OFST+0,sp)
3540  01ef 5f            	clrw	x
3541  01f0 97            	ld	xl,a
3542  01f1 89            	pushw	x
3543  01f2 a678          	ld	a,#120
3544  01f4 cd0000        	call	_eeprom_write_config
3546  01f7 85            	popw	x
3548  01f8 2075          	jra	L7012
3549  01fa               L7702:
3550                     ; 262       else if (eeprom_read_config(EEADR_MENU_ITEM(rP))) 
3552  01fa a67c          	ld	a,#124
3553  01fc cd0000        	call	_eeprom_read_config
3555  01ff a30000        	cpw	x,#0
3556  0202 276b          	jreq	L7012
3557                     ; 264          profile_step_sp = eeprom_read_config(profile_step_eeaddr);
3559  0204 7b06          	ld	a,(OFST-9,sp)
3560  0206 cd0000        	call	_eeprom_read_config
3562  0209 1f02          	ldw	(OFST-13,sp),x
3564                     ; 265 	 t  = curr_dur << 6;
3566  020b be0b          	ldw	x,_curr_dur
3567  020d 58            	sllw	x
3568  020e 58            	sllw	x
3569  020f 58            	sllw	x
3570  0210 58            	sllw	x
3571  0211 58            	sllw	x
3572  0212 58            	sllw	x
3573  0213 1f07          	ldw	(OFST-8,sp),x
3575                     ; 266 	 sp = 32;
3577  0215 ae0020        	ldw	x,#32
3578  0218 1f0d          	ldw	(OFST-2,sp),x
3579  021a ae0000        	ldw	x,#0
3580  021d 1f0b          	ldw	(OFST-4,sp),x
3582                     ; 267 	 for (i = 0; i < 64; i++) 
3584  021f 0f0f          	clr	(OFST+0,sp)
3586  0221               L3112:
3587                     ; 269 	     if (t >= profile_step_dur) 
3589  0221 1e07          	ldw	x,(OFST-8,sp)
3590  0223 1309          	cpw	x,(OFST-6,sp)
3591  0225 2515          	jrult	L1212
3592                     ; 271 	        t  -= profile_step_dur;
3594  0227 1e07          	ldw	x,(OFST-8,sp)
3595  0229 72f009        	subw	x,(OFST-6,sp)
3596  022c 1f07          	ldw	(OFST-8,sp),x
3598                     ; 272 		sp += profile_next_step_sp;
3600  022e 1e04          	ldw	x,(OFST-11,sp)
3601  0230 cd0000        	call	c_itolx
3603  0233 96            	ldw	x,sp
3604  0234 1c000b        	addw	x,#OFST-4
3605  0237 cd0000        	call	c_lgadd
3609  023a 200c          	jra	L3212
3610  023c               L1212:
3611                     ; 276 		sp += profile_step_sp;
3613  023c 1e02          	ldw	x,(OFST-13,sp)
3614  023e cd0000        	call	c_itolx
3616  0241 96            	ldw	x,sp
3617  0242 1c000b        	addw	x,#OFST-4
3618  0245 cd0000        	call	c_lgadd
3621  0248               L3212:
3622                     ; 267 	 for (i = 0; i < 64; i++) 
3624  0248 0c0f          	inc	(OFST+0,sp)
3628  024a 7b0f          	ld	a,(OFST+0,sp)
3629  024c a140          	cp	a,#64
3630  024e 25d1          	jrult	L3112
3631                     ; 279 	 sp >>= 6;
3633  0250 96            	ldw	x,sp
3634  0251 1c000b        	addw	x,#OFST-4
3635  0254 a606          	ld	a,#6
3636  0256 cd0000        	call	c_lgrsh
3639                     ; 281 	 if (minutes) // is timing-control in minutes?
3641                     	btst	_minutes
3642  025e 2406          	jruge	L5212
3643                     ; 282               setpoint = sp;
3645  0260 1e0d          	ldw	x,(OFST-2,sp)
3646  0262 bf06          	ldw	_setpoint,x
3648  0264 2009          	jra	L7012
3649  0266               L5212:
3650                     ; 283          else eeprom_write_config(EEADR_MENU_ITEM(SP), sp);
3652  0266 1e0d          	ldw	x,(OFST-2,sp)
3653  0268 89            	pushw	x
3654  0269 a672          	ld	a,#114
3655  026b cd0000        	call	_eeprom_write_config
3657  026e 85            	popw	x
3658  026f               L7012:
3659                     ; 285       if (!minutes)
3661                     	btst	_minutes
3662  0274 2509          	jrult	L7602
3663                     ; 287           eeprom_write_config(EEADR_MENU_ITEM(dh), curr_dur);
3665  0276 be0b          	ldw	x,_curr_dur
3666  0278 89            	pushw	x
3667  0279 a679          	ld	a,#121
3668  027b cd0000        	call	_eeprom_write_config
3670  027e 85            	popw	x
3671  027f               L7602:
3672                     ; 290 } // update_profile()
3673  027f               L61:
3676  027f 5b0f          	addw	sp,#15
3677  0281 81            	ret
3729                     ; 302 int16_t range(int16_t x, int16_t min, int16_t max)
3729                     ; 303 {
3730                     	switch	.text
3731  0282               _range:
3733  0282 89            	pushw	x
3734       00000000      OFST:	set	0
3737                     ; 304     if (x > max) return min;
3739  0283 9c            	rvf
3740  0284 1307          	cpw	x,(OFST+7,sp)
3741  0286 2d04          	jrsle	L1612
3744  0288 1e05          	ldw	x,(OFST+5,sp)
3746  028a 2009          	jra	L42
3747  028c               L1612:
3748                     ; 305     if (x < min) return max;
3750  028c 9c            	rvf
3751  028d 1e01          	ldw	x,(OFST+1,sp)
3752  028f 1305          	cpw	x,(OFST+5,sp)
3753  0291 2e05          	jrsge	L3612
3756  0293 1e07          	ldw	x,(OFST+7,sp)
3758  0295               L42:
3760  0295 5b02          	addw	sp,#2
3761  0297 81            	ret
3762  0298               L3612:
3763                     ; 306     return x;
3765  0298 1e01          	ldw	x,(OFST+1,sp)
3767  029a 20f9          	jra	L42
3840                     ; 316 int16_t check_config_value(int16_t config_value, uint8_t eeadr)
3840                     ; 317 {
3841                     	switch	.text
3842  029c               _check_config_value:
3844  029c 89            	pushw	x
3845  029d 5205          	subw	sp,#5
3846       00000005      OFST:	set	5
3849                     ; 318     int16_t t_min = 0, t_max = 999;
3851  029f 5f            	clrw	x
3852  02a0 1f01          	ldw	(OFST-4,sp),x
3856  02a2 ae03e7        	ldw	x,#999
3857  02a5 1f04          	ldw	(OFST-1,sp),x
3859                     ; 321     if (eeadr < EEADR_MENU)
3861  02a7 7b0a          	ld	a,(OFST+5,sp)
3862  02a9 a172          	cp	a,#114
3863  02ab 2431          	jruge	L3222
3865  02ad 2006          	jra	L7222
3866  02af               L5222:
3867                     ; 325             eeadr -= PROFILE_SIZE;
3869  02af 7b0a          	ld	a,(OFST+5,sp)
3870  02b1 a013          	sub	a,#19
3871  02b3 6b0a          	ld	(OFST+5,sp),a
3872  02b5               L7222:
3873                     ; 323 	while (eeadr >= PROFILE_SIZE)
3875  02b5 7b0a          	ld	a,(OFST+5,sp)
3876  02b7 a113          	cp	a,#19
3877  02b9 24f4          	jruge	L5222
3878                     ; 327 	if (!(eeadr & 0x1))
3880  02bb 7b0a          	ld	a,(OFST+5,sp)
3881  02bd a501          	bcp	a,#1
3882  02bf 2703          	jreq	L07
3883  02c1 cc03e1        	jp	L5322
3884  02c4               L07:
3885                     ; 329 	    t_min = (fahrenheit ? TEMP_MIN_F : TEMP_MIN_C);
3887  02c4 aefe70        	ldw	x,#65136
3888  02c7 1f01          	ldw	(OFST-4,sp),x
3890                     ; 330 	    t_max = (fahrenheit ? TEMP_MAX_F : TEMP_MAX_C);
3892                     	btst	_fahrenheit
3893  02ce 2405          	jruge	L03
3894  02d0 ae09c4        	ldw	x,#2500
3895  02d3 2003          	jra	L23
3896  02d5               L03:
3897  02d5 ae0578        	ldw	x,#1400
3898  02d8               L23:
3899  02d8 1f04          	ldw	(OFST-1,sp),x
3901  02da ace103e1      	jpf	L5322
3902  02de               L3222:
3903                     ; 333         type = menu[eeadr - EEADR_MENU].type;
3905  02de 7b0a          	ld	a,(OFST+5,sp)
3906  02e0 97            	ld	xl,a
3907  02e1 a604          	ld	a,#4
3908  02e3 42            	mul	x,a
3909  02e4 1d01c8        	subw	x,#456
3910  02e7 d6000d        	ld	a,(_menu+3,x)
3911  02ea 6b03          	ld	(OFST-2,sp),a
3913                     ; 334 	if (type == t_temperature)
3915  02ec 0d03          	tnz	(OFST-2,sp)
3916  02ee 261a          	jrne	L7322
3917                     ; 336 	    t_min = (fahrenheit ? TEMP_MIN_F : TEMP_MIN_C);
3919  02f0 aefe70        	ldw	x,#65136
3920  02f3 1f01          	ldw	(OFST-4,sp),x
3922                     ; 337 	    t_max = (fahrenheit ? TEMP_MAX_F : TEMP_MAX_C);
3924                     	btst	_fahrenheit
3925  02fa 2405          	jruge	L43
3926  02fc ae09c4        	ldw	x,#2500
3927  02ff 2003          	jra	L63
3928  0301               L43:
3929  0301 ae0578        	ldw	x,#1400
3930  0304               L63:
3931  0304 1f04          	ldw	(OFST-1,sp),x
3934  0306 ace103e1      	jpf	L5322
3935  030a               L7322:
3936                     ; 338 	} else if (type == t_tempdiff)
3938  030a 7b03          	ld	a,(OFST-2,sp)
3939  030c a101          	cp	a,#1
3940  030e 2626          	jrne	L3422
3941                     ; 340 	    t_min = (fahrenheit ? TEMP_CORR_MIN_F : TEMP_CORR_MIN_C);
3943                     	btst	_fahrenheit
3944  0315 2405          	jruge	L04
3945  0317 aeff9c        	ldw	x,#65436
3946  031a 2003          	jra	L24
3947  031c               L04:
3948  031c aeffce        	ldw	x,#65486
3949  031f               L24:
3950  031f 1f01          	ldw	(OFST-4,sp),x
3952                     ; 341 	    t_max = (fahrenheit ? TEMP_CORR_MAX_F : TEMP_CORR_MAX_C);
3954                     	btst	_fahrenheit
3955  0326 2405          	jruge	L44
3956  0328 ae0064        	ldw	x,#100
3957  032b 2003          	jra	L64
3958  032d               L44:
3959  032d ae0032        	ldw	x,#50
3960  0330               L64:
3961  0330 1f04          	ldw	(OFST-1,sp),x
3964  0332 ace103e1      	jpf	L5322
3965  0336               L3422:
3966                     ; 342 	} else if (type == t_parameter)
3968  0336 7b03          	ld	a,(OFST-2,sp)
3969  0338 a10a          	cp	a,#10
3970  033a 2616          	jrne	L7422
3971                     ; 344 		t_max = 9999;
3973  033c ae270f        	ldw	x,#9999
3974  033f 1f04          	ldw	(OFST-1,sp),x
3976                     ; 345                 if (eeadr == EEADR_MENU_ITEM(Hc)) 
3978  0341 7b0a          	ld	a,(OFST+5,sp)
3979  0343 a180          	cp	a,#128
3980  0345 2703          	jreq	L27
3981  0347 cc03e1        	jp	L5322
3982  034a               L27:
3983                     ; 347                     t_min = -9999; 
3985  034a aed8f1        	ldw	x,#55537
3986  034d 1f01          	ldw	(OFST-4,sp),x
3988  034f cc03e1        	jra	L5322
3989  0352               L7422:
3990                     ; 349 	} else if (type == t_boolean)
3992  0352 7b03          	ld	a,(OFST-2,sp)
3993  0354 a109          	cp	a,#9
3994  0356 2608          	jrne	L5522
3995                     ; 351 	    t_max = 1;
3997  0358 ae0001        	ldw	x,#1
3998  035b 1f04          	ldw	(OFST-1,sp),x
4001  035d cc03e1        	jra	L5322
4002  0360               L5522:
4003                     ; 352 	} else if (type == t_hyst_1)
4005  0360 7b03          	ld	a,(OFST-2,sp)
4006  0362 a102          	cp	a,#2
4007  0364 2613          	jrne	L1622
4008                     ; 354 	    t_max = (fahrenheit ? TEMP_HYST_1_MAX_F : TEMP_HYST_1_MAX_C);
4010                     	btst	_fahrenheit
4011  036b 2405          	jruge	L05
4012  036d ae0064        	ldw	x,#100
4013  0370 2003          	jra	L25
4014  0372               L05:
4015  0372 ae0032        	ldw	x,#50
4016  0375               L25:
4017  0375 1f04          	ldw	(OFST-1,sp),x
4020  0377 2068          	jra	L5322
4021  0379               L1622:
4022                     ; 355 	} else if (type == t_hyst_2)
4024  0379 7b03          	ld	a,(OFST-2,sp)
4025  037b a103          	cp	a,#3
4026  037d 2613          	jrne	L5622
4027                     ; 357 	    t_max = (fahrenheit ? TEMP_HYST_2_MAX_F : TEMP_HYST_2_MAX_C);
4029                     	btst	_fahrenheit
4030  0384 2405          	jruge	L45
4031  0386 ae01f4        	ldw	x,#500
4032  0389 2003          	jra	L65
4033  038b               L45:
4034  038b ae00fa        	ldw	x,#250
4035  038e               L65:
4036  038e 1f04          	ldw	(OFST-1,sp),x
4039  0390 204f          	jra	L5322
4040  0392               L5622:
4041                     ; 358 	} else if (type == t_sp_alarm)
4043  0392 7b03          	ld	a,(OFST-2,sp)
4044  0394 a104          	cp	a,#4
4045  0396 2624          	jrne	L1722
4046                     ; 360 	    t_min = (fahrenheit ? SP_ALARM_MIN_F : SP_ALARM_MIN_C);
4048                     	btst	_fahrenheit
4049  039d 2405          	jruge	L06
4050  039f aefce0        	ldw	x,#64736
4051  03a2 2003          	jra	L26
4052  03a4               L06:
4053  03a4 aefe70        	ldw	x,#65136
4054  03a7               L26:
4055  03a7 1f01          	ldw	(OFST-4,sp),x
4057                     ; 361 	    t_max = (fahrenheit ? SP_ALARM_MAX_F : SP_ALARM_MAX_C);
4059                     	btst	_fahrenheit
4060  03ae 2405          	jruge	L46
4061  03b0 ae0320        	ldw	x,#800
4062  03b3 2003          	jra	L66
4063  03b5               L46:
4064  03b5 ae0190        	ldw	x,#400
4065  03b8               L66:
4066  03b8 1f04          	ldw	(OFST-1,sp),x
4069  03ba 2025          	jra	L5322
4070  03bc               L1722:
4071                     ; 362 	} else if(type == t_step)
4073  03bc 7b03          	ld	a,(OFST-2,sp)
4074  03be a105          	cp	a,#5
4075  03c0 2607          	jrne	L5722
4076                     ; 364 	    t_max = NO_OF_TT_PAIRS;
4078  03c2 ae0009        	ldw	x,#9
4079  03c5 1f04          	ldw	(OFST-1,sp),x
4082  03c7 2018          	jra	L5322
4083  03c9               L5722:
4084                     ; 365 	} else if (type == t_delay)
4086  03c9 7b03          	ld	a,(OFST-2,sp)
4087  03cb a106          	cp	a,#6
4088  03cd 2607          	jrne	L1032
4089                     ; 367 	    t_max = 60;
4091  03cf ae003c        	ldw	x,#60
4092  03d2 1f04          	ldw	(OFST-1,sp),x
4095  03d4 200b          	jra	L5322
4096  03d6               L1032:
4097                     ; 368 	} else if (type == t_runmode)
4099  03d6 7b03          	ld	a,(OFST-2,sp)
4100  03d8 a107          	cp	a,#7
4101  03da 2605          	jrne	L5322
4102                     ; 370 	    t_max = NO_OF_PROFILES;
4104  03dc ae0006        	ldw	x,#6
4105  03df 1f04          	ldw	(OFST-1,sp),x
4107  03e1               L5322:
4108                     ; 373     return range(config_value, t_min, t_max);
4110  03e1 1e04          	ldw	x,(OFST-1,sp)
4111  03e3 89            	pushw	x
4112  03e4 1e03          	ldw	x,(OFST-2,sp)
4113  03e6 89            	pushw	x
4114  03e7 1e0a          	ldw	x,(OFST+5,sp)
4115  03e9 cd0282        	call	_range
4117  03ec 5b04          	addw	sp,#4
4120  03ee 5b07          	addw	sp,#7
4121  03f0 81            	ret
4180                     ; 383 void read_buttons(void)
4180                     ; 384 {
4181                     	switch	.text
4182  03f1               _read_buttons:
4184  03f1 89            	pushw	x
4185       00000002      OFST:	set	2
4188                     ; 387     disable_interrupts();     // Disable interrups while reading buttons
4191  03f2 9b            sim
4193                     ; 389     porte   = PE_IDR & SEG7_C;    // Save 7-segment C status
4196  03f3 c65015        	ld	a,_PE_IDR
4197  03f6 a401          	and	a,#1
4198  03f8 b700          	ld	_porte,a
4199                     ; 390     portd   = PD_IDR & PORTD_OUT; // Save other 7-segments
4201  03fa c65010        	ld	a,_PD_IDR
4202  03fd a4fd          	and	a,#253
4203  03ff b701          	ld	_portd,a
4204                     ; 391     PE_ODR |= SEG7_C;             // disable 7-segment display C
4206  0401 72105014      	bset	_PE_ODR,#0
4207                     ; 392     PD_ODR |= PORTD_OUT;          // disable all other 7-segment displays
4209  0405 c6500f        	ld	a,_PD_ODR
4210  0408 aafd          	or	a,#253
4211  040a c7500f        	ld	_PD_ODR,a
4212                     ; 393     hc164_state = hc164_val;      // save current hc164_val
4214  040d b600          	ld	a,_hc164_val
4215  040f 6b01          	ld	(OFST-1,sp),a
4217                     ; 394     set_hc164(0x00);
4219  0411 4f            	clr	a
4220  0412 cd0000        	call	_set_hc164
4222                     ; 396     for (i = 0x88; i > 0x0F; i >>= 1)
4224  0415 a688          	ld	a,#136
4225  0417 6b02          	ld	(OFST+0,sp),a
4227  0419               L1332:
4228                     ; 398        set_hc164(i);
4230  0419 7b02          	ld	a,(OFST+0,sp)
4231  041b cd0000        	call	_set_hc164
4233                     ; 399        _buttons <<= 1;
4235  041e 3809          	sll	__buttons
4236                     ; 400        _buttons  &= 0xFE; // clear bit 0
4238  0420 72110009      	bres	__buttons,#0
4239                     ; 401        if (PC_IDR & KEYS) _buttons |= 0x01;
4241  0424 c6500b        	ld	a,_PC_IDR
4242  0427 a502          	bcp	a,#2
4243  0429 2704          	jreq	L7332
4246  042b 72100009      	bset	__buttons,#0
4247  042f               L7332:
4248                     ; 402        set_hc164(0x00);
4250  042f 4f            	clr	a
4251  0430 cd0000        	call	_set_hc164
4253                     ; 396     for (i = 0x88; i > 0x0F; i >>= 1)
4255  0433 0402          	srl	(OFST+0,sp)
4259  0435 7b02          	ld	a,(OFST+0,sp)
4260  0437 a110          	cp	a,#16
4261  0439 24de          	jruge	L1332
4262                     ; 404     top_100 = top_10 = top_1 = top_01 = LED_0;
4264  043b 35e70000      	mov	_top_01,#231
4265  043f 450000        	mov	_top_1,_top_01
4266  0442 450000        	mov	_top_10,_top_1
4267  0445 450000        	mov	_top_100,_top_10
4268                     ; 405     if (_buttons & 0x08) top_100 = LED_S;
4270  0448 b609          	ld	a,__buttons
4271  044a a508          	bcp	a,#8
4272  044c 2704          	jreq	L1432
4275  044e 35b50000      	mov	_top_100,#181
4276  0452               L1432:
4277                     ; 406     if (_buttons & 0x04) top_10  = LED_L;
4279  0452 b609          	ld	a,__buttons
4280  0454 a504          	bcp	a,#4
4281  0456 2704          	jreq	L3432
4284  0458 35e00000      	mov	_top_10,#224
4285  045c               L3432:
4286                     ; 407     if (_buttons & 0x02) top_1   = LED_d;
4288  045c b609          	ld	a,__buttons
4289  045e a502          	bcp	a,#2
4290  0460 2704          	jreq	L5432
4293  0462 35d30000      	mov	_top_1,#211
4294  0466               L5432:
4295                     ; 408     if (_buttons & 0x01) top_01  = LED_u;
4297  0466 b609          	ld	a,__buttons
4298  0468 a501          	bcp	a,#1
4299  046a 2704          	jreq	L7432
4302  046c 35c10000      	mov	_top_01,#193
4303  0470               L7432:
4304                     ; 411     set_hc164(hc164_state); // restore HC164 state
4306  0470 7b01          	ld	a,(OFST-1,sp)
4307  0472 cd0000        	call	_set_hc164
4309                     ; 412     PD_ODR &= ~PORTD_OUT;
4311  0475 c6500f        	ld	a,_PD_ODR
4312  0478 a402          	and	a,#2
4313  047a c7500f        	ld	_PD_ODR,a
4314                     ; 413     PD_ODR |= portd;        // restore PORTD
4316  047d c6500f        	ld	a,_PD_ODR
4317  0480 ba01          	or	a,_portd
4318  0482 c7500f        	ld	_PD_ODR,a
4319                     ; 414     PE_ODR &= ~SEG7_C;
4321  0485 72115014      	bres	_PE_ODR,#0
4322                     ; 415     PE_ODR |= porte;        // restore PORTE
4324  0489 c65014        	ld	a,_PE_ODR
4325  048c ba00          	or	a,_porte
4326  048e c75014        	ld	_PE_ODR,a
4327                     ; 416     enable_interrupts();    // Re-enable Interrupts
4330  0491 9a            rim
4332                     ; 417 } // read_buttons()
4336  0492 85            	popw	x
4337  0493 81            	ret
4425                     	switch	.const
4426  0056               L611:
4427  0056 04ac          	dc.w	L1532
4428  0058 058c          	dc.w	L5532
4429  005a 05b4          	dc.w	L7532
4430  005c 05e1          	dc.w	L1632
4431  005e 0614          	dc.w	L3632
4432  0060 063c          	dc.w	L5632
4433  0062 051b          	dc.w	L3532
4434  0064 0675          	dc.w	L7632
4435  0066 068a          	dc.w	L1732
4436  0068 06e7          	dc.w	L3732
4437  006a 0744          	dc.w	L5732
4438  006c 0813          	dc.w	L1042
4439  006e 086b          	dc.w	L3042
4440                     ; 426 void menu_fsm(void)
4440                     ; 427 {
4441                     	switch	.text
4442  0494               _menu_fsm:
4444  0494 89            	pushw	x
4445       00000002      OFST:	set	2
4448                     ; 430    if (m_countdown) m_countdown--; // countdown counter
4450  0495 3d08          	tnz	_m_countdown
4451  0497 2702          	jreq	L3442
4454  0499 3a08          	dec	_m_countdown
4455  049b               L3442:
4456                     ; 432    switch (menustate)
4458  049b b605          	ld	a,_menustate
4460                     ; 728             break;
4461  049d a10d          	cp	a,#13
4462  049f 2407          	jruge	L411
4463  04a1 5f            	clrw	x
4464  04a2 97            	ld	xl,a
4465  04a3 58            	sllw	x
4466  04a4 de0056        	ldw	x,(L611,x)
4467  04a7 fc            	jp	(x)
4468  04a8               L411:
4469  04a8 ac780978      	jpf	L7042
4470  04ac               L1532:
4471                     ; 435        case MENU_IDLE:
4471                     ; 436 	    if(BTN_PRESSED(BTN_PWR))
4473  04ac b609          	ld	a,__buttons
4474  04ae a422          	and	a,#34
4475  04b0 a102          	cp	a,#2
4476  04b2 260c          	jrne	L1542
4477                     ; 438                 m_countdown = TMR_POWERDOWN;
4479  04b4 351e0008      	mov	_m_countdown,#30
4480                     ; 439                 menustate   = MENU_POWER_DOWN_WAIT;
4482  04b8 35060005      	mov	_menustate,#6
4484  04bc ac7a097a      	jpf	L7442
4485  04c0               L1542:
4486                     ; 440 	    } else if(_buttons && eeprom_read_config(EEADR_POWER_ON))
4488  04c0 3d09          	tnz	__buttons
4489  04c2 2603          	jrne	L421
4490  04c4 cc097a        	jp	L7442
4491  04c7               L421:
4493  04c7 a685          	ld	a,#133
4494  04c9 cd0000        	call	_eeprom_read_config
4496  04cc a30000        	cpw	x,#0
4497  04cf 2603          	jrne	L621
4498  04d1 cc097a        	jp	L7442
4499  04d4               L621:
4500                     ; 442                 if (BTN_PRESSED(BTN_UP | BTN_DOWN)) 
4502  04d4 b609          	ld	a,__buttons
4503  04d6 a4cc          	and	a,#204
4504  04d8 a10c          	cp	a,#12
4505  04da 2608          	jrne	L7542
4506                     ; 444                     menustate = MENU_SHOW_VERSION;
4508  04dc 35010005      	mov	_menustate,#1
4510  04e0 ac7a097a      	jpf	L7442
4511  04e4               L7542:
4512                     ; 445                 } else if(BTN_PRESSED(BTN_UP))
4514  04e4 b609          	ld	a,__buttons
4515  04e6 a488          	and	a,#136
4516  04e8 a108          	cp	a,#8
4517  04ea 2608          	jrne	L3642
4518                     ; 447                     menustate = MENU_SHOW_STATE_UP;
4520  04ec 35020005      	mov	_menustate,#2
4522  04f0 ac7a097a      	jpf	L7442
4523  04f4               L3642:
4524                     ; 448                 } else if(BTN_PRESSED(BTN_DOWN))
4526  04f4 b609          	ld	a,__buttons
4527  04f6 a444          	and	a,#68
4528  04f8 a104          	cp	a,#4
4529  04fa 260c          	jrne	L7642
4530                     ; 450                     m_countdown = TMR_SHOW_PROFILE_ITEM;
4532  04fc 350f0008      	mov	_m_countdown,#15
4533                     ; 451                     menustate   = MENU_SHOW_STATE_DOWN;
4535  0500 35030005      	mov	_menustate,#3
4537  0504 ac7a097a      	jpf	L7442
4538  0508               L7642:
4539                     ; 452                 } else if(BTN_RELEASED(BTN_S))
4541  0508 b609          	ld	a,__buttons
4542  050a a411          	and	a,#17
4543  050c a110          	cp	a,#16
4544  050e 2703          	jreq	L031
4545  0510 cc097a        	jp	L7442
4546  0513               L031:
4547                     ; 454                     menustate = MENU_SHOW_MENU_ITEM;
4549  0513 35070005      	mov	_menustate,#7
4550  0517 ac7a097a      	jpf	L7442
4551  051b               L3532:
4552                     ; 459        case MENU_POWER_DOWN_WAIT:
4552                     ; 460             if (m_countdown == 0)
4554  051b 3d08          	tnz	_m_countdown
4555  051d 263f          	jrne	L5742
4556                     ; 462                 pwr_on = eeprom_read_config(EEADR_POWER_ON);
4558  051f a685          	ld	a,#133
4559  0521 cd0000        	call	_eeprom_read_config
4561  0524 a30000        	cpw	x,#0
4562  0527 2602          	jrne	L231
4563  0529 2006          	jp	L001
4564  052b               L231:
4565  052b 72100001      	bset	_pwr_on
4566  052f 2004          	jra	L201
4567  0531               L001:
4568  0531 72110001      	bres	_pwr_on
4569  0535               L201:
4570                     ; 463                 pwr_on = !pwr_on;
4572  0535 90100001      	bcpl	_pwr_on
4573                     ; 464                 eeprom_write_config(EEADR_POWER_ON, pwr_on);
4575  0539 5f            	clrw	x
4576                     	btst	_pwr_on
4577  053f 59            	rlcw	x
4578  0540 89            	pushw	x
4579  0541 a685          	ld	a,#133
4580  0543 cd0000        	call	_eeprom_write_config
4582  0546 85            	popw	x
4583                     ; 465                 if (pwr_on)
4585                     	btst	_pwr_on
4586  054c 240a          	jruge	L7742
4587                     ; 467                     heating_delay = 60; // 60 sec.
4589  054e ae003c        	ldw	x,#60
4590  0551 bf03          	ldw	_heating_delay,x
4591                     ; 468                     cooling_delay = 60; // 60 sec.
4593  0553 ae003c        	ldw	x,#60
4594  0556 bf01          	ldw	_cooling_delay,x
4595  0558               L7742:
4596                     ; 470                 menustate = MENU_IDLE;
4598  0558 3f05          	clr	_menustate
4600  055a ac7a097a      	jpf	L7442
4601  055e               L5742:
4602                     ; 471             } else if(!BTN_HELD(BTN_PWR))
4604  055e b609          	ld	a,__buttons
4605  0560 a422          	and	a,#34
4606  0562 a122          	cp	a,#34
4607  0564 2603          	jrne	L431
4608  0566 cc097a        	jp	L7442
4609  0569               L431:
4610                     ; 473                 if (++sensor2_selected > 1 + (ts > 0)) sensor2_selected = 0;
4612  0569 9c            	rvf
4613  056a 3d00          	tnz	_ts
4614  056c 2705          	jreq	L401
4615  056e ae0001        	ldw	x,#1
4616  0571 2001          	jra	L601
4617  0573               L401:
4618  0573 5f            	clrw	x
4619  0574               L601:
4620  0574 5c            	incw	x
4621  0575 3c0a          	inc	_sensor2_selected
4622  0577 b60a          	ld	a,_sensor2_selected
4623  0579 905f          	clrw	y
4624  057b 9097          	ld	yl,a
4625  057d bf00          	ldw	c_x,x
4626  057f 90b300        	cpw	y,c_x
4627  0582 2d02          	jrsle	L5052
4630  0584 3f0a          	clr	_sensor2_selected
4631  0586               L5052:
4632                     ; 474                 menustate = MENU_IDLE;
4634  0586 3f05          	clr	_menustate
4635  0588 ac7a097a      	jpf	L7442
4636  058c               L5532:
4637                     ; 478        case MENU_SHOW_VERSION: // Show STC1000p version number
4637                     ; 479             value_to_led(STC1000P_VERSION,LEDS_INT);
4639  058c 4b00          	push	#0
4640  058e ae00c8        	ldw	x,#200
4641  0591 cd009f        	call	_value_to_led
4643  0594 84            	pop	a
4644                     ; 480 	    led_10 |= LED_DECIMAL;
4646  0595 7216000d      	bset	_led_10,#3
4647                     ; 481             led_1  |= LED_DECIMAL;
4649  0599 7216000c      	bset	_led_1,#3
4650                     ; 482 	    led_e  &= ~(LED_DEGR | LED_CELS); // clear ° and Celsius symbols
4652  059d b600          	ld	a,_led_e
4653  059f a49f          	and	a,#159
4654  05a1 b700          	ld	_led_e,a
4655                     ; 483 	    if(!BTN_HELD(BTN_UP | BTN_DOWN)) menustate = MENU_IDLE;
4657  05a3 b609          	ld	a,__buttons
4658  05a5 a4cc          	and	a,#204
4659  05a7 a1cc          	cp	a,#204
4660  05a9 2603          	jrne	L631
4661  05ab cc097a        	jp	L7442
4662  05ae               L631:
4665  05ae 3f05          	clr	_menustate
4666  05b0 ac7a097a      	jpf	L7442
4667  05b4               L7532:
4668                     ; 486        case MENU_SHOW_STATE_UP: // Show setpoint value
4668                     ; 487 	    if (minutes) // is timing-control in minutes?
4670                     	btst	_minutes
4671  05b9 240a          	jruge	L1152
4672                     ; 488                  value_to_led(setpoint,LEDS_TEMP);
4674  05bb 4b01          	push	#1
4675  05bd be06          	ldw	x,_setpoint
4676  05bf cd009f        	call	_value_to_led
4678  05c2 84            	pop	a
4680  05c3 200b          	jra	L3152
4681  05c5               L1152:
4682                     ; 489 	    else value_to_led(eeprom_read_config(EEADR_MENU_ITEM(SP)),LEDS_TEMP);
4684  05c5 4b01          	push	#1
4685  05c7 a672          	ld	a,#114
4686  05c9 cd0000        	call	_eeprom_read_config
4688  05cc cd009f        	call	_value_to_led
4690  05cf 84            	pop	a
4691  05d0               L3152:
4692                     ; 490 	    if(!BTN_HELD(BTN_UP)) menustate = MENU_IDLE;
4694  05d0 b609          	ld	a,__buttons
4695  05d2 a488          	and	a,#136
4696  05d4 a188          	cp	a,#136
4697  05d6 2603          	jrne	L041
4698  05d8 cc097a        	jp	L7442
4699  05db               L041:
4702  05db 3f05          	clr	_menustate
4703  05dd ac7a097a      	jpf	L7442
4704  05e1               L1632:
4705                     ; 493        case MENU_SHOW_STATE_DOWN: // Show Profile-number
4705                     ; 494 	    run_mode = eeprom_read_config(EEADR_MENU_ITEM(rn));
4707  05e1 a684          	ld	a,#132
4708  05e3 cd0000        	call	_eeprom_read_config
4710  05e6 01            	rrwa	x,a
4711  05e7 6b02          	ld	(OFST+0,sp),a
4712  05e9 02            	rlwa	x,a
4714                     ; 495             prx_to_led(run_mode,LEDS_RUN_MODE);
4716  05ea 7b02          	ld	a,(OFST+0,sp)
4717  05ec 5f            	clrw	x
4718  05ed 95            	ld	xh,a
4719  05ee cd0051        	call	_prx_to_led
4721                     ; 496             if ((run_mode < THERMOSTAT_MODE) && (m_countdown == 0))
4723  05f1 7b02          	ld	a,(OFST+0,sp)
4724  05f3 a106          	cp	a,#6
4725  05f5 240c          	jruge	L7152
4727  05f7 3d08          	tnz	_m_countdown
4728  05f9 2608          	jrne	L7152
4729                     ; 498                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4731  05fb 350f0008      	mov	_m_countdown,#15
4732                     ; 499                 menustate   = MENU_SHOW_STATE_DOWN_2;
4734  05ff 35040005      	mov	_menustate,#4
4735  0603               L7152:
4736                     ; 501 	    if(!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
4738  0603 b609          	ld	a,__buttons
4739  0605 a444          	and	a,#68
4740  0607 a144          	cp	a,#68
4741  0609 2603          	jrne	L241
4742  060b cc097a        	jp	L7442
4743  060e               L241:
4746  060e 3f05          	clr	_menustate
4747  0610 ac7a097a      	jpf	L7442
4748  0614               L3632:
4749                     ; 504        case MENU_SHOW_STATE_DOWN_2: // Show current step number within profile
4749                     ; 505 	    value_to_led(eeprom_read_config(EEADR_MENU_ITEM(St)),LEDS_INT);
4751  0614 4b00          	push	#0
4752  0616 a678          	ld	a,#120
4753  0618 cd0000        	call	_eeprom_read_config
4755  061b cd009f        	call	_value_to_led
4757  061e 84            	pop	a
4758                     ; 506 	    if(m_countdown == 0)
4760  061f 3d08          	tnz	_m_countdown
4761  0621 2608          	jrne	L3252
4762                     ; 508                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4764  0623 350f0008      	mov	_m_countdown,#15
4765                     ; 509                 menustate   = MENU_SHOW_STATE_DOWN_3;
4767  0627 35050005      	mov	_menustate,#5
4768  062b               L3252:
4769                     ; 511 	    if(!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
4771  062b b609          	ld	a,__buttons
4772  062d a444          	and	a,#68
4773  062f a144          	cp	a,#68
4774  0631 2603          	jrne	L441
4775  0633 cc097a        	jp	L7442
4776  0636               L441:
4779  0636 3f05          	clr	_menustate
4780  0638 ac7a097a      	jpf	L7442
4781  063c               L5632:
4782                     ; 514        case MENU_SHOW_STATE_DOWN_3: // Show current duration of running profile
4782                     ; 515             if (minutes) // is timing-control in minutes?
4784                     	btst	_minutes
4785  0641 240a          	jruge	L7252
4786                     ; 516                  value_to_led(curr_dur,LEDS_INT);
4788  0643 4b00          	push	#0
4789  0645 be0b          	ldw	x,_curr_dur
4790  0647 cd009f        	call	_value_to_led
4792  064a 84            	pop	a
4794  064b 200b          	jra	L1352
4795  064d               L7252:
4796                     ; 517             else value_to_led(eeprom_read_config(EEADR_MENU_ITEM(dh)),LEDS_INT);
4798  064d 4b00          	push	#0
4799  064f a679          	ld	a,#121
4800  0651 cd0000        	call	_eeprom_read_config
4802  0654 cd009f        	call	_value_to_led
4804  0657 84            	pop	a
4805  0658               L1352:
4806                     ; 518             if(m_countdown == 0)
4808  0658 3d08          	tnz	_m_countdown
4809  065a 2608          	jrne	L3352
4810                     ; 520                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4812  065c 350f0008      	mov	_m_countdown,#15
4813                     ; 521                 menustate   = MENU_SHOW_STATE_DOWN;
4815  0660 35030005      	mov	_menustate,#3
4816  0664               L3352:
4817                     ; 523             if(!BTN_HELD(BTN_DOWN))
4819  0664 b609          	ld	a,__buttons
4820  0666 a444          	and	a,#68
4821  0668 a144          	cp	a,#68
4822  066a 2603          	jrne	L641
4823  066c cc097a        	jp	L7442
4824  066f               L641:
4825                     ; 525                 menustate = MENU_IDLE;
4827  066f 3f05          	clr	_menustate
4828  0671 ac7a097a      	jpf	L7442
4829  0675               L7632:
4830                     ; 529        case MENU_SHOW_MENU_ITEM: // S-button was pressed
4830                     ; 530             prx_to_led(menu_item, LEDS_MENU);
4832  0675 b606          	ld	a,_menu_item
4833  0677 ae0001        	ldw	x,#1
4834  067a 95            	ld	xh,a
4835  067b cd0051        	call	_prx_to_led
4837                     ; 531             m_countdown = TMR_NO_KEY_TIMEOUT;
4839  067e 35960008      	mov	_m_countdown,#150
4840                     ; 532             menustate   = MENU_SET_MENU_ITEM;
4842  0682 35080005      	mov	_menustate,#8
4843                     ; 533             break; // MENU_SHOW_MENU_ITEM
4845  0686 ac7a097a      	jpf	L7442
4846  068a               L1732:
4847                     ; 535        case MENU_SET_MENU_ITEM:
4847                     ; 536             if(m_countdown == 0 || BTN_RELEASED(BTN_PWR))
4849  068a 3d08          	tnz	_m_countdown
4850  068c 2708          	jreq	L1452
4852  068e b609          	ld	a,__buttons
4853  0690 a422          	and	a,#34
4854  0692 a120          	cp	a,#32
4855  0694 2606          	jrne	L7352
4856  0696               L1452:
4857                     ; 538                 menustate = MENU_IDLE;
4859  0696 3f05          	clr	_menustate
4861  0698 ac7a097a      	jpf	L7442
4862  069c               L7352:
4863                     ; 539             } else if(BTN_RELEASED(BTN_UP))
4865  069c b609          	ld	a,__buttons
4866  069e a488          	and	a,#136
4867  06a0 a180          	cp	a,#128
4868  06a2 2612          	jrne	L5452
4869                     ; 541                 if(++menu_item > MENU_ITEM_NO) menu_item = 0;
4871  06a4 3c06          	inc	_menu_item
4872  06a6 b606          	ld	a,_menu_item
4873  06a8 a107          	cp	a,#7
4874  06aa 2502          	jrult	L7452
4877  06ac 3f06          	clr	_menu_item
4878  06ae               L7452:
4879                     ; 542                 menustate = MENU_SHOW_MENU_ITEM;
4881  06ae 35070005      	mov	_menustate,#7
4883  06b2 ac7a097a      	jpf	L7442
4884  06b6               L5452:
4885                     ; 543             } else if(BTN_RELEASED(BTN_DOWN))
4887  06b6 b609          	ld	a,__buttons
4888  06b8 a444          	and	a,#68
4889  06ba a140          	cp	a,#64
4890  06bc 2614          	jrne	L3552
4891                     ; 545                 if(--menu_item > MENU_ITEM_NO) menu_item = MENU_ITEM_NO;
4893  06be 3a06          	dec	_menu_item
4894  06c0 b606          	ld	a,_menu_item
4895  06c2 a107          	cp	a,#7
4896  06c4 2504          	jrult	L5552
4899  06c6 35060006      	mov	_menu_item,#6
4900  06ca               L5552:
4901                     ; 546                 menustate = MENU_SHOW_MENU_ITEM;
4903  06ca 35070005      	mov	_menustate,#7
4905  06ce ac7a097a      	jpf	L7442
4906  06d2               L3552:
4907                     ; 547             } else if(BTN_RELEASED(BTN_S))
4909  06d2 b609          	ld	a,__buttons
4910  06d4 a411          	and	a,#17
4911  06d6 a110          	cp	a,#16
4912  06d8 2703          	jreq	L051
4913  06da cc097a        	jp	L7442
4914  06dd               L051:
4915                     ; 549                 config_item = 0;
4917  06dd 3f07          	clr	_config_item
4918                     ; 550                 menustate   = MENU_SHOW_CONFIG_ITEM;
4920  06df 35090005      	mov	_menustate,#9
4921  06e3 ac7a097a      	jpf	L7442
4922  06e7               L3732:
4923                     ; 554        case MENU_SHOW_CONFIG_ITEM: // S-button is released
4923                     ; 555 	    led_e &= ~(LED_NEG | LED_DEGR | LED_CELS); // clear negative, ° and Celsius symbols
4925  06e7 b600          	ld	a,_led_e
4926  06e9 a41f          	and	a,#31
4927  06eb b700          	ld	_led_e,a
4928                     ; 557 	    if(menu_item < MENU_ITEM_NO)
4930  06ed b606          	ld	a,_menu_item
4931  06ef a106          	cp	a,#6
4932  06f1 2424          	jruge	L3652
4933                     ; 559                 if(config_item & 0x1) 
4935  06f3 b607          	ld	a,_config_item
4936  06f5 a501          	bcp	a,#1
4937  06f7 270a          	jreq	L5652
4938                     ; 561                     led_10 = LED_d; // duration: 2nd value of a profile-step
4940  06f9 35d3000d      	mov	_led_10,#211
4941                     ; 562                     led_1  = LED_h;
4943  06fd 3571000c      	mov	_led_1,#113
4945  0701 2008          	jra	L7652
4946  0703               L5652:
4947                     ; 564                     led_10 = LED_S; // setpoint: 1st value of a profile-step
4949  0703 35b5000d      	mov	_led_10,#181
4950                     ; 565                     led_1  = LED_P;
4952  0707 3576000c      	mov	_led_1,#118
4953  070b               L7652:
4954                     ; 567                 led_01 = led_lookup[(config_item >> 1)];
4956  070b b607          	ld	a,_config_item
4957  070d 44            	srl	a
4958  070e 5f            	clrw	x
4959  070f 97            	ld	xl,a
4960  0710 d60000        	ld	a,(_led_lookup,x)
4961  0713 b70b          	ld	_led_01,a
4963  0715 2021          	jra	L1752
4964  0717               L3652:
4965                     ; 570                 led_10 = menu[config_item].led_c_10;
4967  0717 b607          	ld	a,_config_item
4968  0719 97            	ld	xl,a
4969  071a a604          	ld	a,#4
4970  071c 42            	mul	x,a
4971  071d d6000a        	ld	a,(_menu,x)
4972  0720 b70d          	ld	_led_10,a
4973                     ; 571                 led_1  = menu[config_item].led_c_1;
4975  0722 b607          	ld	a,_config_item
4976  0724 97            	ld	xl,a
4977  0725 a604          	ld	a,#4
4978  0727 42            	mul	x,a
4979  0728 d6000b        	ld	a,(_menu+1,x)
4980  072b b70c          	ld	_led_1,a
4981                     ; 572                 led_01 = menu[config_item].led_c_01;
4983  072d b607          	ld	a,_config_item
4984  072f 97            	ld	xl,a
4985  0730 a604          	ld	a,#4
4986  0732 42            	mul	x,a
4987  0733 d6000c        	ld	a,(_menu+2,x)
4988  0736 b70b          	ld	_led_01,a
4989  0738               L1752:
4990                     ; 574 	    m_countdown = TMR_NO_KEY_TIMEOUT;
4992  0738 35960008      	mov	_m_countdown,#150
4993                     ; 575 	    menustate   = MENU_SET_CONFIG_ITEM;
4995  073c 350a0005      	mov	_menustate,#10
4996                     ; 576 	    break;
4998  0740 ac7a097a      	jpf	L7442
4999  0744               L5732:
5000                     ; 578        case MENU_SET_CONFIG_ITEM:
5000                     ; 579 	    if(m_countdown == 0)
5002  0744 3d08          	tnz	_m_countdown
5003  0746 2606          	jrne	L3752
5004                     ; 581                 menustate = MENU_IDLE;
5006  0748 3f05          	clr	_menustate
5008  074a ac7a097a      	jpf	L7442
5009  074e               L3752:
5010                     ; 582 	    } else if(BTN_RELEASED(BTN_PWR))
5012  074e b609          	ld	a,__buttons
5013  0750 a422          	and	a,#34
5014  0752 a120          	cp	a,#32
5015  0754 2608          	jrne	L7752
5016                     ; 584                 menustate = MENU_SHOW_MENU_ITEM;
5018  0756 35070005      	mov	_menustate,#7
5020  075a ac7a097a      	jpf	L7442
5021  075e               L7752:
5022                     ; 585             } else if(BTN_RELEASED(BTN_UP))
5024  075e b609          	ld	a,__buttons
5025  0760 a488          	and	a,#136
5026  0762 a180          	cp	a,#128
5027  0764 2624          	jrne	L3062
5028                     ; 587                 config_item++;
5030  0766 3c07          	inc	_config_item
5031                     ; 588                 if(menu_item < MENU_ITEM_NO)
5033  0768 b606          	ld	a,_menu_item
5034  076a a106          	cp	a,#6
5035  076c 240a          	jruge	L5062
5036                     ; 590                     if(config_item >= PROFILE_SIZE)
5038  076e b607          	ld	a,_config_item
5039  0770 a113          	cp	a,#19
5040  0772 250e          	jrult	L1162
5041                     ; 592                         config_item = 0;
5043  0774 3f07          	clr	_config_item
5044  0776 200a          	jra	L1162
5045  0778               L5062:
5046                     ; 595                     if(config_item >= MENU_SIZE)
5048  0778 b607          	ld	a,_config_item
5049  077a a113          	cp	a,#19
5050  077c 2532          	jrult	L7732
5051                     ; 597                         config_item = 0;
5053  077e 3f07          	clr	_config_item
5054  0780 202e          	jra	L7732
5055  0782               L1162:
5056                     ; 603                 menustate = MENU_SHOW_CONFIG_ITEM;
5058  0782 35090005      	mov	_menustate,#9
5060  0786 ac7a097a      	jpf	L7442
5061  078a               L3062:
5062                     ; 604             } else if(BTN_RELEASED(BTN_DOWN))
5064  078a b609          	ld	a,__buttons
5065  078c a444          	and	a,#68
5066  078e a140          	cp	a,#64
5067  0790 264d          	jrne	L7162
5068                     ; 606                 config_item--;
5070  0792 3a07          	dec	_config_item
5071                     ; 607                 if(menu_item < MENU_ITEM_NO)
5073  0794 b606          	ld	a,_menu_item
5074  0796 a106          	cp	a,#6
5075  0798 240c          	jruge	L1262
5076                     ; 609                     if(config_item >= PROFILE_SIZE)
5078  079a b607          	ld	a,_config_item
5079  079c a113          	cp	a,#19
5080  079e 2537          	jrult	L5262
5081                     ; 611                         config_item = PROFILE_SIZE-1;
5083  07a0 35120007      	mov	_config_item,#18
5084  07a4 2031          	jra	L5262
5085  07a6               L1262:
5086                     ; 614                     if(config_item > MENU_SIZE-1)
5088  07a6 b607          	ld	a,_config_item
5089  07a8 a113          	cp	a,#19
5090  07aa 2504          	jrult	L7732
5091                     ; 616                         config_item = MENU_SIZE-1;
5093  07ac 35120007      	mov	_config_item,#18
5094  07b0               L7732:
5095                     ; 618             chk_skip_menu_item: // label for goto
5095                     ; 619                     if (!minutes && ((uint8_t)eeprom_read_config(EEADR_MENU_ITEM(rn)) >= THERMOSTAT_MODE))
5097                     	btst	_minutes
5098  07b5 2520          	jrult	L5262
5100  07b7 a684          	ld	a,#132
5101  07b9 cd0000        	call	_eeprom_read_config
5103  07bc 9f            	ld	a,xl
5104  07bd a106          	cp	a,#6
5105  07bf 2516          	jrult	L5262
5106                     ; 621                         if (config_item == St)
5108  07c1 b607          	ld	a,_config_item
5109  07c3 a106          	cp	a,#6
5110  07c5 2606          	jrne	L3362
5111                     ; 623                             config_item += 2;
5113  07c7 3c07          	inc	_config_item
5114  07c9 3c07          	inc	_config_item
5116  07cb 200a          	jra	L5262
5117  07cd               L3362:
5118                     ; 624                         }else if (config_item == dh)
5120  07cd b607          	ld	a,_config_item
5121  07cf a107          	cp	a,#7
5122  07d1 2604          	jrne	L5262
5123                     ; 626                             config_item -= 2;
5125  07d3 3a07          	dec	_config_item
5126  07d5 3a07          	dec	_config_item
5127  07d7               L5262:
5128                     ; 630                 menustate = MENU_SHOW_CONFIG_ITEM;
5130  07d7 35090005      	mov	_menustate,#9
5132  07db ac7a097a      	jpf	L7442
5133  07df               L7162:
5134                     ; 631             } else if(BTN_RELEASED(BTN_S))
5136  07df b609          	ld	a,__buttons
5137  07e1 a411          	and	a,#17
5138  07e3 a110          	cp	a,#16
5139  07e5 2703          	jreq	L251
5140  07e7 cc097a        	jp	L7442
5141  07ea               L251:
5142                     ; 633                 adr          = MI_CI_TO_EEADR(menu_item, config_item);
5144  07ea b606          	ld	a,_menu_item
5145  07ec 97            	ld	xl,a
5146  07ed a613          	ld	a,#19
5147  07ef 42            	mul	x,a
5148  07f0 9f            	ld	a,xl
5149  07f1 bb07          	add	a,_config_item
5150  07f3 6b01          	ld	(OFST-1,sp),a
5152                     ; 634                 config_value = eeprom_read_config(adr);
5154  07f5 7b01          	ld	a,(OFST-1,sp)
5155  07f7 cd0000        	call	_eeprom_read_config
5157  07fa bf09          	ldw	_config_value,x
5158                     ; 635                 config_value = check_config_value(config_value, adr);
5160  07fc 7b01          	ld	a,(OFST-1,sp)
5161  07fe 88            	push	a
5162  07ff be09          	ldw	x,_config_value
5163  0801 cd029c        	call	_check_config_value
5165  0804 84            	pop	a
5166  0805 bf09          	ldw	_config_value,x
5167                     ; 636                 m_countdown  = TMR_NO_KEY_TIMEOUT;
5169  0807 35960008      	mov	_m_countdown,#150
5170                     ; 637                 menustate    = MENU_SHOW_CONFIG_VALUE;
5172  080b 350b0005      	mov	_menustate,#11
5173  080f ac7a097a      	jpf	L7442
5174  0813               L1042:
5175                     ; 641        case MENU_SHOW_CONFIG_VALUE:
5175                     ; 642             if(menu_item < MENU_ITEM_NO)
5177  0813 b606          	ld	a,_menu_item
5178  0815 a106          	cp	a,#6
5179  0817 2414          	jruge	L5462
5180                     ; 644                 value_to_led(config_value, (config_item & 0x1) ? LEDS_INT : LEDS_TEMP);
5182  0819 b607          	ld	a,_config_item
5183  081b a501          	bcp	a,#1
5184  081d 2703          	jreq	L011
5185  081f 4f            	clr	a
5186  0820 2002          	jra	L211
5187  0822               L011:
5188  0822 a601          	ld	a,#1
5189  0824               L211:
5190  0824 88            	push	a
5191  0825 be09          	ldw	x,_config_value
5192  0827 cd009f        	call	_value_to_led
5194  082a 84            	pop	a
5196  082b 2032          	jra	L7462
5197  082d               L5462:
5198                     ; 647                 type = menu[config_item].type;
5200  082d b607          	ld	a,_config_item
5201  082f 97            	ld	xl,a
5202  0830 a604          	ld	a,#4
5203  0832 42            	mul	x,a
5204  0833 d6000d        	ld	a,(_menu+3,x)
5205  0836 6b02          	ld	(OFST+0,sp),a
5207                     ; 648                 if(MENU_TYPE_IS_TEMPERATURE(type))
5209  0838 7b02          	ld	a,(OFST+0,sp)
5210  083a a105          	cp	a,#5
5211  083c 240a          	jruge	L1562
5212                     ; 650                     value_to_led(config_value,LEDS_TEMP);
5214  083e 4b01          	push	#1
5215  0840 be09          	ldw	x,_config_value
5216  0842 cd009f        	call	_value_to_led
5218  0845 84            	pop	a
5220  0846 2017          	jra	L7462
5221  0848               L1562:
5222                     ; 651                 } else if (type == t_runmode)
5224  0848 7b02          	ld	a,(OFST+0,sp)
5225  084a a107          	cp	a,#7
5226  084c 2609          	jrne	L5562
5227                     ; 653                     prx_to_led(config_value,LEDS_RUN_MODE);
5229  084e b60a          	ld	a,_config_value+1
5230  0850 5f            	clrw	x
5231  0851 95            	ld	xh,a
5232  0852 cd0051        	call	_prx_to_led
5235  0855 2008          	jra	L7462
5236  0857               L5562:
5237                     ; 655                     value_to_led(config_value,LEDS_INT);
5239  0857 4b00          	push	#0
5240  0859 be09          	ldw	x,_config_value
5241  085b cd009f        	call	_value_to_led
5243  085e 84            	pop	a
5244  085f               L7462:
5245                     ; 658             m_countdown  = TMR_NO_KEY_TIMEOUT;
5247  085f 35960008      	mov	_m_countdown,#150
5248                     ; 659             menustate    = MENU_SET_CONFIG_VALUE;
5250  0863 350c0005      	mov	_menustate,#12
5251                     ; 660             break;
5253  0867 ac7a097a      	jpf	L7442
5254  086b               L3042:
5255                     ; 662        case MENU_SET_CONFIG_VALUE:
5255                     ; 663             adr = MI_CI_TO_EEADR(menu_item, config_item);
5257  086b b606          	ld	a,_menu_item
5258  086d 97            	ld	xl,a
5259  086e a613          	ld	a,#19
5260  0870 42            	mul	x,a
5261  0871 9f            	ld	a,xl
5262  0872 bb07          	add	a,_config_item
5263  0874 6b01          	ld	(OFST-1,sp),a
5265                     ; 664             if (m_countdown == 0)
5267  0876 3d08          	tnz	_m_countdown
5268  0878 2606          	jrne	L1662
5269                     ; 666                 menustate = MENU_IDLE;
5271  087a 3f05          	clr	_menustate
5273  087c ac7a097a      	jpf	L7442
5274  0880               L1662:
5275                     ; 667             } else if (BTN_RELEASED(BTN_PWR))
5277  0880 b609          	ld	a,__buttons
5278  0882 a422          	and	a,#34
5279  0884 a120          	cp	a,#32
5280  0886 2608          	jrne	L5662
5281                     ; 669                 menustate = MENU_SHOW_CONFIG_ITEM;
5283  0888 35090005      	mov	_menustate,#9
5285  088c ac7a097a      	jpf	L7442
5286  0890               L5662:
5287                     ; 670             } else if(BTN_HELD_OR_RELEASED(BTN_UP)) 
5289  0890 b609          	ld	a,__buttons
5290  0892 a488          	and	a,#136
5291  0894 a5f0          	bcp	a,#240
5292  0896 271d          	jreq	L1762
5293                     ; 672                 config_value++;
5295  0898 be09          	ldw	x,_config_value
5296  089a 1c0001        	addw	x,#1
5297  089d bf09          	ldw	_config_value,x
5298                     ; 673                 if ((config_value > 1000) || (--key_held_tmr < 0))
5300  089f 9c            	rvf
5301  08a0 be09          	ldw	x,_config_value
5302  08a2 a303e9        	cpw	x,#1001
5303  08a5 2e05          	jrsge	L5762
5305  08a7 9c            	rvf
5306  08a8 3a08          	dec	_key_held_tmr
5307  08aa 2e2c          	jrsge	L5042
5308  08ac               L5762:
5309                     ; 675                     config_value += 9;
5311  08ac be09          	ldw	x,_config_value
5312  08ae 1c0009        	addw	x,#9
5313  08b1 bf09          	ldw	_config_value,x
5314  08b3 2023          	jra	L5042
5315  08b5               L1762:
5316                     ; 679             } else if(BTN_HELD_OR_RELEASED(BTN_DOWN)) 
5318  08b5 b609          	ld	a,__buttons
5319  08b7 a444          	and	a,#68
5320  08b9 a5f0          	bcp	a,#240
5321  08bb 272d          	jreq	L1072
5322                     ; 681                 config_value--;
5324  08bd be09          	ldw	x,_config_value
5325  08bf 1d0001        	subw	x,#1
5326  08c2 bf09          	ldw	_config_value,x
5327                     ; 682                 if ((config_value > 1000) || (--key_held_tmr < 0))
5329  08c4 9c            	rvf
5330  08c5 be09          	ldw	x,_config_value
5331  08c7 a303e9        	cpw	x,#1001
5332  08ca 2e05          	jrsge	L5072
5334  08cc 9c            	rvf
5335  08cd 3a08          	dec	_key_held_tmr
5336  08cf 2e07          	jrsge	L5042
5337  08d1               L5072:
5338                     ; 684                     config_value -= 9;
5340  08d1 be09          	ldw	x,_config_value
5341  08d3 1d0009        	subw	x,#9
5342  08d6 bf09          	ldw	_config_value,x
5343  08d8               L5042:
5344                     ; 686             chk_cfg_acc_label: // label for goto
5344                     ; 687                 config_value = check_config_value(config_value, adr);
5346  08d8 7b01          	ld	a,(OFST-1,sp)
5347  08da 88            	push	a
5348  08db be09          	ldw	x,_config_value
5349  08dd cd029c        	call	_check_config_value
5351  08e0 84            	pop	a
5352  08e1 bf09          	ldw	_config_value,x
5353                     ; 688                 menustate    = MENU_SHOW_CONFIG_VALUE;
5355  08e3 350b0005      	mov	_menustate,#11
5357  08e7 cc097a        	jra	L7442
5358  08ea               L1072:
5359                     ; 689             } else if(BTN_RELEASED(BTN_S))
5361  08ea b609          	ld	a,__buttons
5362  08ec a411          	and	a,#17
5363  08ee a110          	cp	a,#16
5364  08f0 2703cc0972    	jrne	L1172
5365                     ; 691                 if(menu_item == MENU_ITEM_NO)
5367  08f5 b606          	ld	a,_menu_item
5368  08f7 a106          	cp	a,#6
5369  08f9 2668          	jrne	L3172
5370                     ; 693                     if(config_item == rn)
5372  08fb b607          	ld	a,_config_item
5373  08fd a112          	cp	a,#18
5374  08ff 2662          	jrne	L3172
5375                     ; 695                         eeprom_write_config(EEADR_MENU_ITEM(St), 0);
5377  0901 5f            	clrw	x
5378  0902 89            	pushw	x
5379  0903 a678          	ld	a,#120
5380  0905 cd0000        	call	_eeprom_write_config
5382  0908 85            	popw	x
5383                     ; 696                         if (minutes)
5385                     	btst	_minutes
5386  090e 2405          	jruge	L7172
5387                     ; 697                              curr_dur = 0;
5389  0910 5f            	clrw	x
5390  0911 bf0b          	ldw	_curr_dur,x
5392  0913 2008          	jra	L1272
5393  0915               L7172:
5394                     ; 698                         else eeprom_write_config(EEADR_MENU_ITEM(dh), 0);
5396  0915 5f            	clrw	x
5397  0916 89            	pushw	x
5398  0917 a679          	ld	a,#121
5399  0919 cd0000        	call	_eeprom_write_config
5401  091c 85            	popw	x
5402  091d               L1272:
5403                     ; 699                         if(config_value < THERMOSTAT_MODE)
5405  091d 9c            	rvf
5406  091e be09          	ldw	x,_config_value
5407  0920 a30006        	cpw	x,#6
5408  0923 2e3e          	jrsge	L3172
5409                     ; 701                             eeadr_sp = EEADR_PROFILE_SETPOINT(((uint8_t)config_value), 0);
5411  0925 b60a          	ld	a,_config_value+1
5412  0927 97            	ld	xl,a
5413  0928 a613          	ld	a,#19
5414  092a 42            	mul	x,a
5415  092b 9f            	ld	a,xl
5416  092c 6b02          	ld	(OFST+0,sp),a
5418                     ; 703                             if (minutes)
5420                     	btst	_minutes
5421  0933 2412          	jruge	L5272
5422                     ; 705                                 setpoint = eeprom_read_config(eeadr_sp);
5424  0935 7b02          	ld	a,(OFST+0,sp)
5425  0937 cd0000        	call	_eeprom_read_config
5427  093a bf06          	ldw	_setpoint,x
5428                     ; 706                                 eeprom_write_config(EEADR_MENU_ITEM(SP), setpoint);
5430  093c be06          	ldw	x,_setpoint
5431  093e 89            	pushw	x
5432  093f a672          	ld	a,#114
5433  0941 cd0000        	call	_eeprom_write_config
5435  0944 85            	popw	x
5437  0945 200c          	jra	L7272
5438  0947               L5272:
5439                     ; 708                                 eeprom_write_config(EEADR_MENU_ITEM(SP), eeprom_read_config(eeadr_sp));
5441  0947 7b02          	ld	a,(OFST+0,sp)
5442  0949 cd0000        	call	_eeprom_read_config
5444  094c 89            	pushw	x
5445  094d a672          	ld	a,#114
5446  094f cd0000        	call	_eeprom_write_config
5448  0952 85            	popw	x
5449  0953               L7272:
5450                     ; 711                             if(eeprom_read_config(eeadr_sp+1) == 0)
5452  0953 7b02          	ld	a,(OFST+0,sp)
5453  0955 4c            	inc	a
5454  0956 cd0000        	call	_eeprom_read_config
5456  0959 a30000        	cpw	x,#0
5457  095c 2605          	jrne	L3172
5458                     ; 713                                 config_value = THERMOSTAT_MODE;
5460  095e ae0006        	ldw	x,#6
5461  0961 bf09          	ldw	_config_value,x
5462  0963               L3172:
5463                     ; 718                 eeprom_write_config(adr, config_value);
5465  0963 be09          	ldw	x,_config_value
5466  0965 89            	pushw	x
5467  0966 7b03          	ld	a,(OFST+1,sp)
5468  0968 cd0000        	call	_eeprom_write_config
5470  096b 85            	popw	x
5471                     ; 719                 menustate = MENU_SHOW_CONFIG_ITEM;
5473  096c 35090005      	mov	_menustate,#9
5475  0970 2008          	jra	L7442
5476  0972               L1172:
5477                     ; 722                 key_held_tmr = TMR_KEY_ACC; 
5479  0972 35140008      	mov	_key_held_tmr,#20
5480  0976 2002          	jra	L7442
5481  0978               L7042:
5482                     ; 726        default:
5482                     ; 727             menustate = MENU_IDLE;
5484  0978 3f05          	clr	_menustate
5485                     ; 728             break;
5487  097a               L7442:
5488                     ; 730    menu_is_idle = (menustate == MENU_IDLE); // needed for ctrl_task()
5490  097a 3d05          	tnz	_menustate
5491  097c 2702          	jreq	L451
5492  097e 2006          	jp	L021
5493  0980               L451:
5494  0980 72100000      	bset	_menu_is_idle
5495  0984 2004          	jra	L221
5496  0986               L021:
5497  0986 72110000      	bres	_menu_is_idle
5498  098a               L221:
5499                     ; 731 } // button_menu_fsm()
5502  098a 85            	popw	x
5503  098b 81            	ret
5694                     ; 738 uint16_t min_to_sec(enum menu_enum x)
5694                     ; 739 {
5695                     	switch	.text
5696  098c               _min_to_sec:
5698  098c 89            	pushw	x
5699       00000002      OFST:	set	2
5702                     ; 742     retv = eeprom_read_config(EEADR_MENU_ITEM(x)) << 6; // * 64
5704  098d ab72          	add	a,#114
5705  098f cd0000        	call	_eeprom_read_config
5707  0992 58            	sllw	x
5708  0993 58            	sllw	x
5709  0994 58            	sllw	x
5710  0995 58            	sllw	x
5711  0996 58            	sllw	x
5712  0997 58            	sllw	x
5713  0998 1f01          	ldw	(OFST-1,sp),x
5715                     ; 743     retv = retv - (retv >> 4); // 64 - 4 = 60
5717  099a 1e01          	ldw	x,(OFST-1,sp)
5718  099c 54            	srlw	x
5719  099d 54            	srlw	x
5720  099e 54            	srlw	x
5721  099f 54            	srlw	x
5722  09a0 72f001        	subw	x,(OFST-1,sp)
5723  09a3 50            	negw	x
5724  09a4 1f01          	ldw	(OFST-1,sp),x
5726                     ; 744     return retv;
5728  09a6 1e01          	ldw	x,(OFST-1,sp)
5731  09a8 5b02          	addw	sp,#2
5732  09aa 81            	ret
5762                     ; 752 void init_temp_delays(void)
5762                     ; 753 {
5763                     	switch	.text
5764  09ab               _init_temp_delays:
5768                     ; 754     if (!minutes) setpoint = eeprom_read_config(EEADR_MENU_ITEM(SP));
5770                     	btst	_minutes
5771  09b0 2507          	jrult	L3403
5774  09b2 a672          	ld	a,#114
5775  09b4 cd0000        	call	_eeprom_read_config
5777  09b7 bf06          	ldw	_setpoint,x
5778  09b9               L3403:
5779                     ; 755     hysteresis  = eeprom_read_config(EEADR_MENU_ITEM(hy));
5781  09b9 a673          	ld	a,#115
5782  09bb cd0000        	call	_eeprom_read_config
5784  09be bf04          	ldw	_hysteresis,x
5785                     ; 756     hysteresis2 = eeprom_read_config(EEADR_MENU_ITEM(hy2));
5787  09c0 a674          	ld	a,#116
5788  09c2 cd0000        	call	_eeprom_read_config
5790  09c5 bf02          	ldw	_hysteresis2,x
5791                     ; 758     if (cooling_delay) cooling_delay--;
5793  09c7 be01          	ldw	x,_cooling_delay
5794  09c9 2707          	jreq	L5403
5797  09cb be01          	ldw	x,_cooling_delay
5798  09cd 1d0001        	subw	x,#1
5799  09d0 bf01          	ldw	_cooling_delay,x
5800  09d2               L5403:
5801                     ; 759     if (heating_delay) heating_delay--;
5803  09d2 be03          	ldw	x,_heating_delay
5804  09d4 2707          	jreq	L7403
5807  09d6 be03          	ldw	x,_heating_delay
5808  09d8 1d0001        	subw	x,#1
5809  09db bf03          	ldw	_heating_delay,x
5810  09dd               L7403:
5811                     ; 760 } // init_temp_delays()
5814  09dd 81            	ret
5817                     	bsct
5818  000f               L1503_pid_tmr:
5819  000f 00            	dc.b	0
5820                     	xref	_init_pid
5821                     	xref	_pid_ctrl
5864                     ; 769 void pid_control(void)
5864                     ; 770 {
5865                     	switch	.text
5866  09de               _pid_control:
5870                     ; 773     init_temp_delays(); // Initialise Heating and Cooling delay
5872  09de adcb          	call	_init_temp_delays
5874                     ; 775     if (kc != eeprom_read_config(EEADR_MENU_ITEM(Hc)) ||
5874                     ; 776         ti != eeprom_read_config(EEADR_MENU_ITEM(Ti)) ||
5874                     ; 777         td != eeprom_read_config(EEADR_MENU_ITEM(Td)))
5876  09e0 a680          	ld	a,#128
5877  09e2 cd0000        	call	_eeprom_read_config
5879  09e5 b300          	cpw	x,_kc
5880  09e7 2612          	jrne	L3703
5882  09e9 a681          	ld	a,#129
5883  09eb cd0000        	call	_eeprom_read_config
5885  09ee b300          	cpw	x,_ti
5886  09f0 2609          	jrne	L3703
5888  09f2 a682          	ld	a,#130
5889  09f4 cd0000        	call	_eeprom_read_config
5891  09f7 b300          	cpw	x,_td
5892  09f9 2728          	jreq	L1703
5893  09fb               L3703:
5894                     ; 779        kc = eeprom_read_config(EEADR_MENU_ITEM(Hc));
5896  09fb a680          	ld	a,#128
5897  09fd cd0000        	call	_eeprom_read_config
5899  0a00 bf00          	ldw	_kc,x
5900                     ; 780        ti = eeprom_read_config(EEADR_MENU_ITEM(Ti));
5902  0a02 a681          	ld	a,#129
5903  0a04 cd0000        	call	_eeprom_read_config
5905  0a07 bf00          	ldw	_ti,x
5906                     ; 781        td = eeprom_read_config(EEADR_MENU_ITEM(Td));
5908  0a09 a682          	ld	a,#130
5909  0a0b cd0000        	call	_eeprom_read_config
5911  0a0e bf00          	ldw	_td,x
5912                     ; 782        init_pid(kc,ti,td,ts,temp_ntc1); // Init PID controller
5914  0a10 be00          	ldw	x,_temp_ntc1
5915  0a12 89            	pushw	x
5916  0a13 3b0000        	push	_ts
5917  0a16 be00          	ldw	x,_td
5918  0a18 89            	pushw	x
5919  0a19 be00          	ldw	x,_ti
5920  0a1b 89            	pushw	x
5921  0a1c be00          	ldw	x,_kc
5922  0a1e cd0000        	call	_init_pid
5924  0a21 5b07          	addw	sp,#7
5925  0a23               L1703:
5926                     ; 785     if (++pid_tmr >= ts) 
5928  0a23 3c0f          	inc	L1503_pid_tmr
5929  0a25 b60f          	ld	a,L1503_pid_tmr
5930  0a27 b100          	cp	a,_ts
5931  0a29 250e          	jrult	L7703
5932                     ; 787         pid_ctrl(temp_ntc1,&pid_out,setpoint);
5934  0a2b be06          	ldw	x,_setpoint
5935  0a2d 89            	pushw	x
5936  0a2e 4b0d          	push	#_pid_out
5937  0a30 be00          	ldw	x,_temp_ntc1
5938  0a32 cd0000        	call	_pid_ctrl
5940  0a35 5b03          	addw	sp,#3
5941                     ; 788         pid_tmr = 0;
5943  0a37 3f0f          	clr	L1503_pid_tmr
5944  0a39               L7703:
5945                     ; 790 } // pid_control()
5948  0a39 81            	ret
6259                     	xdef	_init_temp_delays
6260                     	xdef	_min_to_sec
6261                     	xdef	_menu
6262                     	xref.b	_top_01
6263                     	xref.b	_top_1
6264                     	xref.b	_top_10
6265                     	xref.b	_top_100
6266                     	xref.b	_hc164_val
6267                     	xref.b	_ts
6268                     	xref.b	_td
6269                     	xref.b	_ti
6270                     	xref.b	_kc
6271                     	xref.b	_temp_ntc1
6272                     	switch	.ubsct
6273  0000               _porte:
6274  0000 00            	ds.b	1
6275                     	xdef	_porte
6276  0001               _portd:
6277  0001 00            	ds.b	1
6278                     	xdef	_portd
6279  0002               _hysteresis2:
6280  0002 0000          	ds.b	2
6281                     	xdef	_hysteresis2
6282  0004               _hysteresis:
6283  0004 0000          	ds.b	2
6284                     	xdef	_hysteresis
6285                     	xdef	_pid_out
6286                     	xdef	_curr_dur
6287  0006               _setpoint:
6288  0006 0000          	ds.b	2
6289                     	xdef	_setpoint
6290                     	xdef	_sensor2_selected
6291  0008               _key_held_tmr:
6292  0008 00            	ds.b	1
6293                     	xdef	_key_held_tmr
6294  0009               _config_value:
6295  0009 0000          	ds.b	2
6296                     	xdef	_config_value
6297                     	xdef	__buttons
6298                     	xdef	_m_countdown
6299                     	xdef	_config_item
6300                     	xdef	_menu_item
6301                     	xdef	_minutes
6302                     	xdef	_fahrenheit
6303                     	xdef	_pwr_on
6304                     	xdef	_menu_is_idle
6305                     	xdef	_menustate
6306                     	xdef	_heating_delay
6307                     	xdef	_cooling_delay
6308  000b               _led_01:
6309  000b 00            	ds.b	1
6310                     	xdef	_led_01
6311  000c               _led_1:
6312  000c 00            	ds.b	1
6313                     	xdef	_led_1
6314  000d               _led_10:
6315  000d 00            	ds.b	1
6316                     	xdef	_led_10
6317                     	xdef	_led_e
6318                     	xdef	_eedata
6319                     	xdef	_led_lookup
6320                     	xdef	_pid_control
6321                     	xdef	_menu_fsm
6322                     	xdef	_read_buttons
6323                     	xdef	_check_config_value
6324                     	xdef	_range
6325                     	xdef	_update_profile
6326                     	xdef	_value_to_led
6327                     	xdef	_prx_to_led
6328                     	xdef	_divu10
6329                     	xref	_eeprom_write_config
6330                     	xref	_eeprom_read_config
6331                     	xref	_set_hc164
6332                     	xref.b	c_x
6352                     	xref	c_lgrsh
6353                     	xref	c_lgadd
6354                     	xref	c_itolx
6355                     	end
