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
4193                     ; 389     portc   = PC_IDR & PORTC_LEDS;
4196  03f3 c6500b        	ld	a,_PC_IDR
4197  03f6 a4f8          	and	a,#248
4198  03f8 b701          	ld	_portc,a
4199                     ; 390     portd   = PD_IDR & PORTD_LEDS; 
4201  03fa c65010        	ld	a,_PD_IDR
4202  03fd a41c          	and	a,#28
4203  03ff b700          	ld	_portd,a
4204                     ; 391     PC_ODR |= PORTC_LEDS;    // disable 7-segment displays
4206  0401 c6500a        	ld	a,_PC_ODR
4207  0404 aaf8          	or	a,#248
4208  0406 c7500a        	ld	_PC_ODR,a
4209                     ; 392     PD_ODR |= PORTD_LEDS;    // disable 7-segment displays
4211  0409 c6500f        	ld	a,_PD_ODR
4212  040c aa1c          	or	a,#28
4213  040e c7500f        	ld	_PD_ODR,a
4214                     ; 393     hc164_state = hc164_val; // save current hc164_val
4216  0411 b600          	ld	a,_hc164_val
4217  0413 6b01          	ld	(OFST-1,sp),a
4219                     ; 394     set_hc164(0x00);
4221  0415 4f            	clr	a
4222  0416 cd0000        	call	_set_hc164
4224                     ; 396     for (i = 0x88; i > 0x0F; i >>= 1)
4226  0419 a688          	ld	a,#136
4227  041b 6b02          	ld	(OFST+0,sp),a
4229  041d               L1332:
4230                     ; 398        set_hc164(i);
4232  041d 7b02          	ld	a,(OFST+0,sp)
4233  041f cd0000        	call	_set_hc164
4235                     ; 399        _buttons <<= 1;
4237  0422 3809          	sll	__buttons
4238                     ; 400        _buttons  &= 0xFE; // clear bit 0
4240  0424 72110009      	bres	__buttons,#0
4241                     ; 401        if (PB_IDR & KEYS) _buttons |= 0x01;
4243  0428 c65006        	ld	a,_PB_IDR
4244  042b a520          	bcp	a,#32
4245  042d 2704          	jreq	L7332
4248  042f 72100009      	bset	__buttons,#0
4249  0433               L7332:
4250                     ; 402        set_hc164(0x00);
4252  0433 4f            	clr	a
4253  0434 cd0000        	call	_set_hc164
4255                     ; 396     for (i = 0x88; i > 0x0F; i >>= 1)
4257  0437 0402          	srl	(OFST+0,sp)
4261  0439 7b02          	ld	a,(OFST+0,sp)
4262  043b a110          	cp	a,#16
4263  043d 24de          	jruge	L1332
4264                     ; 404     top_100 = top_10 = top_1 = top_01 = LED_0;
4266  043f 35e70000      	mov	_top_01,#231
4267  0443 450000        	mov	_top_1,_top_01
4268  0446 450000        	mov	_top_10,_top_1
4269  0449 450000        	mov	_top_100,_top_10
4270                     ; 405     if (_buttons & 0x08) top_100 = LED_1;
4272  044c b609          	ld	a,__buttons
4273  044e a508          	bcp	a,#8
4274  0450 2704          	jreq	L1432
4277  0452 35030000      	mov	_top_100,#3
4278  0456               L1432:
4279                     ; 406     if (_buttons & 0x04) top_10  = LED_1;
4281  0456 b609          	ld	a,__buttons
4282  0458 a504          	bcp	a,#4
4283  045a 2704          	jreq	L3432
4286  045c 35030000      	mov	_top_10,#3
4287  0460               L3432:
4288                     ; 407     if (_buttons & 0x02) top_1   = LED_1;
4290  0460 b609          	ld	a,__buttons
4291  0462 a502          	bcp	a,#2
4292  0464 2704          	jreq	L5432
4295  0466 35030000      	mov	_top_1,#3
4296  046a               L5432:
4297                     ; 408     if (_buttons & 0x01) top_01  = LED_1;
4299  046a b609          	ld	a,__buttons
4300  046c a501          	bcp	a,#1
4301  046e 2704          	jreq	L7432
4304  0470 35030000      	mov	_top_01,#3
4305  0474               L7432:
4306                     ; 411     set_hc164(hc164_state); // restore HC164 state
4308  0474 7b01          	ld	a,(OFST-1,sp)
4309  0476 cd0000        	call	_set_hc164
4311                     ; 412     PD_ODR &= ~PORTD_LEDS;
4313  0479 c6500f        	ld	a,_PD_ODR
4314  047c a4e3          	and	a,#227
4315  047e c7500f        	ld	_PD_ODR,a
4316                     ; 413     PD_ODR |= portd;        // restore PORTD
4318  0481 c6500f        	ld	a,_PD_ODR
4319  0484 ba00          	or	a,_portd
4320  0486 c7500f        	ld	_PD_ODR,a
4321                     ; 414     PC_ODR &= ~PORTC_LEDS;
4323  0489 c6500a        	ld	a,_PC_ODR
4324  048c a407          	and	a,#7
4325  048e c7500a        	ld	_PC_ODR,a
4326                     ; 415     PC_ODR |= portc;        // restore PORTC
4328  0491 c6500a        	ld	a,_PC_ODR
4329  0494 ba01          	or	a,_portc
4330  0496 c7500a        	ld	_PC_ODR,a
4331                     ; 416     enable_interrupts();    // Re-enable Interrupts
4334  0499 9a            rim
4336                     ; 417 } // read_buttons()
4340  049a 85            	popw	x
4341  049b 81            	ret
4429                     	switch	.const
4430  0056               L611:
4431  0056 04b4          	dc.w	L1532
4432  0058 0594          	dc.w	L5532
4433  005a 05bc          	dc.w	L7532
4434  005c 05e9          	dc.w	L1632
4435  005e 061c          	dc.w	L3632
4436  0060 0644          	dc.w	L5632
4437  0062 0523          	dc.w	L3532
4438  0064 067d          	dc.w	L7632
4439  0066 0692          	dc.w	L1732
4440  0068 06ef          	dc.w	L3732
4441  006a 074c          	dc.w	L5732
4442  006c 081b          	dc.w	L1042
4443  006e 0873          	dc.w	L3042
4444                     ; 426 void menu_fsm(void)
4444                     ; 427 {
4445                     	switch	.text
4446  049c               _menu_fsm:
4448  049c 89            	pushw	x
4449       00000002      OFST:	set	2
4452                     ; 430    if (m_countdown) m_countdown--; // countdown counter
4454  049d 3d08          	tnz	_m_countdown
4455  049f 2702          	jreq	L3442
4458  04a1 3a08          	dec	_m_countdown
4459  04a3               L3442:
4460                     ; 432    switch (menustate)
4462  04a3 b605          	ld	a,_menustate
4464                     ; 728             break;
4465  04a5 a10d          	cp	a,#13
4466  04a7 2407          	jruge	L411
4467  04a9 5f            	clrw	x
4468  04aa 97            	ld	xl,a
4469  04ab 58            	sllw	x
4470  04ac de0056        	ldw	x,(L611,x)
4471  04af fc            	jp	(x)
4472  04b0               L411:
4473  04b0 ac800980      	jpf	L7042
4474  04b4               L1532:
4475                     ; 435        case MENU_IDLE:
4475                     ; 436 	    if(BTN_PRESSED(BTN_PWR))
4477  04b4 b609          	ld	a,__buttons
4478  04b6 a422          	and	a,#34
4479  04b8 a102          	cp	a,#2
4480  04ba 260c          	jrne	L1542
4481                     ; 438                 m_countdown = TMR_POWERDOWN;
4483  04bc 351e0008      	mov	_m_countdown,#30
4484                     ; 439                 menustate   = MENU_POWER_DOWN_WAIT;
4486  04c0 35060005      	mov	_menustate,#6
4488  04c4 ac820982      	jpf	L7442
4489  04c8               L1542:
4490                     ; 440 	    } else if(_buttons && eeprom_read_config(EEADR_POWER_ON))
4492  04c8 3d09          	tnz	__buttons
4493  04ca 2603          	jrne	L421
4494  04cc cc0982        	jp	L7442
4495  04cf               L421:
4497  04cf a685          	ld	a,#133
4498  04d1 cd0000        	call	_eeprom_read_config
4500  04d4 a30000        	cpw	x,#0
4501  04d7 2603          	jrne	L621
4502  04d9 cc0982        	jp	L7442
4503  04dc               L621:
4504                     ; 442                 if (BTN_PRESSED(BTN_UP | BTN_DOWN)) 
4506  04dc b609          	ld	a,__buttons
4507  04de a4cc          	and	a,#204
4508  04e0 a10c          	cp	a,#12
4509  04e2 2608          	jrne	L7542
4510                     ; 444                     menustate = MENU_SHOW_VERSION;
4512  04e4 35010005      	mov	_menustate,#1
4514  04e8 ac820982      	jpf	L7442
4515  04ec               L7542:
4516                     ; 445                 } else if(BTN_PRESSED(BTN_UP))
4518  04ec b609          	ld	a,__buttons
4519  04ee a488          	and	a,#136
4520  04f0 a108          	cp	a,#8
4521  04f2 2608          	jrne	L3642
4522                     ; 447                     menustate = MENU_SHOW_STATE_UP;
4524  04f4 35020005      	mov	_menustate,#2
4526  04f8 ac820982      	jpf	L7442
4527  04fc               L3642:
4528                     ; 448                 } else if(BTN_PRESSED(BTN_DOWN))
4530  04fc b609          	ld	a,__buttons
4531  04fe a444          	and	a,#68
4532  0500 a104          	cp	a,#4
4533  0502 260c          	jrne	L7642
4534                     ; 450                     m_countdown = TMR_SHOW_PROFILE_ITEM;
4536  0504 350f0008      	mov	_m_countdown,#15
4537                     ; 451                     menustate   = MENU_SHOW_STATE_DOWN;
4539  0508 35030005      	mov	_menustate,#3
4541  050c ac820982      	jpf	L7442
4542  0510               L7642:
4543                     ; 452                 } else if(BTN_RELEASED(BTN_S))
4545  0510 b609          	ld	a,__buttons
4546  0512 a411          	and	a,#17
4547  0514 a110          	cp	a,#16
4548  0516 2703          	jreq	L031
4549  0518 cc0982        	jp	L7442
4550  051b               L031:
4551                     ; 454                     menustate = MENU_SHOW_MENU_ITEM;
4553  051b 35070005      	mov	_menustate,#7
4554  051f ac820982      	jpf	L7442
4555  0523               L3532:
4556                     ; 459        case MENU_POWER_DOWN_WAIT:
4556                     ; 460             if (m_countdown == 0)
4558  0523 3d08          	tnz	_m_countdown
4559  0525 263f          	jrne	L5742
4560                     ; 462                 pwr_on = eeprom_read_config(EEADR_POWER_ON);
4562  0527 a685          	ld	a,#133
4563  0529 cd0000        	call	_eeprom_read_config
4565  052c a30000        	cpw	x,#0
4566  052f 2602          	jrne	L231
4567  0531 2006          	jp	L001
4568  0533               L231:
4569  0533 72100001      	bset	_pwr_on
4570  0537 2004          	jra	L201
4571  0539               L001:
4572  0539 72110001      	bres	_pwr_on
4573  053d               L201:
4574                     ; 463                 pwr_on = !pwr_on;
4576  053d 90100001      	bcpl	_pwr_on
4577                     ; 464                 eeprom_write_config(EEADR_POWER_ON, pwr_on);
4579  0541 5f            	clrw	x
4580                     	btst	_pwr_on
4581  0547 59            	rlcw	x
4582  0548 89            	pushw	x
4583  0549 a685          	ld	a,#133
4584  054b cd0000        	call	_eeprom_write_config
4586  054e 85            	popw	x
4587                     ; 465                 if (pwr_on)
4589                     	btst	_pwr_on
4590  0554 240a          	jruge	L7742
4591                     ; 467                     heating_delay = 60; // 60 sec.
4593  0556 ae003c        	ldw	x,#60
4594  0559 bf03          	ldw	_heating_delay,x
4595                     ; 468                     cooling_delay = 60; // 60 sec.
4597  055b ae003c        	ldw	x,#60
4598  055e bf01          	ldw	_cooling_delay,x
4599  0560               L7742:
4600                     ; 470                 menustate = MENU_IDLE;
4602  0560 3f05          	clr	_menustate
4604  0562 ac820982      	jpf	L7442
4605  0566               L5742:
4606                     ; 471             } else if(!BTN_HELD(BTN_PWR))
4608  0566 b609          	ld	a,__buttons
4609  0568 a422          	and	a,#34
4610  056a a122          	cp	a,#34
4611  056c 2603          	jrne	L431
4612  056e cc0982        	jp	L7442
4613  0571               L431:
4614                     ; 473                 if (++sensor2_selected > 1 + (ts > 0)) sensor2_selected = 0;
4616  0571 9c            	rvf
4617  0572 3d00          	tnz	_ts
4618  0574 2705          	jreq	L401
4619  0576 ae0001        	ldw	x,#1
4620  0579 2001          	jra	L601
4621  057b               L401:
4622  057b 5f            	clrw	x
4623  057c               L601:
4624  057c 5c            	incw	x
4625  057d 3c0a          	inc	_sensor2_selected
4626  057f b60a          	ld	a,_sensor2_selected
4627  0581 905f          	clrw	y
4628  0583 9097          	ld	yl,a
4629  0585 bf00          	ldw	c_x,x
4630  0587 90b300        	cpw	y,c_x
4631  058a 2d02          	jrsle	L5052
4634  058c 3f0a          	clr	_sensor2_selected
4635  058e               L5052:
4636                     ; 474                 menustate = MENU_IDLE;
4638  058e 3f05          	clr	_menustate
4639  0590 ac820982      	jpf	L7442
4640  0594               L5532:
4641                     ; 478        case MENU_SHOW_VERSION: // Show STC1000p version number
4641                     ; 479             value_to_led(STC1000P_VERSION,LEDS_INT);
4643  0594 4b00          	push	#0
4644  0596 ae00c8        	ldw	x,#200
4645  0599 cd009f        	call	_value_to_led
4647  059c 84            	pop	a
4648                     ; 480 	    led_10 |= LED_DECIMAL;
4650  059d 7216000d      	bset	_led_10,#3
4651                     ; 481             led_1  |= LED_DECIMAL;
4653  05a1 7216000c      	bset	_led_1,#3
4654                     ; 482 	    led_e  &= ~(LED_DEGR | LED_CELS); // clear ° and Celsius symbols
4656  05a5 b600          	ld	a,_led_e
4657  05a7 a49f          	and	a,#159
4658  05a9 b700          	ld	_led_e,a
4659                     ; 483 	    if(!BTN_HELD(BTN_UP | BTN_DOWN)) menustate = MENU_IDLE;
4661  05ab b609          	ld	a,__buttons
4662  05ad a4cc          	and	a,#204
4663  05af a1cc          	cp	a,#204
4664  05b1 2603          	jrne	L631
4665  05b3 cc0982        	jp	L7442
4666  05b6               L631:
4669  05b6 3f05          	clr	_menustate
4670  05b8 ac820982      	jpf	L7442
4671  05bc               L7532:
4672                     ; 486        case MENU_SHOW_STATE_UP: // Show setpoint value
4672                     ; 487 	    if (minutes) // is timing-control in minutes?
4674                     	btst	_minutes
4675  05c1 240a          	jruge	L1152
4676                     ; 488                  value_to_led(setpoint,LEDS_TEMP);
4678  05c3 4b01          	push	#1
4679  05c5 be06          	ldw	x,_setpoint
4680  05c7 cd009f        	call	_value_to_led
4682  05ca 84            	pop	a
4684  05cb 200b          	jra	L3152
4685  05cd               L1152:
4686                     ; 489 	    else value_to_led(eeprom_read_config(EEADR_MENU_ITEM(SP)),LEDS_TEMP);
4688  05cd 4b01          	push	#1
4689  05cf a672          	ld	a,#114
4690  05d1 cd0000        	call	_eeprom_read_config
4692  05d4 cd009f        	call	_value_to_led
4694  05d7 84            	pop	a
4695  05d8               L3152:
4696                     ; 490 	    if(!BTN_HELD(BTN_UP)) menustate = MENU_IDLE;
4698  05d8 b609          	ld	a,__buttons
4699  05da a488          	and	a,#136
4700  05dc a188          	cp	a,#136
4701  05de 2603          	jrne	L041
4702  05e0 cc0982        	jp	L7442
4703  05e3               L041:
4706  05e3 3f05          	clr	_menustate
4707  05e5 ac820982      	jpf	L7442
4708  05e9               L1632:
4709                     ; 493        case MENU_SHOW_STATE_DOWN: // Show Profile-number
4709                     ; 494 	    run_mode = eeprom_read_config(EEADR_MENU_ITEM(rn));
4711  05e9 a684          	ld	a,#132
4712  05eb cd0000        	call	_eeprom_read_config
4714  05ee 01            	rrwa	x,a
4715  05ef 6b02          	ld	(OFST+0,sp),a
4716  05f1 02            	rlwa	x,a
4718                     ; 495             prx_to_led(run_mode,LEDS_RUN_MODE);
4720  05f2 7b02          	ld	a,(OFST+0,sp)
4721  05f4 5f            	clrw	x
4722  05f5 95            	ld	xh,a
4723  05f6 cd0051        	call	_prx_to_led
4725                     ; 496             if ((run_mode < THERMOSTAT_MODE) && (m_countdown == 0))
4727  05f9 7b02          	ld	a,(OFST+0,sp)
4728  05fb a106          	cp	a,#6
4729  05fd 240c          	jruge	L7152
4731  05ff 3d08          	tnz	_m_countdown
4732  0601 2608          	jrne	L7152
4733                     ; 498                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4735  0603 350f0008      	mov	_m_countdown,#15
4736                     ; 499                 menustate   = MENU_SHOW_STATE_DOWN_2;
4738  0607 35040005      	mov	_menustate,#4
4739  060b               L7152:
4740                     ; 501 	    if(!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
4742  060b b609          	ld	a,__buttons
4743  060d a444          	and	a,#68
4744  060f a144          	cp	a,#68
4745  0611 2603          	jrne	L241
4746  0613 cc0982        	jp	L7442
4747  0616               L241:
4750  0616 3f05          	clr	_menustate
4751  0618 ac820982      	jpf	L7442
4752  061c               L3632:
4753                     ; 504        case MENU_SHOW_STATE_DOWN_2: // Show current step number within profile
4753                     ; 505 	    value_to_led(eeprom_read_config(EEADR_MENU_ITEM(St)),LEDS_INT);
4755  061c 4b00          	push	#0
4756  061e a678          	ld	a,#120
4757  0620 cd0000        	call	_eeprom_read_config
4759  0623 cd009f        	call	_value_to_led
4761  0626 84            	pop	a
4762                     ; 506 	    if(m_countdown == 0)
4764  0627 3d08          	tnz	_m_countdown
4765  0629 2608          	jrne	L3252
4766                     ; 508                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4768  062b 350f0008      	mov	_m_countdown,#15
4769                     ; 509                 menustate   = MENU_SHOW_STATE_DOWN_3;
4771  062f 35050005      	mov	_menustate,#5
4772  0633               L3252:
4773                     ; 511 	    if(!BTN_HELD(BTN_DOWN)) menustate = MENU_IDLE;
4775  0633 b609          	ld	a,__buttons
4776  0635 a444          	and	a,#68
4777  0637 a144          	cp	a,#68
4778  0639 2603          	jrne	L441
4779  063b cc0982        	jp	L7442
4780  063e               L441:
4783  063e 3f05          	clr	_menustate
4784  0640 ac820982      	jpf	L7442
4785  0644               L5632:
4786                     ; 514        case MENU_SHOW_STATE_DOWN_3: // Show current duration of running profile
4786                     ; 515             if (minutes) // is timing-control in minutes?
4788                     	btst	_minutes
4789  0649 240a          	jruge	L7252
4790                     ; 516                  value_to_led(curr_dur,LEDS_INT);
4792  064b 4b00          	push	#0
4793  064d be0b          	ldw	x,_curr_dur
4794  064f cd009f        	call	_value_to_led
4796  0652 84            	pop	a
4798  0653 200b          	jra	L1352
4799  0655               L7252:
4800                     ; 517             else value_to_led(eeprom_read_config(EEADR_MENU_ITEM(dh)),LEDS_INT);
4802  0655 4b00          	push	#0
4803  0657 a679          	ld	a,#121
4804  0659 cd0000        	call	_eeprom_read_config
4806  065c cd009f        	call	_value_to_led
4808  065f 84            	pop	a
4809  0660               L1352:
4810                     ; 518             if(m_countdown == 0)
4812  0660 3d08          	tnz	_m_countdown
4813  0662 2608          	jrne	L3352
4814                     ; 520                 m_countdown = TMR_SHOW_PROFILE_ITEM;
4816  0664 350f0008      	mov	_m_countdown,#15
4817                     ; 521                 menustate   = MENU_SHOW_STATE_DOWN;
4819  0668 35030005      	mov	_menustate,#3
4820  066c               L3352:
4821                     ; 523             if(!BTN_HELD(BTN_DOWN))
4823  066c b609          	ld	a,__buttons
4824  066e a444          	and	a,#68
4825  0670 a144          	cp	a,#68
4826  0672 2603          	jrne	L641
4827  0674 cc0982        	jp	L7442
4828  0677               L641:
4829                     ; 525                 menustate = MENU_IDLE;
4831  0677 3f05          	clr	_menustate
4832  0679 ac820982      	jpf	L7442
4833  067d               L7632:
4834                     ; 529        case MENU_SHOW_MENU_ITEM: // S-button was pressed
4834                     ; 530             prx_to_led(menu_item, LEDS_MENU);
4836  067d b606          	ld	a,_menu_item
4837  067f ae0001        	ldw	x,#1
4838  0682 95            	ld	xh,a
4839  0683 cd0051        	call	_prx_to_led
4841                     ; 531             m_countdown = TMR_NO_KEY_TIMEOUT;
4843  0686 35960008      	mov	_m_countdown,#150
4844                     ; 532             menustate   = MENU_SET_MENU_ITEM;
4846  068a 35080005      	mov	_menustate,#8
4847                     ; 533             break; // MENU_SHOW_MENU_ITEM
4849  068e ac820982      	jpf	L7442
4850  0692               L1732:
4851                     ; 535        case MENU_SET_MENU_ITEM:
4851                     ; 536             if(m_countdown == 0 || BTN_RELEASED(BTN_PWR))
4853  0692 3d08          	tnz	_m_countdown
4854  0694 2708          	jreq	L1452
4856  0696 b609          	ld	a,__buttons
4857  0698 a422          	and	a,#34
4858  069a a120          	cp	a,#32
4859  069c 2606          	jrne	L7352
4860  069e               L1452:
4861                     ; 538                 menustate = MENU_IDLE;
4863  069e 3f05          	clr	_menustate
4865  06a0 ac820982      	jpf	L7442
4866  06a4               L7352:
4867                     ; 539             } else if(BTN_RELEASED(BTN_UP))
4869  06a4 b609          	ld	a,__buttons
4870  06a6 a488          	and	a,#136
4871  06a8 a180          	cp	a,#128
4872  06aa 2612          	jrne	L5452
4873                     ; 541                 if(++menu_item > MENU_ITEM_NO) menu_item = 0;
4875  06ac 3c06          	inc	_menu_item
4876  06ae b606          	ld	a,_menu_item
4877  06b0 a107          	cp	a,#7
4878  06b2 2502          	jrult	L7452
4881  06b4 3f06          	clr	_menu_item
4882  06b6               L7452:
4883                     ; 542                 menustate = MENU_SHOW_MENU_ITEM;
4885  06b6 35070005      	mov	_menustate,#7
4887  06ba ac820982      	jpf	L7442
4888  06be               L5452:
4889                     ; 543             } else if(BTN_RELEASED(BTN_DOWN))
4891  06be b609          	ld	a,__buttons
4892  06c0 a444          	and	a,#68
4893  06c2 a140          	cp	a,#64
4894  06c4 2614          	jrne	L3552
4895                     ; 545                 if(--menu_item > MENU_ITEM_NO) menu_item = MENU_ITEM_NO;
4897  06c6 3a06          	dec	_menu_item
4898  06c8 b606          	ld	a,_menu_item
4899  06ca a107          	cp	a,#7
4900  06cc 2504          	jrult	L5552
4903  06ce 35060006      	mov	_menu_item,#6
4904  06d2               L5552:
4905                     ; 546                 menustate = MENU_SHOW_MENU_ITEM;
4907  06d2 35070005      	mov	_menustate,#7
4909  06d6 ac820982      	jpf	L7442
4910  06da               L3552:
4911                     ; 547             } else if(BTN_RELEASED(BTN_S))
4913  06da b609          	ld	a,__buttons
4914  06dc a411          	and	a,#17
4915  06de a110          	cp	a,#16
4916  06e0 2703          	jreq	L051
4917  06e2 cc0982        	jp	L7442
4918  06e5               L051:
4919                     ; 549                 config_item = 0;
4921  06e5 3f07          	clr	_config_item
4922                     ; 550                 menustate   = MENU_SHOW_CONFIG_ITEM;
4924  06e7 35090005      	mov	_menustate,#9
4925  06eb ac820982      	jpf	L7442
4926  06ef               L3732:
4927                     ; 554        case MENU_SHOW_CONFIG_ITEM: // S-button is released
4927                     ; 555 	    led_e &= ~(LED_NEG | LED_DEGR | LED_CELS); // clear negative, ° and Celsius symbols
4929  06ef b600          	ld	a,_led_e
4930  06f1 a41f          	and	a,#31
4931  06f3 b700          	ld	_led_e,a
4932                     ; 557 	    if(menu_item < MENU_ITEM_NO)
4934  06f5 b606          	ld	a,_menu_item
4935  06f7 a106          	cp	a,#6
4936  06f9 2424          	jruge	L3652
4937                     ; 559                 if(config_item & 0x1) 
4939  06fb b607          	ld	a,_config_item
4940  06fd a501          	bcp	a,#1
4941  06ff 270a          	jreq	L5652
4942                     ; 561                     led_10 = LED_d; // duration: 2nd value of a profile-step
4944  0701 35d3000d      	mov	_led_10,#211
4945                     ; 562                     led_1  = LED_h;
4947  0705 3571000c      	mov	_led_1,#113
4949  0709 2008          	jra	L7652
4950  070b               L5652:
4951                     ; 564                     led_10 = LED_S; // setpoint: 1st value of a profile-step
4953  070b 35b5000d      	mov	_led_10,#181
4954                     ; 565                     led_1  = LED_P;
4956  070f 3576000c      	mov	_led_1,#118
4957  0713               L7652:
4958                     ; 567                 led_01 = led_lookup[(config_item >> 1)];
4960  0713 b607          	ld	a,_config_item
4961  0715 44            	srl	a
4962  0716 5f            	clrw	x
4963  0717 97            	ld	xl,a
4964  0718 d60000        	ld	a,(_led_lookup,x)
4965  071b b70b          	ld	_led_01,a
4967  071d 2021          	jra	L1752
4968  071f               L3652:
4969                     ; 570                 led_10 = menu[config_item].led_c_10;
4971  071f b607          	ld	a,_config_item
4972  0721 97            	ld	xl,a
4973  0722 a604          	ld	a,#4
4974  0724 42            	mul	x,a
4975  0725 d6000a        	ld	a,(_menu,x)
4976  0728 b70d          	ld	_led_10,a
4977                     ; 571                 led_1  = menu[config_item].led_c_1;
4979  072a b607          	ld	a,_config_item
4980  072c 97            	ld	xl,a
4981  072d a604          	ld	a,#4
4982  072f 42            	mul	x,a
4983  0730 d6000b        	ld	a,(_menu+1,x)
4984  0733 b70c          	ld	_led_1,a
4985                     ; 572                 led_01 = menu[config_item].led_c_01;
4987  0735 b607          	ld	a,_config_item
4988  0737 97            	ld	xl,a
4989  0738 a604          	ld	a,#4
4990  073a 42            	mul	x,a
4991  073b d6000c        	ld	a,(_menu+2,x)
4992  073e b70b          	ld	_led_01,a
4993  0740               L1752:
4994                     ; 574 	    m_countdown = TMR_NO_KEY_TIMEOUT;
4996  0740 35960008      	mov	_m_countdown,#150
4997                     ; 575 	    menustate   = MENU_SET_CONFIG_ITEM;
4999  0744 350a0005      	mov	_menustate,#10
5000                     ; 576 	    break;
5002  0748 ac820982      	jpf	L7442
5003  074c               L5732:
5004                     ; 578        case MENU_SET_CONFIG_ITEM:
5004                     ; 579 	    if(m_countdown == 0)
5006  074c 3d08          	tnz	_m_countdown
5007  074e 2606          	jrne	L3752
5008                     ; 581                 menustate = MENU_IDLE;
5010  0750 3f05          	clr	_menustate
5012  0752 ac820982      	jpf	L7442
5013  0756               L3752:
5014                     ; 582 	    } else if(BTN_RELEASED(BTN_PWR))
5016  0756 b609          	ld	a,__buttons
5017  0758 a422          	and	a,#34
5018  075a a120          	cp	a,#32
5019  075c 2608          	jrne	L7752
5020                     ; 584                 menustate = MENU_SHOW_MENU_ITEM;
5022  075e 35070005      	mov	_menustate,#7
5024  0762 ac820982      	jpf	L7442
5025  0766               L7752:
5026                     ; 585             } else if(BTN_RELEASED(BTN_UP))
5028  0766 b609          	ld	a,__buttons
5029  0768 a488          	and	a,#136
5030  076a a180          	cp	a,#128
5031  076c 2624          	jrne	L3062
5032                     ; 587                 config_item++;
5034  076e 3c07          	inc	_config_item
5035                     ; 588                 if(menu_item < MENU_ITEM_NO)
5037  0770 b606          	ld	a,_menu_item
5038  0772 a106          	cp	a,#6
5039  0774 240a          	jruge	L5062
5040                     ; 590                     if(config_item >= PROFILE_SIZE)
5042  0776 b607          	ld	a,_config_item
5043  0778 a113          	cp	a,#19
5044  077a 250e          	jrult	L1162
5045                     ; 592                         config_item = 0;
5047  077c 3f07          	clr	_config_item
5048  077e 200a          	jra	L1162
5049  0780               L5062:
5050                     ; 595                     if(config_item >= MENU_SIZE)
5052  0780 b607          	ld	a,_config_item
5053  0782 a113          	cp	a,#19
5054  0784 2532          	jrult	L7732
5055                     ; 597                         config_item = 0;
5057  0786 3f07          	clr	_config_item
5058  0788 202e          	jra	L7732
5059  078a               L1162:
5060                     ; 603                 menustate = MENU_SHOW_CONFIG_ITEM;
5062  078a 35090005      	mov	_menustate,#9
5064  078e ac820982      	jpf	L7442
5065  0792               L3062:
5066                     ; 604             } else if(BTN_RELEASED(BTN_DOWN))
5068  0792 b609          	ld	a,__buttons
5069  0794 a444          	and	a,#68
5070  0796 a140          	cp	a,#64
5071  0798 264d          	jrne	L7162
5072                     ; 606                 config_item--;
5074  079a 3a07          	dec	_config_item
5075                     ; 607                 if(menu_item < MENU_ITEM_NO)
5077  079c b606          	ld	a,_menu_item
5078  079e a106          	cp	a,#6
5079  07a0 240c          	jruge	L1262
5080                     ; 609                     if(config_item >= PROFILE_SIZE)
5082  07a2 b607          	ld	a,_config_item
5083  07a4 a113          	cp	a,#19
5084  07a6 2537          	jrult	L5262
5085                     ; 611                         config_item = PROFILE_SIZE-1;
5087  07a8 35120007      	mov	_config_item,#18
5088  07ac 2031          	jra	L5262
5089  07ae               L1262:
5090                     ; 614                     if(config_item > MENU_SIZE-1)
5092  07ae b607          	ld	a,_config_item
5093  07b0 a113          	cp	a,#19
5094  07b2 2504          	jrult	L7732
5095                     ; 616                         config_item = MENU_SIZE-1;
5097  07b4 35120007      	mov	_config_item,#18
5098  07b8               L7732:
5099                     ; 618             chk_skip_menu_item: // label for goto
5099                     ; 619                     if (!minutes && ((uint8_t)eeprom_read_config(EEADR_MENU_ITEM(rn)) >= THERMOSTAT_MODE))
5101                     	btst	_minutes
5102  07bd 2520          	jrult	L5262
5104  07bf a684          	ld	a,#132
5105  07c1 cd0000        	call	_eeprom_read_config
5107  07c4 9f            	ld	a,xl
5108  07c5 a106          	cp	a,#6
5109  07c7 2516          	jrult	L5262
5110                     ; 621                         if (config_item == St)
5112  07c9 b607          	ld	a,_config_item
5113  07cb a106          	cp	a,#6
5114  07cd 2606          	jrne	L3362
5115                     ; 623                             config_item += 2;
5117  07cf 3c07          	inc	_config_item
5118  07d1 3c07          	inc	_config_item
5120  07d3 200a          	jra	L5262
5121  07d5               L3362:
5122                     ; 624                         }else if (config_item == dh)
5124  07d5 b607          	ld	a,_config_item
5125  07d7 a107          	cp	a,#7
5126  07d9 2604          	jrne	L5262
5127                     ; 626                             config_item -= 2;
5129  07db 3a07          	dec	_config_item
5130  07dd 3a07          	dec	_config_item
5131  07df               L5262:
5132                     ; 630                 menustate = MENU_SHOW_CONFIG_ITEM;
5134  07df 35090005      	mov	_menustate,#9
5136  07e3 ac820982      	jpf	L7442
5137  07e7               L7162:
5138                     ; 631             } else if(BTN_RELEASED(BTN_S))
5140  07e7 b609          	ld	a,__buttons
5141  07e9 a411          	and	a,#17
5142  07eb a110          	cp	a,#16
5143  07ed 2703          	jreq	L251
5144  07ef cc0982        	jp	L7442
5145  07f2               L251:
5146                     ; 633                 adr          = MI_CI_TO_EEADR(menu_item, config_item);
5148  07f2 b606          	ld	a,_menu_item
5149  07f4 97            	ld	xl,a
5150  07f5 a613          	ld	a,#19
5151  07f7 42            	mul	x,a
5152  07f8 9f            	ld	a,xl
5153  07f9 bb07          	add	a,_config_item
5154  07fb 6b01          	ld	(OFST-1,sp),a
5156                     ; 634                 config_value = eeprom_read_config(adr);
5158  07fd 7b01          	ld	a,(OFST-1,sp)
5159  07ff cd0000        	call	_eeprom_read_config
5161  0802 bf09          	ldw	_config_value,x
5162                     ; 635                 config_value = check_config_value(config_value, adr);
5164  0804 7b01          	ld	a,(OFST-1,sp)
5165  0806 88            	push	a
5166  0807 be09          	ldw	x,_config_value
5167  0809 cd029c        	call	_check_config_value
5169  080c 84            	pop	a
5170  080d bf09          	ldw	_config_value,x
5171                     ; 636                 m_countdown  = TMR_NO_KEY_TIMEOUT;
5173  080f 35960008      	mov	_m_countdown,#150
5174                     ; 637                 menustate    = MENU_SHOW_CONFIG_VALUE;
5176  0813 350b0005      	mov	_menustate,#11
5177  0817 ac820982      	jpf	L7442
5178  081b               L1042:
5179                     ; 641        case MENU_SHOW_CONFIG_VALUE:
5179                     ; 642             if(menu_item < MENU_ITEM_NO)
5181  081b b606          	ld	a,_menu_item
5182  081d a106          	cp	a,#6
5183  081f 2414          	jruge	L5462
5184                     ; 644                 value_to_led(config_value, (config_item & 0x1) ? LEDS_INT : LEDS_TEMP);
5186  0821 b607          	ld	a,_config_item
5187  0823 a501          	bcp	a,#1
5188  0825 2703          	jreq	L011
5189  0827 4f            	clr	a
5190  0828 2002          	jra	L211
5191  082a               L011:
5192  082a a601          	ld	a,#1
5193  082c               L211:
5194  082c 88            	push	a
5195  082d be09          	ldw	x,_config_value
5196  082f cd009f        	call	_value_to_led
5198  0832 84            	pop	a
5200  0833 2032          	jra	L7462
5201  0835               L5462:
5202                     ; 647                 type = menu[config_item].type;
5204  0835 b607          	ld	a,_config_item
5205  0837 97            	ld	xl,a
5206  0838 a604          	ld	a,#4
5207  083a 42            	mul	x,a
5208  083b d6000d        	ld	a,(_menu+3,x)
5209  083e 6b02          	ld	(OFST+0,sp),a
5211                     ; 648                 if(MENU_TYPE_IS_TEMPERATURE(type))
5213  0840 7b02          	ld	a,(OFST+0,sp)
5214  0842 a105          	cp	a,#5
5215  0844 240a          	jruge	L1562
5216                     ; 650                     value_to_led(config_value,LEDS_TEMP);
5218  0846 4b01          	push	#1
5219  0848 be09          	ldw	x,_config_value
5220  084a cd009f        	call	_value_to_led
5222  084d 84            	pop	a
5224  084e 2017          	jra	L7462
5225  0850               L1562:
5226                     ; 651                 } else if (type == t_runmode)
5228  0850 7b02          	ld	a,(OFST+0,sp)
5229  0852 a107          	cp	a,#7
5230  0854 2609          	jrne	L5562
5231                     ; 653                     prx_to_led(config_value,LEDS_RUN_MODE);
5233  0856 b60a          	ld	a,_config_value+1
5234  0858 5f            	clrw	x
5235  0859 95            	ld	xh,a
5236  085a cd0051        	call	_prx_to_led
5239  085d 2008          	jra	L7462
5240  085f               L5562:
5241                     ; 655                     value_to_led(config_value,LEDS_INT);
5243  085f 4b00          	push	#0
5244  0861 be09          	ldw	x,_config_value
5245  0863 cd009f        	call	_value_to_led
5247  0866 84            	pop	a
5248  0867               L7462:
5249                     ; 658             m_countdown  = TMR_NO_KEY_TIMEOUT;
5251  0867 35960008      	mov	_m_countdown,#150
5252                     ; 659             menustate    = MENU_SET_CONFIG_VALUE;
5254  086b 350c0005      	mov	_menustate,#12
5255                     ; 660             break;
5257  086f ac820982      	jpf	L7442
5258  0873               L3042:
5259                     ; 662        case MENU_SET_CONFIG_VALUE:
5259                     ; 663             adr = MI_CI_TO_EEADR(menu_item, config_item);
5261  0873 b606          	ld	a,_menu_item
5262  0875 97            	ld	xl,a
5263  0876 a613          	ld	a,#19
5264  0878 42            	mul	x,a
5265  0879 9f            	ld	a,xl
5266  087a bb07          	add	a,_config_item
5267  087c 6b01          	ld	(OFST-1,sp),a
5269                     ; 664             if (m_countdown == 0)
5271  087e 3d08          	tnz	_m_countdown
5272  0880 2606          	jrne	L1662
5273                     ; 666                 menustate = MENU_IDLE;
5275  0882 3f05          	clr	_menustate
5277  0884 ac820982      	jpf	L7442
5278  0888               L1662:
5279                     ; 667             } else if (BTN_RELEASED(BTN_PWR))
5281  0888 b609          	ld	a,__buttons
5282  088a a422          	and	a,#34
5283  088c a120          	cp	a,#32
5284  088e 2608          	jrne	L5662
5285                     ; 669                 menustate = MENU_SHOW_CONFIG_ITEM;
5287  0890 35090005      	mov	_menustate,#9
5289  0894 ac820982      	jpf	L7442
5290  0898               L5662:
5291                     ; 670             } else if(BTN_HELD_OR_RELEASED(BTN_UP)) 
5293  0898 b609          	ld	a,__buttons
5294  089a a488          	and	a,#136
5295  089c a5f0          	bcp	a,#240
5296  089e 271d          	jreq	L1762
5297                     ; 672                 config_value++;
5299  08a0 be09          	ldw	x,_config_value
5300  08a2 1c0001        	addw	x,#1
5301  08a5 bf09          	ldw	_config_value,x
5302                     ; 673                 if ((config_value > 1000) || (--key_held_tmr < 0))
5304  08a7 9c            	rvf
5305  08a8 be09          	ldw	x,_config_value
5306  08aa a303e9        	cpw	x,#1001
5307  08ad 2e05          	jrsge	L5762
5309  08af 9c            	rvf
5310  08b0 3a08          	dec	_key_held_tmr
5311  08b2 2e2c          	jrsge	L5042
5312  08b4               L5762:
5313                     ; 675                     config_value += 9;
5315  08b4 be09          	ldw	x,_config_value
5316  08b6 1c0009        	addw	x,#9
5317  08b9 bf09          	ldw	_config_value,x
5318  08bb 2023          	jra	L5042
5319  08bd               L1762:
5320                     ; 679             } else if(BTN_HELD_OR_RELEASED(BTN_DOWN)) 
5322  08bd b609          	ld	a,__buttons
5323  08bf a444          	and	a,#68
5324  08c1 a5f0          	bcp	a,#240
5325  08c3 272d          	jreq	L1072
5326                     ; 681                 config_value--;
5328  08c5 be09          	ldw	x,_config_value
5329  08c7 1d0001        	subw	x,#1
5330  08ca bf09          	ldw	_config_value,x
5331                     ; 682                 if ((config_value > 1000) || (--key_held_tmr < 0))
5333  08cc 9c            	rvf
5334  08cd be09          	ldw	x,_config_value
5335  08cf a303e9        	cpw	x,#1001
5336  08d2 2e05          	jrsge	L5072
5338  08d4 9c            	rvf
5339  08d5 3a08          	dec	_key_held_tmr
5340  08d7 2e07          	jrsge	L5042
5341  08d9               L5072:
5342                     ; 684                     config_value -= 9;
5344  08d9 be09          	ldw	x,_config_value
5345  08db 1d0009        	subw	x,#9
5346  08de bf09          	ldw	_config_value,x
5347  08e0               L5042:
5348                     ; 686             chk_cfg_acc_label: // label for goto
5348                     ; 687                 config_value = check_config_value(config_value, adr);
5350  08e0 7b01          	ld	a,(OFST-1,sp)
5351  08e2 88            	push	a
5352  08e3 be09          	ldw	x,_config_value
5353  08e5 cd029c        	call	_check_config_value
5355  08e8 84            	pop	a
5356  08e9 bf09          	ldw	_config_value,x
5357                     ; 688                 menustate    = MENU_SHOW_CONFIG_VALUE;
5359  08eb 350b0005      	mov	_menustate,#11
5361  08ef cc0982        	jra	L7442
5362  08f2               L1072:
5363                     ; 689             } else if(BTN_RELEASED(BTN_S))
5365  08f2 b609          	ld	a,__buttons
5366  08f4 a411          	and	a,#17
5367  08f6 a110          	cp	a,#16
5368  08f8 2703cc097a    	jrne	L1172
5369                     ; 691                 if(menu_item == MENU_ITEM_NO)
5371  08fd b606          	ld	a,_menu_item
5372  08ff a106          	cp	a,#6
5373  0901 2668          	jrne	L3172
5374                     ; 693                     if(config_item == rn)
5376  0903 b607          	ld	a,_config_item
5377  0905 a112          	cp	a,#18
5378  0907 2662          	jrne	L3172
5379                     ; 695                         eeprom_write_config(EEADR_MENU_ITEM(St), 0);
5381  0909 5f            	clrw	x
5382  090a 89            	pushw	x
5383  090b a678          	ld	a,#120
5384  090d cd0000        	call	_eeprom_write_config
5386  0910 85            	popw	x
5387                     ; 696                         if (minutes)
5389                     	btst	_minutes
5390  0916 2405          	jruge	L7172
5391                     ; 697                              curr_dur = 0;
5393  0918 5f            	clrw	x
5394  0919 bf0b          	ldw	_curr_dur,x
5396  091b 2008          	jra	L1272
5397  091d               L7172:
5398                     ; 698                         else eeprom_write_config(EEADR_MENU_ITEM(dh), 0);
5400  091d 5f            	clrw	x
5401  091e 89            	pushw	x
5402  091f a679          	ld	a,#121
5403  0921 cd0000        	call	_eeprom_write_config
5405  0924 85            	popw	x
5406  0925               L1272:
5407                     ; 699                         if(config_value < THERMOSTAT_MODE)
5409  0925 9c            	rvf
5410  0926 be09          	ldw	x,_config_value
5411  0928 a30006        	cpw	x,#6
5412  092b 2e3e          	jrsge	L3172
5413                     ; 701                             eeadr_sp = EEADR_PROFILE_SETPOINT(((uint8_t)config_value), 0);
5415  092d b60a          	ld	a,_config_value+1
5416  092f 97            	ld	xl,a
5417  0930 a613          	ld	a,#19
5418  0932 42            	mul	x,a
5419  0933 9f            	ld	a,xl
5420  0934 6b02          	ld	(OFST+0,sp),a
5422                     ; 703                             if (minutes)
5424                     	btst	_minutes
5425  093b 2412          	jruge	L5272
5426                     ; 705                                 setpoint = eeprom_read_config(eeadr_sp);
5428  093d 7b02          	ld	a,(OFST+0,sp)
5429  093f cd0000        	call	_eeprom_read_config
5431  0942 bf06          	ldw	_setpoint,x
5432                     ; 706                                 eeprom_write_config(EEADR_MENU_ITEM(SP), setpoint);
5434  0944 be06          	ldw	x,_setpoint
5435  0946 89            	pushw	x
5436  0947 a672          	ld	a,#114
5437  0949 cd0000        	call	_eeprom_write_config
5439  094c 85            	popw	x
5441  094d 200c          	jra	L7272
5442  094f               L5272:
5443                     ; 708                                 eeprom_write_config(EEADR_MENU_ITEM(SP), eeprom_read_config(eeadr_sp));
5445  094f 7b02          	ld	a,(OFST+0,sp)
5446  0951 cd0000        	call	_eeprom_read_config
5448  0954 89            	pushw	x
5449  0955 a672          	ld	a,#114
5450  0957 cd0000        	call	_eeprom_write_config
5452  095a 85            	popw	x
5453  095b               L7272:
5454                     ; 711                             if(eeprom_read_config(eeadr_sp+1) == 0)
5456  095b 7b02          	ld	a,(OFST+0,sp)
5457  095d 4c            	inc	a
5458  095e cd0000        	call	_eeprom_read_config
5460  0961 a30000        	cpw	x,#0
5461  0964 2605          	jrne	L3172
5462                     ; 713                                 config_value = THERMOSTAT_MODE;
5464  0966 ae0006        	ldw	x,#6
5465  0969 bf09          	ldw	_config_value,x
5466  096b               L3172:
5467                     ; 718                 eeprom_write_config(adr, config_value);
5469  096b be09          	ldw	x,_config_value
5470  096d 89            	pushw	x
5471  096e 7b03          	ld	a,(OFST+1,sp)
5472  0970 cd0000        	call	_eeprom_write_config
5474  0973 85            	popw	x
5475                     ; 719                 menustate = MENU_SHOW_CONFIG_ITEM;
5477  0974 35090005      	mov	_menustate,#9
5479  0978 2008          	jra	L7442
5480  097a               L1172:
5481                     ; 722                 key_held_tmr = TMR_KEY_ACC; 
5483  097a 35140008      	mov	_key_held_tmr,#20
5484  097e 2002          	jra	L7442
5485  0980               L7042:
5486                     ; 726        default:
5486                     ; 727             menustate = MENU_IDLE;
5488  0980 3f05          	clr	_menustate
5489                     ; 728             break;
5491  0982               L7442:
5492                     ; 730    menu_is_idle = (menustate == MENU_IDLE); // needed for ctrl_task()
5494  0982 3d05          	tnz	_menustate
5495  0984 2702          	jreq	L451
5496  0986 2006          	jp	L021
5497  0988               L451:
5498  0988 72100000      	bset	_menu_is_idle
5499  098c 2004          	jra	L221
5500  098e               L021:
5501  098e 72110000      	bres	_menu_is_idle
5502  0992               L221:
5503                     ; 731 } // button_menu_fsm()
5506  0992 85            	popw	x
5507  0993 81            	ret
5698                     ; 738 uint16_t min_to_sec(enum menu_enum x)
5698                     ; 739 {
5699                     	switch	.text
5700  0994               _min_to_sec:
5702  0994 89            	pushw	x
5703       00000002      OFST:	set	2
5706                     ; 742     retv = eeprom_read_config(EEADR_MENU_ITEM(x)) << 6; // * 64
5708  0995 ab72          	add	a,#114
5709  0997 cd0000        	call	_eeprom_read_config
5711  099a 58            	sllw	x
5712  099b 58            	sllw	x
5713  099c 58            	sllw	x
5714  099d 58            	sllw	x
5715  099e 58            	sllw	x
5716  099f 58            	sllw	x
5717  09a0 1f01          	ldw	(OFST-1,sp),x
5719                     ; 743     retv = retv - (retv >> 4); // 64 - 4 = 60
5721  09a2 1e01          	ldw	x,(OFST-1,sp)
5722  09a4 54            	srlw	x
5723  09a5 54            	srlw	x
5724  09a6 54            	srlw	x
5725  09a7 54            	srlw	x
5726  09a8 72f001        	subw	x,(OFST-1,sp)
5727  09ab 50            	negw	x
5728  09ac 1f01          	ldw	(OFST-1,sp),x
5730                     ; 744     return retv;
5732  09ae 1e01          	ldw	x,(OFST-1,sp)
5735  09b0 5b02          	addw	sp,#2
5736  09b2 81            	ret
5766                     ; 752 void init_temp_delays(void)
5766                     ; 753 {
5767                     	switch	.text
5768  09b3               _init_temp_delays:
5772                     ; 754     if (!minutes) setpoint = eeprom_read_config(EEADR_MENU_ITEM(SP));
5774                     	btst	_minutes
5775  09b8 2507          	jrult	L3403
5778  09ba a672          	ld	a,#114
5779  09bc cd0000        	call	_eeprom_read_config
5781  09bf bf06          	ldw	_setpoint,x
5782  09c1               L3403:
5783                     ; 755     hysteresis  = eeprom_read_config(EEADR_MENU_ITEM(hy));
5785  09c1 a673          	ld	a,#115
5786  09c3 cd0000        	call	_eeprom_read_config
5788  09c6 bf04          	ldw	_hysteresis,x
5789                     ; 756     hysteresis2 = eeprom_read_config(EEADR_MENU_ITEM(hy2));
5791  09c8 a674          	ld	a,#116
5792  09ca cd0000        	call	_eeprom_read_config
5794  09cd bf02          	ldw	_hysteresis2,x
5795                     ; 758     if (cooling_delay) cooling_delay--;
5797  09cf be01          	ldw	x,_cooling_delay
5798  09d1 2707          	jreq	L5403
5801  09d3 be01          	ldw	x,_cooling_delay
5802  09d5 1d0001        	subw	x,#1
5803  09d8 bf01          	ldw	_cooling_delay,x
5804  09da               L5403:
5805                     ; 759     if (heating_delay) heating_delay--;
5807  09da be03          	ldw	x,_heating_delay
5808  09dc 2707          	jreq	L7403
5811  09de be03          	ldw	x,_heating_delay
5812  09e0 1d0001        	subw	x,#1
5813  09e3 bf03          	ldw	_heating_delay,x
5814  09e5               L7403:
5815                     ; 760 } // init_temp_delays()
5818  09e5 81            	ret
5844                     ; 767 void enable_cooling(void)
5844                     ; 768 {
5845                     	switch	.text
5846  09e6               _enable_cooling:
5850                     ; 769      if (cooling_delay) 
5852  09e6 be01          	ldw	x,_cooling_delay
5853  09e8 2706          	jreq	L1603
5854                     ; 770          led_e ^= LED_COOL; // Flash to indicate cooling delay
5856  09ea 90140000      	bcpl	_led_e,#2
5858  09ee 2008          	jra	L3603
5859  09f0               L1603:
5860                     ; 773          COOL_ON; // Enable Cooling
5862  09f0 72145000      	bset	_PA_ODR,#2
5863                     ; 774          led_e |= LED_COOL;
5865  09f4 72140000      	bset	_led_e,#2
5866  09f8               L3603:
5867                     ; 776 } // enable_cooling()
5870  09f8 81            	ret
5896                     ; 783 void enable_heating(void)
5896                     ; 784 {
5897                     	switch	.text
5898  09f9               _enable_heating:
5902                     ; 785      if (heating_delay) 
5904  09f9 be03          	ldw	x,_heating_delay
5905  09fb 2706          	jreq	L5703
5906                     ; 786          led_e ^= LED_HEAT; // Flash to indicate heating delay
5908  09fd 90100000      	bcpl	_led_e,#0
5910  0a01 2008          	jra	L7703
5911  0a03               L5703:
5912                     ; 789          HEAT_ON; // Enable Cooling
5914  0a03 72125000      	bset	_PA_ODR,#1
5915                     ; 790          led_e |= LED_HEAT;
5917  0a07 72100000      	bset	_led_e,#0
5918  0a0b               L7703:
5919                     ; 792 } // enable_heating()
5922  0a0b 81            	ret
5962                     ; 800 void temperature_control(void)
5962                     ; 801 {
5963                     	switch	.text
5964  0a0c               _temperature_control:
5968                     ; 802     init_temp_delays(); // Initialise Heating and Cooling delay
5970  0a0c ada5          	call	_init_temp_delays
5972                     ; 805     if (!pwr_on ||
5972                     ; 806        (COOL_STATUS && (temp_ntc1 <= setpoint || (probe2 && (temp_ntc2 < (setpoint - hysteresis2))))) || 
5972                     ; 807        (HEAT_STATUS && (temp_ntc1 >= setpoint || (probe2 && (temp_ntc2 > (setpoint + hysteresis2))))))
5974                     	btst	_pwr_on
5975  0a13 2444          	jruge	L3113
5977  0a15 c65001        	ld	a,_PA_IDR
5978  0a18 a404          	and	a,#4
5979  0a1a a104          	cp	a,#4
5980  0a1c 2619          	jrne	L7113
5982  0a1e 9c            	rvf
5983  0a1f be00          	ldw	x,_temp_ntc1
5984  0a21 b306          	cpw	x,_setpoint
5985  0a23 2d34          	jrsle	L3113
5987                     	btst	_probe2
5988  0a2a 240b          	jruge	L7113
5990  0a2c 9c            	rvf
5991  0a2d be06          	ldw	x,_setpoint
5992  0a2f 72b00002      	subw	x,_hysteresis2
5993  0a33 b300          	cpw	x,_temp_ntc2
5994  0a35 2c22          	jrsgt	L3113
5995  0a37               L7113:
5997  0a37 c65001        	ld	a,_PA_IDR
5998  0a3a a402          	and	a,#2
5999  0a3c a102          	cp	a,#2
6000  0a3e 2636          	jrne	L1113
6002  0a40 9c            	rvf
6003  0a41 be00          	ldw	x,_temp_ntc1
6004  0a43 b306          	cpw	x,_setpoint
6005  0a45 2e12          	jrsge	L3113
6007                     	btst	_probe2
6008  0a4c 2428          	jruge	L1113
6010  0a4e 9c            	rvf
6011  0a4f be06          	ldw	x,_setpoint
6012  0a51 72bb0002      	addw	x,_hysteresis2
6013  0a55 b300          	cpw	x,_temp_ntc2
6014  0a57 2e1d          	jrsge	L1113
6015  0a59               L3113:
6016                     ; 809         cooling_delay = min_to_sec(cd);
6018  0a59 a608          	ld	a,#8
6019  0a5b cd0994        	call	_min_to_sec
6021  0a5e bf01          	ldw	_cooling_delay,x
6022                     ; 810         heating_delay = min_to_sec(hd);
6024  0a60 a609          	ld	a,#9
6025  0a62 cd0994        	call	_min_to_sec
6027  0a65 bf03          	ldw	_heating_delay,x
6028                     ; 811 	RELAYS_OFF; // Disable Cooling and Heating relays
6030  0a67 c65000        	ld	a,_PA_ODR
6031  0a6a a4f9          	and	a,#249
6032  0a6c c75000        	ld	_PA_ODR,a
6033                     ; 812         led_e &= ~(LED_HEAT | LED_COOL); // disable both LEDs
6035  0a6f b600          	ld	a,_led_e
6036  0a71 a4fa          	and	a,#250
6037  0a73 b700          	ld	_led_e,a
6039  0a75               L5213:
6040                     ; 824 } // temperature_control()
6043  0a75 81            	ret
6044  0a76               L1113:
6045                     ; 814     else if (!HEAT_STATUS && !COOL_STATUS) 
6047  0a76 c65001        	ld	a,_PA_IDR
6048  0a79 a402          	and	a,#2
6049  0a7b a102          	cp	a,#2
6050  0a7d 27f6          	jreq	L5213
6052  0a7f c65001        	ld	a,_PA_IDR
6053  0a82 a404          	and	a,#4
6054  0a84 a104          	cp	a,#4
6055  0a86 27ed          	jreq	L5213
6056                     ; 816 	hysteresis2 >>= 2; // Divide hysteresis2 by 2
6058  0a88 a602          	ld	a,#2
6059  0a8a               L071:
6060  0a8a 3702          	sra	_hysteresis2
6061  0a8c 3603          	rrc	_hysteresis2+1
6062  0a8e 4a            	dec	a
6063  0a8f 26f9          	jrne	L071
6064                     ; 817 	if ((temp_ntc1 > setpoint + hysteresis) && (!probe2 || (temp_ntc2 >= setpoint - hysteresis2))) 
6066  0a91 9c            	rvf
6067  0a92 be06          	ldw	x,_setpoint
6068  0a94 72bb0004      	addw	x,_hysteresis
6069  0a98 b300          	cpw	x,_temp_ntc1
6070  0a9a 2e17          	jrsge	L1313
6072                     	btst	_probe2
6073  0aa1 240b          	jruge	L3313
6075  0aa3 9c            	rvf
6076  0aa4 be06          	ldw	x,_setpoint
6077  0aa6 72b00002      	subw	x,_hysteresis2
6078  0aaa b300          	cpw	x,_temp_ntc2
6079  0aac 2c05          	jrsgt	L1313
6080  0aae               L3313:
6081                     ; 818              enable_cooling(); // switch cooling relay
6083  0aae cd09e6        	call	_enable_cooling
6086  0ab1 2004          	jra	L5313
6087  0ab3               L1313:
6088                     ; 819         else led_e &= ~LED_COOL;
6090  0ab3 72150000      	bres	_led_e,#2
6091  0ab7               L5313:
6092                     ; 820 	if ((temp_ntc1 < setpoint - hysteresis) && (probe2 || (temp_ntc2 <= setpoint + hysteresis2))) 
6094  0ab7 9c            	rvf
6095  0ab8 be06          	ldw	x,_setpoint
6096  0aba 72b00004      	subw	x,_hysteresis
6097  0abe b300          	cpw	x,_temp_ntc1
6098  0ac0 2d17          	jrsle	L7313
6100                     	btst	_probe2
6101  0ac7 250b          	jrult	L1413
6103  0ac9 9c            	rvf
6104  0aca be06          	ldw	x,_setpoint
6105  0acc 72bb0002      	addw	x,_hysteresis2
6106  0ad0 b300          	cpw	x,_temp_ntc2
6107  0ad2 2f05          	jrslt	L7313
6108  0ad4               L1413:
6109                     ; 821 	    enable_heating(); // switch heating relay
6111  0ad4 cd09f9        	call	_enable_heating
6114  0ad7 209c          	jra	L5213
6115  0ad9               L7313:
6116                     ; 822 	else led_e &= ~LED_HEAT;
6118  0ad9 72110000      	bres	_led_e,#0
6119  0add 2096          	jra	L5213
6122                     	bsct
6123  000f               L5413_pid_tmr:
6124  000f 00            	dc.b	0
6125                     	xref	_init_pid
6126                     	xref	_pid_ctrl
6169                     ; 833 void pid_control(void)
6169                     ; 834 {
6170                     	switch	.text
6171  0adf               _pid_control:
6175                     ; 837     init_temp_delays(); // Initialise Heating and Cooling delay
6177  0adf cd09b3        	call	_init_temp_delays
6179                     ; 839     if (kc != eeprom_read_config(EEADR_MENU_ITEM(Hc)) ||
6179                     ; 840         ti != eeprom_read_config(EEADR_MENU_ITEM(Ti)) ||
6179                     ; 841         td != eeprom_read_config(EEADR_MENU_ITEM(Td)))
6181  0ae2 a680          	ld	a,#128
6182  0ae4 cd0000        	call	_eeprom_read_config
6184  0ae7 b300          	cpw	x,_kc
6185  0ae9 2612          	jrne	L7613
6187  0aeb a681          	ld	a,#129
6188  0aed cd0000        	call	_eeprom_read_config
6190  0af0 b300          	cpw	x,_ti
6191  0af2 2609          	jrne	L7613
6193  0af4 a682          	ld	a,#130
6194  0af6 cd0000        	call	_eeprom_read_config
6196  0af9 b300          	cpw	x,_td
6197  0afb 2728          	jreq	L5613
6198  0afd               L7613:
6199                     ; 843        kc = eeprom_read_config(EEADR_MENU_ITEM(Hc));
6201  0afd a680          	ld	a,#128
6202  0aff cd0000        	call	_eeprom_read_config
6204  0b02 bf00          	ldw	_kc,x
6205                     ; 844        ti = eeprom_read_config(EEADR_MENU_ITEM(Ti));
6207  0b04 a681          	ld	a,#129
6208  0b06 cd0000        	call	_eeprom_read_config
6210  0b09 bf00          	ldw	_ti,x
6211                     ; 845        td = eeprom_read_config(EEADR_MENU_ITEM(Td));
6213  0b0b a682          	ld	a,#130
6214  0b0d cd0000        	call	_eeprom_read_config
6216  0b10 bf00          	ldw	_td,x
6217                     ; 846        init_pid(kc,ti,td,ts,temp_ntc1); // Init PID controller
6219  0b12 be00          	ldw	x,_temp_ntc1
6220  0b14 89            	pushw	x
6221  0b15 3b0000        	push	_ts
6222  0b18 be00          	ldw	x,_td
6223  0b1a 89            	pushw	x
6224  0b1b be00          	ldw	x,_ti
6225  0b1d 89            	pushw	x
6226  0b1e be00          	ldw	x,_kc
6227  0b20 cd0000        	call	_init_pid
6229  0b23 5b07          	addw	sp,#7
6230  0b25               L5613:
6231                     ; 849     if (++pid_tmr >= ts) 
6233  0b25 3c0f          	inc	L5413_pid_tmr
6234  0b27 b60f          	ld	a,L5413_pid_tmr
6235  0b29 b100          	cp	a,_ts
6236  0b2b 250e          	jrult	L3713
6237                     ; 851         pid_ctrl(temp_ntc1,&pid_out,setpoint);
6239  0b2d be06          	ldw	x,_setpoint
6240  0b2f 89            	pushw	x
6241  0b30 4b0d          	push	#_pid_out
6242  0b32 be00          	ldw	x,_temp_ntc1
6243  0b34 cd0000        	call	_pid_ctrl
6245  0b37 5b03          	addw	sp,#3
6246                     ; 852         pid_tmr = 0;
6248  0b39 3f0f          	clr	L5413_pid_tmr
6249  0b3b               L3713:
6250                     ; 877 } // pid_control()
6253  0b3b 81            	ret
6564                     	xdef	_enable_heating
6565                     	xdef	_enable_cooling
6566                     	xdef	_init_temp_delays
6567                     	xdef	_min_to_sec
6568                     	xdef	_menu
6569                     	xref.b	_top_01
6570                     	xref.b	_top_1
6571                     	xref.b	_top_10
6572                     	xref.b	_top_100
6573                     	xref.b	_hc164_val
6574                     	xref.b	_ts
6575                     	xref.b	_td
6576                     	xref.b	_ti
6577                     	xref.b	_kc
6578                     	xref.b	_temp_ntc2
6579                     	xref.b	_temp_ntc1
6580                     	xbit	_probe2
6581                     	switch	.ubsct
6582  0000               _portd:
6583  0000 00            	ds.b	1
6584                     	xdef	_portd
6585  0001               _portc:
6586  0001 00            	ds.b	1
6587                     	xdef	_portc
6588  0002               _hysteresis2:
6589  0002 0000          	ds.b	2
6590                     	xdef	_hysteresis2
6591  0004               _hysteresis:
6592  0004 0000          	ds.b	2
6593                     	xdef	_hysteresis
6594                     	xdef	_pid_out
6595                     	xdef	_curr_dur
6596  0006               _setpoint:
6597  0006 0000          	ds.b	2
6598                     	xdef	_setpoint
6599                     	xdef	_sensor2_selected
6600  0008               _key_held_tmr:
6601  0008 00            	ds.b	1
6602                     	xdef	_key_held_tmr
6603  0009               _config_value:
6604  0009 0000          	ds.b	2
6605                     	xdef	_config_value
6606                     	xdef	__buttons
6607                     	xdef	_m_countdown
6608                     	xdef	_config_item
6609                     	xdef	_menu_item
6610                     	xdef	_minutes
6611                     	xdef	_fahrenheit
6612                     	xdef	_pwr_on
6613                     	xdef	_menu_is_idle
6614                     	xdef	_menustate
6615                     	xdef	_heating_delay
6616                     	xdef	_cooling_delay
6617  000b               _led_01:
6618  000b 00            	ds.b	1
6619                     	xdef	_led_01
6620  000c               _led_1:
6621  000c 00            	ds.b	1
6622                     	xdef	_led_1
6623  000d               _led_10:
6624  000d 00            	ds.b	1
6625                     	xdef	_led_10
6626                     	xdef	_led_e
6627                     	xdef	_eedata
6628                     	xdef	_led_lookup
6629                     	xdef	_pid_control
6630                     	xdef	_temperature_control
6631                     	xdef	_menu_fsm
6632                     	xdef	_read_buttons
6633                     	xdef	_check_config_value
6634                     	xdef	_range
6635                     	xdef	_update_profile
6636                     	xdef	_value_to_led
6637                     	xdef	_prx_to_led
6638                     	xdef	_divu10
6639                     	xref	_eeprom_write_config
6640                     	xref	_eeprom_read_config
6641                     	xref	_set_hc164
6642                     	xref.b	c_x
6662                     	xref	c_lgrsh
6663                     	xref	c_lgadd
6664                     	xref	c_itolx
6665                     	end
