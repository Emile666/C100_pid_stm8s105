   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2523                     .bit:	section	.data,bit
2524  0000               _ad_err1:
2525  0000 00            	dc.b	0
2526  0001               _ad_err2:
2527  0001 00            	dc.b	0
2528  0002               _probe2:
2529  0002 00            	dc.b	0
2530  0003               _show_sa_alarm:
2531  0003 00            	dc.b	0
2532  0004               _sound_alarm:
2533  0004 00            	dc.b	0
2534                     	bsct
2535  0000               _mpx_nr:
2536  0000 00            	dc.b	0
2537  0001               _pwr_on_tmr:
2538  0001 03e8          	dc.w	1000
2539  0003               _std:
2540  0003 00            	dc.b	0
2541  0004 00            	dc.b	0
2542  0005 00            	dc.b	0
2543  0006 00            	dc.b	0
2612                     ; 67 void set_hc164(uint8_t x)
2612                     ; 68 {
2614                     	switch	.text
2615  0000               _set_hc164:
2617  0000 88            	push	a
2618  0001 5203          	subw	sp,#3
2619       00000003      OFST:	set	3
2622                     ; 69     uint8_t i, j, p = 0x80;
2624  0003 a680          	ld	a,#128
2625  0005 6b01          	ld	(OFST-2,sp),a
2627                     ; 71     hc164_val = x; // save value for read_buttons() function
2629  0007 7b04          	ld	a,(OFST+1,sp)
2630  0009 b704          	ld	_hc164_val,a
2631                     ; 72     SET_CLK_0;     // CLK  = 0
2633  000b 7219500a      	bres	_PC_ODR,#4
2634                     ; 73     SET_SDIN_0;    // SDIN = 0
2636  000f 7217500a      	bres	_PC_ODR,#3
2637                     ; 74     for (i = 0; i < 8; i++)
2639  0013 0f02          	clr	(OFST-1,sp)
2641  0015               L3661:
2642                     ; 76         if (x & p) SET_SDIN_1;
2644  0015 7b04          	ld	a,(OFST+1,sp)
2645  0017 1501          	bcp	a,(OFST-2,sp)
2646  0019 2706          	jreq	L1761
2649  001b 7216500a      	bset	_PC_ODR,#3
2651  001f 2004          	jra	L3761
2652  0021               L1761:
2653                     ; 77         else       SET_SDIN_0;
2655  0021 7217500a      	bres	_PC_ODR,#3
2656  0025               L3761:
2657                     ; 78         SET_CLK_1;
2659  0025 7218500a      	bset	_PC_ODR,#4
2660                     ; 79         p >>= 1;
2662  0029 0401          	srl	(OFST-2,sp)
2664                     ; 80         for (j = 0; j < 10; j++); // small delay
2666  002b 0f03          	clr	(OFST+0,sp)
2668  002d               L5761:
2672  002d 0c03          	inc	(OFST+0,sp)
2676  002f 7b03          	ld	a,(OFST+0,sp)
2677  0031 a10a          	cp	a,#10
2678  0033 25f8          	jrult	L5761
2679                     ; 81         SET_CLK_0;
2681  0035 7219500a      	bres	_PC_ODR,#4
2682                     ; 74     for (i = 0; i < 8; i++)
2684  0039 0c02          	inc	(OFST-1,sp)
2688  003b 7b02          	ld	a,(OFST-1,sp)
2689  003d a108          	cp	a,#8
2690  003f 25d4          	jrult	L3661
2691                     ; 83 } // set_hc164()
2694  0041 5b04          	addw	sp,#4
2695  0043 81            	ret
2769                     ; 94 void set_one_led(uint8_t nr, uint16_t led, uint16_t blink_msk, uint16_t blink_rate_msk)
2769                     ; 95 {   
2770                     	switch	.text
2771  0044               _set_one_led:
2773  0044 88            	push	a
2774  0045 88            	push	a
2775       00000001      OFST:	set	1
2778                     ; 98    if (leds_out & blink_rate_msk)
2780  0046 be09          	ldw	x,_leds_out
2781  0048 01            	rrwa	x,a
2782  0049 140a          	and	a,(OFST+9,sp)
2783  004b 01            	rrwa	x,a
2784  004c 1409          	and	a,(OFST+8,sp)
2785  004e 01            	rrwa	x,a
2786  004f a30000        	cpw	x,#0
2787  0052 2706          	jreq	L1571
2788                     ; 99         blink_rate = LED_BLINK_FAST;
2790  0054 a61e          	ld	a,#30
2791  0056 6b01          	ld	(OFST+0,sp),a
2794  0058 2004          	jra	L3571
2795  005a               L1571:
2796                     ; 100    else blink_rate = LED_BLINK_SLOW;
2798  005a a63c          	ld	a,#60
2799  005c 6b01          	ld	(OFST+0,sp),a
2801  005e               L3571:
2802                     ; 102    switch (std[nr])
2804  005e 7b02          	ld	a,(OFST+1,sp)
2805  0060 5f            	clrw	x
2806  0061 97            	ld	xl,a
2807  0062 e603          	ld	a,(_std,x)
2809                     ; 148           break;  
2810  0064 4d            	tnz	a
2811  0065 2713          	jreq	L3071
2812  0067 4a            	dec	a
2813  0068 2755          	jreq	L5071
2814  006a 4a            	dec	a
2815  006b 2603          	jrne	L01
2816  006d cc0156        	jp	L1171
2817  0070               L01:
2818  0070 4a            	dec	a
2819  0071 2603          	jrne	L21
2820  0073 cc0103        	jp	L7071
2821  0076               L21:
2822  0076 ac8e018e      	jpf	L7571
2823  007a               L3071:
2824                     ; 104        case STD_LED_OFF:
2824                     ; 105           PD_ODR |= led; // LED off
2826  007a c6500f        	ld	a,_PD_ODR
2827  007d 1a06          	or	a,(OFST+5,sp)
2828  007f c7500f        	ld	_PD_ODR,a
2829                     ; 106           if (leds_out & led)
2831  0082 be09          	ldw	x,_leds_out
2832  0084 01            	rrwa	x,a
2833  0085 1406          	and	a,(OFST+5,sp)
2834  0087 01            	rrwa	x,a
2835  0088 1405          	and	a,(OFST+4,sp)
2836  008a 01            	rrwa	x,a
2837  008b a30000        	cpw	x,#0
2838  008e 2603          	jrne	L41
2839  0090 cc018e        	jp	L7571
2840  0093               L41:
2841                     ; 108              if (leds_out & blink_msk)
2843  0093 be09          	ldw	x,_leds_out
2844  0095 01            	rrwa	x,a
2845  0096 1408          	and	a,(OFST+7,sp)
2846  0098 01            	rrwa	x,a
2847  0099 1407          	and	a,(OFST+6,sp)
2848  009b 01            	rrwa	x,a
2849  009c a30000        	cpw	x,#0
2850  009f 2712          	jreq	L3671
2851                     ; 110                   std[nr]       = STD_LED_BLINK1;
2853  00a1 7b02          	ld	a,(OFST+1,sp)
2854  00a3 5f            	clrw	x
2855  00a4 97            	ld	xl,a
2856  00a5 a603          	ld	a,#3
2857  00a7 e703          	ld	(_std,x),a
2858                     ; 111                   blink_tmr[nr] = 0;
2860  00a9 7b02          	ld	a,(OFST+1,sp)
2861  00ab 5f            	clrw	x
2862  00ac 97            	ld	xl,a
2863  00ad 6f00          	clr	(_blink_tmr,x)
2865  00af ac8e018e      	jpf	L7571
2866  00b3               L3671:
2867                     ; 113              else std[nr] = STD_LED_ON;
2869  00b3 7b02          	ld	a,(OFST+1,sp)
2870  00b5 5f            	clrw	x
2871  00b6 97            	ld	xl,a
2872  00b7 a601          	ld	a,#1
2873  00b9 e703          	ld	(_std,x),a
2874  00bb ac8e018e      	jpf	L7571
2875  00bf               L5071:
2876                     ; 117        case STD_LED_ON:
2876                     ; 118           PD_ODR &= ~led; // LED on
2878  00bf 7b06          	ld	a,(OFST+5,sp)
2879  00c1 43            	cpl	a
2880  00c2 c4500f        	and	a,_PD_ODR
2881  00c5 c7500f        	ld	_PD_ODR,a
2882                     ; 119           if (!(leds_out & led))
2884  00c8 be09          	ldw	x,_leds_out
2885  00ca 01            	rrwa	x,a
2886  00cb 1406          	and	a,(OFST+5,sp)
2887  00cd 01            	rrwa	x,a
2888  00ce 1405          	and	a,(OFST+4,sp)
2889  00d0 01            	rrwa	x,a
2890  00d1 a30000        	cpw	x,#0
2891  00d4 260a          	jrne	L7671
2892                     ; 120              std[nr] = STD_LED_OFF;
2894  00d6 7b02          	ld	a,(OFST+1,sp)
2895  00d8 5f            	clrw	x
2896  00d9 97            	ld	xl,a
2897  00da 6f03          	clr	(_std,x)
2899  00dc ac8e018e      	jpf	L7571
2900  00e0               L7671:
2901                     ; 121           else if (leds_out & blink_msk)
2903  00e0 be09          	ldw	x,_leds_out
2904  00e2 01            	rrwa	x,a
2905  00e3 1408          	and	a,(OFST+7,sp)
2906  00e5 01            	rrwa	x,a
2907  00e6 1407          	and	a,(OFST+6,sp)
2908  00e8 01            	rrwa	x,a
2909  00e9 a30000        	cpw	x,#0
2910  00ec 2603          	jrne	L61
2911  00ee cc018e        	jp	L7571
2912  00f1               L61:
2913                     ; 123              std[nr]       = STD_LED_BLINK1;
2915  00f1 7b02          	ld	a,(OFST+1,sp)
2916  00f3 5f            	clrw	x
2917  00f4 97            	ld	xl,a
2918  00f5 a603          	ld	a,#3
2919  00f7 e703          	ld	(_std,x),a
2920                     ; 124              blink_tmr[nr] = 0;
2922  00f9 7b02          	ld	a,(OFST+1,sp)
2923  00fb 5f            	clrw	x
2924  00fc 97            	ld	xl,a
2925  00fd 6f00          	clr	(_blink_tmr,x)
2926  00ff ac8e018e      	jpf	L7571
2927  0103               L7071:
2928                     ; 127        case STD_LED_BLINK1:
2928                     ; 128           PD_ODR &= ~led; // LED on
2930  0103 7b06          	ld	a,(OFST+5,sp)
2931  0105 43            	cpl	a
2932  0106 c4500f        	and	a,_PD_ODR
2933  0109 c7500f        	ld	_PD_ODR,a
2934                     ; 129           if (!(leds_out & led))
2936  010c be09          	ldw	x,_leds_out
2937  010e 01            	rrwa	x,a
2938  010f 1406          	and	a,(OFST+5,sp)
2939  0111 01            	rrwa	x,a
2940  0112 1405          	and	a,(OFST+4,sp)
2941  0114 01            	rrwa	x,a
2942  0115 a30000        	cpw	x,#0
2943  0118 2608          	jrne	L5771
2944                     ; 130              std[nr] = STD_LED_OFF;
2946  011a 7b02          	ld	a,(OFST+1,sp)
2947  011c 5f            	clrw	x
2948  011d 97            	ld	xl,a
2949  011e 6f03          	clr	(_std,x)
2951  0120 206c          	jra	L7571
2952  0122               L5771:
2953                     ; 131           else if (!(leds_out & blink_msk))
2955  0122 be09          	ldw	x,_leds_out
2956  0124 01            	rrwa	x,a
2957  0125 1408          	and	a,(OFST+7,sp)
2958  0127 01            	rrwa	x,a
2959  0128 1407          	and	a,(OFST+6,sp)
2960  012a 01            	rrwa	x,a
2961  012b a30000        	cpw	x,#0
2962  012e 260a          	jrne	L1002
2963                     ; 132              std[nr] = STD_LED_ON;
2965  0130 7b02          	ld	a,(OFST+1,sp)
2966  0132 5f            	clrw	x
2967  0133 97            	ld	xl,a
2968  0134 a601          	ld	a,#1
2969  0136 e703          	ld	(_std,x),a
2971  0138 2054          	jra	L7571
2972  013a               L1002:
2973                     ; 133           else if (++blink_tmr[nr] > blink_rate)
2975  013a 7b02          	ld	a,(OFST+1,sp)
2976  013c 5f            	clrw	x
2977  013d 97            	ld	xl,a
2978  013e 6c00          	inc	(_blink_tmr,x)
2979  0140 e600          	ld	a,(_blink_tmr,x)
2980  0142 1101          	cp	a,(OFST+0,sp)
2981  0144 2348          	jrule	L7571
2982                     ; 135              std[nr]       = STD_LED_BLINK0;
2984  0146 7b02          	ld	a,(OFST+1,sp)
2985  0148 5f            	clrw	x
2986  0149 97            	ld	xl,a
2987  014a a602          	ld	a,#2
2988  014c e703          	ld	(_std,x),a
2989                     ; 136              blink_tmr[nr] = 0;
2991  014e 7b02          	ld	a,(OFST+1,sp)
2992  0150 5f            	clrw	x
2993  0151 97            	ld	xl,a
2994  0152 6f00          	clr	(_blink_tmr,x)
2995  0154 2038          	jra	L7571
2996  0156               L1171:
2997                     ; 139        case STD_LED_BLINK0:
2997                     ; 140           PD_ODR |= led; // LED off
2999  0156 c6500f        	ld	a,_PD_ODR
3000  0159 1a06          	or	a,(OFST+5,sp)
3001  015b c7500f        	ld	_PD_ODR,a
3002                     ; 141           if (!(leds_out & blink_msk))
3004  015e be09          	ldw	x,_leds_out
3005  0160 01            	rrwa	x,a
3006  0161 1408          	and	a,(OFST+7,sp)
3007  0163 01            	rrwa	x,a
3008  0164 1407          	and	a,(OFST+6,sp)
3009  0166 01            	rrwa	x,a
3010  0167 a30000        	cpw	x,#0
3011  016a 2608          	jrne	L7002
3012                     ; 142              std[nr] = STD_LED_OFF;
3014  016c 7b02          	ld	a,(OFST+1,sp)
3015  016e 5f            	clrw	x
3016  016f 97            	ld	xl,a
3017  0170 6f03          	clr	(_std,x)
3019  0172 201a          	jra	L7571
3020  0174               L7002:
3021                     ; 143           else if (++blink_tmr[nr] > blink_rate)
3023  0174 7b02          	ld	a,(OFST+1,sp)
3024  0176 5f            	clrw	x
3025  0177 97            	ld	xl,a
3026  0178 6c00          	inc	(_blink_tmr,x)
3027  017a e600          	ld	a,(_blink_tmr,x)
3028  017c 1101          	cp	a,(OFST+0,sp)
3029  017e 230e          	jrule	L7571
3030                     ; 145              std[nr]       = STD_LED_BLINK1;
3032  0180 7b02          	ld	a,(OFST+1,sp)
3033  0182 5f            	clrw	x
3034  0183 97            	ld	xl,a
3035  0184 a603          	ld	a,#3
3036  0186 e703          	ld	(_std,x),a
3037                     ; 146              blink_tmr[nr] = 0;
3039  0188 7b02          	ld	a,(OFST+1,sp)
3040  018a 5f            	clrw	x
3041  018b 97            	ld	xl,a
3042  018c 6f00          	clr	(_blink_tmr,x)
3043  018e               L7571:
3044                     ; 150 } // set_one_led()
3047  018e 85            	popw	x
3048  018f 81            	ret
3085                     ; 160 void multiplexer(void)
3085                     ; 161 {
3086                     	switch	.text
3087  0190               _multiplexer:
3089  0190 88            	push	a
3090       00000001      OFST:	set	1
3093                     ; 162     LEDS_OFF;             // clear LEDs
3095  0191 7214500a      	bset	_PC_ODR,#2
3096                     ; 163     PE_ODR |= SEG7_C;     // disable 7-segment display C
3098  0195 72105014      	bset	_PE_ODR,#0
3099                     ; 164     PD_ODR |= PORTD_OUT;  // disable all other 7-segment displays
3101  0199 c6500f        	ld	a,_PD_ODR
3102  019c aafd          	or	a,#253
3103  019e c7500f        	ld	_PD_ODR,a
3104                     ; 165     set_hc164(0x00);      // disable CA-lines of 7-segment displays
3106  01a1 4f            	clr	a
3107  01a2 cd0000        	call	_set_hc164
3109                     ; 167     switch (mpx_nr)
3111  01a5 b600          	ld	a,_mpx_nr
3113                     ; 226             break;
3114  01a7 4d            	tnz	a
3115  01a8 2731          	jreq	L5102
3116  01aa 4a            	dec	a
3117  01ab 275a          	jreq	L7102
3118  01ad 4a            	dec	a
3119  01ae 2603cc0233    	jreq	L1202
3120  01b3 4a            	dec	a
3121  01b4 2603          	jrne	L22
3122  01b6 cc025f        	jp	L3202
3123  01b9               L22:
3124  01b9 4a            	dec	a
3125  01ba 2603          	jrne	L42
3126  01bc cc028b        	jp	L5202
3127  01bf               L42:
3128  01bf 4a            	dec	a
3129  01c0 2603          	jrne	L62
3130  01c2 cc02e6        	jp	L7202
3131  01c5               L62:
3132  01c5 4a            	dec	a
3133  01c6 2603          	jrne	L03
3134  01c8 cc0310        	jp	L1302
3135  01cb               L03:
3136  01cb 4a            	dec	a
3137  01cc 2603          	jrne	L23
3138  01ce cc033a        	jp	L3302
3139  01d1               L23:
3140  01d1 4a            	dec	a
3141  01d2 2603          	jrne	L43
3142  01d4 cc0364        	jp	L5302
3143  01d7               L43:
3144  01d7 ac880388      	jpf	L7302
3145  01db               L5102:
3146                     ; 169         case 0: // output CA1 BOTTOM display (LSB)
3146                     ; 170             set_hc164(0x01);
3148  01db a601          	ld	a,#1
3149  01dd cd0000        	call	_set_hc164
3151                     ; 171             PE_ODR &= ~PE_LEDS(bot_01);   // Update PE0 (SEG7_C)
3153  01e0 b600          	ld	a,_bot_01
3154  01e2 a401          	and	a,#1
3155  01e4 43            	cpl	a
3156  01e5 c45014        	and	a,_PE_ODR
3157  01e8 c75014        	ld	_PE_ODR,a
3158                     ; 172             PD_ODR &= ~PD_LEDS(bot_01);   // Update all other segments
3160  01eb b600          	ld	a,_bot_01
3161  01ed 44            	srl	a
3162  01ee a401          	and	a,#1
3163  01f0 6b01          	ld	(OFST+0,sp),a
3165  01f2 b600          	ld	a,_bot_01
3166  01f4 a4fc          	and	a,#252
3167  01f6 1a01          	or	a,(OFST+0,sp)
3168  01f8 43            	cpl	a
3169  01f9 c4500f        	and	a,_PD_ODR
3170  01fc c7500f        	ld	_PD_ODR,a
3171                     ; 173             mpx_nr = 1;
3173  01ff 35010000      	mov	_mpx_nr,#1
3174                     ; 174             break;
3176  0203 ac8a038a      	jpf	L3502
3177  0207               L7102:
3178                     ; 175         case 1: // output CA2 BOTTOM display
3178                     ; 176             set_hc164(0x02);
3180  0207 a602          	ld	a,#2
3181  0209 cd0000        	call	_set_hc164
3183                     ; 177             PE_ODR &= ~PE_LEDS(bot_1);   // Update PE0 (SEG7_C)
3185  020c b600          	ld	a,_bot_1
3186  020e a401          	and	a,#1
3187  0210 43            	cpl	a
3188  0211 c45014        	and	a,_PE_ODR
3189  0214 c75014        	ld	_PE_ODR,a
3190                     ; 178             PD_ODR &= ~PD_LEDS(bot_1);   // Update all other segments
3192  0217 b600          	ld	a,_bot_1
3193  0219 44            	srl	a
3194  021a a401          	and	a,#1
3195  021c 6b01          	ld	(OFST+0,sp),a
3197  021e b600          	ld	a,_bot_1
3198  0220 a4fc          	and	a,#252
3199  0222 1a01          	or	a,(OFST+0,sp)
3200  0224 43            	cpl	a
3201  0225 c4500f        	and	a,_PD_ODR
3202  0228 c7500f        	ld	_PD_ODR,a
3203                     ; 179             mpx_nr = 2;
3205  022b 35020000      	mov	_mpx_nr,#2
3206                     ; 180             break;
3208  022f ac8a038a      	jpf	L3502
3209  0233               L1202:
3210                     ; 181         case 2: // output CA3 BOTTOM display
3210                     ; 182             set_hc164(0x04);
3212  0233 a604          	ld	a,#4
3213  0235 cd0000        	call	_set_hc164
3215                     ; 183             PE_ODR &= ~PE_LEDS(bot_10);   // Update PE0 (SEG7_C)
3217  0238 b600          	ld	a,_bot_10
3218  023a a401          	and	a,#1
3219  023c 43            	cpl	a
3220  023d c45014        	and	a,_PE_ODR
3221  0240 c75014        	ld	_PE_ODR,a
3222                     ; 184             PD_ODR &= ~PD_LEDS(bot_10);   // Update all other segments
3224  0243 b600          	ld	a,_bot_10
3225  0245 44            	srl	a
3226  0246 a401          	and	a,#1
3227  0248 6b01          	ld	(OFST+0,sp),a
3229  024a b600          	ld	a,_bot_10
3230  024c a4fc          	and	a,#252
3231  024e 1a01          	or	a,(OFST+0,sp)
3232  0250 43            	cpl	a
3233  0251 c4500f        	and	a,_PD_ODR
3234  0254 c7500f        	ld	_PD_ODR,a
3235                     ; 185             mpx_nr = 3;
3237  0257 35030000      	mov	_mpx_nr,#3
3238                     ; 186             break;
3240  025b ac8a038a      	jpf	L3502
3241  025f               L3202:
3242                     ; 187         case 3: // outputs CA4 BOTTOM display (MSB)
3242                     ; 188             set_hc164(0x08);
3244  025f a608          	ld	a,#8
3245  0261 cd0000        	call	_set_hc164
3247                     ; 189             PE_ODR &= ~PE_LEDS(bot_100);  // Update PE0 (SEG7_C)
3249  0264 b600          	ld	a,_bot_100
3250  0266 a401          	and	a,#1
3251  0268 43            	cpl	a
3252  0269 c45014        	and	a,_PE_ODR
3253  026c c75014        	ld	_PE_ODR,a
3254                     ; 190             PD_ODR &= ~PD_LEDS(bot_100);  // Update all other segments
3256  026f b600          	ld	a,_bot_100
3257  0271 44            	srl	a
3258  0272 a401          	and	a,#1
3259  0274 6b01          	ld	(OFST+0,sp),a
3261  0276 b600          	ld	a,_bot_100
3262  0278 a4fc          	and	a,#252
3263  027a 1a01          	or	a,(OFST+0,sp)
3264  027c 43            	cpl	a
3265  027d c4500f        	and	a,_PD_ODR
3266  0280 c7500f        	ld	_PD_ODR,a
3267                     ; 191             mpx_nr = 4;
3269  0283 35040000      	mov	_mpx_nr,#4
3270                     ; 192             break;
3272  0287 ac8a038a      	jpf	L3502
3273  028b               L5202:
3274                     ; 193         case 4: // set Frontpanel LEDs
3274                     ; 194             set_hc164(0x00);
3276  028b 4f            	clr	a
3277  028c cd0000        	call	_set_hc164
3279                     ; 195             LEDS_ENABLE;
3281  028f 7215500a      	bres	_PC_ODR,#2
3282                     ; 196             set_one_led(0,LED_ALM1, LED_ALM1_BLINK, LED_ALM1_BLINK_FAST);
3284  0293 ae0100        	ldw	x,#256
3285  0296 89            	pushw	x
3286  0297 ae0002        	ldw	x,#2
3287  029a 89            	pushw	x
3288  029b ae0001        	ldw	x,#1
3289  029e 89            	pushw	x
3290  029f 4f            	clr	a
3291  02a0 cd0044        	call	_set_one_led
3293  02a3 5b06          	addw	sp,#6
3294                     ; 197             set_one_led(1,LED_ALM2, LED_ALM2_BLINK, LED_ALM2_BLINK_FAST);
3296  02a5 ae0200        	ldw	x,#512
3297  02a8 89            	pushw	x
3298  02a9 ae0008        	ldw	x,#8
3299  02ac 89            	pushw	x
3300  02ad ae0004        	ldw	x,#4
3301  02b0 89            	pushw	x
3302  02b1 a601          	ld	a,#1
3303  02b3 cd0044        	call	_set_one_led
3305  02b6 5b06          	addw	sp,#6
3306                     ; 198             set_one_led(2,LED_OUT1, LED_OUT1_BLINK, LED_OUT1_BLINK_FAST);
3308  02b8 ae0400        	ldw	x,#1024
3309  02bb 89            	pushw	x
3310  02bc ae0010        	ldw	x,#16
3311  02bf 89            	pushw	x
3312  02c0 ae0020        	ldw	x,#32
3313  02c3 89            	pushw	x
3314  02c4 a602          	ld	a,#2
3315  02c6 cd0044        	call	_set_one_led
3317  02c9 5b06          	addw	sp,#6
3318                     ; 199             set_one_led(3,LED_AT  , LED_AT_BLINK  , LED_AT_BLINK_FAST);
3320  02cb ae0800        	ldw	x,#2048
3321  02ce 89            	pushw	x
3322  02cf ae0040        	ldw	x,#64
3323  02d2 89            	pushw	x
3324  02d3 ae0080        	ldw	x,#128
3325  02d6 89            	pushw	x
3326  02d7 a603          	ld	a,#3
3327  02d9 cd0044        	call	_set_one_led
3329  02dc 5b06          	addw	sp,#6
3330                     ; 200             mpx_nr = 5;
3332  02de 35050000      	mov	_mpx_nr,#5
3333                     ; 201             break;
3335  02e2 ac8a038a      	jpf	L3502
3336  02e6               L7202:
3337                     ; 202         case 5: // output CA1 TOP display (LSB)
3337                     ; 203             set_hc164(0x10);
3339  02e6 a610          	ld	a,#16
3340  02e8 cd0000        	call	_set_hc164
3342                     ; 204             PE_ODR &= ~PE_LEDS(top_01);  // Update PE0 (SEG7_C)
3344  02eb b600          	ld	a,_top_01
3345  02ed a401          	and	a,#1
3346  02ef 43            	cpl	a
3347  02f0 c45014        	and	a,_PE_ODR
3348  02f3 c75014        	ld	_PE_ODR,a
3349                     ; 205             PD_ODR &= ~PD_LEDS(top_01);  // Update all other segments
3351  02f6 b600          	ld	a,_top_01
3352  02f8 44            	srl	a
3353  02f9 a401          	and	a,#1
3354  02fb 6b01          	ld	(OFST+0,sp),a
3356  02fd b600          	ld	a,_top_01
3357  02ff a4fc          	and	a,#252
3358  0301 1a01          	or	a,(OFST+0,sp)
3359  0303 43            	cpl	a
3360  0304 c4500f        	and	a,_PD_ODR
3361  0307 c7500f        	ld	_PD_ODR,a
3362                     ; 206             mpx_nr = 6;
3364  030a 35060000      	mov	_mpx_nr,#6
3365                     ; 207             break;
3367  030e 207a          	jra	L3502
3368  0310               L1302:
3369                     ; 208         case 6: // output CA2 TOP display
3369                     ; 209             set_hc164(0x20);
3371  0310 a620          	ld	a,#32
3372  0312 cd0000        	call	_set_hc164
3374                     ; 210             PE_ODR &= ~PE_LEDS(top_1);   // Update PE0 (SEG7_C)
3376  0315 b600          	ld	a,_top_1
3377  0317 a401          	and	a,#1
3378  0319 43            	cpl	a
3379  031a c45014        	and	a,_PE_ODR
3380  031d c75014        	ld	_PE_ODR,a
3381                     ; 211             PD_ODR &= ~PD_LEDS(top_1);   // Update all other segments
3383  0320 b600          	ld	a,_top_1
3384  0322 44            	srl	a
3385  0323 a401          	and	a,#1
3386  0325 6b01          	ld	(OFST+0,sp),a
3388  0327 b600          	ld	a,_top_1
3389  0329 a4fc          	and	a,#252
3390  032b 1a01          	or	a,(OFST+0,sp)
3391  032d 43            	cpl	a
3392  032e c4500f        	and	a,_PD_ODR
3393  0331 c7500f        	ld	_PD_ODR,a
3394                     ; 212             mpx_nr = 7;
3396  0334 35070000      	mov	_mpx_nr,#7
3397                     ; 213             break;
3399  0338 2050          	jra	L3502
3400  033a               L3302:
3401                     ; 214         case 7: // output CA3 TOP display
3401                     ; 215             set_hc164(0x40);
3403  033a a640          	ld	a,#64
3404  033c cd0000        	call	_set_hc164
3406                     ; 216             PE_ODR &= ~PE_LEDS(top_10);  // Update PE0 (SEG7_C)
3408  033f b600          	ld	a,_top_10
3409  0341 a401          	and	a,#1
3410  0343 43            	cpl	a
3411  0344 c45014        	and	a,_PE_ODR
3412  0347 c75014        	ld	_PE_ODR,a
3413                     ; 217             PD_ODR &= ~PD_LEDS(top_10);  // Update all other segments
3415  034a b600          	ld	a,_top_10
3416  034c 44            	srl	a
3417  034d a401          	and	a,#1
3418  034f 6b01          	ld	(OFST+0,sp),a
3420  0351 b600          	ld	a,_top_10
3421  0353 a4fc          	and	a,#252
3422  0355 1a01          	or	a,(OFST+0,sp)
3423  0357 43            	cpl	a
3424  0358 c4500f        	and	a,_PD_ODR
3425  035b c7500f        	ld	_PD_ODR,a
3426                     ; 218             mpx_nr = 8;
3428  035e 35080000      	mov	_mpx_nr,#8
3429                     ; 219             break;
3431  0362 2026          	jra	L3502
3432  0364               L5302:
3433                     ; 220         case 8: // outputs CA4 TOP display (MSB)
3433                     ; 221             set_hc164(0x80);
3435  0364 a680          	ld	a,#128
3436  0366 cd0000        	call	_set_hc164
3438                     ; 222             PE_ODR &= ~PE_LEDS(top_100); // Update PE0 (SEG7_C)
3440  0369 b600          	ld	a,_top_100
3441  036b a401          	and	a,#1
3442  036d 43            	cpl	a
3443  036e c45014        	and	a,_PE_ODR
3444  0371 c75014        	ld	_PE_ODR,a
3445                     ; 223             PD_ODR &= ~PD_LEDS(top_100); // Update all other segments
3447  0374 b600          	ld	a,_top_100
3448  0376 44            	srl	a
3449  0377 a401          	and	a,#1
3450  0379 6b01          	ld	(OFST+0,sp),a
3452  037b b600          	ld	a,_top_100
3453  037d a4fc          	and	a,#252
3454  037f 1a01          	or	a,(OFST+0,sp)
3455  0381 43            	cpl	a
3456  0382 c4500f        	and	a,_PD_ODR
3457  0385 c7500f        	ld	_PD_ODR,a
3458  0388               L7302:
3459                     ; 224         default: // FALL-THROUGH (less code-size)
3459                     ; 225             mpx_nr = 0;
3461  0388 3f00          	clr	_mpx_nr
3462                     ; 226             break;
3464  038a               L3502:
3465                     ; 228 } // multiplexer()
3468  038a 84            	pop	a
3469  038b 81            	ret
3506                     ; 237 @interrupt void TIM2_UPD_OVF_IRQHandler(void)
3506                     ; 238 {
3507                     	switch	.text
3508  038c               _TIM2_UPD_OVF_IRQHandler:
3510  038c 8a            	push	cc
3511  038d 84            	pop	a
3512  038e a4bf          	and	a,#191
3513  0390 88            	push	a
3514  0391 86            	pop	cc
3515  0392 3b0002        	push	c_x+2
3516  0395 be00          	ldw	x,c_x
3517  0397 89            	pushw	x
3518  0398 3b0002        	push	c_y+2
3519  039b be00          	ldw	x,c_y
3520  039d 89            	pushw	x
3523                     ; 239     scheduler_isr();  // Run scheduler interrupt function
3525  039e cd0000        	call	_scheduler_isr
3527                     ; 240     if (!pwr_on)
3529                     	btst	_pwr_on
3530  03a6 251c          	jrult	L5602
3531                     ; 242         top_100    = top_10 = top_1 = top_01 = bot_01 = LED_OFF;
3533  03a8 3f00          	clr	_bot_01
3534  03aa 3f00          	clr	_top_01
3535  03ac 3f00          	clr	_top_1
3536  03ae 3f00          	clr	_top_10
3537  03b0 3f00          	clr	_top_100
3538                     ; 243         bot_100    = LED_O; 
3540  03b2 35e70000      	mov	_bot_100,#231
3541                     ; 244         bot_10     = bot_1 = LED_F;
3543  03b6 35740000      	mov	_bot_1,#116
3544  03ba 450000        	mov	_bot_10,_bot_1
3545                     ; 245         pwr_on_tmr = 2000; // 2 seconds
3547  03bd ae07d0        	ldw	x,#2000
3548  03c0 bf01          	ldw	_pwr_on_tmr,x
3550  03c2 202b          	jra	L7602
3551  03c4               L5602:
3552                     ; 247     else if (pwr_on_tmr > 0)
3554  03c4 9c            	rvf
3555  03c5 be01          	ldw	x,_pwr_on_tmr
3556  03c7 2d26          	jrsle	L7602
3557                     ; 249         pwr_on_tmr--;
3559  03c9 be01          	ldw	x,_pwr_on_tmr
3560  03cb 1d0001        	subw	x,#1
3561  03ce bf01          	ldw	_pwr_on_tmr,x
3562                     ; 250         top_100 = LED_C; top_10 = LED_1; top_1 = top_01 = LED_0;
3564  03d0 35e40000      	mov	_top_100,#228
3567  03d4 35030000      	mov	_top_10,#3
3570  03d8 35e70000      	mov	_top_01,#231
3571  03dc 450000        	mov	_top_1,_top_01
3572                     ; 251         bot_100 = LED_P; bot_10 = LED_I; bot_1 = LED_d; bot_01 = LED_c;
3574  03df 35760000      	mov	_bot_100,#118
3577  03e3 35030000      	mov	_bot_10,#3
3580  03e7 35d30000      	mov	_bot_1,#211
3583  03eb 35d00000      	mov	_bot_01,#208
3584  03ef               L7602:
3585                     ; 253     multiplexer();             // Run multiplexer for Display and Keys
3587  03ef cd0190        	call	_multiplexer
3589                     ; 254     TIM2_SR1 &= ~TIM2_SR1_UIF; // Reset interrupt (UIF bit) so it will not fire again straight away.
3591  03f2 72115302      	bres	_TIM2_SR1,#0
3592                     ; 255 } // TIM2_UPD_OVF_IRQHandler()
3595  03f6 85            	popw	x
3596  03f7 bf00          	ldw	c_y,x
3597  03f9 320002        	pop	c_y+2
3598  03fc 85            	popw	x
3599  03fd bf00          	ldw	c_x,x
3600  03ff 320002        	pop	c_x+2
3601  0402 80            	iret
3629                     ; 263 void setup_timer2(void)
3629                     ; 264 {
3630                     	switch	.text
3631  0403               _setup_timer2:
3635                     ; 265     TIM2_PSCR = 0x04;         //  Prescaler = 16
3637  0403 3504530c      	mov	_TIM2_PSCR,#4
3638                     ; 266     TIM2_ARRH = 0x03;         //  High byte of 1000
3640  0407 3503530d      	mov	_TIM2_ARRH,#3
3641                     ; 267     TIM2_ARRL = 0xE8;         //  Low  byte of 1000
3643  040b 35e8530e      	mov	_TIM2_ARRL,#232
3644                     ; 268     TIM2_IER  = TIM2_IER_UIE; //  Enable the update interrupts, disable all others
3646  040f 35015301      	mov	_TIM2_IER,#1
3647                     ; 269     TIM2_CR1  = TIM2_CR1_CEN; //  Finally enable the timer
3649  0413 35015300      	mov	_TIM2_CR1,#1
3650                     ; 270 } // setup_timer2()
3653  0417 81            	ret
3692                     ; 278 void setup_gpio_ports(void)
3692                     ; 279 {
3693                     	switch	.text
3694  0418               _setup_gpio_ports:
3698                     ; 283     PA_DDR     |=   SSR | ALARM;         // Set PORTA pins as outputs
3700  0418 c65002        	ld	a,_PA_DDR
3701  041b aa0c          	or	a,#12
3702  041d c75002        	ld	_PA_DDR,a
3703                     ; 284     PA_CR1     |=   SSR | ALARM;         // Set output pins to Push-Pull
3705  0420 c65003        	ld	a,_PA_CR1
3706  0423 aa0c          	or	a,#12
3707  0425 c75003        	ld	_PA_CR1,a
3708                     ; 285     PA_ODR     &= ~(SSR | ALARM);        // Disable SSR and Alarm outputs
3710  0428 c65000        	ld	a,_PA_ODR
3711  042b a4f3          	and	a,#243
3712  042d c75000        	ld	_PA_ODR,a
3713                     ; 290     PB_DDR     |=  PORTB_OUT;            // Set PORTB pins as outputs
3715  0430 c65007        	ld	a,_PB_DDR
3716  0433 aaf0          	or	a,#240
3717  0435 c75007        	ld	_PB_DDR,a
3718                     ; 291     PB_CR1     |=  PORTB_OUT;            // Set output pins to Push-Pull
3720  0438 c65008        	ld	a,_PB_CR1
3721  043b aaf0          	or	a,#240
3722  043d c75008        	ld	_PB_CR1,a
3723                     ; 292     PB_ODR     |= (CS_TC | CS_PT100 | CS_NRF24L01); // Disable SPI Chip-Selects
3725  0440 c65005        	ld	a,_PB_ODR
3726  0443 aae0          	or	a,#224
3727  0445 c75005        	ld	_PB_ODR,a
3728                     ; 293     PB_ODR     &= ~CE_NRF24L01;          // Set CE for NRF24L01 low
3730  0448 72195005      	bres	_PB_ODR,#4
3731                     ; 298     PC_ODR     &= ~PORTC_OUT;            // Turn off all pins from Port C
3733  044c c6500a        	ld	a,_PC_ODR
3734  044f a483          	and	a,#131
3735  0451 c7500a        	ld	_PC_ODR,a
3736                     ; 299     PC_DDR     |= PORTC_OUT;             // Set PORTC pins as outputs
3738  0454 c6500c        	ld	a,_PC_DDR
3739  0457 aa7c          	or	a,#124
3740  0459 c7500c        	ld	_PC_DDR,a
3741                     ; 300     PC_CR1     |= PORTC_OUT;             // Set output pins to Push-Pull
3743  045c c6500d        	ld	a,_PC_CR1
3744  045f aa7c          	or	a,#124
3745  0461 c7500d        	ld	_PC_CR1,a
3746                     ; 301 	PC_CR2     |=  (SPI_MOSI | SPI_SCK); // Set to 10 MHz
3748  0464 c6500e        	ld	a,_PC_CR2
3749  0467 aa60          	or	a,#96
3750  0469 c7500e        	ld	_PC_CR2,a
3751                     ; 302     PC_ODR     &= ~(SPI_MOSI | SPI_SCK); // MOSI = 0, SPI_CLK = 0
3753  046c c6500a        	ld	a,_PC_ODR
3754  046f a49f          	and	a,#159
3755  0471 c7500a        	ld	_PC_ODR,a
3756                     ; 303     PC_DDR     &= ~PORTC_IN;             // set PORTC pins as inputs
3758  0474 c6500c        	ld	a,_PC_DDR
3759  0477 a47d          	and	a,#125
3760  0479 c7500c        	ld	_PC_DDR,a
3761                     ; 304 	PC_CR1     &= ~PORTC_IN;             // set input pins to Floating
3763  047c c6500d        	ld	a,_PC_CR1
3764  047f a47d          	and	a,#125
3765  0481 c7500d        	ld	_PC_CR1,a
3766                     ; 305     LEDS_OFF;                            // Disable frontpanel LEDs
3768  0484 7214500a      	bset	_PC_ODR,#2
3769                     ; 306     SET_SDIN_0;                          // Disable SDIN for HC164
3771  0488 7217500a      	bres	_PC_ODR,#3
3772                     ; 307     SET_CLK_0;                           // Disable CLK for HC164
3774  048c 7219500a      	bres	_PC_ODR,#4
3775                     ; 312     PD_DDR     |=  PORTD_OUT;            // Set PORTD pins as outputs
3777  0490 c65011        	ld	a,_PD_DDR
3778  0493 aafd          	or	a,#253
3779  0495 c75011        	ld	_PD_DDR,a
3780                     ; 313     PD_CR1     |=  PORTD_OUT;            // Set output pins to Push-Pull
3782  0498 c65012        	ld	a,_PD_CR1
3783  049b aafd          	or	a,#253
3784  049d c75012        	ld	_PD_CR1,a
3785                     ; 314     PD_ODR     &= ~PORTD_OUT;            // Disable 7-segment displays
3787  04a0 c6500f        	ld	a,_PD_ODR
3788  04a3 a402          	and	a,#2
3789  04a5 c7500f        	ld	_PD_ODR,a
3790                     ; 319     PE_ODR     |=  (I2C_SCL | I2C_SDA);           // Must be set here, or I2C will not work
3792  04a8 c65014        	ld	a,_PE_ODR
3793  04ab aa06          	or	a,#6
3794  04ad c75014        	ld	_PE_ODR,a
3795                     ; 320     PE_DDR     |=  (I2C_SCL | I2C_SDA | SEG7_C);  // Set as outputs
3797  04b0 c65016        	ld	a,_PE_DDR
3798  04b3 aa07          	or	a,#7
3799  04b5 c75016        	ld	_PE_DDR,a
3800                     ; 321     PE_CR1     |=  SEG7_C;                        // Set output pin to Push-Pull
3802  04b8 72105017      	bset	_PE_CR1,#0
3803                     ; 322     PE_ODR     &= ~SEG7_C;                        // Disable 7-segment display
3805  04bc 72115014      	bres	_PE_ODR,#0
3806                     ; 323 } // setup_gpio_ports()
3809  04c0 81            	ret
3832                     ; 331 void adc_task(void)
3832                     ; 332 {
3833                     	switch	.text
3834  04c1               _adc_task:
3838                     ; 333 } // adc_task()
3841  04c1 81            	ret
3866                     ; 341 void std_task(void)
3866                     ; 342 {
3867                     	switch	.text
3868  04c2               _std_task:
3872                     ; 343     read_buttons(); // reads the buttons keys, result is stored in _buttons
3874  04c2 cd0000        	call	_read_buttons
3876                     ; 344     menu_fsm();     // Finite State Machine menu
3878  04c5 cd0000        	call	_menu_fsm
3880                     ; 346 } // std_task()
3883  04c8 81            	ret
3951                     ; 354 void ctrl_task(void)
3951                     ; 355 {
3952                     	switch	.text
3953  04c9               _ctrl_task:
3955  04c9 5206          	subw	sp,#6
3956       00000006      OFST:	set	6
3959                     ; 358     if (eeprom_read_config(EEADR_MENU_ITEM(CF))) // true = Fahrenheit
3961  04cb a67d          	ld	a,#125
3962  04cd cd0000        	call	_eeprom_read_config
3964  04d0 a30000        	cpw	x,#0
3965  04d3 2706          	jreq	L3612
3966                     ; 359          fahrenheit = true;
3968  04d5 72100000      	bset	_fahrenheit
3970  04d9 2004          	jra	L5612
3971  04db               L3612:
3972                     ; 360     else fahrenheit = false;
3974  04db 72110000      	bres	_fahrenheit
3975  04df               L5612:
3976                     ; 361     if (eeprom_read_config(EEADR_MENU_ITEM(HrS))) // true = hours
3978  04df a67f          	ld	a,#127
3979  04e1 cd0000        	call	_eeprom_read_config
3981  04e4 a30000        	cpw	x,#0
3982  04e7 2706          	jreq	L7612
3983                     ; 362          minutes = false; // control-timing is in hours 
3985  04e9 72110000      	bres	_minutes
3987  04ed 2004          	jra	L1712
3988  04ef               L7612:
3989                     ; 363     else minutes = true;  // control-timing is in minutes
3991  04ef 72100000      	bset	_minutes
3992  04f3               L1712:
3993                     ; 367       if (eeprom_read_config(EEADR_MENU_ITEM(Pb2))) 
3995  04f3 a67e          	ld	a,#126
3996  04f5 cd0000        	call	_eeprom_read_config
3998  04f8 a30000        	cpw	x,#0
3999  04fb 2706          	jreq	L3712
4000                     ; 368         probe2 = true;
4002  04fd 72100002      	bset	_probe2
4004  0501 2004          	jra	L5712
4005  0503               L3712:
4006                     ; 369    else probe2 = false;
4008  0503 72110002      	bres	_probe2
4009  0507               L5712:
4010                     ; 370    if (ad_err1 || (ad_err2 && probe2))
4012                     	btst	_ad_err1
4013  050c 250e          	jrult	L1022
4015                     	btst	_ad_err2
4016  0513 243b          	jruge	L7712
4018                     	btst	_probe2
4019  051a 2434          	jruge	L7712
4020  051c               L1022:
4021                     ; 372        sound_alarm = true;
4023  051c 72100004      	bset	_sound_alarm
4024                     ; 373        if (menu_is_idle)
4026                     	btst	_menu_is_idle
4027  0525 241d          	jruge	L3022
4028                     ; 375           top_100 = LED_A;
4030  0527 35770000      	mov	_top_100,#119
4031                     ; 376           top_10  = LED_L;
4033  052b 35e00000      	mov	_top_10,#224
4034                     ; 377           top_1   = LED_S; // sensor not connected alarm
4036  052f 35b50000      	mov	_top_1,#181
4037                     ; 378           if (ad_err1) top_01 = LED_1;
4039                     	btst	_ad_err1
4040  0538 2406          	jruge	L5022
4043  053a 35030000      	mov	_top_01,#3
4045  053e 2004          	jra	L3022
4046  0540               L5022:
4047                     ; 379           else         top_01 = LED_2;
4049  0540 35d60000      	mov	_top_01,#214
4050  0544               L3022:
4051                     ; 381        cooling_delay = heating_delay = 60;
4053  0544 ae003c        	ldw	x,#60
4054  0547 bf00          	ldw	_heating_delay,x
4055  0549 be00          	ldw	x,_heating_delay
4056  054b bf00          	ldw	_cooling_delay,x
4058  054d               L1122:
4059                     ; 436 } // ctrl_task()
4062  054d 5b06          	addw	sp,#6
4063  054f 81            	ret
4064  0550               L7712:
4065                     ; 383        sound_alarm = false; // reset the piezo buzzer
4067  0550 72110004      	bres	_sound_alarm
4068                     ; 384        if(((uint8_t)eeprom_read_config(EEADR_MENU_ITEM(rn))) < THERMOSTAT_MODE)
4070  0554 a684          	ld	a,#132
4071  0556 cd0000        	call	_eeprom_read_config
4073  0559 9f            	ld	a,xl
4074  055a a106          	cp	a,#6
4075  055c 2408          	jruge	L3122
4076                     ; 385             leds_out |=  (LED_AT | LED_AT_BLINK); // Indicate profile mode
4078  055e b60a          	ld	a,_leds_out+1
4079  0560 aac0          	or	a,#192
4080  0562 b70a          	ld	_leds_out+1,a
4082  0564 2006          	jra	L5122
4083  0566               L3122:
4084                     ; 386        else leds_out &= ~(LED_AT | LED_AT_BLINK);
4086  0566 b60a          	ld	a,_leds_out+1
4087  0568 a43f          	and	a,#63
4088  056a b70a          	ld	_leds_out+1,a
4089  056c               L5122:
4090                     ; 388        ts = eeprom_read_config(EEADR_MENU_ITEM(Ts)); // Read Ts [seconds]
4092  056c a683          	ld	a,#131
4093  056e cd0000        	call	_eeprom_read_config
4095  0571 01            	rrwa	x,a
4096  0572 b700          	ld	_ts,a
4097  0574 02            	rlwa	x,a
4098                     ; 389        sa = eeprom_read_config(EEADR_MENU_ITEM(SA)); // Show Alarm parameter
4100  0575 a677          	ld	a,#119
4101  0577 cd0000        	call	_eeprom_read_config
4103  057a 1f03          	ldw	(OFST-3,sp),x
4105                     ; 390        if (sa)
4107  057c 1e03          	ldw	x,(OFST-3,sp)
4108  057e 275b          	jreq	L7122
4109                     ; 392             if (minutes) // is timing-control in minutes?
4111                     	btst	_minutes
4112  0585 240a          	jruge	L1222
4113                     ; 393                  diff = temp_ntc1 - setpoint;
4115  0587 be07          	ldw	x,_temp_ntc1
4116  0589 72b00000      	subw	x,_setpoint
4117  058d 1f05          	ldw	(OFST-1,sp),x
4120  058f 200e          	jra	L3222
4121  0591               L1222:
4122                     ; 394             else diff = temp_ntc1 - eeprom_read_config(EEADR_MENU_ITEM(SP));
4124  0591 a672          	ld	a,#114
4125  0593 cd0000        	call	_eeprom_read_config
4127  0596 1f01          	ldw	(OFST-5,sp),x
4129  0598 be07          	ldw	x,_temp_ntc1
4130  059a 72f001        	subw	x,(OFST-5,sp)
4131  059d 1f05          	ldw	(OFST-1,sp),x
4133  059f               L3222:
4134                     ; 395             if (diff < 0) 
4136  059f 9c            	rvf
4137  05a0 1e05          	ldw	x,(OFST-1,sp)
4138  05a2 2e05          	jrsge	L5222
4139                     ; 396                  diff = -diff;
4141  05a4 1e05          	ldw	x,(OFST-1,sp)
4142  05a6 50            	negw	x
4143  05a7 1f05          	ldw	(OFST-1,sp),x
4145  05a9               L5222:
4146                     ; 397             if (sa < 0)
4148  05a9 9c            	rvf
4149  05aa 1e03          	ldw	x,(OFST-3,sp)
4150  05ac 2e1a          	jrsge	L7222
4151                     ; 399                  sa = -sa;
4153  05ae 1e03          	ldw	x,(OFST-3,sp)
4154  05b0 50            	negw	x
4155  05b1 1f03          	ldw	(OFST-3,sp),x
4157                     ; 400                  sound_alarm = (diff <= sa); // enable buzzer if diff is small
4159  05b3 9c            	rvf
4160  05b4 1e05          	ldw	x,(OFST-1,sp)
4161  05b6 1303          	cpw	x,(OFST-3,sp)
4162  05b8 2d02          	jrsle	L26
4163  05ba 2006          	jp	L25
4164  05bc               L26:
4165  05bc 72100004      	bset	_sound_alarm
4166  05c0 2004          	jra	L45
4167  05c2               L25:
4168  05c2 72110004      	bres	_sound_alarm
4169  05c6               L45:
4171  05c6 2013          	jra	L7122
4172  05c8               L7222:
4173                     ; 402                  sound_alarm = (diff >= sa); // enable buzzer if diff is large
4175  05c8 9c            	rvf
4176  05c9 1e05          	ldw	x,(OFST-1,sp)
4177  05cb 1303          	cpw	x,(OFST-3,sp)
4178  05cd 2e02          	jrsge	L46
4179  05cf 2006          	jp	L65
4180  05d1               L46:
4181  05d1 72100004      	bset	_sound_alarm
4182  05d5 2004          	jra	L06
4183  05d7               L65:
4184  05d7 72110004      	bres	_sound_alarm
4185  05db               L06:
4186  05db               L7122:
4187                     ; 405        if (ts == 0)                // PID Ts parameter is 0?
4189  05db 3d00          	tnz	_ts
4190  05dd 2608          	jrne	L3322
4191                     ; 407            temperature_control();  // Run thermostat
4193  05df cd0000        	call	_temperature_control
4195                     ; 408            pid_out = 0;            // Disable PID-output
4197  05e2 5f            	clrw	x
4198  05e3 bf00          	ldw	_pid_out,x
4200  05e5 2003          	jra	L5322
4201  05e7               L3322:
4202                     ; 412            pid_control();          // Run PID controller
4204  05e7 cd0000        	call	_pid_control
4206  05ea               L5322:
4207                     ; 414        if (menu_is_idle)           // show temperature if menu is idle
4209                     	btst	_menu_is_idle
4210  05ef 2503          	jrult	L66
4211  05f1 cc054d        	jp	L1122
4212  05f4               L66:
4213                     ; 416            if (sound_alarm && show_sa_alarm)
4215                     	btst	_sound_alarm
4216  05f9 2415          	jruge	L1422
4218                     	btst	_show_sa_alarm
4219  0600 240e          	jruge	L1422
4220                     ; 418                 top_100 = LED_A;
4222  0602 35770000      	mov	_top_100,#119
4223                     ; 419                 top_10  = LED_L;
4225  0606 35e00000      	mov	_top_10,#224
4226                     ; 420                 top_1   = LED_d;
4228  060a 35d30000      	mov	_top_1,#211
4230  060e 2021          	jra	L3422
4231  0610               L1422:
4232                     ; 422                value_to_led(setpoint,LEDS_TEMP, ROW_BOT); // display setpoint on top-row
4234  0610 4b03          	push	#3
4235  0612 4b01          	push	#1
4236  0614 be00          	ldw	x,_setpoint
4237  0616 cd0000        	call	_value_to_led
4239  0619 85            	popw	x
4240                     ; 423                switch (sensor2_selected)
4242  061a b600          	ld	a,_sensor2_selected
4244                     ; 430                            break;
4245  061c 4d            	tnz	a
4246  061d 2708          	jreq	L3312
4247  061f 4a            	dec	a
4248  0620 2717          	jreq	L5312
4249  0622 4a            	dec	a
4250  0623 2720          	jreq	L7312
4251  0625 200a          	jra	L3422
4252  0627               L3312:
4253                     ; 425                    case 0: value_to_led(temp_ntc1,LEDS_TEMP,ROW_TOP); 
4255  0627 4b02          	push	#2
4256  0629 4b01          	push	#1
4257  062b be07          	ldw	x,_temp_ntc1
4258  062d cd0000        	call	_value_to_led
4260  0630 85            	popw	x
4261                     ; 426                            break;
4262  0631               L3422:
4263                     ; 433            show_sa_alarm = !show_sa_alarm;
4265  0631 90100003      	bcpl	_show_sa_alarm
4266  0635 ac4d054d      	jpf	L1122
4267  0639               L5312:
4268                     ; 427                    case 1: value_to_led(temp_ntc2,LEDS_TEMP,ROW_TOP); 
4270  0639 4b02          	push	#2
4271  063b 4b01          	push	#1
4272  063d be05          	ldw	x,_temp_ntc2
4273  063f cd0000        	call	_value_to_led
4275  0642 85            	popw	x
4276                     ; 428                            break;
4278  0643 20ec          	jra	L3422
4279  0645               L7312:
4280                     ; 429                    case 2: value_to_led(pid_out  ,LEDS_INT,ROW_TOP); 
4282  0645 4b02          	push	#2
4283  0647 4b00          	push	#0
4284  0649 be00          	ldw	x,_pid_out
4285  064b cd0000        	call	_value_to_led
4287  064e 85            	popw	x
4288                     ; 430                            break;
4290  064f 20e0          	jra	L3422
4291  0651               L7422:
4292  0651 20de          	jra	L3422
4295                     	bsct
4296  0007               L1522_min:
4297  0007 00            	dc.b	0
4331                     ; 444 void prfl_task(void)
4331                     ; 445 {
4332                     	switch	.text
4333  0653               _prfl_task:
4337                     ; 448     if (minutes)
4339                     	btst	_minutes
4340  0658 2407          	jruge	L1722
4341                     ; 450         update_profile();
4343  065a cd0000        	call	_update_profile
4345                     ; 451         min = 0;
4347  065d 3f07          	clr	L1522_min
4349  065f 200d          	jra	L3722
4350  0661               L1722:
4351                     ; 453         if (++min >= 60)
4353  0661 3c07          	inc	L1522_min
4354  0663 b607          	ld	a,L1522_min
4355  0665 a13c          	cp	a,#60
4356  0667 2505          	jrult	L3722
4357                     ; 455             min = 0;
4359  0669 3f07          	clr	L1522_min
4360                     ; 456             update_profile(); 
4362  066b cd0000        	call	_update_profile
4364  066e               L3722:
4365                     ; 459 } // prfl_task();
4368  066e 81            	ret
4398                     ; 467 void initialise_system_clock(void)
4398                     ; 468 {
4399                     	switch	.text
4400  066f               _initialise_system_clock:
4404                     ; 469 	CLK_ICKCR  = 0;                //  Reset the Internal Clock Register.
4406  066f 725f50c0      	clr	_CLK_ICKCR
4407                     ; 470     CLK_ICKCR |= CLK_ICKCR_HSIEN;  //  Enable the HSI.
4409  0673 721050c0      	bset	_CLK_ICKCR,#0
4411  0677               L1132:
4412                     ; 471     while ((CLK_ICKCR & CLK_ICKCR_HSIRDY) == 0); //  Wait for the HSI to be ready for use.
4414  0677 c650c0        	ld	a,_CLK_ICKCR
4415  067a a502          	bcp	a,#2
4416  067c 27f9          	jreq	L1132
4417                     ; 472     CLK_CKDIVR     = 0;            //  Ensure the clocks are running at full speed.
4419  067e 725f50c6      	clr	_CLK_CKDIVR
4420                     ; 476     ADC_CR1     &= ~ADC_CR1_SPSEL_MSK;
4422  0682 c65401        	ld	a,_ADC_CR1
4423  0685 a48f          	and	a,#143
4424  0687 c75401        	ld	_ADC_CR1,a
4425                     ; 477     ADC_CR1     |= 0x20;          //  Set prescaler (SPSEL bits) to 4, fADC = 4 MHz
4427  068a 721a5401      	bset	_ADC_CR1,#5
4428                     ; 478     CLK_SWIMCCR  = 0x00;          //  Set SWIM to run at clock / 2.
4430  068e 725f50cd      	clr	_CLK_SWIMCCR
4431                     ; 479     CLK_SWR      = 0xE1;          //  Use HSI as the clock source.
4433  0692 35e150c4      	mov	_CLK_SWR,#225
4434                     ; 480     CLK_SWCR     = 0x00;          //  Reset the clock switch control register.
4436  0696 725f50c5      	clr	_CLK_SWCR
4437                     ; 481     CLK_SWCR    |= CLK_SWCR_SWEN; //  Enable switching.
4439  069a 721250c5      	bset	_CLK_SWCR,#1
4441  069e               L7132:
4442                     ; 482     while ((CLK_SWCR & CLK_SWCR_SWBSY) != 0);  //  Pause while the clock switch is busy.
4444  069e c650c5        	ld	a,_CLK_SWCR
4445  06a1 a501          	bcp	a,#1
4446  06a3 26f9          	jrne	L7132
4447                     ; 483 } // initialise_system_clock()
4450  06a5 81            	ret
4502                     ; 492 int main(void)
4502                     ; 493 {
4503                     	switch	.text
4504  06a6               _main:
4506  06a6 89            	pushw	x
4507       00000002      OFST:	set	2
4510                     ; 495 	int ee = eedata[0]; // This is to prevent the linker from removing .eeprom section
4512  06a7 ce0000        	ldw	x,_eedata
4513  06aa 1f01          	ldw	(OFST-1,sp),x
4515                     ; 497 	disable_interrupts();      // no interrupts yet
4518  06ac 9b            sim
4520                     ; 498 	initialise_system_clock(); // set main-clock to 16 MHz
4523  06ad adc0          	call	_initialise_system_clock
4525                     ; 499 	setup_gpio_ports();        // Initialise all GPIO ports
4527  06af cd0418        	call	_setup_gpio_ports
4529                     ; 500 	setup_timer2();            // set TMR2 clock to 1 kHz for interrupt
4531  06b2 cd0403        	call	_setup_timer2
4533                     ; 503     scheduler_init();                    // init. task scheduler
4535  06b5 cd0000        	call	_scheduler_init
4537                     ; 504     add_task(adc_task ,"ADC",  0,  500); // every 500 msec.
4539  06b8 ae01f4        	ldw	x,#500
4540  06bb 89            	pushw	x
4541  06bc 5f            	clrw	x
4542  06bd 89            	pushw	x
4543  06be ae000c        	ldw	x,#L1432
4544  06c1 89            	pushw	x
4545  06c2 ae04c1        	ldw	x,#_adc_task
4546  06c5 cd0000        	call	_add_task
4548  06c8 5b06          	addw	sp,#6
4549                     ; 505     add_task(std_task ,"STD", 50,  100); // every 100 msec.
4551  06ca ae0064        	ldw	x,#100
4552  06cd 89            	pushw	x
4553  06ce ae0032        	ldw	x,#50
4554  06d1 89            	pushw	x
4555  06d2 ae0008        	ldw	x,#L3432
4556  06d5 89            	pushw	x
4557  06d6 ae04c2        	ldw	x,#_std_task
4558  06d9 cd0000        	call	_add_task
4560  06dc 5b06          	addw	sp,#6
4561                     ; 506     add_task(ctrl_task,"CTL",200, 1000); // every second
4563  06de ae03e8        	ldw	x,#1000
4564  06e1 89            	pushw	x
4565  06e2 ae00c8        	ldw	x,#200
4566  06e5 89            	pushw	x
4567  06e6 ae0004        	ldw	x,#L5432
4568  06e9 89            	pushw	x
4569  06ea ae04c9        	ldw	x,#_ctrl_task
4570  06ed cd0000        	call	_add_task
4572  06f0 5b06          	addw	sp,#6
4573                     ; 507     add_task(prfl_task,"PRF",300,60000); // every minute / hour
4575  06f2 aeea60        	ldw	x,#60000
4576  06f5 89            	pushw	x
4577  06f6 ae012c        	ldw	x,#300
4578  06f9 89            	pushw	x
4579  06fa ae0000        	ldw	x,#L7432
4580  06fd 89            	pushw	x
4581  06fe ae0653        	ldw	x,#_prfl_task
4582  0701 cd0000        	call	_add_task
4584  0704 5b06          	addw	sp,#6
4585                     ; 508 	enable_interrupts();                 // enable interrupts
4588  0706 9a            rim
4590  0707               L1532:
4591                     ; 512         dispatch_tasks();     // Run task-scheduler()
4593  0707 cd0000        	call	_dispatch_tasks
4595                     ; 513         wait_for_interrupt(); // do nothing
4598  070a 8f            wfi
4602  070b 20fa          	jra	L1532
4741                     	xdef	_main
4742                     	xdef	_prfl_task
4743                     	xdef	_ctrl_task
4744                     	xdef	_std_task
4745                     	xdef	_adc_task
4746                     	xdef	_TIM2_UPD_OVF_IRQHandler
4747                     	xdef	_set_one_led
4748                     	xref.b	_pid_out
4749                     	xref.b	_ts
4750                     	xref.b	_setpoint
4751                     	xref.b	_heating_delay
4752                     	xref.b	_cooling_delay
4753                     	xbit	_fahrenheit
4754                     	xbit	_menu_is_idle
4755                     	xbit	_minutes
4756                     	xref.b	_sensor2_selected
4757                     	xbit	_pwr_on
4758                     	xref.b	_bot_01
4759                     	xref.b	_bot_1
4760                     	xref.b	_bot_10
4761                     	xref.b	_bot_100
4762                     	xref.b	_top_01
4763                     	xref.b	_top_1
4764                     	xref.b	_top_10
4765                     	xref.b	_top_100
4766                     	xref	_eedata
4767                     	switch	.ubsct
4768  0000               _blink_tmr:
4769  0000 00000000      	ds.b	4
4770                     	xdef	_blink_tmr
4771                     	xdef	_std
4772  0004               _hc164_val:
4773  0004 00            	ds.b	1
4774                     	xdef	_hc164_val
4775                     	xdef	_pwr_on_tmr
4776                     	xdef	_mpx_nr
4777  0005               _temp_ntc2:
4778  0005 0000          	ds.b	2
4779                     	xdef	_temp_ntc2
4780  0007               _temp_ntc1:
4781  0007 0000          	ds.b	2
4782                     	xdef	_temp_ntc1
4783  0009               _leds_out:
4784  0009 0000          	ds.b	2
4785                     	xdef	_leds_out
4786                     	xdef	_sound_alarm
4787                     	xdef	_show_sa_alarm
4788                     	xdef	_probe2
4789                     	xdef	_ad_err2
4790                     	xdef	_ad_err1
4791                     	xref	_add_task
4792                     	xref	_dispatch_tasks
4793                     	xref	_scheduler_isr
4794                     	xref	_scheduler_init
4795                     	xref	_pid_control
4796                     	xref	_temperature_control
4797                     	xref	_menu_fsm
4798                     	xref	_read_buttons
4799                     	xref	_update_profile
4800                     	xref	_value_to_led
4801                     	xref	_eeprom_read_config
4802                     	xdef	_setup_gpio_ports
4803                     	xdef	_initialise_system_clock
4804                     	xdef	_setup_timer2
4805                     	xdef	_multiplexer
4806                     	xdef	_set_hc164
4807                     .const:	section	.text
4808  0000               L7432:
4809  0000 50524600      	dc.b	"PRF",0
4810  0004               L5432:
4811  0004 43544c00      	dc.b	"CTL",0
4812  0008               L3432:
4813  0008 53544400      	dc.b	"STD",0
4814  000c               L1432:
4815  000c 41444300      	dc.b	"ADC",0
4816                     	xref.b	c_x
4817                     	xref.b	c_y
4837                     	end
