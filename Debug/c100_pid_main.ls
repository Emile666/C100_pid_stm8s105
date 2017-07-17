   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2523                     .bit:	section	.data,bit
2524  0000               _relay_alarm1:
2525  0000 00            	dc.b	0
2526                     	bsct
2527  0000               _temp_tc_fil:
2528  0000 00003200      	dc.l	12800
2529  0004               _temp_pt_fil:
2530  0004 00003200      	dc.l	12800
2531                     	switch	.bit
2532  0001               _temp_err:
2533  0001 00            	dc.b	0
2534                     	bsct
2535  0008               _mpx_nr:
2536  0008 00            	dc.b	0
2537  0009               _pwr_on_tmr:
2538  0009 03e8          	dc.w	1000
2539  000b               _std:
2540  000b 00            	dc.b	0
2541  000c 00            	dc.b	0
2542  000d 00            	dc.b	0
2543  000e 00            	dc.b	0
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
2780  0046 be07          	ldw	x,_leds_out
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
2807  0062 e60b          	ld	a,(_std,x)
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
2831  0082 be07          	ldw	x,_leds_out
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
2843  0093 be07          	ldw	x,_leds_out
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
2857  00a7 e70b          	ld	(_std,x),a
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
2873  00b9 e70b          	ld	(_std,x),a
2874  00bb ac8e018e      	jpf	L7571
2875  00bf               L5071:
2876                     ; 117        case STD_LED_ON:
2876                     ; 118           PD_ODR &= ~led; // LED on
2878  00bf 7b06          	ld	a,(OFST+5,sp)
2879  00c1 43            	cpl	a
2880  00c2 c4500f        	and	a,_PD_ODR
2881  00c5 c7500f        	ld	_PD_ODR,a
2882                     ; 119           if (!(leds_out & led))
2884  00c8 be07          	ldw	x,_leds_out
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
2897  00da 6f0b          	clr	(_std,x)
2899  00dc ac8e018e      	jpf	L7571
2900  00e0               L7671:
2901                     ; 121           else if (leds_out & blink_msk)
2903  00e0 be07          	ldw	x,_leds_out
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
2919  00f7 e70b          	ld	(_std,x),a
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
2936  010c be07          	ldw	x,_leds_out
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
2949  011e 6f0b          	clr	(_std,x)
2951  0120 206c          	jra	L7571
2952  0122               L5771:
2953                     ; 131           else if (!(leds_out & blink_msk))
2955  0122 be07          	ldw	x,_leds_out
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
2969  0136 e70b          	ld	(_std,x),a
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
2988  014c e70b          	ld	(_std,x),a
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
3004  015e be07          	ldw	x,_leds_out
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
3017  0170 6f0b          	clr	(_std,x)
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
3036  0186 e70b          	ld	(_std,x),a
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
3096                     ; 163     set_hc164(0x00);      // disable CA-lines of 7-segment displays
3098  0195 4f            	clr	a
3099  0196 cd0000        	call	_set_hc164
3101                     ; 164     PE_ODR |= SEG7_C;     // disable 7-segment display C
3103  0199 72105014      	bset	_PE_ODR,#0
3104                     ; 165     PD_ODR |= PORTD_OUT;  // disable all other 7-segment displays
3106  019d c6500f        	ld	a,_PD_ODR
3107  01a0 aafd          	or	a,#253
3108  01a2 c7500f        	ld	_PD_ODR,a
3109                     ; 167     switch (mpx_nr)
3111  01a5 b608          	ld	a,_mpx_nr
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
3146                     ; 170             PE_ODR &= ~PE_LEDS(bot_01);   // Update PE0 (SEG7_C)
3148  01db b600          	ld	a,_bot_01
3149  01dd a401          	and	a,#1
3150  01df 43            	cpl	a
3151  01e0 c45014        	and	a,_PE_ODR
3152  01e3 c75014        	ld	_PE_ODR,a
3153                     ; 171             PD_ODR &= ~PD_LEDS(bot_01);   // Update all other segments
3155  01e6 b600          	ld	a,_bot_01
3156  01e8 44            	srl	a
3157  01e9 a401          	and	a,#1
3158  01eb 6b01          	ld	(OFST+0,sp),a
3160  01ed b600          	ld	a,_bot_01
3161  01ef a4fc          	and	a,#252
3162  01f1 1a01          	or	a,(OFST+0,sp)
3163  01f3 43            	cpl	a
3164  01f4 c4500f        	and	a,_PD_ODR
3165  01f7 c7500f        	ld	_PD_ODR,a
3166                     ; 172             set_hc164(0x01);
3168  01fa a601          	ld	a,#1
3169  01fc cd0000        	call	_set_hc164
3171                     ; 173             mpx_nr = 1;
3173  01ff 35010008      	mov	_mpx_nr,#1
3174                     ; 174             break;
3176  0203 ac8a038a      	jpf	L3502
3177  0207               L7102:
3178                     ; 175         case 1: // output CA2 BOTTOM display
3178                     ; 176             PE_ODR &= ~PE_LEDS(bot_1);   // Update PE0 (SEG7_C)
3180  0207 b600          	ld	a,_bot_1
3181  0209 a401          	and	a,#1
3182  020b 43            	cpl	a
3183  020c c45014        	and	a,_PE_ODR
3184  020f c75014        	ld	_PE_ODR,a
3185                     ; 177             PD_ODR &= ~PD_LEDS(bot_1);   // Update all other segments
3187  0212 b600          	ld	a,_bot_1
3188  0214 44            	srl	a
3189  0215 a401          	and	a,#1
3190  0217 6b01          	ld	(OFST+0,sp),a
3192  0219 b600          	ld	a,_bot_1
3193  021b a4fc          	and	a,#252
3194  021d 1a01          	or	a,(OFST+0,sp)
3195  021f 43            	cpl	a
3196  0220 c4500f        	and	a,_PD_ODR
3197  0223 c7500f        	ld	_PD_ODR,a
3198                     ; 178             set_hc164(0x02);
3200  0226 a602          	ld	a,#2
3201  0228 cd0000        	call	_set_hc164
3203                     ; 179             mpx_nr = 2;
3205  022b 35020008      	mov	_mpx_nr,#2
3206                     ; 180             break;
3208  022f ac8a038a      	jpf	L3502
3209  0233               L1202:
3210                     ; 181         case 2: // output CA3 BOTTOM display
3210                     ; 182             PE_ODR &= ~PE_LEDS(bot_10);   // Update PE0 (SEG7_C)
3212  0233 b600          	ld	a,_bot_10
3213  0235 a401          	and	a,#1
3214  0237 43            	cpl	a
3215  0238 c45014        	and	a,_PE_ODR
3216  023b c75014        	ld	_PE_ODR,a
3217                     ; 183             PD_ODR &= ~PD_LEDS(bot_10);   // Update all other segments
3219  023e b600          	ld	a,_bot_10
3220  0240 44            	srl	a
3221  0241 a401          	and	a,#1
3222  0243 6b01          	ld	(OFST+0,sp),a
3224  0245 b600          	ld	a,_bot_10
3225  0247 a4fc          	and	a,#252
3226  0249 1a01          	or	a,(OFST+0,sp)
3227  024b 43            	cpl	a
3228  024c c4500f        	and	a,_PD_ODR
3229  024f c7500f        	ld	_PD_ODR,a
3230                     ; 184             set_hc164(0x04);
3232  0252 a604          	ld	a,#4
3233  0254 cd0000        	call	_set_hc164
3235                     ; 185             mpx_nr = 3;
3237  0257 35030008      	mov	_mpx_nr,#3
3238                     ; 186             break;
3240  025b ac8a038a      	jpf	L3502
3241  025f               L3202:
3242                     ; 187         case 3: // outputs CA4 BOTTOM display (MSB)
3242                     ; 188             PE_ODR &= ~PE_LEDS(bot_100);  // Update PE0 (SEG7_C)
3244  025f b600          	ld	a,_bot_100
3245  0261 a401          	and	a,#1
3246  0263 43            	cpl	a
3247  0264 c45014        	and	a,_PE_ODR
3248  0267 c75014        	ld	_PE_ODR,a
3249                     ; 189             PD_ODR &= ~PD_LEDS(bot_100);  // Update all other segments
3251  026a b600          	ld	a,_bot_100
3252  026c 44            	srl	a
3253  026d a401          	and	a,#1
3254  026f 6b01          	ld	(OFST+0,sp),a
3256  0271 b600          	ld	a,_bot_100
3257  0273 a4fc          	and	a,#252
3258  0275 1a01          	or	a,(OFST+0,sp)
3259  0277 43            	cpl	a
3260  0278 c4500f        	and	a,_PD_ODR
3261  027b c7500f        	ld	_PD_ODR,a
3262                     ; 190             set_hc164(0x08);
3264  027e a608          	ld	a,#8
3265  0280 cd0000        	call	_set_hc164
3267                     ; 191             mpx_nr = 4;
3269  0283 35040008      	mov	_mpx_nr,#4
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
3332  02de 35050008      	mov	_mpx_nr,#5
3333                     ; 201             break;
3335  02e2 ac8a038a      	jpf	L3502
3336  02e6               L7202:
3337                     ; 202         case 5: // output CA1 TOP display (LSB)
3337                     ; 203             PE_ODR &= ~PE_LEDS(top_01);  // Update PE0 (SEG7_C)
3339  02e6 b600          	ld	a,_top_01
3340  02e8 a401          	and	a,#1
3341  02ea 43            	cpl	a
3342  02eb c45014        	and	a,_PE_ODR
3343  02ee c75014        	ld	_PE_ODR,a
3344                     ; 204             PD_ODR &= ~PD_LEDS(top_01);  // Update all other segments
3346  02f1 b600          	ld	a,_top_01
3347  02f3 44            	srl	a
3348  02f4 a401          	and	a,#1
3349  02f6 6b01          	ld	(OFST+0,sp),a
3351  02f8 b600          	ld	a,_top_01
3352  02fa a4fc          	and	a,#252
3353  02fc 1a01          	or	a,(OFST+0,sp)
3354  02fe 43            	cpl	a
3355  02ff c4500f        	and	a,_PD_ODR
3356  0302 c7500f        	ld	_PD_ODR,a
3357                     ; 205             set_hc164(0x10);
3359  0305 a610          	ld	a,#16
3360  0307 cd0000        	call	_set_hc164
3362                     ; 206             mpx_nr = 6;
3364  030a 35060008      	mov	_mpx_nr,#6
3365                     ; 207             break;
3367  030e 207a          	jra	L3502
3368  0310               L1302:
3369                     ; 208         case 6: // output CA2 TOP display
3369                     ; 209             PE_ODR &= ~PE_LEDS(top_1);   // Update PE0 (SEG7_C)
3371  0310 b600          	ld	a,_top_1
3372  0312 a401          	and	a,#1
3373  0314 43            	cpl	a
3374  0315 c45014        	and	a,_PE_ODR
3375  0318 c75014        	ld	_PE_ODR,a
3376                     ; 210             PD_ODR &= ~PD_LEDS(top_1);   // Update all other segments
3378  031b b600          	ld	a,_top_1
3379  031d 44            	srl	a
3380  031e a401          	and	a,#1
3381  0320 6b01          	ld	(OFST+0,sp),a
3383  0322 b600          	ld	a,_top_1
3384  0324 a4fc          	and	a,#252
3385  0326 1a01          	or	a,(OFST+0,sp)
3386  0328 43            	cpl	a
3387  0329 c4500f        	and	a,_PD_ODR
3388  032c c7500f        	ld	_PD_ODR,a
3389                     ; 211             set_hc164(0x20);
3391  032f a620          	ld	a,#32
3392  0331 cd0000        	call	_set_hc164
3394                     ; 212             mpx_nr = 7;
3396  0334 35070008      	mov	_mpx_nr,#7
3397                     ; 213             break;
3399  0338 2050          	jra	L3502
3400  033a               L3302:
3401                     ; 214         case 7: // output CA3 TOP display
3401                     ; 215             PE_ODR &= ~PE_LEDS(top_10);  // Update PE0 (SEG7_C)
3403  033a b600          	ld	a,_top_10
3404  033c a401          	and	a,#1
3405  033e 43            	cpl	a
3406  033f c45014        	and	a,_PE_ODR
3407  0342 c75014        	ld	_PE_ODR,a
3408                     ; 216             PD_ODR &= ~PD_LEDS(top_10);  // Update all other segments
3410  0345 b600          	ld	a,_top_10
3411  0347 44            	srl	a
3412  0348 a401          	and	a,#1
3413  034a 6b01          	ld	(OFST+0,sp),a
3415  034c b600          	ld	a,_top_10
3416  034e a4fc          	and	a,#252
3417  0350 1a01          	or	a,(OFST+0,sp)
3418  0352 43            	cpl	a
3419  0353 c4500f        	and	a,_PD_ODR
3420  0356 c7500f        	ld	_PD_ODR,a
3421                     ; 217             set_hc164(0x40);
3423  0359 a640          	ld	a,#64
3424  035b cd0000        	call	_set_hc164
3426                     ; 218             mpx_nr = 8;
3428  035e 35080008      	mov	_mpx_nr,#8
3429                     ; 219             break;
3431  0362 2026          	jra	L3502
3432  0364               L5302:
3433                     ; 220         case 8: // outputs CA4 TOP display (MSB)
3433                     ; 221             PE_ODR &= ~PE_LEDS(top_100); // Update PE0 (SEG7_C)
3435  0364 b600          	ld	a,_top_100
3436  0366 a401          	and	a,#1
3437  0368 43            	cpl	a
3438  0369 c45014        	and	a,_PE_ODR
3439  036c c75014        	ld	_PE_ODR,a
3440                     ; 222             PD_ODR &= ~PD_LEDS(top_100); // Update all other segments
3442  036f b600          	ld	a,_top_100
3443  0371 44            	srl	a
3444  0372 a401          	and	a,#1
3445  0374 6b01          	ld	(OFST+0,sp),a
3447  0376 b600          	ld	a,_top_100
3448  0378 a4fc          	and	a,#252
3449  037a 1a01          	or	a,(OFST+0,sp)
3450  037c 43            	cpl	a
3451  037d c4500f        	and	a,_PD_ODR
3452  0380 c7500f        	ld	_PD_ODR,a
3453                     ; 223             set_hc164(0x80);
3455  0383 a680          	ld	a,#128
3456  0385 cd0000        	call	_set_hc164
3458  0388               L7302:
3459                     ; 224         default: // FALL-THROUGH (less code-size)
3459                     ; 225             mpx_nr = 0;
3461  0388 3f08          	clr	_mpx_nr
3462                     ; 226             break;
3464  038a               L3502:
3465                     ; 228 } // multiplexer()
3468  038a 84            	pop	a
3469  038b 81            	ret
3507                     ; 237 @interrupt void TIM2_UPD_OVF_IRQHandler(void)
3507                     ; 238 {
3508                     	switch	.text
3509  038c               _TIM2_UPD_OVF_IRQHandler:
3511  038c 8a            	push	cc
3512  038d 84            	pop	a
3513  038e a4bf          	and	a,#191
3514  0390 88            	push	a
3515  0391 86            	pop	cc
3516  0392 3b0002        	push	c_x+2
3517  0395 be00          	ldw	x,c_x
3518  0397 89            	pushw	x
3519  0398 3b0002        	push	c_y+2
3520  039b be00          	ldw	x,c_y
3521  039d 89            	pushw	x
3524                     ; 239     scheduler_isr();  // Run scheduler interrupt function
3526  039e cd0000        	call	_scheduler_isr
3528                     ; 240     t2_millis++;      // update millisecond counter
3530  03a1 ae0000        	ldw	x,#_t2_millis
3531  03a4 a601          	ld	a,#1
3532  03a6 cd0000        	call	c_lgadc
3534                     ; 241     if (!pwr_on)
3536                     	btst	_pwr_on
3537  03ae 251c          	jrult	L5602
3538                     ; 243         top_100    = top_10 = top_1 = top_01 = bot_01 = LED_OFF;
3540  03b0 3f00          	clr	_bot_01
3541  03b2 3f00          	clr	_top_01
3542  03b4 3f00          	clr	_top_1
3543  03b6 3f00          	clr	_top_10
3544  03b8 3f00          	clr	_top_100
3545                     ; 244         bot_100    = LED_O; 
3547  03ba 35e70000      	mov	_bot_100,#231
3548                     ; 245         bot_10     = bot_1 = LED_F;
3550  03be 35740000      	mov	_bot_1,#116
3551  03c2 450000        	mov	_bot_10,_bot_1
3552                     ; 246         pwr_on_tmr = 2000; // 2 seconds
3554  03c5 ae07d0        	ldw	x,#2000
3555  03c8 bf09          	ldw	_pwr_on_tmr,x
3557  03ca 202b          	jra	L7602
3558  03cc               L5602:
3559                     ; 248     else if (pwr_on_tmr > 0)
3561  03cc 9c            	rvf
3562  03cd be09          	ldw	x,_pwr_on_tmr
3563  03cf 2d26          	jrsle	L7602
3564                     ; 250         pwr_on_tmr--;
3566  03d1 be09          	ldw	x,_pwr_on_tmr
3567  03d3 1d0001        	subw	x,#1
3568  03d6 bf09          	ldw	_pwr_on_tmr,x
3569                     ; 251         top_100 = LED_C; top_10 = LED_1; top_1 = top_01 = LED_0;
3571  03d8 35e40000      	mov	_top_100,#228
3574  03dc 35030000      	mov	_top_10,#3
3577  03e0 35e70000      	mov	_top_01,#231
3578  03e4 450000        	mov	_top_1,_top_01
3579                     ; 252         bot_100 = LED_P; bot_10 = LED_I; bot_1 = LED_d; bot_01 = LED_c;
3581  03e7 35760000      	mov	_bot_100,#118
3584  03eb 35030000      	mov	_bot_10,#3
3587  03ef 35d30000      	mov	_bot_1,#211
3590  03f3 35d00000      	mov	_bot_01,#208
3591  03f7               L7602:
3592                     ; 254     multiplexer();             // Run multiplexer for Display and Keys
3594  03f7 cd0190        	call	_multiplexer
3596                     ; 255     TIM2_SR1 &= ~TIM2_SR1_UIF; // Reset interrupt (UIF bit) so it will not fire again straight away.
3598  03fa 72115302      	bres	_TIM2_SR1,#0
3599                     ; 256 } // TIM2_UPD_OVF_IRQHandler()
3602  03fe 85            	popw	x
3603  03ff bf00          	ldw	c_y,x
3604  0401 320002        	pop	c_y+2
3605  0404 85            	popw	x
3606  0405 bf00          	ldw	c_x,x
3607  0407 320002        	pop	c_x+2
3608  040a 80            	iret
3636                     ; 264 void setup_timer2(void)
3636                     ; 265 {
3637                     	switch	.text
3638  040b               _setup_timer2:
3642                     ; 266     TIM2_PSCR = 0x04;         //  Prescaler = 16
3644  040b 3504530c      	mov	_TIM2_PSCR,#4
3645                     ; 267     TIM2_ARRH = 0x03;         //  High byte of 1000
3647  040f 3503530d      	mov	_TIM2_ARRH,#3
3648                     ; 268     TIM2_ARRL = 0xE8;         //  Low  byte of 1000
3650  0413 35e8530e      	mov	_TIM2_ARRL,#232
3651                     ; 269     TIM2_IER  = TIM2_IER_UIE; //  Enable the update interrupts, disable all others
3653  0417 35015301      	mov	_TIM2_IER,#1
3654                     ; 270     TIM2_CR1  = TIM2_CR1_CEN; //  Finally enable the timer
3656  041b 35015300      	mov	_TIM2_CR1,#1
3657                     ; 271 } // setup_timer2()
3660  041f 81            	ret
3699                     ; 279 void setup_gpio_ports(void)
3699                     ; 280 {
3700                     	switch	.text
3701  0420               _setup_gpio_ports:
3705                     ; 284     PA_DDR     |=   SSR | ALARM;         // Set PORTA pins as outputs
3707  0420 c65002        	ld	a,_PA_DDR
3708  0423 aa0c          	or	a,#12
3709  0425 c75002        	ld	_PA_DDR,a
3710                     ; 285     PA_CR1     |=   SSR | ALARM;         // Set output pins to Push-Pull
3712  0428 c65003        	ld	a,_PA_CR1
3713  042b aa0c          	or	a,#12
3714  042d c75003        	ld	_PA_CR1,a
3715                     ; 286     PA_ODR     &= ~(SSR | ALARM);        // Disable SSR and Alarm outputs
3717  0430 c65000        	ld	a,_PA_ODR
3718  0433 a4f3          	and	a,#243
3719  0435 c75000        	ld	_PA_ODR,a
3720                     ; 291     PB_DDR     |=  PORTB_OUT;            // Set PORTB pins as outputs
3722  0438 c65007        	ld	a,_PB_DDR
3723  043b aaf0          	or	a,#240
3724  043d c75007        	ld	_PB_DDR,a
3725                     ; 292     PB_CR1     |=  PORTB_OUT;            // Set output pins to Push-Pull
3727  0440 c65008        	ld	a,_PB_CR1
3728  0443 aaf0          	or	a,#240
3729  0445 c75008        	ld	_PB_CR1,a
3730                     ; 293     PB_ODR     |= (CS_TC | CS_PT100 | CS_NRF24L01); // Disable SPI Chip-Selects
3732  0448 c65005        	ld	a,_PB_ODR
3733  044b aae0          	or	a,#224
3734  044d c75005        	ld	_PB_ODR,a
3735                     ; 294     PB_ODR     &= ~CE_NRF24L01;          // Set CE for NRF24L01 low
3737  0450 72195005      	bres	_PB_ODR,#4
3738                     ; 299     PC_ODR     &= ~PORTC_OUT;            // Turn off all pins from Port C
3740  0454 c6500a        	ld	a,_PC_ODR
3741  0457 a483          	and	a,#131
3742  0459 c7500a        	ld	_PC_ODR,a
3743                     ; 300     PC_DDR     |= PORTC_OUT;             // Set PORTC pins as outputs
3745  045c c6500c        	ld	a,_PC_DDR
3746  045f aa7c          	or	a,#124
3747  0461 c7500c        	ld	_PC_DDR,a
3748                     ; 301     PC_CR1     |= PORTC_OUT;             // Set output pins to Push-Pull
3750  0464 c6500d        	ld	a,_PC_CR1
3751  0467 aa7c          	or	a,#124
3752  0469 c7500d        	ld	_PC_CR1,a
3753                     ; 302 	PC_CR2     |=  (SPI_MOSI | SPI_SCK); // Set to 10 MHz
3755  046c c6500e        	ld	a,_PC_CR2
3756  046f aa60          	or	a,#96
3757  0471 c7500e        	ld	_PC_CR2,a
3758                     ; 303     PC_ODR     &= ~(SPI_MOSI | SPI_SCK); // MOSI = 0, SPI_CLK = 0
3760  0474 c6500a        	ld	a,_PC_ODR
3761  0477 a49f          	and	a,#159
3762  0479 c7500a        	ld	_PC_ODR,a
3763                     ; 304     PC_DDR     &= ~PORTC_IN;             // set PORTC pins as inputs
3765  047c c6500c        	ld	a,_PC_DDR
3766  047f a47d          	and	a,#125
3767  0481 c7500c        	ld	_PC_DDR,a
3768                     ; 305 	PC_CR1     &= ~PORTC_IN;             // set input pins to Floating
3770  0484 c6500d        	ld	a,_PC_CR1
3771  0487 a47d          	and	a,#125
3772  0489 c7500d        	ld	_PC_CR1,a
3773                     ; 306     LEDS_OFF;                            // Disable frontpanel LEDs
3775  048c 7214500a      	bset	_PC_ODR,#2
3776                     ; 307     SET_SDIN_0;                          // Disable SDIN for HC164
3778  0490 7217500a      	bres	_PC_ODR,#3
3779                     ; 308     SET_CLK_0;                           // Disable CLK for HC164
3781  0494 7219500a      	bres	_PC_ODR,#4
3782                     ; 313     PD_DDR     |=  PORTD_OUT;            // Set PORTD pins as outputs
3784  0498 c65011        	ld	a,_PD_DDR
3785  049b aafd          	or	a,#253
3786  049d c75011        	ld	_PD_DDR,a
3787                     ; 314     PD_CR1     |=  PORTD_OUT;            // Set output pins to Push-Pull
3789  04a0 c65012        	ld	a,_PD_CR1
3790  04a3 aafd          	or	a,#253
3791  04a5 c75012        	ld	_PD_CR1,a
3792                     ; 315     PD_ODR     &= ~PORTD_OUT;            // Disable 7-segment displays
3794  04a8 c6500f        	ld	a,_PD_ODR
3795  04ab a402          	and	a,#2
3796  04ad c7500f        	ld	_PD_ODR,a
3797                     ; 320     PE_ODR     |=  (SPI_NSS | I2C_SCL | I2C_SDA);           // Must be set here, or I2C will not work
3799  04b0 c65014        	ld	a,_PE_ODR
3800  04b3 aa26          	or	a,#38
3801  04b5 c75014        	ld	_PE_ODR,a
3802                     ; 321     PE_DDR     |=  (SPI_NSS | I2C_SCL | I2C_SDA | SEG7_C);  // Set as outputs
3804  04b8 c65016        	ld	a,_PE_DDR
3805  04bb aa27          	or	a,#39
3806  04bd c75016        	ld	_PE_DDR,a
3807                     ; 322     PE_CR1     |=   SPI_NSS | SEG7_C;                       // Set output pin to Push-Pull
3809  04c0 c65017        	ld	a,_PE_CR1
3810  04c3 aa21          	or	a,#33
3811  04c5 c75017        	ld	_PE_CR1,a
3812                     ; 323     PE_ODR     &=  ~SEG7_C;                                 // Disable 7-segment display
3814  04c8 72115014      	bres	_PE_ODR,#0
3815                     ; 324 } // setup_gpio_ports()
3818  04cc 81            	ret
3821                     	bsct
3822  000f               L3112_std_ptt:
3823  000f 01            	dc.b	1
3824  0010               L5112_ltmr:
3825  0010 00            	dc.b	0
3826  0011               L7112_htmr:
3827  0011 00            	dc.b	0
3891                     ; 333 void pid_to_time(void)
3891                     ; 334 {
3892                     	switch	.text
3893  04cd               _pid_to_time:
3895  04cd 88            	push	a
3896       00000001      OFST:	set	1
3899                     ; 340     x = (uint8_t)(pid_out >> 3); // divide by 8 to give 1.25 * pid_out
3901  04ce be00          	ldw	x,_pid_out
3902  04d0 57            	sraw	x
3903  04d1 57            	sraw	x
3904  04d2 57            	sraw	x
3905  04d3 9f            	ld	a,xl
3906  04d4 6b01          	ld	(OFST+0,sp),a
3908                     ; 342     switch (std_ptt)
3910  04d6 b60f          	ld	a,L3112_std_ptt
3912                     ; 370             break;
3913  04d8 4d            	tnz	a
3914  04d9 2708          	jreq	L1212
3915  04db 4a            	dec	a
3916  04dc 2734          	jreq	L3212
3917  04de 4a            	dec	a
3918  04df 2760          	jreq	L5212
3919  04e1 206e          	jra	L3612
3920  04e3               L1212:
3921                     ; 344         case 0: // OFF
3921                     ; 345             if (ts == 0) std_ptt = 2;
3923  04e3 3d00          	tnz	_ts
3924  04e5 2606          	jrne	L5612
3927  04e7 3502000f      	mov	L3112_std_ptt,#2
3929  04eb 201b          	jra	L7612
3930  04ed               L5612:
3931                     ; 346             else if (ltmr == 0)
3933  04ed 3d10          	tnz	L5112_ltmr
3934  04ef 2615          	jrne	L1712
3935                     ; 348                 htmr = x; // htmr = 1.25 * pid_out
3937  04f1 7b01          	ld	a,(OFST+0,sp)
3938  04f3 b711          	ld	L7112_htmr,a
3939                     ; 349                 if ((htmr > 0) && pwr_on) std_ptt = 1;
3941  04f5 3d11          	tnz	L7112_htmr
3942  04f7 270f          	jreq	L7612
3944                     	btst	_pwr_on
3945  04fe 2408          	jruge	L7612
3948  0500 3501000f      	mov	L3112_std_ptt,#1
3949  0504 2002          	jra	L7612
3950  0506               L1712:
3951                     ; 351             else ltmr--; // decrease timer
3953  0506 3a10          	dec	L5112_ltmr
3954  0508               L7612:
3955                     ; 352             SSR_OFF;     // SSR output = 0
3957  0508 72175000      	bres	_PA_ODR,#3
3958                     ; 353             leds_out &= ~LED_OUT1; // disable OUT1 LED
3960  050c 721b0008      	bres	_leds_out+1,#5
3961                     ; 354             break;
3963  0510 203f          	jra	L3612
3964  0512               L3212:
3965                     ; 355         case 1: // ON
3965                     ; 356             if (ts == 0) std_ptt = 2;
3967  0512 3d00          	tnz	_ts
3968  0514 2606          	jrne	L7712
3971  0516 3502000f      	mov	L3112_std_ptt,#2
3973  051a 201b          	jra	L1022
3974  051c               L7712:
3975                     ; 357             else if (htmr == 0)
3977  051c 3d11          	tnz	L7112_htmr
3978  051e 2615          	jrne	L3022
3979                     ; 359                 ltmr = 125 - x; // ltmr = 1.25 * (100 - pid_out)
3981  0520 a67d          	ld	a,#125
3982  0522 1001          	sub	a,(OFST+0,sp)
3983  0524 b710          	ld	L5112_ltmr,a
3984                     ; 360                 if ((ltmr > 0) || !pwr_on) std_ptt = 0;
3986  0526 3d10          	tnz	L5112_ltmr
3987  0528 2607          	jrne	L7022
3989                     	btst	_pwr_on
3990  052f 2506          	jrult	L1022
3991  0531               L7022:
3994  0531 3f0f          	clr	L3112_std_ptt
3995  0533 2002          	jra	L1022
3996  0535               L3022:
3997                     ; 362             else htmr--; // decrease timer
3999  0535 3a11          	dec	L7112_htmr
4000  0537               L1022:
4001                     ; 363             SSR_ON;      // SSR output = 1
4003  0537 72165000      	bset	_PA_ODR,#3
4004                     ; 364             leds_out |= LED_OUT1; // enable OUT1 LED
4006  053b 721a0008      	bset	_leds_out+1,#5
4007                     ; 365             break;
4009  053f 2010          	jra	L3612
4010  0541               L5212:
4011                     ; 366         case 2: // DISABLED
4011                     ; 367             SSR_OFF; // S3 output = 0;
4013  0541 72175000      	bres	_PA_ODR,#3
4014                     ; 368             leds_out &= ~LED_OUT1; // disable OUT1 LED
4016  0545 721b0008      	bres	_leds_out+1,#5
4017                     ; 369             if (ts > 0) std_ptt = 1;
4019  0549 3d00          	tnz	_ts
4020  054b 2704          	jreq	L3612
4023  054d 3501000f      	mov	L3112_std_ptt,#1
4024  0551               L3612:
4025                     ; 372 } // pid_to_time()
4028  0551 84            	pop	a
4029  0552 81            	ret
4097                     ; 380 void adc_task(void)
4097                     ; 381 {
4098                     	switch	.text
4099  0553               _adc_task:
4101  0553 520c          	subw	sp,#12
4102       0000000c      OFST:	set	12
4105                     ; 385     temp_err    = false;               // assume all is well
4107  0555 72110001      	bres	_temp_err
4108                     ; 386     temp_tc     = max31855_read(&err); // K-type thermocouple
4110  0559 96            	ldw	x,sp
4111  055a 1c000a        	addw	x,#OFST-2
4112  055d cd0000        	call	_max31855_read
4114  0560 1f0b          	ldw	(OFST-1,sp),x
4116                     ; 387     err1        = ((err & TC_ERR_OC) > 0);
4118  0562 7b0a          	ld	a,(OFST-2,sp)
4119  0564 a501          	bcp	a,#1
4120  0566 2704          	jreq	L05
4121  0568 a601          	ld	a,#1
4122  056a 2001          	jra	L25
4123  056c               L05:
4124  056c 4f            	clr	a
4125  056d               L25:
4126  056d 6b09          	ld	(OFST-3,sp),a
4128                     ; 388     if (err1) 
4130  056f 0d09          	tnz	(OFST-3,sp)
4131  0571 2603          	jrne	L45
4132  0573 cc05fb        	jp	L7422
4133  0576               L45:
4134                     ; 390         temp_tc_fil = TEMP_ROOM;           // reset TC-temperature to default
4136  0576 ae3200        	ldw	x,#12800
4137  0579 bf02          	ldw	_temp_tc_fil+2,x
4138  057b ae0000        	ldw	x,#0
4139  057e bf00          	ldw	_temp_tc_fil,x
4140                     ; 391         temp_pt     = max31865_read(&err); // Read PT100 temperature
4142  0580 96            	ldw	x,sp
4143  0581 1c000a        	addw	x,#OFST-2
4144  0584 cd0000        	call	_max31865_read
4146  0587 1f0b          	ldw	(OFST-1,sp),x
4148                     ; 392         if (err)
4150  0589 0d0a          	tnz	(OFST-2,sp)
4151  058b 2715          	jreq	L1522
4152                     ; 394             temp_pt_fil = TEMP_ROOM; // Reset PT100-temperature
4154  058d ae3200        	ldw	x,#12800
4155  0590 bf06          	ldw	_temp_pt_fil+2,x
4156  0592 ae0000        	ldw	x,#0
4157  0595 bf04          	ldw	_temp_pt_fil,x
4158                     ; 395             temp_tc_pt  = 0;         // Default temperature to 0.0 °C
4160  0597 5f            	clrw	x
4161  0598 bf05          	ldw	_temp_tc_pt,x
4162                     ; 396             temp_err    = true;      // No sensors detected
4164  059a 72100001      	bset	_temp_err
4166  059e ac520652      	jpf	L5522
4167  05a2               L1522:
4168                     ; 400             temp_pt_fil = ((temp_pt_fil - (temp_pt_fil >> FILTER_SHIFT)) + temp_pt);
4170  05a2 1e0b          	ldw	x,(OFST-1,sp)
4171  05a4 cd0000        	call	c_itolx
4173  05a7 96            	ldw	x,sp
4174  05a8 1c0005        	addw	x,#OFST-7
4175  05ab cd0000        	call	c_rtol
4178  05ae ae0004        	ldw	x,#_temp_pt_fil
4179  05b1 cd0000        	call	c_ltor
4181  05b4 a606          	ld	a,#6
4182  05b6 cd0000        	call	c_lrsh
4184  05b9 96            	ldw	x,sp
4185  05ba 1c0001        	addw	x,#OFST-11
4186  05bd cd0000        	call	c_rtol
4189  05c0 ae0004        	ldw	x,#_temp_pt_fil
4190  05c3 cd0000        	call	c_ltor
4192  05c6 96            	ldw	x,sp
4193  05c7 1c0001        	addw	x,#OFST-11
4194  05ca cd0000        	call	c_lsub
4196  05cd 96            	ldw	x,sp
4197  05ce 1c0005        	addw	x,#OFST-7
4198  05d1 cd0000        	call	c_ladd
4200  05d4 ae0004        	ldw	x,#_temp_pt_fil
4201  05d7 cd0000        	call	c_rtol
4203                     ; 401             temp_tc_pt  = (int16_t)((temp_pt_fil + FILTER_ROUND) >> FILTER_SHIFT); 
4205  05da ae0004        	ldw	x,#_temp_pt_fil
4206  05dd cd0000        	call	c_ltor
4208  05e0 a620          	ld	a,#32
4209  05e2 cd0000        	call	c_ladc
4211  05e5 a606          	ld	a,#6
4212  05e7 cd0000        	call	c_lrsh
4214  05ea be02          	ldw	x,c_lreg+2
4215  05ec bf05          	ldw	_temp_tc_pt,x
4216                     ; 402             temp_tc_pt += eeprom_read_config(EEADR_MENU_ITEM(tc2));
4218  05ee a676          	ld	a,#118
4219  05f0 cd0000        	call	_eeprom_read_config
4221  05f3 72bb0005      	addw	x,_temp_tc_pt
4222  05f7 bf05          	ldw	_temp_tc_pt,x
4223  05f9 2057          	jra	L5522
4224  05fb               L7422:
4225                     ; 407        temp_tc_fil = ((temp_tc_fil - (temp_tc_fil >> FILTER_SHIFT)) + temp_tc);
4227  05fb 1e0b          	ldw	x,(OFST-1,sp)
4228  05fd cd0000        	call	c_itolx
4230  0600 96            	ldw	x,sp
4231  0601 1c0005        	addw	x,#OFST-7
4232  0604 cd0000        	call	c_rtol
4235  0607 ae0000        	ldw	x,#_temp_tc_fil
4236  060a cd0000        	call	c_ltor
4238  060d a606          	ld	a,#6
4239  060f cd0000        	call	c_lrsh
4241  0612 96            	ldw	x,sp
4242  0613 1c0001        	addw	x,#OFST-11
4243  0616 cd0000        	call	c_rtol
4246  0619 ae0000        	ldw	x,#_temp_tc_fil
4247  061c cd0000        	call	c_ltor
4249  061f 96            	ldw	x,sp
4250  0620 1c0001        	addw	x,#OFST-11
4251  0623 cd0000        	call	c_lsub
4253  0626 96            	ldw	x,sp
4254  0627 1c0005        	addw	x,#OFST-7
4255  062a cd0000        	call	c_ladd
4257  062d ae0000        	ldw	x,#_temp_tc_fil
4258  0630 cd0000        	call	c_rtol
4260                     ; 408        temp_tc_pt  = (int16_t)((temp_tc_fil + FILTER_ROUND) >> FILTER_SHIFT); 
4262  0633 ae0000        	ldw	x,#_temp_tc_fil
4263  0636 cd0000        	call	c_ltor
4265  0639 a620          	ld	a,#32
4266  063b cd0000        	call	c_ladc
4268  063e a606          	ld	a,#6
4269  0640 cd0000        	call	c_lrsh
4271  0643 be02          	ldw	x,c_lreg+2
4272  0645 bf05          	ldw	_temp_tc_pt,x
4273                     ; 409        temp_tc_pt += eeprom_read_config(EEADR_MENU_ITEM(tc));
4275  0647 a675          	ld	a,#117
4276  0649 cd0000        	call	_eeprom_read_config
4278  064c 72bb0005      	addw	x,_temp_tc_pt
4279  0650 bf05          	ldw	_temp_tc_pt,x
4280  0652               L5522:
4281                     ; 411 } // adc_task()
4284  0652 5b0c          	addw	sp,#12
4285  0654 81            	ret
4311                     ; 419 void std_task(void)
4311                     ; 420 {
4312                     	switch	.text
4313  0655               _std_task:
4317                     ; 421     read_buttons(); // reads the buttons keys, result is stored in _buttons
4319  0655 cd0000        	call	_read_buttons
4321                     ; 422     menu_fsm();     // Finite State Machine menu
4323  0658 cd0000        	call	_menu_fsm
4325                     ; 423     pid_to_time();  // Make Slow-PWM signal and send to Solid-State Relay (SSR)
4327  065b cd04cd        	call	_pid_to_time
4329                     ; 424 } // std_task()
4332  065e 81            	ret
4335                     	xref	_init_temp_delays
4401                     ; 432 void ctrl_task(void)
4401                     ; 433 {
4402                     	switch	.text
4403  065f               _ctrl_task:
4405  065f 5206          	subw	sp,#6
4406       00000006      OFST:	set	6
4409                     ; 436     if (eeprom_read_config(EEADR_MENU_ITEM(CF))) // true = Fahrenheit
4411  0661 a67d          	ld	a,#125
4412  0663 cd0000        	call	_eeprom_read_config
4414  0666 a30000        	cpw	x,#0
4415  0669 2706          	jreq	L1132
4416                     ; 437          fahrenheit = true;
4418  066b 72100000      	bset	_fahrenheit
4420  066f 2004          	jra	L3132
4421  0671               L1132:
4422                     ; 438     else fahrenheit = false;
4424  0671 72110000      	bres	_fahrenheit
4425  0675               L3132:
4426                     ; 439     if (eeprom_read_config(EEADR_MENU_ITEM(HrS))) // true = hours
4428  0675 a67f          	ld	a,#127
4429  0677 cd0000        	call	_eeprom_read_config
4431  067a a30000        	cpw	x,#0
4432  067d 2706          	jreq	L5132
4433                     ; 440          minutes = false; // control-timing is in hours 
4435  067f 72110000      	bres	_minutes
4437  0683 2004          	jra	L7132
4438  0685               L5132:
4439                     ; 441     else minutes = true;  // control-timing is in minutes
4441  0685 72100000      	bset	_minutes
4442  0689               L7132:
4443                     ; 444    if (temp_err)
4445                     	btst	_temp_err
4446  068e 2438          	jruge	L1232
4447                     ; 446        relay_alarm1 = true;
4449  0690 72100000      	bset	_relay_alarm1
4450                     ; 447        if (menu_is_idle)
4452                     	btst	_menu_is_idle
4453  0699 2420          	jruge	L3232
4454                     ; 449           top_100 = LED_A; top_10  = LED_L;
4456  069b 35770000      	mov	_top_100,#119
4459  069f 35e00000      	mov	_top_10,#224
4460                     ; 450           top_1   = LED_0; top_01  = LED_1; // sensor not connected alarm
4462  06a3 35e70000      	mov	_top_1,#231
4465  06a7 35030000      	mov	_top_01,#3
4466                     ; 451           bot_100 = LED_n; bot_10  = LED_o;
4468  06ab 35510000      	mov	_bot_100,#81
4471  06af 35d10000      	mov	_bot_10,#209
4472                     ; 452           bot_1   = LED_P; bot_01  = LED_b; // noPb = no Probe
4474  06b3 35760000      	mov	_bot_1,#118
4477  06b7 35f10000      	mov	_bot_01,#241
4478  06bb               L3232:
4479                     ; 454        cooling_delay = heating_delay = 60;
4481  06bb ae003c        	ldw	x,#60
4482  06be bf00          	ldw	_heating_delay,x
4483  06c0 be00          	ldw	x,_heating_delay
4484  06c2 bf00          	ldw	_cooling_delay,x
4486  06c4 ac7d077d      	jpf	L5232
4487  06c8               L1232:
4488                     ; 456        relay_alarm1 = false; // reset the piezo buzzer
4490  06c8 72110000      	bres	_relay_alarm1
4491                     ; 457        if(((uint8_t)eeprom_read_config(EEADR_MENU_ITEM(rn))) < THERMOSTAT_MODE)
4493  06cc a684          	ld	a,#132
4494  06ce cd0000        	call	_eeprom_read_config
4496  06d1 9f            	ld	a,xl
4497  06d2 a106          	cp	a,#6
4498  06d4 2408          	jruge	L7232
4499                     ; 458             leds_out |=  (LED_AT | LED_AT_BLINK); // Indicate profile mode
4501  06d6 b608          	ld	a,_leds_out+1
4502  06d8 aac0          	or	a,#192
4503  06da b708          	ld	_leds_out+1,a
4505  06dc 2006          	jra	L1332
4506  06de               L7232:
4507                     ; 459        else leds_out &= ~(LED_AT | LED_AT_BLINK);
4509  06de b608          	ld	a,_leds_out+1
4510  06e0 a43f          	and	a,#63
4511  06e2 b708          	ld	_leds_out+1,a
4512  06e4               L1332:
4513                     ; 461        ts = eeprom_read_config(EEADR_MENU_ITEM(Ts)); // Read Ts [seconds]
4515  06e4 a683          	ld	a,#131
4516  06e6 cd0000        	call	_eeprom_read_config
4518  06e9 01            	rrwa	x,a
4519  06ea b700          	ld	_ts,a
4520  06ec 02            	rlwa	x,a
4521                     ; 462        sa = eeprom_read_config(EEADR_MENU_ITEM(SA)); // Show Alarm parameter
4523  06ed a677          	ld	a,#119
4524  06ef cd0000        	call	_eeprom_read_config
4526  06f2 1f03          	ldw	(OFST-3,sp),x
4528                     ; 463        if (sa)
4530  06f4 1e03          	ldw	x,(OFST-3,sp)
4531  06f6 275b          	jreq	L3332
4532                     ; 465             if (minutes) // is timing-control in minutes?
4534                     	btst	_minutes
4535  06fd 240a          	jruge	L5332
4536                     ; 466                  diff = temp_tc_pt - setpoint;
4538  06ff be05          	ldw	x,_temp_tc_pt
4539  0701 72b00000      	subw	x,_setpoint
4540  0705 1f05          	ldw	(OFST-1,sp),x
4543  0707 200e          	jra	L7332
4544  0709               L5332:
4545                     ; 467             else diff = temp_tc_pt - eeprom_read_config(EEADR_MENU_ITEM(SP));
4547  0709 a672          	ld	a,#114
4548  070b cd0000        	call	_eeprom_read_config
4550  070e 1f01          	ldw	(OFST-5,sp),x
4552  0710 be05          	ldw	x,_temp_tc_pt
4553  0712 72f001        	subw	x,(OFST-5,sp)
4554  0715 1f05          	ldw	(OFST-1,sp),x
4556  0717               L7332:
4557                     ; 468             if (diff < 0) 
4559  0717 9c            	rvf
4560  0718 1e05          	ldw	x,(OFST-1,sp)
4561  071a 2e05          	jrsge	L1432
4562                     ; 469                  diff = -diff;
4564  071c 1e05          	ldw	x,(OFST-1,sp)
4565  071e 50            	negw	x
4566  071f 1f05          	ldw	(OFST-1,sp),x
4568  0721               L1432:
4569                     ; 470             if (sa < 0)
4571  0721 9c            	rvf
4572  0722 1e03          	ldw	x,(OFST-3,sp)
4573  0724 2e1a          	jrsge	L3432
4574                     ; 472                  sa = -sa;
4576  0726 1e03          	ldw	x,(OFST-3,sp)
4577  0728 50            	negw	x
4578  0729 1f03          	ldw	(OFST-3,sp),x
4580                     ; 473                  relay_alarm1 = (diff <= sa); // enable relay if diff is small
4582  072b 9c            	rvf
4583  072c 1e05          	ldw	x,(OFST-1,sp)
4584  072e 1303          	cpw	x,(OFST-3,sp)
4585  0730 2d02          	jrsle	L27
4586  0732 2006          	jp	L26
4587  0734               L27:
4588  0734 72100000      	bset	_relay_alarm1
4589  0738 2004          	jra	L46
4590  073a               L26:
4591  073a 72110000      	bres	_relay_alarm1
4592  073e               L46:
4594  073e 2013          	jra	L3332
4595  0740               L3432:
4596                     ; 475                  relay_alarm1 = (diff >= sa); // enable relay if diff is large
4598  0740 9c            	rvf
4599  0741 1e05          	ldw	x,(OFST-1,sp)
4600  0743 1303          	cpw	x,(OFST-3,sp)
4601  0745 2e02          	jrsge	L47
4602  0747 2006          	jp	L66
4603  0749               L47:
4604  0749 72100000      	bset	_relay_alarm1
4605  074d 2004          	jra	L07
4606  074f               L66:
4607  074f 72110000      	bres	_relay_alarm1
4608  0753               L07:
4609  0753               L3332:
4610                     ; 478        if (ts == 0)              // PID Ts parameter is 0?
4612  0753 3d00          	tnz	_ts
4613  0755 2608          	jrne	L7432
4614                     ; 480             init_temp_delays();  // Initialise Heating and Cooling delay
4616  0757 cd0000        	call	_init_temp_delays
4618                     ; 481             pid_out = 0;         // Disable PID-output
4620  075a 5f            	clrw	x
4621  075b bf00          	ldw	_pid_out,x
4623  075d 2003          	jra	L1532
4624  075f               L7432:
4625                     ; 483        else pid_control();       // Run PID controller
4627  075f cd0000        	call	_pid_control
4629  0762               L1532:
4630                     ; 484        if (menu_is_idle)         // show temperature if menu is idle
4632                     	btst	_menu_is_idle
4633  0767 2414          	jruge	L5232
4634                     ; 486             value_to_led(temp_tc_pt,LEDS_TEMP,ROW_TOP); // display temperature on top-row
4636  0769 4b02          	push	#2
4637  076b 4b01          	push	#1
4638  076d be05          	ldw	x,_temp_tc_pt
4639  076f cd0000        	call	_value_to_led
4641  0772 85            	popw	x
4642                     ; 487             value_to_led(setpoint  ,LEDS_TEMP,ROW_BOT); // display setpoint on bottom-row
4644  0773 4b03          	push	#3
4645  0775 4b01          	push	#1
4646  0777 be00          	ldw	x,_setpoint
4647  0779 cd0000        	call	_value_to_led
4649  077c 85            	popw	x
4650  077d               L5232:
4651                     ; 490    if (relay_alarm1)
4653                     	btst	_relay_alarm1
4654  0782 240c          	jruge	L5532
4655                     ; 492         leds_out |= LED_ALM1 | LED_ALM1_BLINK;
4657  0784 b608          	ld	a,_leds_out+1
4658  0786 aa03          	or	a,#3
4659  0788 b708          	ld	_leds_out+1,a
4660                     ; 493         ALARM_ON;
4662  078a 72145000      	bset	_PA_ODR,#2
4664  078e 200a          	jra	L7532
4665  0790               L5532:
4666                     ; 497        leds_out &= ~(LED_ALM1 | LED_ALM1_BLINK);
4668  0790 b608          	ld	a,_leds_out+1
4669  0792 a4fc          	and	a,#252
4670  0794 b708          	ld	_leds_out+1,a
4671                     ; 498        ALARM_OFF;
4673  0796 72155000      	bres	_PA_ODR,#2
4674  079a               L7532:
4675                     ; 500 } // ctrl_task()
4678  079a 5b06          	addw	sp,#6
4679  079c 81            	ret
4682                     	bsct
4683  0012               L1632_min:
4684  0012 00            	dc.b	0
4718                     ; 508 void prfl_task(void)
4718                     ; 509 {
4719                     	switch	.text
4720  079d               _prfl_task:
4724                     ; 512     if (minutes)
4726                     	btst	_minutes
4727  07a2 2407          	jruge	L1042
4728                     ; 514         update_profile();
4730  07a4 cd0000        	call	_update_profile
4732                     ; 515         min = 0;
4734  07a7 3f12          	clr	L1632_min
4736  07a9 200d          	jra	L3042
4737  07ab               L1042:
4738                     ; 517         if (++min >= 60)
4740  07ab 3c12          	inc	L1632_min
4741  07ad b612          	ld	a,L1632_min
4742  07af a13c          	cp	a,#60
4743  07b1 2505          	jrult	L3042
4744                     ; 519             min = 0;
4746  07b3 3f12          	clr	L1632_min
4747                     ; 520             update_profile(); 
4749  07b5 cd0000        	call	_update_profile
4751  07b8               L3042:
4752                     ; 523 } // prfl_task();
4755  07b8 81            	ret
4785                     ; 531 void initialise_system_clock(void)
4785                     ; 532 {
4786                     	switch	.text
4787  07b9               _initialise_system_clock:
4791                     ; 533 	CLK_ICKCR  = 0;                //  Reset the Internal Clock Register.
4793  07b9 725f50c0      	clr	_CLK_ICKCR
4794                     ; 534     CLK_ICKCR |= CLK_ICKCR_HSIEN;  //  Enable the HSI.
4796  07bd 721050c0      	bset	_CLK_ICKCR,#0
4798  07c1               L1242:
4799                     ; 535     while ((CLK_ICKCR & CLK_ICKCR_HSIRDY) == 0); //  Wait for the HSI to be ready for use.
4801  07c1 c650c0        	ld	a,_CLK_ICKCR
4802  07c4 a502          	bcp	a,#2
4803  07c6 27f9          	jreq	L1242
4804                     ; 536     CLK_CKDIVR     = 0;            //  Ensure the clocks are running at full speed.
4806  07c8 725f50c6      	clr	_CLK_CKDIVR
4807                     ; 540     ADC_CR1     &= ~ADC_CR1_SPSEL_MSK;
4809  07cc c65401        	ld	a,_ADC_CR1
4810  07cf a48f          	and	a,#143
4811  07d1 c75401        	ld	_ADC_CR1,a
4812                     ; 541     ADC_CR1     |= 0x20;          //  Set prescaler (SPSEL bits) to 4, fADC = 4 MHz
4814  07d4 721a5401      	bset	_ADC_CR1,#5
4815                     ; 542     CLK_SWIMCCR  = 0x00;          //  Set SWIM to run at clock / 2.
4817  07d8 725f50cd      	clr	_CLK_SWIMCCR
4818                     ; 543     CLK_SWR      = 0xE1;          //  Use HSI as the clock source.
4820  07dc 35e150c4      	mov	_CLK_SWR,#225
4821                     ; 544     CLK_SWCR     = 0x00;          //  Reset the clock switch control register.
4823  07e0 725f50c5      	clr	_CLK_SWCR
4824                     ; 545     CLK_SWCR    |= CLK_SWCR_SWEN; //  Enable switching.
4826  07e4 721250c5      	bset	_CLK_SWCR,#1
4828  07e8               L7242:
4829                     ; 546     while ((CLK_SWCR & CLK_SWCR_SWBSY) != 0);  //  Pause while the clock switch is busy.
4831  07e8 c650c5        	ld	a,_CLK_SWCR
4832  07eb a501          	bcp	a,#1
4833  07ed 26f9          	jrne	L7242
4834                     ; 547 } // initialise_system_clock()
4837  07ef 81            	ret
4891                     ; 556 int main(void)
4891                     ; 557 {
4892                     	switch	.text
4893  07f0               _main:
4895  07f0 89            	pushw	x
4896       00000002      OFST:	set	2
4899                     ; 559 	int ee = eedata[0]; // This is to prevent the linker from removing .eeprom section
4901  07f1 ce0000        	ldw	x,_eedata
4902  07f4 1f01          	ldw	(OFST-1,sp),x
4904                     ; 561 	disable_interrupts();      // no interrupts yet
4907  07f6 9b            sim
4909                     ; 562 	initialise_system_clock(); // set main-clock to 16 MHz
4912  07f7 adc0          	call	_initialise_system_clock
4914                     ; 563 	setup_gpio_ports();        // Initialise all GPIO ports
4916  07f9 cd0420        	call	_setup_gpio_ports
4918                     ; 564 	setup_timer2();            // set TMR2 clock to 1 kHz for interrupt
4920  07fc cd040b        	call	_setup_timer2
4922                     ; 565     spi_init();                // Init. SPI interface
4924  07ff cd0000        	call	_spi_init
4926                     ; 566     max31865_init();           // Init. PT100 device
4928  0802 cd0000        	call	_max31865_init
4930                     ; 569     scheduler_init();                    // init. task scheduler
4932  0805 cd0000        	call	_scheduler_init
4934                     ; 570     add_task(adc_task ,"ADC",  0,  500); // every 500 msec.
4936  0808 ae01f4        	ldw	x,#500
4937  080b 89            	pushw	x
4938  080c 5f            	clrw	x
4939  080d 89            	pushw	x
4940  080e ae000c        	ldw	x,#L1542
4941  0811 89            	pushw	x
4942  0812 ae0553        	ldw	x,#_adc_task
4943  0815 cd0000        	call	_add_task
4945  0818 5b06          	addw	sp,#6
4946                     ; 571     add_task(std_task ,"STD", 50,  100); // every 100 msec.
4948  081a ae0064        	ldw	x,#100
4949  081d 89            	pushw	x
4950  081e ae0032        	ldw	x,#50
4951  0821 89            	pushw	x
4952  0822 ae0008        	ldw	x,#L3542
4953  0825 89            	pushw	x
4954  0826 ae0655        	ldw	x,#_std_task
4955  0829 cd0000        	call	_add_task
4957  082c 5b06          	addw	sp,#6
4958                     ; 572     add_task(ctrl_task,"CTL",200, 1000); // every second
4960  082e ae03e8        	ldw	x,#1000
4961  0831 89            	pushw	x
4962  0832 ae00c8        	ldw	x,#200
4963  0835 89            	pushw	x
4964  0836 ae0004        	ldw	x,#L5542
4965  0839 89            	pushw	x
4966  083a ae065f        	ldw	x,#_ctrl_task
4967  083d cd0000        	call	_add_task
4969  0840 5b06          	addw	sp,#6
4970                     ; 573     add_task(prfl_task,"PRF",300,60000); // every minute / hour
4972  0842 aeea60        	ldw	x,#60000
4973  0845 89            	pushw	x
4974  0846 ae012c        	ldw	x,#300
4975  0849 89            	pushw	x
4976  084a ae0000        	ldw	x,#L7542
4977  084d 89            	pushw	x
4978  084e ae079d        	ldw	x,#_prfl_task
4979  0851 cd0000        	call	_add_task
4981  0854 5b06          	addw	sp,#6
4982                     ; 574 	enable_interrupts();                 // enable interrupts
4985  0856 9a            rim
4987  0857               L1642:
4988                     ; 578         dispatch_tasks();     // Run task-scheduler()
4990  0857 cd0000        	call	_dispatch_tasks
4992                     ; 579         wait_for_interrupt(); // do nothing
4995  085a 8f            wfi
4999  085b 20fa          	jra	L1642
5117                     	xdef	_main
5118                     	xdef	_prfl_task
5119                     	xdef	_ctrl_task
5120                     	xdef	_std_task
5121                     	xdef	_adc_task
5122                     	xdef	_pid_to_time
5123                     	xdef	_TIM2_UPD_OVF_IRQHandler
5124                     	xdef	_set_one_led
5125                     	xref.b	_t2_millis
5126                     	xref.b	_pid_out
5127                     	xref.b	_ts
5128                     	xref.b	_setpoint
5129                     	xref.b	_heating_delay
5130                     	xref.b	_cooling_delay
5131                     	xbit	_fahrenheit
5132                     	xbit	_menu_is_idle
5133                     	xbit	_minutes
5134                     	xbit	_pwr_on
5135                     	xref.b	_bot_01
5136                     	xref.b	_bot_1
5137                     	xref.b	_bot_10
5138                     	xref.b	_bot_100
5139                     	xref.b	_top_01
5140                     	xref.b	_top_1
5141                     	xref.b	_top_10
5142                     	xref.b	_top_100
5143                     	xref	_eedata
5144                     	switch	.ubsct
5145  0000               _blink_tmr:
5146  0000 00000000      	ds.b	4
5147                     	xdef	_blink_tmr
5148                     	xdef	_std
5149  0004               _hc164_val:
5150  0004 00            	ds.b	1
5151                     	xdef	_hc164_val
5152                     	xdef	_pwr_on_tmr
5153                     	xdef	_mpx_nr
5154                     	xdef	_temp_err
5155                     	xdef	_temp_pt_fil
5156                     	xdef	_temp_tc_fil
5157  0005               _temp_tc_pt:
5158  0005 0000          	ds.b	2
5159                     	xdef	_temp_tc_pt
5160  0007               _leds_out:
5161  0007 0000          	ds.b	2
5162                     	xdef	_leds_out
5163                     	xdef	_relay_alarm1
5164                     	xref	_max31865_read
5165                     	xref	_max31865_init
5166                     	xref	_max31855_read
5167                     	xref	_spi_init
5168                     	xref	_add_task
5169                     	xref	_dispatch_tasks
5170                     	xref	_scheduler_isr
5171                     	xref	_scheduler_init
5172                     	xref	_pid_control
5173                     	xref	_menu_fsm
5174                     	xref	_read_buttons
5175                     	xref	_update_profile
5176                     	xref	_value_to_led
5177                     	xref	_eeprom_read_config
5178                     	xdef	_setup_gpio_ports
5179                     	xdef	_initialise_system_clock
5180                     	xdef	_setup_timer2
5181                     	xdef	_multiplexer
5182                     	xdef	_set_hc164
5183                     .const:	section	.text
5184  0000               L7542:
5185  0000 50524600      	dc.b	"PRF",0
5186  0004               L5542:
5187  0004 43544c00      	dc.b	"CTL",0
5188  0008               L3542:
5189  0008 53544400      	dc.b	"STD",0
5190  000c               L1542:
5191  000c 41444300      	dc.b	"ADC",0
5192                     	xref.b	c_lreg
5193                     	xref.b	c_x
5194                     	xref.b	c_y
5214                     	xref	c_ladc
5215                     	xref	c_ladd
5216                     	xref	c_itolx
5217                     	xref	c_lsub
5218                     	xref	c_rtol
5219                     	xref	c_lrsh
5220                     	xref	c_ltor
5221                     	xref	c_lgadc
5222                     	end
