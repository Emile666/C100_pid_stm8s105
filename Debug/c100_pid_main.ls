   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2523                     	bsct
2524  0000               _delay_val:
2525  0000 000186a0      	dc.l	100000
2526  0004               _irq_cnt:
2527  0004 0000          	dc.w	0
2528                     .bit:	section	.data,bit
2529  0000               _probe2:
2530  0000 00            	dc.b	0
2531                     	bsct
2532  0006               _mpx_nr:
2533  0006 00            	dc.b	0
2534  0007               _pwr_on_tmr:
2535  0007 03e8          	dc.w	1000
2536  0009               _std:
2537  0009 00            	dc.b	0
2538  000a 00            	dc.b	0
2539  000b 00            	dc.b	0
2540  000c 00            	dc.b	0
2609                     ; 57 void set_hc164(uint8_t x)
2609                     ; 58 {
2611                     	switch	.text
2612  0000               _set_hc164:
2614  0000 88            	push	a
2615  0001 5203          	subw	sp,#3
2616       00000003      OFST:	set	3
2619                     ; 59     uint8_t i, j, p = 0x80;
2621  0003 a680          	ld	a,#128
2622  0005 6b01          	ld	(OFST-2,sp),a
2624                     ; 61     hc164_val = x; // save value for read_buttons() function
2626  0007 7b04          	ld	a,(OFST+1,sp)
2627  0009 b704          	ld	_hc164_val,a
2628                     ; 62     SET_CLK_0;     // CLK  = 0
2630  000b 7219500a      	bres	_PC_ODR,#4
2631                     ; 63     SET_SDIN_0;    // SDIN = 0
2633  000f 7217500a      	bres	_PC_ODR,#3
2634                     ; 64     for (i = 0; i < 8; i++)
2636  0013 0f02          	clr	(OFST-1,sp)
2638  0015               L3661:
2639                     ; 66         if (x & p) SET_SDIN_1;
2641  0015 7b04          	ld	a,(OFST+1,sp)
2642  0017 1501          	bcp	a,(OFST-2,sp)
2643  0019 2706          	jreq	L1761
2646  001b 7216500a      	bset	_PC_ODR,#3
2648  001f 2004          	jra	L3761
2649  0021               L1761:
2650                     ; 67         else       SET_SDIN_0;
2652  0021 7217500a      	bres	_PC_ODR,#3
2653  0025               L3761:
2654                     ; 68         SET_CLK_1;
2656  0025 7218500a      	bset	_PC_ODR,#4
2657                     ; 69         p >>= 1;
2659  0029 0401          	srl	(OFST-2,sp)
2661                     ; 70         for (j = 0; j < 10; j++); // small delay
2663  002b 0f03          	clr	(OFST+0,sp)
2665  002d               L5761:
2669  002d 0c03          	inc	(OFST+0,sp)
2673  002f 7b03          	ld	a,(OFST+0,sp)
2674  0031 a10a          	cp	a,#10
2675  0033 25f8          	jrult	L5761
2676                     ; 71         SET_CLK_0;
2678  0035 7219500a      	bres	_PC_ODR,#4
2679                     ; 64     for (i = 0; i < 8; i++)
2681  0039 0c02          	inc	(OFST-1,sp)
2685  003b 7b02          	ld	a,(OFST-1,sp)
2686  003d a108          	cp	a,#8
2687  003f 25d4          	jrult	L3661
2688                     ; 73 } // set_hc164()
2691  0041 5b04          	addw	sp,#4
2692  0043 81            	ret
2766                     ; 84 void set_one_led(uint8_t nr, uint16_t led, uint16_t blink_msk, uint16_t blink_rate_msk)
2766                     ; 85 {   
2767                     	switch	.text
2768  0044               _set_one_led:
2770  0044 88            	push	a
2771  0045 88            	push	a
2772       00000001      OFST:	set	1
2775                     ; 88    if (leds_out & blink_rate_msk)
2777  0046 be0d          	ldw	x,_leds_out
2778  0048 01            	rrwa	x,a
2779  0049 140a          	and	a,(OFST+9,sp)
2780  004b 01            	rrwa	x,a
2781  004c 1409          	and	a,(OFST+8,sp)
2782  004e 01            	rrwa	x,a
2783  004f a30000        	cpw	x,#0
2784  0052 2706          	jreq	L1571
2785                     ; 89         blink_rate = LED_BLINK_FAST;
2787  0054 a61e          	ld	a,#30
2788  0056 6b01          	ld	(OFST+0,sp),a
2791  0058 2004          	jra	L3571
2792  005a               L1571:
2793                     ; 90    else blink_rate = LED_BLINK_SLOW;
2795  005a a63c          	ld	a,#60
2796  005c 6b01          	ld	(OFST+0,sp),a
2798  005e               L3571:
2799                     ; 92    switch (std[nr])
2801  005e 7b02          	ld	a,(OFST+1,sp)
2802  0060 5f            	clrw	x
2803  0061 97            	ld	xl,a
2804  0062 e609          	ld	a,(_std,x)
2806                     ; 138           break;  
2807  0064 4d            	tnz	a
2808  0065 2713          	jreq	L3071
2809  0067 4a            	dec	a
2810  0068 2755          	jreq	L5071
2811  006a 4a            	dec	a
2812  006b 2603          	jrne	L01
2813  006d cc0156        	jp	L1171
2814  0070               L01:
2815  0070 4a            	dec	a
2816  0071 2603          	jrne	L21
2817  0073 cc0103        	jp	L7071
2818  0076               L21:
2819  0076 ac8e018e      	jpf	L7571
2820  007a               L3071:
2821                     ; 94        case STD_LED_OFF:
2821                     ; 95           PD_ODR |= led; // LED off
2823  007a c6500f        	ld	a,_PD_ODR
2824  007d 1a06          	or	a,(OFST+5,sp)
2825  007f c7500f        	ld	_PD_ODR,a
2826                     ; 96           if (leds_out & led)
2828  0082 be0d          	ldw	x,_leds_out
2829  0084 01            	rrwa	x,a
2830  0085 1406          	and	a,(OFST+5,sp)
2831  0087 01            	rrwa	x,a
2832  0088 1405          	and	a,(OFST+4,sp)
2833  008a 01            	rrwa	x,a
2834  008b a30000        	cpw	x,#0
2835  008e 2603          	jrne	L41
2836  0090 cc018e        	jp	L7571
2837  0093               L41:
2838                     ; 98              if (leds_out & blink_msk)
2840  0093 be0d          	ldw	x,_leds_out
2841  0095 01            	rrwa	x,a
2842  0096 1408          	and	a,(OFST+7,sp)
2843  0098 01            	rrwa	x,a
2844  0099 1407          	and	a,(OFST+6,sp)
2845  009b 01            	rrwa	x,a
2846  009c a30000        	cpw	x,#0
2847  009f 2712          	jreq	L3671
2848                     ; 100                   std[nr]       = STD_LED_BLINK1;
2850  00a1 7b02          	ld	a,(OFST+1,sp)
2851  00a3 5f            	clrw	x
2852  00a4 97            	ld	xl,a
2853  00a5 a603          	ld	a,#3
2854  00a7 e709          	ld	(_std,x),a
2855                     ; 101                   blink_tmr[nr] = 0;
2857  00a9 7b02          	ld	a,(OFST+1,sp)
2858  00ab 5f            	clrw	x
2859  00ac 97            	ld	xl,a
2860  00ad 6f00          	clr	(_blink_tmr,x)
2862  00af ac8e018e      	jpf	L7571
2863  00b3               L3671:
2864                     ; 103              else std[nr] = STD_LED_ON;
2866  00b3 7b02          	ld	a,(OFST+1,sp)
2867  00b5 5f            	clrw	x
2868  00b6 97            	ld	xl,a
2869  00b7 a601          	ld	a,#1
2870  00b9 e709          	ld	(_std,x),a
2871  00bb ac8e018e      	jpf	L7571
2872  00bf               L5071:
2873                     ; 107        case STD_LED_ON:
2873                     ; 108           PD_ODR &= ~led; // LED on
2875  00bf 7b06          	ld	a,(OFST+5,sp)
2876  00c1 43            	cpl	a
2877  00c2 c4500f        	and	a,_PD_ODR
2878  00c5 c7500f        	ld	_PD_ODR,a
2879                     ; 109           if (!(leds_out & led))
2881  00c8 be0d          	ldw	x,_leds_out
2882  00ca 01            	rrwa	x,a
2883  00cb 1406          	and	a,(OFST+5,sp)
2884  00cd 01            	rrwa	x,a
2885  00ce 1405          	and	a,(OFST+4,sp)
2886  00d0 01            	rrwa	x,a
2887  00d1 a30000        	cpw	x,#0
2888  00d4 260a          	jrne	L7671
2889                     ; 110              std[nr] = STD_LED_OFF;
2891  00d6 7b02          	ld	a,(OFST+1,sp)
2892  00d8 5f            	clrw	x
2893  00d9 97            	ld	xl,a
2894  00da 6f09          	clr	(_std,x)
2896  00dc ac8e018e      	jpf	L7571
2897  00e0               L7671:
2898                     ; 111           else if (leds_out & blink_msk)
2900  00e0 be0d          	ldw	x,_leds_out
2901  00e2 01            	rrwa	x,a
2902  00e3 1408          	and	a,(OFST+7,sp)
2903  00e5 01            	rrwa	x,a
2904  00e6 1407          	and	a,(OFST+6,sp)
2905  00e8 01            	rrwa	x,a
2906  00e9 a30000        	cpw	x,#0
2907  00ec 2603          	jrne	L61
2908  00ee cc018e        	jp	L7571
2909  00f1               L61:
2910                     ; 113              std[nr]       = STD_LED_BLINK1;
2912  00f1 7b02          	ld	a,(OFST+1,sp)
2913  00f3 5f            	clrw	x
2914  00f4 97            	ld	xl,a
2915  00f5 a603          	ld	a,#3
2916  00f7 e709          	ld	(_std,x),a
2917                     ; 114              blink_tmr[nr] = 0;
2919  00f9 7b02          	ld	a,(OFST+1,sp)
2920  00fb 5f            	clrw	x
2921  00fc 97            	ld	xl,a
2922  00fd 6f00          	clr	(_blink_tmr,x)
2923  00ff ac8e018e      	jpf	L7571
2924  0103               L7071:
2925                     ; 117        case STD_LED_BLINK1:
2925                     ; 118           PD_ODR &= ~led; // LED on
2927  0103 7b06          	ld	a,(OFST+5,sp)
2928  0105 43            	cpl	a
2929  0106 c4500f        	and	a,_PD_ODR
2930  0109 c7500f        	ld	_PD_ODR,a
2931                     ; 119           if (!(leds_out & led))
2933  010c be0d          	ldw	x,_leds_out
2934  010e 01            	rrwa	x,a
2935  010f 1406          	and	a,(OFST+5,sp)
2936  0111 01            	rrwa	x,a
2937  0112 1405          	and	a,(OFST+4,sp)
2938  0114 01            	rrwa	x,a
2939  0115 a30000        	cpw	x,#0
2940  0118 2608          	jrne	L5771
2941                     ; 120              std[nr] = STD_LED_OFF;
2943  011a 7b02          	ld	a,(OFST+1,sp)
2944  011c 5f            	clrw	x
2945  011d 97            	ld	xl,a
2946  011e 6f09          	clr	(_std,x)
2948  0120 206c          	jra	L7571
2949  0122               L5771:
2950                     ; 121           else if (!(leds_out & blink_msk))
2952  0122 be0d          	ldw	x,_leds_out
2953  0124 01            	rrwa	x,a
2954  0125 1408          	and	a,(OFST+7,sp)
2955  0127 01            	rrwa	x,a
2956  0128 1407          	and	a,(OFST+6,sp)
2957  012a 01            	rrwa	x,a
2958  012b a30000        	cpw	x,#0
2959  012e 260a          	jrne	L1002
2960                     ; 122              std[nr] = STD_LED_ON;
2962  0130 7b02          	ld	a,(OFST+1,sp)
2963  0132 5f            	clrw	x
2964  0133 97            	ld	xl,a
2965  0134 a601          	ld	a,#1
2966  0136 e709          	ld	(_std,x),a
2968  0138 2054          	jra	L7571
2969  013a               L1002:
2970                     ; 123           else if (++blink_tmr[nr] > blink_rate)
2972  013a 7b02          	ld	a,(OFST+1,sp)
2973  013c 5f            	clrw	x
2974  013d 97            	ld	xl,a
2975  013e 6c00          	inc	(_blink_tmr,x)
2976  0140 e600          	ld	a,(_blink_tmr,x)
2977  0142 1101          	cp	a,(OFST+0,sp)
2978  0144 2348          	jrule	L7571
2979                     ; 125              std[nr]       = STD_LED_BLINK0;
2981  0146 7b02          	ld	a,(OFST+1,sp)
2982  0148 5f            	clrw	x
2983  0149 97            	ld	xl,a
2984  014a a602          	ld	a,#2
2985  014c e709          	ld	(_std,x),a
2986                     ; 126              blink_tmr[nr] = 0;
2988  014e 7b02          	ld	a,(OFST+1,sp)
2989  0150 5f            	clrw	x
2990  0151 97            	ld	xl,a
2991  0152 6f00          	clr	(_blink_tmr,x)
2992  0154 2038          	jra	L7571
2993  0156               L1171:
2994                     ; 129        case STD_LED_BLINK0:
2994                     ; 130           PD_ODR |= led; // LED off
2996  0156 c6500f        	ld	a,_PD_ODR
2997  0159 1a06          	or	a,(OFST+5,sp)
2998  015b c7500f        	ld	_PD_ODR,a
2999                     ; 131           if (!(leds_out & blink_msk))
3001  015e be0d          	ldw	x,_leds_out
3002  0160 01            	rrwa	x,a
3003  0161 1408          	and	a,(OFST+7,sp)
3004  0163 01            	rrwa	x,a
3005  0164 1407          	and	a,(OFST+6,sp)
3006  0166 01            	rrwa	x,a
3007  0167 a30000        	cpw	x,#0
3008  016a 2608          	jrne	L7002
3009                     ; 132              std[nr] = STD_LED_OFF;
3011  016c 7b02          	ld	a,(OFST+1,sp)
3012  016e 5f            	clrw	x
3013  016f 97            	ld	xl,a
3014  0170 6f09          	clr	(_std,x)
3016  0172 201a          	jra	L7571
3017  0174               L7002:
3018                     ; 133           else if (++blink_tmr[nr] > blink_rate)
3020  0174 7b02          	ld	a,(OFST+1,sp)
3021  0176 5f            	clrw	x
3022  0177 97            	ld	xl,a
3023  0178 6c00          	inc	(_blink_tmr,x)
3024  017a e600          	ld	a,(_blink_tmr,x)
3025  017c 1101          	cp	a,(OFST+0,sp)
3026  017e 230e          	jrule	L7571
3027                     ; 135              std[nr]       = STD_LED_BLINK1;
3029  0180 7b02          	ld	a,(OFST+1,sp)
3030  0182 5f            	clrw	x
3031  0183 97            	ld	xl,a
3032  0184 a603          	ld	a,#3
3033  0186 e709          	ld	(_std,x),a
3034                     ; 136              blink_tmr[nr] = 0;
3036  0188 7b02          	ld	a,(OFST+1,sp)
3037  018a 5f            	clrw	x
3038  018b 97            	ld	xl,a
3039  018c 6f00          	clr	(_blink_tmr,x)
3040  018e               L7571:
3041                     ; 140 } // set_one_led()
3044  018e 85            	popw	x
3045  018f 81            	ret
3082                     ; 150 void multiplexer(void)
3082                     ; 151 {
3083                     	switch	.text
3084  0190               _multiplexer:
3086  0190 88            	push	a
3087       00000001      OFST:	set	1
3090                     ; 152     LEDS_OFF;             // clear LEDs
3092  0191 7214500a      	bset	_PC_ODR,#2
3093                     ; 153     PE_ODR |= SEG7_C;     // disable 7-segment display C
3095  0195 72105014      	bset	_PE_ODR,#0
3096                     ; 154     PD_ODR |= PORTD_OUT;  // disable all other 7-segment displays
3098  0199 c6500f        	ld	a,_PD_ODR
3099  019c aafd          	or	a,#253
3100  019e c7500f        	ld	_PD_ODR,a
3101                     ; 155     set_hc164(0x00);      // disable CA-lines of 7-segment displays
3103  01a1 4f            	clr	a
3104  01a2 cd0000        	call	_set_hc164
3106                     ; 157     switch (mpx_nr)
3108  01a5 b606          	ld	a,_mpx_nr
3110                     ; 216             break;
3111  01a7 4d            	tnz	a
3112  01a8 2731          	jreq	L5102
3113  01aa 4a            	dec	a
3114  01ab 275a          	jreq	L7102
3115  01ad 4a            	dec	a
3116  01ae 2603cc0233    	jreq	L1202
3117  01b3 4a            	dec	a
3118  01b4 2603          	jrne	L22
3119  01b6 cc025f        	jp	L3202
3120  01b9               L22:
3121  01b9 4a            	dec	a
3122  01ba 2603          	jrne	L42
3123  01bc cc028b        	jp	L5202
3124  01bf               L42:
3125  01bf 4a            	dec	a
3126  01c0 2603          	jrne	L62
3127  01c2 cc02e6        	jp	L7202
3128  01c5               L62:
3129  01c5 4a            	dec	a
3130  01c6 2603          	jrne	L03
3131  01c8 cc0310        	jp	L1302
3132  01cb               L03:
3133  01cb 4a            	dec	a
3134  01cc 2603          	jrne	L23
3135  01ce cc033a        	jp	L3302
3136  01d1               L23:
3137  01d1 4a            	dec	a
3138  01d2 2603          	jrne	L43
3139  01d4 cc0364        	jp	L5302
3140  01d7               L43:
3141  01d7 ac880388      	jpf	L7302
3142  01db               L5102:
3143                     ; 159         case 0: // output CA1 BOTTOM display (LSB)
3143                     ; 160             set_hc164(0x01);
3145  01db a601          	ld	a,#1
3146  01dd cd0000        	call	_set_hc164
3148                     ; 161             PE_ODR &= ~PE_LEDS(led_e);   // Update PE0 (SEG7_C)
3150  01e0 b600          	ld	a,_led_e
3151  01e2 a401          	and	a,#1
3152  01e4 43            	cpl	a
3153  01e5 c45014        	and	a,_PE_ODR
3154  01e8 c75014        	ld	_PE_ODR,a
3155                     ; 162             PD_ODR &= ~PD_LEDS(led_e);   // Update all other segments
3157  01eb b600          	ld	a,_led_e
3158  01ed 44            	srl	a
3159  01ee a401          	and	a,#1
3160  01f0 6b01          	ld	(OFST+0,sp),a
3162  01f2 b600          	ld	a,_led_e
3163  01f4 a4fc          	and	a,#252
3164  01f6 1a01          	or	a,(OFST+0,sp)
3165  01f8 43            	cpl	a
3166  01f9 c4500f        	and	a,_PD_ODR
3167  01fc c7500f        	ld	_PD_ODR,a
3168                     ; 163             mpx_nr = 1;
3170  01ff 35010006      	mov	_mpx_nr,#1
3171                     ; 164             break;
3173  0203 ac8a038a      	jpf	L3502
3174  0207               L7102:
3175                     ; 165         case 1: // output CA2 BOTTOM display
3175                     ; 166             set_hc164(0x02);
3177  0207 a602          	ld	a,#2
3178  0209 cd0000        	call	_set_hc164
3180                     ; 167             PE_ODR &= ~PE_LEDS(led_01);  // Update PE0 (SEG7_C)
3182  020c b600          	ld	a,_led_01
3183  020e a401          	and	a,#1
3184  0210 43            	cpl	a
3185  0211 c45014        	and	a,_PE_ODR
3186  0214 c75014        	ld	_PE_ODR,a
3187                     ; 168             PD_ODR &= ~PD_LEDS(led_01);  // Update all other segments
3189  0217 b600          	ld	a,_led_01
3190  0219 44            	srl	a
3191  021a a401          	and	a,#1
3192  021c 6b01          	ld	(OFST+0,sp),a
3194  021e b600          	ld	a,_led_01
3195  0220 a4fc          	and	a,#252
3196  0222 1a01          	or	a,(OFST+0,sp)
3197  0224 43            	cpl	a
3198  0225 c4500f        	and	a,_PD_ODR
3199  0228 c7500f        	ld	_PD_ODR,a
3200                     ; 169             mpx_nr = 2;
3202  022b 35020006      	mov	_mpx_nr,#2
3203                     ; 170             break;
3205  022f ac8a038a      	jpf	L3502
3206  0233               L1202:
3207                     ; 171         case 2: // output CA3 BOTTOM display
3207                     ; 172             set_hc164(0x04);
3209  0233 a604          	ld	a,#4
3210  0235 cd0000        	call	_set_hc164
3212                     ; 173             PE_ODR &= ~PE_LEDS(led_1);   // Update PE0 (SEG7_C)
3214  0238 b600          	ld	a,_led_1
3215  023a a401          	and	a,#1
3216  023c 43            	cpl	a
3217  023d c45014        	and	a,_PE_ODR
3218  0240 c75014        	ld	_PE_ODR,a
3219                     ; 174             PD_ODR &= ~PD_LEDS(led_1);   // Update all other segments
3221  0243 b600          	ld	a,_led_1
3222  0245 44            	srl	a
3223  0246 a401          	and	a,#1
3224  0248 6b01          	ld	(OFST+0,sp),a
3226  024a b600          	ld	a,_led_1
3227  024c a4fc          	and	a,#252
3228  024e 1a01          	or	a,(OFST+0,sp)
3229  0250 43            	cpl	a
3230  0251 c4500f        	and	a,_PD_ODR
3231  0254 c7500f        	ld	_PD_ODR,a
3232                     ; 175             mpx_nr = 3;
3234  0257 35030006      	mov	_mpx_nr,#3
3235                     ; 176             break;
3237  025b ac8a038a      	jpf	L3502
3238  025f               L3202:
3239                     ; 177         case 3: // outputs CA4 BOTTOM display (MSB)
3239                     ; 178             set_hc164(0x08);
3241  025f a608          	ld	a,#8
3242  0261 cd0000        	call	_set_hc164
3244                     ; 179             PE_ODR &= ~PE_LEDS(led_10);  // Update PE0 (SEG7_C)
3246  0264 b600          	ld	a,_led_10
3247  0266 a401          	and	a,#1
3248  0268 43            	cpl	a
3249  0269 c45014        	and	a,_PE_ODR
3250  026c c75014        	ld	_PE_ODR,a
3251                     ; 180             PD_ODR &= ~PD_LEDS(led_10);  // Update all other segments
3253  026f b600          	ld	a,_led_10
3254  0271 44            	srl	a
3255  0272 a401          	and	a,#1
3256  0274 6b01          	ld	(OFST+0,sp),a
3258  0276 b600          	ld	a,_led_10
3259  0278 a4fc          	and	a,#252
3260  027a 1a01          	or	a,(OFST+0,sp)
3261  027c 43            	cpl	a
3262  027d c4500f        	and	a,_PD_ODR
3263  0280 c7500f        	ld	_PD_ODR,a
3264                     ; 181             mpx_nr = 4;
3266  0283 35040006      	mov	_mpx_nr,#4
3267                     ; 182             break;
3269  0287 ac8a038a      	jpf	L3502
3270  028b               L5202:
3271                     ; 183         case 4: // set Frontpanel LEDs
3271                     ; 184             set_hc164(0x00);
3273  028b 4f            	clr	a
3274  028c cd0000        	call	_set_hc164
3276                     ; 185             LEDS_ENABLE;
3278  028f 7215500a      	bres	_PC_ODR,#2
3279                     ; 186             set_one_led(0,LED_ALM1, LED_ALM1_BLINK, LED_ALM1_BLINK_FAST);
3281  0293 ae0100        	ldw	x,#256
3282  0296 89            	pushw	x
3283  0297 ae0002        	ldw	x,#2
3284  029a 89            	pushw	x
3285  029b ae0001        	ldw	x,#1
3286  029e 89            	pushw	x
3287  029f 4f            	clr	a
3288  02a0 cd0044        	call	_set_one_led
3290  02a3 5b06          	addw	sp,#6
3291                     ; 187             set_one_led(1,LED_ALM2, LED_ALM2_BLINK, LED_ALM2_BLINK_FAST);
3293  02a5 ae0200        	ldw	x,#512
3294  02a8 89            	pushw	x
3295  02a9 ae0008        	ldw	x,#8
3296  02ac 89            	pushw	x
3297  02ad ae0004        	ldw	x,#4
3298  02b0 89            	pushw	x
3299  02b1 a601          	ld	a,#1
3300  02b3 cd0044        	call	_set_one_led
3302  02b6 5b06          	addw	sp,#6
3303                     ; 188             set_one_led(2,LED_OUT1, LED_OUT1_BLINK, LED_OUT1_BLINK_FAST);
3305  02b8 ae0400        	ldw	x,#1024
3306  02bb 89            	pushw	x
3307  02bc ae0010        	ldw	x,#16
3308  02bf 89            	pushw	x
3309  02c0 ae0020        	ldw	x,#32
3310  02c3 89            	pushw	x
3311  02c4 a602          	ld	a,#2
3312  02c6 cd0044        	call	_set_one_led
3314  02c9 5b06          	addw	sp,#6
3315                     ; 189             set_one_led(3,LED_AT  , LED_AT_BLINK  , LED_AT_BLINK_FAST);
3317  02cb ae0800        	ldw	x,#2048
3318  02ce 89            	pushw	x
3319  02cf ae0040        	ldw	x,#64
3320  02d2 89            	pushw	x
3321  02d3 ae0080        	ldw	x,#128
3322  02d6 89            	pushw	x
3323  02d7 a603          	ld	a,#3
3324  02d9 cd0044        	call	_set_one_led
3326  02dc 5b06          	addw	sp,#6
3327                     ; 190             mpx_nr = 5;
3329  02de 35050006      	mov	_mpx_nr,#5
3330                     ; 191             break;
3332  02e2 ac8a038a      	jpf	L3502
3333  02e6               L7202:
3334                     ; 192         case 5: // output CA1 TOP display (LSB)
3334                     ; 193             set_hc164(0x10);
3336  02e6 a610          	ld	a,#16
3337  02e8 cd0000        	call	_set_hc164
3339                     ; 194             PE_ODR &= ~PE_LEDS(top_01);  // Update PE0 (SEG7_C)
3341  02eb b605          	ld	a,_top_01
3342  02ed a401          	and	a,#1
3343  02ef 43            	cpl	a
3344  02f0 c45014        	and	a,_PE_ODR
3345  02f3 c75014        	ld	_PE_ODR,a
3346                     ; 195             PD_ODR &= ~PD_LEDS(top_01);  // Update all other segments
3348  02f6 b605          	ld	a,_top_01
3349  02f8 44            	srl	a
3350  02f9 a401          	and	a,#1
3351  02fb 6b01          	ld	(OFST+0,sp),a
3353  02fd b605          	ld	a,_top_01
3354  02ff a4fc          	and	a,#252
3355  0301 1a01          	or	a,(OFST+0,sp)
3356  0303 43            	cpl	a
3357  0304 c4500f        	and	a,_PD_ODR
3358  0307 c7500f        	ld	_PD_ODR,a
3359                     ; 196             mpx_nr = 6;
3361  030a 35060006      	mov	_mpx_nr,#6
3362                     ; 197             break;
3364  030e 207a          	jra	L3502
3365  0310               L1302:
3366                     ; 198         case 6: // output CA2 TOP display
3366                     ; 199             set_hc164(0x20);
3368  0310 a620          	ld	a,#32
3369  0312 cd0000        	call	_set_hc164
3371                     ; 200             PE_ODR &= ~PE_LEDS(top_1);   // Update PE0 (SEG7_C)
3373  0315 b606          	ld	a,_top_1
3374  0317 a401          	and	a,#1
3375  0319 43            	cpl	a
3376  031a c45014        	and	a,_PE_ODR
3377  031d c75014        	ld	_PE_ODR,a
3378                     ; 201             PD_ODR &= ~PD_LEDS(top_1);   // Update all other segments
3380  0320 b606          	ld	a,_top_1
3381  0322 44            	srl	a
3382  0323 a401          	and	a,#1
3383  0325 6b01          	ld	(OFST+0,sp),a
3385  0327 b606          	ld	a,_top_1
3386  0329 a4fc          	and	a,#252
3387  032b 1a01          	or	a,(OFST+0,sp)
3388  032d 43            	cpl	a
3389  032e c4500f        	and	a,_PD_ODR
3390  0331 c7500f        	ld	_PD_ODR,a
3391                     ; 202             mpx_nr = 7;
3393  0334 35070006      	mov	_mpx_nr,#7
3394                     ; 203             break;
3396  0338 2050          	jra	L3502
3397  033a               L3302:
3398                     ; 204         case 7: // output CA3 TOP display
3398                     ; 205             set_hc164(0x40);
3400  033a a640          	ld	a,#64
3401  033c cd0000        	call	_set_hc164
3403                     ; 206             PE_ODR &= ~PE_LEDS(top_10);  // Update PE0 (SEG7_C)
3405  033f b607          	ld	a,_top_10
3406  0341 a401          	and	a,#1
3407  0343 43            	cpl	a
3408  0344 c45014        	and	a,_PE_ODR
3409  0347 c75014        	ld	_PE_ODR,a
3410                     ; 207             PD_ODR &= ~PD_LEDS(top_10);  // Update all other segments
3412  034a b607          	ld	a,_top_10
3413  034c 44            	srl	a
3414  034d a401          	and	a,#1
3415  034f 6b01          	ld	(OFST+0,sp),a
3417  0351 b607          	ld	a,_top_10
3418  0353 a4fc          	and	a,#252
3419  0355 1a01          	or	a,(OFST+0,sp)
3420  0357 43            	cpl	a
3421  0358 c4500f        	and	a,_PD_ODR
3422  035b c7500f        	ld	_PD_ODR,a
3423                     ; 208             mpx_nr = 8;
3425  035e 35080006      	mov	_mpx_nr,#8
3426                     ; 209             break;
3428  0362 2026          	jra	L3502
3429  0364               L5302:
3430                     ; 210         case 8: // outputs CA4 TOP display (MSB)
3430                     ; 211             set_hc164(0x80);
3432  0364 a680          	ld	a,#128
3433  0366 cd0000        	call	_set_hc164
3435                     ; 212             PE_ODR &= ~PE_LEDS(top_100); // Update PE0 (SEG7_C)
3437  0369 b608          	ld	a,_top_100
3438  036b a401          	and	a,#1
3439  036d 43            	cpl	a
3440  036e c45014        	and	a,_PE_ODR
3441  0371 c75014        	ld	_PE_ODR,a
3442                     ; 213             PD_ODR &= ~PD_LEDS(top_100); // Update all other segments
3444  0374 b608          	ld	a,_top_100
3445  0376 44            	srl	a
3446  0377 a401          	and	a,#1
3447  0379 6b01          	ld	(OFST+0,sp),a
3449  037b b608          	ld	a,_top_100
3450  037d a4fc          	and	a,#252
3451  037f 1a01          	or	a,(OFST+0,sp)
3452  0381 43            	cpl	a
3453  0382 c4500f        	and	a,_PD_ODR
3454  0385 c7500f        	ld	_PD_ODR,a
3455  0388               L7302:
3456                     ; 214         default: // FALL-THROUGH (less code-size)
3456                     ; 215             mpx_nr = 0;
3458  0388 3f06          	clr	_mpx_nr
3459                     ; 216             break;
3461  038a               L3502:
3462                     ; 218 } // multiplexer()
3465  038a 84            	pop	a
3466  038b 81            	ret
3499                     ; 227 @interrupt void TIM2_UPD_OVF_IRQHandler(void)
3499                     ; 228 {
3500                     	switch	.text
3501  038c               _TIM2_UPD_OVF_IRQHandler:
3503  038c 8a            	push	cc
3504  038d 84            	pop	a
3505  038e a4bf          	and	a,#191
3506  0390 88            	push	a
3507  0391 86            	pop	cc
3508  0392 3b0002        	push	c_x+2
3509  0395 be00          	ldw	x,c_x
3510  0397 89            	pushw	x
3511  0398 3b0002        	push	c_y+2
3512  039b be00          	ldw	x,c_y
3513  039d 89            	pushw	x
3516                     ; 229     scheduler_isr();  // Run scheduler interrupt function
3518  039e cd0000        	call	_scheduler_isr
3520                     ; 230     if (!pwr_on)
3522                     	btst	_pwr_on
3523  03a6 2514          	jrult	L5602
3524                     ; 232         led_10     = LED_O;
3526  03a8 35e70000      	mov	_led_10,#231
3527                     ; 233         led_1      = led_01 = LED_F;
3529  03ac 35740000      	mov	_led_01,#116
3530  03b0 450000        	mov	_led_1,_led_01
3531                     ; 234         led_e      = LED_OFF;
3533  03b3 3f00          	clr	_led_e
3534                     ; 235         pwr_on_tmr = 2000; // 2 seconds
3536  03b5 ae07d0        	ldw	x,#2000
3537  03b8 bf07          	ldw	_pwr_on_tmr,x
3539  03ba 2019          	jra	L7602
3540  03bc               L5602:
3541                     ; 237     else if (pwr_on_tmr > 0)
3543  03bc 9c            	rvf
3544  03bd be07          	ldw	x,_pwr_on_tmr
3545  03bf 2d14          	jrsle	L7602
3546                     ; 239         pwr_on_tmr--;
3548  03c1 be07          	ldw	x,_pwr_on_tmr
3549  03c3 1d0001        	subw	x,#1
3550  03c6 bf07          	ldw	_pwr_on_tmr,x
3551                     ; 240         led_10 = led_1 = led_01 = led_e = LED_ON;
3553  03c8 35ff0000      	mov	_led_e,#255
3554  03cc 450000        	mov	_led_01,_led_e
3555  03cf 450000        	mov	_led_1,_led_01
3556  03d2 450000        	mov	_led_10,_led_1
3557  03d5               L7602:
3558                     ; 242     multiplexer();             // Run multiplexer for Display and Keys
3560  03d5 cd0190        	call	_multiplexer
3562                     ; 243     TIM2_SR1 &= ~TIM2_SR1_UIF; // Reset interrupt (UIF bit) so it will not fire again straight away.
3564  03d8 72115302      	bres	_TIM2_SR1,#0
3565                     ; 244 } // TIM2_UPD_OVF_IRQHandler()
3568  03dc 85            	popw	x
3569  03dd bf00          	ldw	c_y,x
3570  03df 320002        	pop	c_y+2
3571  03e2 85            	popw	x
3572  03e3 bf00          	ldw	c_x,x
3573  03e5 320002        	pop	c_x+2
3574  03e8 80            	iret
3602                     ; 252 void setup_timer2(void)
3602                     ; 253 {
3603                     	switch	.text
3604  03e9               _setup_timer2:
3608                     ; 254     TIM2_PSCR = 0x04;         //  Prescaler = 16
3610  03e9 3504530c      	mov	_TIM2_PSCR,#4
3611                     ; 255     TIM2_ARRH = 0x03;         //  High byte of 1000
3613  03ed 3503530d      	mov	_TIM2_ARRH,#3
3614                     ; 256     TIM2_ARRL = 0xE8;         //  Low  byte of 1000
3616  03f1 35e8530e      	mov	_TIM2_ARRL,#232
3617                     ; 257     TIM2_IER  = TIM2_IER_UIE; //  Enable the update interrupts, disable all others
3619  03f5 35015301      	mov	_TIM2_IER,#1
3620                     ; 258     TIM2_CR1  = TIM2_CR1_CEN; //  Finally enable the timer
3622  03f9 35015300      	mov	_TIM2_CR1,#1
3623                     ; 259 } // setup_timer2()
3626  03fd 81            	ret
3665                     ; 267 void setup_gpio_ports(void)
3665                     ; 268 {
3666                     	switch	.text
3667  03fe               _setup_gpio_ports:
3671                     ; 272     PA_DDR     |=   SSR | ALARM;         // Set PORTA pins as outputs
3673  03fe c65002        	ld	a,_PA_DDR
3674  0401 aa0c          	or	a,#12
3675  0403 c75002        	ld	_PA_DDR,a
3676                     ; 273     PA_CR1     |=   SSR | ALARM;         // Set output pins to Push-Pull
3678  0406 c65003        	ld	a,_PA_CR1
3679  0409 aa0c          	or	a,#12
3680  040b c75003        	ld	_PA_CR1,a
3681                     ; 274     PA_ODR     &= ~(SSR | ALARM);        // Disable SSR and Alarm outputs
3683  040e c65000        	ld	a,_PA_ODR
3684  0411 a4f3          	and	a,#243
3685  0413 c75000        	ld	_PA_ODR,a
3686                     ; 279     PB_DDR     |=  PORTB_OUT;            // Set PORTB pins as outputs
3688  0416 c65007        	ld	a,_PB_DDR
3689  0419 aaf0          	or	a,#240
3690  041b c75007        	ld	_PB_DDR,a
3691                     ; 280     PB_CR1     |=  PORTB_OUT;            // Set output pins to Push-Pull
3693  041e c65008        	ld	a,_PB_CR1
3694  0421 aaf0          	or	a,#240
3695  0423 c75008        	ld	_PB_CR1,a
3696                     ; 281     PB_ODR     |= (CS_TC | CS_PT100 | CS_NRF24L01); // Disable SPI Chip-Selects
3698  0426 c65005        	ld	a,_PB_ODR
3699  0429 aae0          	or	a,#224
3700  042b c75005        	ld	_PB_ODR,a
3701                     ; 282     PB_ODR     &= ~CE_NRF24L01;          // Set CE for NRF24L01 low
3703  042e 72195005      	bres	_PB_ODR,#4
3704                     ; 287     PC_ODR     &= ~PORTC_OUT;            // Turn off all pins from Port C
3706  0432 c6500a        	ld	a,_PC_ODR
3707  0435 a483          	and	a,#131
3708  0437 c7500a        	ld	_PC_ODR,a
3709                     ; 288     PC_DDR     |= PORTC_OUT;             // Set PORTC pins as outputs
3711  043a c6500c        	ld	a,_PC_DDR
3712  043d aa7c          	or	a,#124
3713  043f c7500c        	ld	_PC_DDR,a
3714                     ; 289     PC_CR1     |= PORTC_OUT;             // Set output pins to Push-Pull
3716  0442 c6500d        	ld	a,_PC_CR1
3717  0445 aa7c          	or	a,#124
3718  0447 c7500d        	ld	_PC_CR1,a
3719                     ; 290 	PC_CR2     |=  (SPI_MOSI | SPI_SCK); // Set to 10 MHz
3721  044a c6500e        	ld	a,_PC_CR2
3722  044d aa60          	or	a,#96
3723  044f c7500e        	ld	_PC_CR2,a
3724                     ; 291     PC_ODR     &= ~(SPI_MOSI | SPI_SCK); // MOSI = 0, SPI_CLK = 0
3726  0452 c6500a        	ld	a,_PC_ODR
3727  0455 a49f          	and	a,#159
3728  0457 c7500a        	ld	_PC_ODR,a
3729                     ; 292     PC_DDR     &= ~PORTC_IN;             // set PORTC pins as inputs
3731  045a c6500c        	ld	a,_PC_DDR
3732  045d a47d          	and	a,#125
3733  045f c7500c        	ld	_PC_DDR,a
3734                     ; 293 	PC_CR1     &= ~PORTC_IN;             // set input pins to Floating
3736  0462 c6500d        	ld	a,_PC_CR1
3737  0465 a47d          	and	a,#125
3738  0467 c7500d        	ld	_PC_CR1,a
3739                     ; 294     LEDS_OFF;                            // Disable frontpanel LEDs
3741  046a 7214500a      	bset	_PC_ODR,#2
3742                     ; 295     SET_SDIN_0;                          // Disable SDIN for HC164
3744  046e 7217500a      	bres	_PC_ODR,#3
3745                     ; 296     SET_CLK_0;                           // Disable CLK for HC164
3747  0472 7219500a      	bres	_PC_ODR,#4
3748                     ; 301     PD_DDR     |=  PORTD_OUT;            // Set PORTD pins as outputs
3750  0476 c65011        	ld	a,_PD_DDR
3751  0479 aafd          	or	a,#253
3752  047b c75011        	ld	_PD_DDR,a
3753                     ; 302     PD_CR1     |=  PORTD_OUT;            // Set output pins to Push-Pull
3755  047e c65012        	ld	a,_PD_CR1
3756  0481 aafd          	or	a,#253
3757  0483 c75012        	ld	_PD_CR1,a
3758                     ; 303     PD_ODR     &= ~PORTD_OUT;            // Disable 7-segment displays
3760  0486 c6500f        	ld	a,_PD_ODR
3761  0489 a402          	and	a,#2
3762  048b c7500f        	ld	_PD_ODR,a
3763                     ; 308     PE_ODR     |=  (I2C_SCL | I2C_SDA);           // Must be set here, or I2C will not work
3765  048e c65014        	ld	a,_PE_ODR
3766  0491 aa06          	or	a,#6
3767  0493 c75014        	ld	_PE_ODR,a
3768                     ; 309     PE_DDR     |=  (I2C_SCL | I2C_SDA | SEG7_C);  // Set as outputs
3770  0496 c65016        	ld	a,_PE_DDR
3771  0499 aa07          	or	a,#7
3772  049b c75016        	ld	_PE_DDR,a
3773                     ; 310     PE_CR1     |=  SEG7_C;                        // Set output pin to Push-Pull
3775  049e 72105017      	bset	_PE_CR1,#0
3776                     ; 311     PE_ODR     &= ~SEG7_C;                        // Disable 7-segment display
3778  04a2 72115014      	bres	_PE_ODR,#0
3779                     ; 312 } // setup_gpio_ports()
3782  04a6 81            	ret
3807                     ; 320 void std_task(void)
3807                     ; 321 {
3808                     	switch	.text
3809  04a7               _std_task:
3813                     ; 322     read_buttons(); // reads the buttons keys, result is stored in _buttons
3815  04a7 cd0000        	call	_read_buttons
3817                     ; 323     menu_fsm();     // Finite State Machine menu
3819  04aa cd0000        	call	_menu_fsm
3821                     ; 325 } // std_task()
3824  04ad 81            	ret
3854                     ; 333 void initialise_system_clock(void)
3854                     ; 334 {
3855                     	switch	.text
3856  04ae               _initialise_system_clock:
3860                     ; 335 	CLK_ICKCR  = 0;                //  Reset the Internal Clock Register.
3862  04ae 725f50c0      	clr	_CLK_ICKCR
3863                     ; 336     CLK_ICKCR |= CLK_ICKCR_HSIEN;  //  Enable the HSI.
3865  04b2 721050c0      	bset	_CLK_ICKCR,#0
3867  04b6               L5312:
3868                     ; 337     while ((CLK_ICKCR & CLK_ICKCR_HSIRDY) == 0); //  Wait for the HSI to be ready for use.
3870  04b6 c650c0        	ld	a,_CLK_ICKCR
3871  04b9 a502          	bcp	a,#2
3872  04bb 27f9          	jreq	L5312
3873                     ; 338     CLK_CKDIVR     = 0;            //  Ensure the clocks are running at full speed.
3875  04bd 725f50c6      	clr	_CLK_CKDIVR
3876                     ; 342     ADC_CR1     &= ~ADC_CR1_SPSEL_MSK;
3878  04c1 c65401        	ld	a,_ADC_CR1
3879  04c4 a48f          	and	a,#143
3880  04c6 c75401        	ld	_ADC_CR1,a
3881                     ; 343     ADC_CR1     |= 0x20;          //  Set prescaler (SPSEL bits) to 4, fADC = 4 MHz
3883  04c9 721a5401      	bset	_ADC_CR1,#5
3884                     ; 344     CLK_SWIMCCR  = 0x00;          //  Set SWIM to run at clock / 2.
3886  04cd 725f50cd      	clr	_CLK_SWIMCCR
3887                     ; 345     CLK_SWR      = 0xE1;          //  Use HSI as the clock source.
3889  04d1 35e150c4      	mov	_CLK_SWR,#225
3890                     ; 346     CLK_SWCR     = 0x00;          //  Reset the clock switch control register.
3892  04d5 725f50c5      	clr	_CLK_SWCR
3893                     ; 347     CLK_SWCR    |= CLK_SWCR_SWEN; //  Enable switching.
3895  04d9 721250c5      	bset	_CLK_SWCR,#1
3897  04dd               L3412:
3898                     ; 348     while ((CLK_SWCR & CLK_SWCR_SWBSY) != 0);  //  Pause while the clock switch is busy.
3900  04dd c650c5        	ld	a,_CLK_SWCR
3901  04e0 a501          	bcp	a,#1
3902  04e2 26f9          	jrne	L3412
3903                     ; 349 } // initialise_system_clock()
3906  04e4 81            	ret
3953                     ; 358 int main(void)
3953                     ; 359 {
3954                     	switch	.text
3955  04e5               _main:
3957  04e5 89            	pushw	x
3958       00000002      OFST:	set	2
3961                     ; 361 	int ee = eedata[0]; // This is to prevent the linker from removing .eeprom section
3963  04e6 ce0000        	ldw	x,_eedata
3964  04e9 1f01          	ldw	(OFST-1,sp),x
3966                     ; 363 	disable_interrupts();      // no interrupts yet
3969  04eb 9b            sim
3971                     ; 364 	initialise_system_clock(); // set main-clock to 16 MHz
3974  04ec adc0          	call	_initialise_system_clock
3976                     ; 365 	setup_gpio_ports();        // Initialise all GPIO ports
3978  04ee cd03fe        	call	_setup_gpio_ports
3980                     ; 366 	setup_timer2();            // set TMR2 clock to 1 kHz for interrupt
3982  04f1 cd03e9        	call	_setup_timer2
3984                     ; 369     scheduler_init();                    // init. task scheduler
3986  04f4 cd0000        	call	_scheduler_init
3988                     ; 370     add_task(std_task ,"STD", 50,  100); // every 100 msec.
3990  04f7 ae0064        	ldw	x,#100
3991  04fa 89            	pushw	x
3992  04fb ae0032        	ldw	x,#50
3993  04fe 89            	pushw	x
3994  04ff ae0000        	ldw	x,#L5612
3995  0502 89            	pushw	x
3996  0503 ae04a7        	ldw	x,#_std_task
3997  0506 cd0000        	call	_add_task
3999  0509 5b06          	addw	sp,#6
4000                     ; 371 	enable_interrupts();                 // enable interrupts
4003  050b 9a            rim
4005                     ; 374     leds_out  = LED_ALM1 | LED_OUT1 | LED_AT;
4008  050c ae00a1        	ldw	x,#161
4009  050f bf0d          	ldw	_leds_out,x
4010                     ; 375     leds_out |= LED_ALM1_BLINK | LED_AT_BLINK;
4012  0511 b60e          	ld	a,_leds_out+1
4013  0513 aa42          	or	a,#66
4014  0515 b70e          	ld	_leds_out+1,a
4015                     ; 376     leds_out |= LED_ALM1_BLINK_FAST;
4017  0517 7210000d      	bset	_leds_out,#0
4018  051b               L7612:
4019                     ; 380         dispatch_tasks();     // Run task-scheduler()
4021  051b cd0000        	call	_dispatch_tasks
4023                     ; 381         wait_for_interrupt(); // do nothing
4026  051e 8f            wfi
4030  051f 20fa          	jra	L7612
4183                     	xdef	_main
4184                     	xdef	_std_task
4185                     	xdef	_TIM2_UPD_OVF_IRQHandler
4186                     	xdef	_set_one_led
4187                     	xbit	_pwr_on
4188                     	xref.b	_led_01
4189                     	xref.b	_led_1
4190                     	xref.b	_led_10
4191                     	xref.b	_led_e
4192                     	xref	_eedata
4193                     	switch	.ubsct
4194  0000               _blink_tmr:
4195  0000 00000000      	ds.b	4
4196                     	xdef	_blink_tmr
4197                     	xdef	_std
4198  0004               _hc164_val:
4199  0004 00            	ds.b	1
4200                     	xdef	_hc164_val
4201  0005               _top_01:
4202  0005 00            	ds.b	1
4203                     	xdef	_top_01
4204  0006               _top_1:
4205  0006 00            	ds.b	1
4206                     	xdef	_top_1
4207  0007               _top_10:
4208  0007 00            	ds.b	1
4209                     	xdef	_top_10
4210  0008               _top_100:
4211  0008 00            	ds.b	1
4212                     	xdef	_top_100
4213                     	xdef	_pwr_on_tmr
4214                     	xdef	_mpx_nr
4215  0009               _temp_ntc2:
4216  0009 0000          	ds.b	2
4217                     	xdef	_temp_ntc2
4218  000b               _temp_ntc1:
4219  000b 0000          	ds.b	2
4220                     	xdef	_temp_ntc1
4221  000d               _leds_out:
4222  000d 0000          	ds.b	2
4223                     	xdef	_leds_out
4224                     	xdef	_probe2
4225                     	xdef	_irq_cnt
4226                     	xdef	_delay_val
4227                     	xref	_add_task
4228                     	xref	_dispatch_tasks
4229                     	xref	_scheduler_isr
4230                     	xref	_scheduler_init
4231                     	xref	_menu_fsm
4232                     	xref	_read_buttons
4233                     	xdef	_setup_gpio_ports
4234                     	xdef	_initialise_system_clock
4235                     	xdef	_setup_timer2
4236                     	xdef	_multiplexer
4237                     	xdef	_set_hc164
4238                     .const:	section	.text
4239  0000               L5612:
4240  0000 53544400      	dc.b	"STD",0
4241                     	xref.b	c_x
4242                     	xref.b	c_y
4262                     	end
