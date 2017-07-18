   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2523                     .bit:	section	.data,bit
2524  0000               _auto_tuning:
2525  0000 00            	dc.b	0
2526  0001               _relay_alarm1:
2527  0001 00            	dc.b	0
2528                     	bsct
2529  0000               _temp_tc_fil:
2530  0000 00003200      	dc.l	12800
2531  0004               _temp_pt_fil:
2532  0004 00003200      	dc.l	12800
2533                     	switch	.bit
2534  0002               _temp_err:
2535  0002 00            	dc.b	0
2536                     	bsct
2537  0008               _mpx_nr:
2538  0008 00            	dc.b	0
2539  0009               _pwr_on_tmr:
2540  0009 03e8          	dc.w	1000
2541  000b               _std:
2542  000b 00            	dc.b	0
2543  000c 00            	dc.b	0
2544  000d 00            	dc.b	0
2545  000e 00            	dc.b	0
2614                     ; 66 void set_hc164(uint8_t x)
2614                     ; 67 {
2616                     	switch	.text
2617  0000               _set_hc164:
2619  0000 88            	push	a
2620  0001 5203          	subw	sp,#3
2621       00000003      OFST:	set	3
2624                     ; 68     uint8_t i, j, p = 0x80;
2626  0003 a680          	ld	a,#128
2627  0005 6b01          	ld	(OFST-2,sp),a
2629                     ; 70     hc164_val = x; // save value for read_buttons() function
2631  0007 7b04          	ld	a,(OFST+1,sp)
2632  0009 b704          	ld	_hc164_val,a
2633                     ; 71     SET_CLK_0;     // CLK  = 0
2635  000b 7219500a      	bres	_PC_ODR,#4
2636                     ; 72     SET_SDIN_0;    // SDIN = 0
2638  000f 7217500a      	bres	_PC_ODR,#3
2639                     ; 73     for (i = 0; i < 8; i++)
2641  0013 0f02          	clr	(OFST-1,sp)
2643  0015               L3661:
2644                     ; 75         if (x & p) SET_SDIN_1;
2646  0015 7b04          	ld	a,(OFST+1,sp)
2647  0017 1501          	bcp	a,(OFST-2,sp)
2648  0019 2706          	jreq	L1761
2651  001b 7216500a      	bset	_PC_ODR,#3
2653  001f 2004          	jra	L3761
2654  0021               L1761:
2655                     ; 76         else       SET_SDIN_0;
2657  0021 7217500a      	bres	_PC_ODR,#3
2658  0025               L3761:
2659                     ; 77         SET_CLK_1;
2661  0025 7218500a      	bset	_PC_ODR,#4
2662                     ; 78         p >>= 1;
2664  0029 0401          	srl	(OFST-2,sp)
2666                     ; 79         for (j = 0; j < 10; j++); // small delay
2668  002b 0f03          	clr	(OFST+0,sp)
2670  002d               L5761:
2674  002d 0c03          	inc	(OFST+0,sp)
2678  002f 7b03          	ld	a,(OFST+0,sp)
2679  0031 a10a          	cp	a,#10
2680  0033 25f8          	jrult	L5761
2681                     ; 80         SET_CLK_0;
2683  0035 7219500a      	bres	_PC_ODR,#4
2684                     ; 73     for (i = 0; i < 8; i++)
2686  0039 0c02          	inc	(OFST-1,sp)
2690  003b 7b02          	ld	a,(OFST-1,sp)
2691  003d a108          	cp	a,#8
2692  003f 25d4          	jrult	L3661
2693                     ; 82 } // set_hc164()
2696  0041 5b04          	addw	sp,#4
2697  0043 81            	ret
2771                     ; 93 void set_one_led(uint8_t nr, uint16_t led, uint16_t blink_msk, uint16_t blink_rate_msk)
2771                     ; 94 {   
2772                     	switch	.text
2773  0044               _set_one_led:
2775  0044 88            	push	a
2776  0045 88            	push	a
2777       00000001      OFST:	set	1
2780                     ; 97    if (leds_out & blink_rate_msk)
2782  0046 be07          	ldw	x,_leds_out
2783  0048 01            	rrwa	x,a
2784  0049 140a          	and	a,(OFST+9,sp)
2785  004b 01            	rrwa	x,a
2786  004c 1409          	and	a,(OFST+8,sp)
2787  004e 01            	rrwa	x,a
2788  004f a30000        	cpw	x,#0
2789  0052 2706          	jreq	L1571
2790                     ; 98         blink_rate = LED_BLINK_FAST;
2792  0054 a61e          	ld	a,#30
2793  0056 6b01          	ld	(OFST+0,sp),a
2796  0058 2004          	jra	L3571
2797  005a               L1571:
2798                     ; 99    else blink_rate = LED_BLINK_SLOW;
2800  005a a63c          	ld	a,#60
2801  005c 6b01          	ld	(OFST+0,sp),a
2803  005e               L3571:
2804                     ; 101    switch (std[nr])
2806  005e 7b02          	ld	a,(OFST+1,sp)
2807  0060 5f            	clrw	x
2808  0061 97            	ld	xl,a
2809  0062 e60b          	ld	a,(_std,x)
2811                     ; 147           break;  
2812  0064 4d            	tnz	a
2813  0065 2713          	jreq	L3071
2814  0067 4a            	dec	a
2815  0068 2755          	jreq	L5071
2816  006a 4a            	dec	a
2817  006b 2603          	jrne	L01
2818  006d cc0156        	jp	L1171
2819  0070               L01:
2820  0070 4a            	dec	a
2821  0071 2603          	jrne	L21
2822  0073 cc0103        	jp	L7071
2823  0076               L21:
2824  0076 ac8e018e      	jpf	L7571
2825  007a               L3071:
2826                     ; 103        case STD_LED_OFF:
2826                     ; 104           PD_ODR |= led; // LED off
2828  007a c6500f        	ld	a,_PD_ODR
2829  007d 1a06          	or	a,(OFST+5,sp)
2830  007f c7500f        	ld	_PD_ODR,a
2831                     ; 105           if (leds_out & led)
2833  0082 be07          	ldw	x,_leds_out
2834  0084 01            	rrwa	x,a
2835  0085 1406          	and	a,(OFST+5,sp)
2836  0087 01            	rrwa	x,a
2837  0088 1405          	and	a,(OFST+4,sp)
2838  008a 01            	rrwa	x,a
2839  008b a30000        	cpw	x,#0
2840  008e 2603          	jrne	L41
2841  0090 cc018e        	jp	L7571
2842  0093               L41:
2843                     ; 107              if (leds_out & blink_msk)
2845  0093 be07          	ldw	x,_leds_out
2846  0095 01            	rrwa	x,a
2847  0096 1408          	and	a,(OFST+7,sp)
2848  0098 01            	rrwa	x,a
2849  0099 1407          	and	a,(OFST+6,sp)
2850  009b 01            	rrwa	x,a
2851  009c a30000        	cpw	x,#0
2852  009f 2712          	jreq	L3671
2853                     ; 109                   std[nr]       = STD_LED_BLINK1;
2855  00a1 7b02          	ld	a,(OFST+1,sp)
2856  00a3 5f            	clrw	x
2857  00a4 97            	ld	xl,a
2858  00a5 a603          	ld	a,#3
2859  00a7 e70b          	ld	(_std,x),a
2860                     ; 110                   blink_tmr[nr] = 0;
2862  00a9 7b02          	ld	a,(OFST+1,sp)
2863  00ab 5f            	clrw	x
2864  00ac 97            	ld	xl,a
2865  00ad 6f00          	clr	(_blink_tmr,x)
2867  00af ac8e018e      	jpf	L7571
2868  00b3               L3671:
2869                     ; 112              else std[nr] = STD_LED_ON;
2871  00b3 7b02          	ld	a,(OFST+1,sp)
2872  00b5 5f            	clrw	x
2873  00b6 97            	ld	xl,a
2874  00b7 a601          	ld	a,#1
2875  00b9 e70b          	ld	(_std,x),a
2876  00bb ac8e018e      	jpf	L7571
2877  00bf               L5071:
2878                     ; 116        case STD_LED_ON:
2878                     ; 117           PD_ODR &= ~led; // LED on
2880  00bf 7b06          	ld	a,(OFST+5,sp)
2881  00c1 43            	cpl	a
2882  00c2 c4500f        	and	a,_PD_ODR
2883  00c5 c7500f        	ld	_PD_ODR,a
2884                     ; 118           if (!(leds_out & led))
2886  00c8 be07          	ldw	x,_leds_out
2887  00ca 01            	rrwa	x,a
2888  00cb 1406          	and	a,(OFST+5,sp)
2889  00cd 01            	rrwa	x,a
2890  00ce 1405          	and	a,(OFST+4,sp)
2891  00d0 01            	rrwa	x,a
2892  00d1 a30000        	cpw	x,#0
2893  00d4 260a          	jrne	L7671
2894                     ; 119              std[nr] = STD_LED_OFF;
2896  00d6 7b02          	ld	a,(OFST+1,sp)
2897  00d8 5f            	clrw	x
2898  00d9 97            	ld	xl,a
2899  00da 6f0b          	clr	(_std,x)
2901  00dc ac8e018e      	jpf	L7571
2902  00e0               L7671:
2903                     ; 120           else if (leds_out & blink_msk)
2905  00e0 be07          	ldw	x,_leds_out
2906  00e2 01            	rrwa	x,a
2907  00e3 1408          	and	a,(OFST+7,sp)
2908  00e5 01            	rrwa	x,a
2909  00e6 1407          	and	a,(OFST+6,sp)
2910  00e8 01            	rrwa	x,a
2911  00e9 a30000        	cpw	x,#0
2912  00ec 2603          	jrne	L61
2913  00ee cc018e        	jp	L7571
2914  00f1               L61:
2915                     ; 122              std[nr]       = STD_LED_BLINK1;
2917  00f1 7b02          	ld	a,(OFST+1,sp)
2918  00f3 5f            	clrw	x
2919  00f4 97            	ld	xl,a
2920  00f5 a603          	ld	a,#3
2921  00f7 e70b          	ld	(_std,x),a
2922                     ; 123              blink_tmr[nr] = 0;
2924  00f9 7b02          	ld	a,(OFST+1,sp)
2925  00fb 5f            	clrw	x
2926  00fc 97            	ld	xl,a
2927  00fd 6f00          	clr	(_blink_tmr,x)
2928  00ff ac8e018e      	jpf	L7571
2929  0103               L7071:
2930                     ; 126        case STD_LED_BLINK1:
2930                     ; 127           PD_ODR &= ~led; // LED on
2932  0103 7b06          	ld	a,(OFST+5,sp)
2933  0105 43            	cpl	a
2934  0106 c4500f        	and	a,_PD_ODR
2935  0109 c7500f        	ld	_PD_ODR,a
2936                     ; 128           if (!(leds_out & led))
2938  010c be07          	ldw	x,_leds_out
2939  010e 01            	rrwa	x,a
2940  010f 1406          	and	a,(OFST+5,sp)
2941  0111 01            	rrwa	x,a
2942  0112 1405          	and	a,(OFST+4,sp)
2943  0114 01            	rrwa	x,a
2944  0115 a30000        	cpw	x,#0
2945  0118 2608          	jrne	L5771
2946                     ; 129              std[nr] = STD_LED_OFF;
2948  011a 7b02          	ld	a,(OFST+1,sp)
2949  011c 5f            	clrw	x
2950  011d 97            	ld	xl,a
2951  011e 6f0b          	clr	(_std,x)
2953  0120 206c          	jra	L7571
2954  0122               L5771:
2955                     ; 130           else if (!(leds_out & blink_msk))
2957  0122 be07          	ldw	x,_leds_out
2958  0124 01            	rrwa	x,a
2959  0125 1408          	and	a,(OFST+7,sp)
2960  0127 01            	rrwa	x,a
2961  0128 1407          	and	a,(OFST+6,sp)
2962  012a 01            	rrwa	x,a
2963  012b a30000        	cpw	x,#0
2964  012e 260a          	jrne	L1002
2965                     ; 131              std[nr] = STD_LED_ON;
2967  0130 7b02          	ld	a,(OFST+1,sp)
2968  0132 5f            	clrw	x
2969  0133 97            	ld	xl,a
2970  0134 a601          	ld	a,#1
2971  0136 e70b          	ld	(_std,x),a
2973  0138 2054          	jra	L7571
2974  013a               L1002:
2975                     ; 132           else if (++blink_tmr[nr] > blink_rate)
2977  013a 7b02          	ld	a,(OFST+1,sp)
2978  013c 5f            	clrw	x
2979  013d 97            	ld	xl,a
2980  013e 6c00          	inc	(_blink_tmr,x)
2981  0140 e600          	ld	a,(_blink_tmr,x)
2982  0142 1101          	cp	a,(OFST+0,sp)
2983  0144 2348          	jrule	L7571
2984                     ; 134              std[nr]       = STD_LED_BLINK0;
2986  0146 7b02          	ld	a,(OFST+1,sp)
2987  0148 5f            	clrw	x
2988  0149 97            	ld	xl,a
2989  014a a602          	ld	a,#2
2990  014c e70b          	ld	(_std,x),a
2991                     ; 135              blink_tmr[nr] = 0;
2993  014e 7b02          	ld	a,(OFST+1,sp)
2994  0150 5f            	clrw	x
2995  0151 97            	ld	xl,a
2996  0152 6f00          	clr	(_blink_tmr,x)
2997  0154 2038          	jra	L7571
2998  0156               L1171:
2999                     ; 138        case STD_LED_BLINK0:
2999                     ; 139           PD_ODR |= led; // LED off
3001  0156 c6500f        	ld	a,_PD_ODR
3002  0159 1a06          	or	a,(OFST+5,sp)
3003  015b c7500f        	ld	_PD_ODR,a
3004                     ; 140           if (!(leds_out & blink_msk))
3006  015e be07          	ldw	x,_leds_out
3007  0160 01            	rrwa	x,a
3008  0161 1408          	and	a,(OFST+7,sp)
3009  0163 01            	rrwa	x,a
3010  0164 1407          	and	a,(OFST+6,sp)
3011  0166 01            	rrwa	x,a
3012  0167 a30000        	cpw	x,#0
3013  016a 2608          	jrne	L7002
3014                     ; 141              std[nr] = STD_LED_OFF;
3016  016c 7b02          	ld	a,(OFST+1,sp)
3017  016e 5f            	clrw	x
3018  016f 97            	ld	xl,a
3019  0170 6f0b          	clr	(_std,x)
3021  0172 201a          	jra	L7571
3022  0174               L7002:
3023                     ; 142           else if (++blink_tmr[nr] > blink_rate)
3025  0174 7b02          	ld	a,(OFST+1,sp)
3026  0176 5f            	clrw	x
3027  0177 97            	ld	xl,a
3028  0178 6c00          	inc	(_blink_tmr,x)
3029  017a e600          	ld	a,(_blink_tmr,x)
3030  017c 1101          	cp	a,(OFST+0,sp)
3031  017e 230e          	jrule	L7571
3032                     ; 144              std[nr]       = STD_LED_BLINK1;
3034  0180 7b02          	ld	a,(OFST+1,sp)
3035  0182 5f            	clrw	x
3036  0183 97            	ld	xl,a
3037  0184 a603          	ld	a,#3
3038  0186 e70b          	ld	(_std,x),a
3039                     ; 145              blink_tmr[nr] = 0;
3041  0188 7b02          	ld	a,(OFST+1,sp)
3042  018a 5f            	clrw	x
3043  018b 97            	ld	xl,a
3044  018c 6f00          	clr	(_blink_tmr,x)
3045  018e               L7571:
3046                     ; 149 } // set_one_led()
3049  018e 85            	popw	x
3050  018f 81            	ret
3087                     ; 159 void multiplexer(void)
3087                     ; 160 {
3088                     	switch	.text
3089  0190               _multiplexer:
3091  0190 88            	push	a
3092       00000001      OFST:	set	1
3095                     ; 161     LEDS_OFF;             // clear LEDs
3097  0191 7214500a      	bset	_PC_ODR,#2
3098                     ; 162     set_hc164(0x00);      // disable CA-lines of 7-segment displays
3100  0195 4f            	clr	a
3101  0196 cd0000        	call	_set_hc164
3103                     ; 163     PE_ODR |= SEG7_C;     // disable 7-segment display C
3105  0199 72105014      	bset	_PE_ODR,#0
3106                     ; 164     PD_ODR |= PORTD_OUT;  // disable all other 7-segment displays
3108  019d c6500f        	ld	a,_PD_ODR
3109  01a0 aafd          	or	a,#253
3110  01a2 c7500f        	ld	_PD_ODR,a
3111                     ; 166     switch (mpx_nr)
3113  01a5 b608          	ld	a,_mpx_nr
3115                     ; 225             break;
3116  01a7 4d            	tnz	a
3117  01a8 2731          	jreq	L5102
3118  01aa 4a            	dec	a
3119  01ab 275a          	jreq	L7102
3120  01ad 4a            	dec	a
3121  01ae 2603cc0233    	jreq	L1202
3122  01b3 4a            	dec	a
3123  01b4 2603          	jrne	L22
3124  01b6 cc025f        	jp	L3202
3125  01b9               L22:
3126  01b9 4a            	dec	a
3127  01ba 2603          	jrne	L42
3128  01bc cc028b        	jp	L5202
3129  01bf               L42:
3130  01bf 4a            	dec	a
3131  01c0 2603          	jrne	L62
3132  01c2 cc02e6        	jp	L7202
3133  01c5               L62:
3134  01c5 4a            	dec	a
3135  01c6 2603          	jrne	L03
3136  01c8 cc0310        	jp	L1302
3137  01cb               L03:
3138  01cb 4a            	dec	a
3139  01cc 2603          	jrne	L23
3140  01ce cc033a        	jp	L3302
3141  01d1               L23:
3142  01d1 4a            	dec	a
3143  01d2 2603          	jrne	L43
3144  01d4 cc0364        	jp	L5302
3145  01d7               L43:
3146  01d7 ac880388      	jpf	L7302
3147  01db               L5102:
3148                     ; 168         case 0: // output CA1 BOTTOM display (LSB)
3148                     ; 169             PE_ODR &= ~PE_LEDS(bot_01);   // Update PE0 (SEG7_C)
3150  01db b600          	ld	a,_bot_01
3151  01dd a401          	and	a,#1
3152  01df 43            	cpl	a
3153  01e0 c45014        	and	a,_PE_ODR
3154  01e3 c75014        	ld	_PE_ODR,a
3155                     ; 170             PD_ODR &= ~PD_LEDS(bot_01);   // Update all other segments
3157  01e6 b600          	ld	a,_bot_01
3158  01e8 44            	srl	a
3159  01e9 a401          	and	a,#1
3160  01eb 6b01          	ld	(OFST+0,sp),a
3162  01ed b600          	ld	a,_bot_01
3163  01ef a4fc          	and	a,#252
3164  01f1 1a01          	or	a,(OFST+0,sp)
3165  01f3 43            	cpl	a
3166  01f4 c4500f        	and	a,_PD_ODR
3167  01f7 c7500f        	ld	_PD_ODR,a
3168                     ; 171             set_hc164(0x01);
3170  01fa a601          	ld	a,#1
3171  01fc cd0000        	call	_set_hc164
3173                     ; 172             mpx_nr = 1;
3175  01ff 35010008      	mov	_mpx_nr,#1
3176                     ; 173             break;
3178  0203 ac8a038a      	jpf	L3502
3179  0207               L7102:
3180                     ; 174         case 1: // output CA2 BOTTOM display
3180                     ; 175             PE_ODR &= ~PE_LEDS(bot_1);   // Update PE0 (SEG7_C)
3182  0207 b600          	ld	a,_bot_1
3183  0209 a401          	and	a,#1
3184  020b 43            	cpl	a
3185  020c c45014        	and	a,_PE_ODR
3186  020f c75014        	ld	_PE_ODR,a
3187                     ; 176             PD_ODR &= ~PD_LEDS(bot_1);   // Update all other segments
3189  0212 b600          	ld	a,_bot_1
3190  0214 44            	srl	a
3191  0215 a401          	and	a,#1
3192  0217 6b01          	ld	(OFST+0,sp),a
3194  0219 b600          	ld	a,_bot_1
3195  021b a4fc          	and	a,#252
3196  021d 1a01          	or	a,(OFST+0,sp)
3197  021f 43            	cpl	a
3198  0220 c4500f        	and	a,_PD_ODR
3199  0223 c7500f        	ld	_PD_ODR,a
3200                     ; 177             set_hc164(0x02);
3202  0226 a602          	ld	a,#2
3203  0228 cd0000        	call	_set_hc164
3205                     ; 178             mpx_nr = 2;
3207  022b 35020008      	mov	_mpx_nr,#2
3208                     ; 179             break;
3210  022f ac8a038a      	jpf	L3502
3211  0233               L1202:
3212                     ; 180         case 2: // output CA3 BOTTOM display
3212                     ; 181             PE_ODR &= ~PE_LEDS(bot_10);   // Update PE0 (SEG7_C)
3214  0233 b600          	ld	a,_bot_10
3215  0235 a401          	and	a,#1
3216  0237 43            	cpl	a
3217  0238 c45014        	and	a,_PE_ODR
3218  023b c75014        	ld	_PE_ODR,a
3219                     ; 182             PD_ODR &= ~PD_LEDS(bot_10);   // Update all other segments
3221  023e b600          	ld	a,_bot_10
3222  0240 44            	srl	a
3223  0241 a401          	and	a,#1
3224  0243 6b01          	ld	(OFST+0,sp),a
3226  0245 b600          	ld	a,_bot_10
3227  0247 a4fc          	and	a,#252
3228  0249 1a01          	or	a,(OFST+0,sp)
3229  024b 43            	cpl	a
3230  024c c4500f        	and	a,_PD_ODR
3231  024f c7500f        	ld	_PD_ODR,a
3232                     ; 183             set_hc164(0x04);
3234  0252 a604          	ld	a,#4
3235  0254 cd0000        	call	_set_hc164
3237                     ; 184             mpx_nr = 3;
3239  0257 35030008      	mov	_mpx_nr,#3
3240                     ; 185             break;
3242  025b ac8a038a      	jpf	L3502
3243  025f               L3202:
3244                     ; 186         case 3: // outputs CA4 BOTTOM display (MSB)
3244                     ; 187             PE_ODR &= ~PE_LEDS(bot_100);  // Update PE0 (SEG7_C)
3246  025f b600          	ld	a,_bot_100
3247  0261 a401          	and	a,#1
3248  0263 43            	cpl	a
3249  0264 c45014        	and	a,_PE_ODR
3250  0267 c75014        	ld	_PE_ODR,a
3251                     ; 188             PD_ODR &= ~PD_LEDS(bot_100);  // Update all other segments
3253  026a b600          	ld	a,_bot_100
3254  026c 44            	srl	a
3255  026d a401          	and	a,#1
3256  026f 6b01          	ld	(OFST+0,sp),a
3258  0271 b600          	ld	a,_bot_100
3259  0273 a4fc          	and	a,#252
3260  0275 1a01          	or	a,(OFST+0,sp)
3261  0277 43            	cpl	a
3262  0278 c4500f        	and	a,_PD_ODR
3263  027b c7500f        	ld	_PD_ODR,a
3264                     ; 189             set_hc164(0x08);
3266  027e a608          	ld	a,#8
3267  0280 cd0000        	call	_set_hc164
3269                     ; 190             mpx_nr = 4;
3271  0283 35040008      	mov	_mpx_nr,#4
3272                     ; 191             break;
3274  0287 ac8a038a      	jpf	L3502
3275  028b               L5202:
3276                     ; 192         case 4: // set Frontpanel LEDs
3276                     ; 193             set_hc164(0x00);
3278  028b 4f            	clr	a
3279  028c cd0000        	call	_set_hc164
3281                     ; 194             LEDS_ENABLE;
3283  028f 7215500a      	bres	_PC_ODR,#2
3284                     ; 195             set_one_led(0,LED_ALM1, LED_ALM1_BLINK, LED_ALM1_BLINK_FAST);
3286  0293 ae0100        	ldw	x,#256
3287  0296 89            	pushw	x
3288  0297 ae0002        	ldw	x,#2
3289  029a 89            	pushw	x
3290  029b ae0001        	ldw	x,#1
3291  029e 89            	pushw	x
3292  029f 4f            	clr	a
3293  02a0 cd0044        	call	_set_one_led
3295  02a3 5b06          	addw	sp,#6
3296                     ; 196             set_one_led(1,LED_ALM2, LED_ALM2_BLINK, LED_ALM2_BLINK_FAST);
3298  02a5 ae0200        	ldw	x,#512
3299  02a8 89            	pushw	x
3300  02a9 ae0008        	ldw	x,#8
3301  02ac 89            	pushw	x
3302  02ad ae0004        	ldw	x,#4
3303  02b0 89            	pushw	x
3304  02b1 a601          	ld	a,#1
3305  02b3 cd0044        	call	_set_one_led
3307  02b6 5b06          	addw	sp,#6
3308                     ; 197             set_one_led(2,LED_OUT1, LED_OUT1_BLINK, LED_OUT1_BLINK_FAST);
3310  02b8 ae0400        	ldw	x,#1024
3311  02bb 89            	pushw	x
3312  02bc ae0010        	ldw	x,#16
3313  02bf 89            	pushw	x
3314  02c0 ae0020        	ldw	x,#32
3315  02c3 89            	pushw	x
3316  02c4 a602          	ld	a,#2
3317  02c6 cd0044        	call	_set_one_led
3319  02c9 5b06          	addw	sp,#6
3320                     ; 198             set_one_led(3,LED_AT  , LED_AT_BLINK  , LED_AT_BLINK_FAST);
3322  02cb ae0800        	ldw	x,#2048
3323  02ce 89            	pushw	x
3324  02cf ae0040        	ldw	x,#64
3325  02d2 89            	pushw	x
3326  02d3 ae0080        	ldw	x,#128
3327  02d6 89            	pushw	x
3328  02d7 a603          	ld	a,#3
3329  02d9 cd0044        	call	_set_one_led
3331  02dc 5b06          	addw	sp,#6
3332                     ; 199             mpx_nr = 5;
3334  02de 35050008      	mov	_mpx_nr,#5
3335                     ; 200             break;
3337  02e2 ac8a038a      	jpf	L3502
3338  02e6               L7202:
3339                     ; 201         case 5: // output CA1 TOP display (LSB)
3339                     ; 202             PE_ODR &= ~PE_LEDS(top_01);  // Update PE0 (SEG7_C)
3341  02e6 b600          	ld	a,_top_01
3342  02e8 a401          	and	a,#1
3343  02ea 43            	cpl	a
3344  02eb c45014        	and	a,_PE_ODR
3345  02ee c75014        	ld	_PE_ODR,a
3346                     ; 203             PD_ODR &= ~PD_LEDS(top_01);  // Update all other segments
3348  02f1 b600          	ld	a,_top_01
3349  02f3 44            	srl	a
3350  02f4 a401          	and	a,#1
3351  02f6 6b01          	ld	(OFST+0,sp),a
3353  02f8 b600          	ld	a,_top_01
3354  02fa a4fc          	and	a,#252
3355  02fc 1a01          	or	a,(OFST+0,sp)
3356  02fe 43            	cpl	a
3357  02ff c4500f        	and	a,_PD_ODR
3358  0302 c7500f        	ld	_PD_ODR,a
3359                     ; 204             set_hc164(0x10);
3361  0305 a610          	ld	a,#16
3362  0307 cd0000        	call	_set_hc164
3364                     ; 205             mpx_nr = 6;
3366  030a 35060008      	mov	_mpx_nr,#6
3367                     ; 206             break;
3369  030e 207a          	jra	L3502
3370  0310               L1302:
3371                     ; 207         case 6: // output CA2 TOP display
3371                     ; 208             PE_ODR &= ~PE_LEDS(top_1);   // Update PE0 (SEG7_C)
3373  0310 b600          	ld	a,_top_1
3374  0312 a401          	and	a,#1
3375  0314 43            	cpl	a
3376  0315 c45014        	and	a,_PE_ODR
3377  0318 c75014        	ld	_PE_ODR,a
3378                     ; 209             PD_ODR &= ~PD_LEDS(top_1);   // Update all other segments
3380  031b b600          	ld	a,_top_1
3381  031d 44            	srl	a
3382  031e a401          	and	a,#1
3383  0320 6b01          	ld	(OFST+0,sp),a
3385  0322 b600          	ld	a,_top_1
3386  0324 a4fc          	and	a,#252
3387  0326 1a01          	or	a,(OFST+0,sp)
3388  0328 43            	cpl	a
3389  0329 c4500f        	and	a,_PD_ODR
3390  032c c7500f        	ld	_PD_ODR,a
3391                     ; 210             set_hc164(0x20);
3393  032f a620          	ld	a,#32
3394  0331 cd0000        	call	_set_hc164
3396                     ; 211             mpx_nr = 7;
3398  0334 35070008      	mov	_mpx_nr,#7
3399                     ; 212             break;
3401  0338 2050          	jra	L3502
3402  033a               L3302:
3403                     ; 213         case 7: // output CA3 TOP display
3403                     ; 214             PE_ODR &= ~PE_LEDS(top_10);  // Update PE0 (SEG7_C)
3405  033a b600          	ld	a,_top_10
3406  033c a401          	and	a,#1
3407  033e 43            	cpl	a
3408  033f c45014        	and	a,_PE_ODR
3409  0342 c75014        	ld	_PE_ODR,a
3410                     ; 215             PD_ODR &= ~PD_LEDS(top_10);  // Update all other segments
3412  0345 b600          	ld	a,_top_10
3413  0347 44            	srl	a
3414  0348 a401          	and	a,#1
3415  034a 6b01          	ld	(OFST+0,sp),a
3417  034c b600          	ld	a,_top_10
3418  034e a4fc          	and	a,#252
3419  0350 1a01          	or	a,(OFST+0,sp)
3420  0352 43            	cpl	a
3421  0353 c4500f        	and	a,_PD_ODR
3422  0356 c7500f        	ld	_PD_ODR,a
3423                     ; 216             set_hc164(0x40);
3425  0359 a640          	ld	a,#64
3426  035b cd0000        	call	_set_hc164
3428                     ; 217             mpx_nr = 8;
3430  035e 35080008      	mov	_mpx_nr,#8
3431                     ; 218             break;
3433  0362 2026          	jra	L3502
3434  0364               L5302:
3435                     ; 219         case 8: // outputs CA4 TOP display (MSB)
3435                     ; 220             PE_ODR &= ~PE_LEDS(top_100); // Update PE0 (SEG7_C)
3437  0364 b600          	ld	a,_top_100
3438  0366 a401          	and	a,#1
3439  0368 43            	cpl	a
3440  0369 c45014        	and	a,_PE_ODR
3441  036c c75014        	ld	_PE_ODR,a
3442                     ; 221             PD_ODR &= ~PD_LEDS(top_100); // Update all other segments
3444  036f b600          	ld	a,_top_100
3445  0371 44            	srl	a
3446  0372 a401          	and	a,#1
3447  0374 6b01          	ld	(OFST+0,sp),a
3449  0376 b600          	ld	a,_top_100
3450  0378 a4fc          	and	a,#252
3451  037a 1a01          	or	a,(OFST+0,sp)
3452  037c 43            	cpl	a
3453  037d c4500f        	and	a,_PD_ODR
3454  0380 c7500f        	ld	_PD_ODR,a
3455                     ; 222             set_hc164(0x80);
3457  0383 a680          	ld	a,#128
3458  0385 cd0000        	call	_set_hc164
3460  0388               L7302:
3461                     ; 223         default: // FALL-THROUGH (less code-size)
3461                     ; 224             mpx_nr = 0;
3463  0388 3f08          	clr	_mpx_nr
3464                     ; 225             break;
3466  038a               L3502:
3467                     ; 227 } // multiplexer()
3470  038a 84            	pop	a
3471  038b 81            	ret
3509                     ; 236 @interrupt void TIM2_UPD_OVF_IRQHandler(void)
3509                     ; 237 {
3510                     	switch	.text
3511  038c               _TIM2_UPD_OVF_IRQHandler:
3513  038c 8a            	push	cc
3514  038d 84            	pop	a
3515  038e a4bf          	and	a,#191
3516  0390 88            	push	a
3517  0391 86            	pop	cc
3518  0392 3b0002        	push	c_x+2
3519  0395 be00          	ldw	x,c_x
3520  0397 89            	pushw	x
3521  0398 3b0002        	push	c_y+2
3522  039b be00          	ldw	x,c_y
3523  039d 89            	pushw	x
3526                     ; 238     scheduler_isr();  // Run scheduler interrupt function
3528  039e cd0000        	call	_scheduler_isr
3530                     ; 239     t2_millis++;      // update millisecond counter
3532  03a1 ae0000        	ldw	x,#_t2_millis
3533  03a4 a601          	ld	a,#1
3534  03a6 cd0000        	call	c_lgadc
3536                     ; 240     if (!pwr_on)
3538                     	btst	_pwr_on
3539  03ae 251c          	jrult	L5602
3540                     ; 242         top_100    = top_10 = top_1 = top_01 = bot_01 = LED_OFF;
3542  03b0 3f00          	clr	_bot_01
3543  03b2 3f00          	clr	_top_01
3544  03b4 3f00          	clr	_top_1
3545  03b6 3f00          	clr	_top_10
3546  03b8 3f00          	clr	_top_100
3547                     ; 243         bot_100    = LED_O; 
3549  03ba 35e70000      	mov	_bot_100,#231
3550                     ; 244         bot_10     = bot_1 = LED_F;
3552  03be 35740000      	mov	_bot_1,#116
3553  03c2 450000        	mov	_bot_10,_bot_1
3554                     ; 245         pwr_on_tmr = 2000; // 2 seconds
3556  03c5 ae07d0        	ldw	x,#2000
3557  03c8 bf09          	ldw	_pwr_on_tmr,x
3559  03ca 202b          	jra	L7602
3560  03cc               L5602:
3561                     ; 247     else if (pwr_on_tmr > 0)
3563  03cc 9c            	rvf
3564  03cd be09          	ldw	x,_pwr_on_tmr
3565  03cf 2d26          	jrsle	L7602
3566                     ; 249         pwr_on_tmr--;
3568  03d1 be09          	ldw	x,_pwr_on_tmr
3569  03d3 1d0001        	subw	x,#1
3570  03d6 bf09          	ldw	_pwr_on_tmr,x
3571                     ; 250         top_100 = LED_C; top_10 = LED_1; top_1 = top_01 = LED_0;
3573  03d8 35e40000      	mov	_top_100,#228
3576  03dc 35030000      	mov	_top_10,#3
3579  03e0 35e70000      	mov	_top_01,#231
3580  03e4 450000        	mov	_top_1,_top_01
3581                     ; 251         bot_100 = LED_P; bot_10 = LED_I; bot_1 = LED_d; bot_01 = LED_c;
3583  03e7 35760000      	mov	_bot_100,#118
3586  03eb 35030000      	mov	_bot_10,#3
3589  03ef 35d30000      	mov	_bot_1,#211
3592  03f3 35d00000      	mov	_bot_01,#208
3593  03f7               L7602:
3594                     ; 253     multiplexer();             // Run multiplexer for Display and Keys
3596  03f7 cd0190        	call	_multiplexer
3598                     ; 254     TIM2_SR1 &= ~TIM2_SR1_UIF; // Reset interrupt (UIF bit) so it will not fire again straight away.
3600  03fa 72115302      	bres	_TIM2_SR1,#0
3601                     ; 255 } // TIM2_UPD_OVF_IRQHandler()
3604  03fe 85            	popw	x
3605  03ff bf00          	ldw	c_y,x
3606  0401 320002        	pop	c_y+2
3607  0404 85            	popw	x
3608  0405 bf00          	ldw	c_x,x
3609  0407 320002        	pop	c_x+2
3610  040a 80            	iret
3638                     ; 263 void setup_timer2(void)
3638                     ; 264 {
3639                     	switch	.text
3640  040b               _setup_timer2:
3644                     ; 265     TIM2_PSCR = 0x04;         //  Prescaler = 16
3646  040b 3504530c      	mov	_TIM2_PSCR,#4
3647                     ; 266     TIM2_ARRH = 0x03;         //  High byte of 1000
3649  040f 3503530d      	mov	_TIM2_ARRH,#3
3650                     ; 267     TIM2_ARRL = 0xE8;         //  Low  byte of 1000
3652  0413 35e8530e      	mov	_TIM2_ARRL,#232
3653                     ; 268     TIM2_IER  = TIM2_IER_UIE; //  Enable the update interrupts, disable all others
3655  0417 35015301      	mov	_TIM2_IER,#1
3656                     ; 269     TIM2_CR1  = TIM2_CR1_CEN; //  Finally enable the timer
3658  041b 35015300      	mov	_TIM2_CR1,#1
3659                     ; 270 } // setup_timer2()
3662  041f 81            	ret
3701                     ; 278 void setup_gpio_ports(void)
3701                     ; 279 {
3702                     	switch	.text
3703  0420               _setup_gpio_ports:
3707                     ; 283     PA_DDR     |=   SSR | ALARM;         // Set PORTA pins as outputs
3709  0420 c65002        	ld	a,_PA_DDR
3710  0423 aa0c          	or	a,#12
3711  0425 c75002        	ld	_PA_DDR,a
3712                     ; 284     PA_CR1     |=   SSR | ALARM;         // Set output pins to Push-Pull
3714  0428 c65003        	ld	a,_PA_CR1
3715  042b aa0c          	or	a,#12
3716  042d c75003        	ld	_PA_CR1,a
3717                     ; 285     PA_ODR     &= ~(SSR | ALARM);        // Disable SSR and Alarm outputs
3719  0430 c65000        	ld	a,_PA_ODR
3720  0433 a4f3          	and	a,#243
3721  0435 c75000        	ld	_PA_ODR,a
3722                     ; 290     PB_DDR     |=  PORTB_OUT;            // Set PORTB pins as outputs
3724  0438 c65007        	ld	a,_PB_DDR
3725  043b aaf0          	or	a,#240
3726  043d c75007        	ld	_PB_DDR,a
3727                     ; 291     PB_CR1     |=  PORTB_OUT;            // Set output pins to Push-Pull
3729  0440 c65008        	ld	a,_PB_CR1
3730  0443 aaf0          	or	a,#240
3731  0445 c75008        	ld	_PB_CR1,a
3732                     ; 292     PB_ODR     |= (CS_TC | CS_PT100 | CS_NRF24L01); // Disable SPI Chip-Selects
3734  0448 c65005        	ld	a,_PB_ODR
3735  044b aae0          	or	a,#224
3736  044d c75005        	ld	_PB_ODR,a
3737                     ; 293     PB_ODR     &= ~CE_NRF24L01;          // Set CE for NRF24L01 low
3739  0450 72195005      	bres	_PB_ODR,#4
3740                     ; 298     PC_ODR     &= ~PORTC_OUT;            // Turn off all pins from Port C
3742  0454 c6500a        	ld	a,_PC_ODR
3743  0457 a483          	and	a,#131
3744  0459 c7500a        	ld	_PC_ODR,a
3745                     ; 299     PC_DDR     |= PORTC_OUT;             // Set PORTC pins as outputs
3747  045c c6500c        	ld	a,_PC_DDR
3748  045f aa7c          	or	a,#124
3749  0461 c7500c        	ld	_PC_DDR,a
3750                     ; 300     PC_CR1     |= PORTC_OUT;             // Set output pins to Push-Pull
3752  0464 c6500d        	ld	a,_PC_CR1
3753  0467 aa7c          	or	a,#124
3754  0469 c7500d        	ld	_PC_CR1,a
3755                     ; 301 	PC_CR2     |=  (SPI_MOSI | SPI_SCK); // Set to 10 MHz
3757  046c c6500e        	ld	a,_PC_CR2
3758  046f aa60          	or	a,#96
3759  0471 c7500e        	ld	_PC_CR2,a
3760                     ; 302     PC_ODR     &= ~(SPI_MOSI | SPI_SCK); // MOSI = 0, SPI_CLK = 0
3762  0474 c6500a        	ld	a,_PC_ODR
3763  0477 a49f          	and	a,#159
3764  0479 c7500a        	ld	_PC_ODR,a
3765                     ; 303     PC_DDR     &= ~PORTC_IN;             // set PORTC pins as inputs
3767  047c c6500c        	ld	a,_PC_DDR
3768  047f a47d          	and	a,#125
3769  0481 c7500c        	ld	_PC_DDR,a
3770                     ; 304 	PC_CR1     &= ~PORTC_IN;             // set input pins to Floating
3772  0484 c6500d        	ld	a,_PC_CR1
3773  0487 a47d          	and	a,#125
3774  0489 c7500d        	ld	_PC_CR1,a
3775                     ; 305     LEDS_OFF;                            // Disable frontpanel LEDs
3777  048c 7214500a      	bset	_PC_ODR,#2
3778                     ; 306     SET_SDIN_0;                          // Disable SDIN for HC164
3780  0490 7217500a      	bres	_PC_ODR,#3
3781                     ; 307     SET_CLK_0;                           // Disable CLK for HC164
3783  0494 7219500a      	bres	_PC_ODR,#4
3784                     ; 312     PD_DDR     |=  PORTD_OUT;            // Set PORTD pins as outputs
3786  0498 c65011        	ld	a,_PD_DDR
3787  049b aafd          	or	a,#253
3788  049d c75011        	ld	_PD_DDR,a
3789                     ; 313     PD_CR1     |=  PORTD_OUT;            // Set output pins to Push-Pull
3791  04a0 c65012        	ld	a,_PD_CR1
3792  04a3 aafd          	or	a,#253
3793  04a5 c75012        	ld	_PD_CR1,a
3794                     ; 314     PD_ODR     &= ~PORTD_OUT;            // Disable 7-segment displays
3796  04a8 c6500f        	ld	a,_PD_ODR
3797  04ab a402          	and	a,#2
3798  04ad c7500f        	ld	_PD_ODR,a
3799                     ; 319     PE_ODR     |=  (SPI_NSS | I2C_SCL | I2C_SDA);           // Must be set here, or I2C will not work
3801  04b0 c65014        	ld	a,_PE_ODR
3802  04b3 aa26          	or	a,#38
3803  04b5 c75014        	ld	_PE_ODR,a
3804                     ; 320     PE_DDR     |=  (SPI_NSS | I2C_SCL | I2C_SDA | SEG7_C);  // Set as outputs
3806  04b8 c65016        	ld	a,_PE_DDR
3807  04bb aa27          	or	a,#39
3808  04bd c75016        	ld	_PE_DDR,a
3809                     ; 321     PE_CR1     |=   SPI_NSS | SEG7_C;                       // Set output pin to Push-Pull
3811  04c0 c65017        	ld	a,_PE_CR1
3812  04c3 aa21          	or	a,#33
3813  04c5 c75017        	ld	_PE_CR1,a
3814                     ; 322     PE_ODR     &=  ~SEG7_C;                                 // Disable 7-segment display
3816  04c8 72115014      	bres	_PE_ODR,#0
3817                     ; 323 } // setup_gpio_ports()
3820  04cc 81            	ret
3823                     	bsct
3824  000f               L3112_std_ptt:
3825  000f 01            	dc.b	1
3826  0010               L5112_ltmr:
3827  0010 00            	dc.b	0
3828  0011               L7112_htmr:
3829  0011 00            	dc.b	0
3901                     ; 332 void pid_to_time(void)
3901                     ; 333 {
3902                     	switch	.text
3903  04cd               _pid_to_time:
3905  04cd 5203          	subw	sp,#3
3906       00000003      OFST:	set	3
3909                     ; 337     int16_t pid = pid_out;      // copy of pid_out 
3911  04cf be00          	ldw	x,_pid_out
3912  04d1 1f02          	ldw	(OFST-1,sp),x
3914                     ; 340     if (pid < 0) pid = -pid;
3916  04d3 9c            	rvf
3917  04d4 1e02          	ldw	x,(OFST-1,sp)
3918  04d6 2e05          	jrsge	L5612
3921  04d8 1e02          	ldw	x,(OFST-1,sp)
3922  04da 50            	negw	x
3923  04db 1f02          	ldw	(OFST-1,sp),x
3925  04dd               L5612:
3926                     ; 341     x = (uint8_t)(pid >> 3); // divide by 8 to give 1.25 * pid_out
3928  04dd 1e02          	ldw	x,(OFST-1,sp)
3929  04df 57            	sraw	x
3930  04e0 57            	sraw	x
3931  04e1 57            	sraw	x
3932  04e2 9f            	ld	a,xl
3933  04e3 6b01          	ld	(OFST-2,sp),a
3935                     ; 343     switch (std_ptt)
3937  04e5 b60f          	ld	a,L3112_std_ptt
3939                     ; 371             break;
3940  04e7 4d            	tnz	a
3941  04e8 2708          	jreq	L1212
3942  04ea 4a            	dec	a
3943  04eb 2737          	jreq	L3212
3944  04ed 4a            	dec	a
3945  04ee 2766          	jreq	L5212
3946  04f0 2077          	jra	L1712
3947  04f2               L1212:
3948                     ; 345         case 0: // OFF
3948                     ; 346             if (!pwr_on) std_ptt = 2;
3950                     	btst	_pwr_on
3951  04f7 2506          	jrult	L3712
3954  04f9 3502000f      	mov	L3112_std_ptt,#2
3956  04fd 201b          	jra	L5712
3957  04ff               L3712:
3958                     ; 347             else if (ltmr == 0)
3960  04ff 3d10          	tnz	L5112_ltmr
3961  0501 2615          	jrne	L7712
3962                     ; 349                 htmr = x; // htmr = 1.25 * pid_out
3964  0503 7b01          	ld	a,(OFST-2,sp)
3965  0505 b711          	ld	L7112_htmr,a
3966                     ; 350                 if ((htmr > 0) && pwr_on) std_ptt = 1;
3968  0507 3d11          	tnz	L7112_htmr
3969  0509 270f          	jreq	L5712
3971                     	btst	_pwr_on
3972  0510 2408          	jruge	L5712
3975  0512 3501000f      	mov	L3112_std_ptt,#1
3976  0516 2002          	jra	L5712
3977  0518               L7712:
3978                     ; 352             else ltmr--; // decrease timer
3980  0518 3a10          	dec	L5112_ltmr
3981  051a               L5712:
3982                     ; 353             SSR_OFF;     // SSR output = 0
3984  051a 72175000      	bres	_PA_ODR,#3
3985                     ; 354             leds_out &= ~LED_OUT1; // disable OUT1 LED
3987  051e 721b0008      	bres	_leds_out+1,#5
3988                     ; 355             break;
3990  0522 2045          	jra	L1712
3991  0524               L3212:
3992                     ; 356         case 1: // ON
3992                     ; 357             if (!pwr_on) std_ptt = 2;
3994                     	btst	_pwr_on
3995  0529 2506          	jrult	L5022
3998  052b 3502000f      	mov	L3112_std_ptt,#2
4000  052f 201b          	jra	L7022
4001  0531               L5022:
4002                     ; 358             else if (htmr == 0)
4004  0531 3d11          	tnz	L7112_htmr
4005  0533 2615          	jrne	L1122
4006                     ; 360                 ltmr = 125 - x; // ltmr = 1.25 * (100 - pid_out)
4008  0535 a67d          	ld	a,#125
4009  0537 1001          	sub	a,(OFST-2,sp)
4010  0539 b710          	ld	L5112_ltmr,a
4011                     ; 361                 if ((ltmr > 0) || !pwr_on) std_ptt = 0;
4013  053b 3d10          	tnz	L5112_ltmr
4014  053d 2607          	jrne	L5122
4016                     	btst	_pwr_on
4017  0544 2506          	jrult	L7022
4018  0546               L5122:
4021  0546 3f0f          	clr	L3112_std_ptt
4022  0548 2002          	jra	L7022
4023  054a               L1122:
4024                     ; 363             else htmr--; // decrease timer
4026  054a 3a11          	dec	L7112_htmr
4027  054c               L7022:
4028                     ; 364             SSR_ON;      // SSR output = 1
4030  054c 72165000      	bset	_PA_ODR,#3
4031                     ; 365             leds_out |= LED_OUT1; // enable OUT1 LED
4033  0550 721a0008      	bset	_leds_out+1,#5
4034                     ; 366             break;
4036  0554 2013          	jra	L1712
4037  0556               L5212:
4038                     ; 367         case 2: // DISABLED
4038                     ; 368             SSR_OFF; // SSR output = 0;
4040  0556 72175000      	bres	_PA_ODR,#3
4041                     ; 369             leds_out &= ~LED_OUT1; // disable OUT1 LED
4043  055a 721b0008      	bres	_leds_out+1,#5
4044                     ; 370             if (pwr_on) std_ptt = 1;
4046                     	btst	_pwr_on
4047  0563 2404          	jruge	L1712
4050  0565 3501000f      	mov	L3112_std_ptt,#1
4051  0569               L1712:
4052                     ; 373 } // pid_to_time()
4055  0569 5b03          	addw	sp,#3
4056  056b 81            	ret
4124                     ; 381 void adc_task(void)
4124                     ; 382 {
4125                     	switch	.text
4126  056c               _adc_task:
4128  056c 520c          	subw	sp,#12
4129       0000000c      OFST:	set	12
4132                     ; 386     temp_err    = false;               // assume all is well
4134  056e 72110002      	bres	_temp_err
4135                     ; 387     temp_tc     = max31855_read(&err); // K-type thermocouple
4137  0572 96            	ldw	x,sp
4138  0573 1c000a        	addw	x,#OFST-2
4139  0576 cd0000        	call	_max31855_read
4141  0579 1f0b          	ldw	(OFST-1,sp),x
4143                     ; 388     err1        = ((err & TC_ERR_OC) > 0);
4145  057b 7b0a          	ld	a,(OFST-2,sp)
4146  057d a501          	bcp	a,#1
4147  057f 2704          	jreq	L05
4148  0581 a601          	ld	a,#1
4149  0583 2001          	jra	L25
4150  0585               L05:
4151  0585 4f            	clr	a
4152  0586               L25:
4153  0586 6b09          	ld	(OFST-3,sp),a
4155                     ; 389     if (err1) 
4157  0588 0d09          	tnz	(OFST-3,sp)
4158  058a 2603          	jrne	L45
4159  058c cc0614        	jp	L5522
4160  058f               L45:
4161                     ; 391         temp_tc_fil = TEMP_ROOM;           // reset TC-temperature to default
4163  058f ae3200        	ldw	x,#12800
4164  0592 bf02          	ldw	_temp_tc_fil+2,x
4165  0594 ae0000        	ldw	x,#0
4166  0597 bf00          	ldw	_temp_tc_fil,x
4167                     ; 392         temp_pt     = max31865_read(&err); // Read PT100 temperature
4169  0599 96            	ldw	x,sp
4170  059a 1c000a        	addw	x,#OFST-2
4171  059d cd0000        	call	_max31865_read
4173  05a0 1f0b          	ldw	(OFST-1,sp),x
4175                     ; 393         if (err)
4177  05a2 0d0a          	tnz	(OFST-2,sp)
4178  05a4 2715          	jreq	L7522
4179                     ; 395             temp_pt_fil = TEMP_ROOM; // Reset PT100-temperature
4181  05a6 ae3200        	ldw	x,#12800
4182  05a9 bf06          	ldw	_temp_pt_fil+2,x
4183  05ab ae0000        	ldw	x,#0
4184  05ae bf04          	ldw	_temp_pt_fil,x
4185                     ; 396             temp_tc_pt  = 0;         // Default temperature to 0.0 °C
4187  05b0 5f            	clrw	x
4188  05b1 bf05          	ldw	_temp_tc_pt,x
4189                     ; 397             temp_err    = true;      // No sensors detected
4191  05b3 72100002      	bset	_temp_err
4193  05b7 ac6b066b      	jpf	L3622
4194  05bb               L7522:
4195                     ; 401             temp_pt_fil = ((temp_pt_fil - (temp_pt_fil >> FILTER_SHIFT)) + temp_pt);
4197  05bb 1e0b          	ldw	x,(OFST-1,sp)
4198  05bd cd0000        	call	c_itolx
4200  05c0 96            	ldw	x,sp
4201  05c1 1c0005        	addw	x,#OFST-7
4202  05c4 cd0000        	call	c_rtol
4205  05c7 ae0004        	ldw	x,#_temp_pt_fil
4206  05ca cd0000        	call	c_ltor
4208  05cd a606          	ld	a,#6
4209  05cf cd0000        	call	c_lrsh
4211  05d2 96            	ldw	x,sp
4212  05d3 1c0001        	addw	x,#OFST-11
4213  05d6 cd0000        	call	c_rtol
4216  05d9 ae0004        	ldw	x,#_temp_pt_fil
4217  05dc cd0000        	call	c_ltor
4219  05df 96            	ldw	x,sp
4220  05e0 1c0001        	addw	x,#OFST-11
4221  05e3 cd0000        	call	c_lsub
4223  05e6 96            	ldw	x,sp
4224  05e7 1c0005        	addw	x,#OFST-7
4225  05ea cd0000        	call	c_ladd
4227  05ed ae0004        	ldw	x,#_temp_pt_fil
4228  05f0 cd0000        	call	c_rtol
4230                     ; 402             temp_tc_pt  = (int16_t)((temp_pt_fil + FILTER_ROUND) >> FILTER_SHIFT); 
4232  05f3 ae0004        	ldw	x,#_temp_pt_fil
4233  05f6 cd0000        	call	c_ltor
4235  05f9 a620          	ld	a,#32
4236  05fb cd0000        	call	c_ladc
4238  05fe a606          	ld	a,#6
4239  0600 cd0000        	call	c_lrsh
4241  0603 be02          	ldw	x,c_lreg+2
4242  0605 bf05          	ldw	_temp_tc_pt,x
4243                     ; 403             temp_tc_pt += eeprom_read_config(EEADR_MENU_ITEM(tc2));
4245  0607 a675          	ld	a,#117
4246  0609 cd0000        	call	_eeprom_read_config
4248  060c 72bb0005      	addw	x,_temp_tc_pt
4249  0610 bf05          	ldw	_temp_tc_pt,x
4250  0612 2057          	jra	L3622
4251  0614               L5522:
4252                     ; 408        temp_tc_fil = ((temp_tc_fil - (temp_tc_fil >> FILTER_SHIFT)) + temp_tc);
4254  0614 1e0b          	ldw	x,(OFST-1,sp)
4255  0616 cd0000        	call	c_itolx
4257  0619 96            	ldw	x,sp
4258  061a 1c0005        	addw	x,#OFST-7
4259  061d cd0000        	call	c_rtol
4262  0620 ae0000        	ldw	x,#_temp_tc_fil
4263  0623 cd0000        	call	c_ltor
4265  0626 a606          	ld	a,#6
4266  0628 cd0000        	call	c_lrsh
4268  062b 96            	ldw	x,sp
4269  062c 1c0001        	addw	x,#OFST-11
4270  062f cd0000        	call	c_rtol
4273  0632 ae0000        	ldw	x,#_temp_tc_fil
4274  0635 cd0000        	call	c_ltor
4276  0638 96            	ldw	x,sp
4277  0639 1c0001        	addw	x,#OFST-11
4278  063c cd0000        	call	c_lsub
4280  063f 96            	ldw	x,sp
4281  0640 1c0005        	addw	x,#OFST-7
4282  0643 cd0000        	call	c_ladd
4284  0646 ae0000        	ldw	x,#_temp_tc_fil
4285  0649 cd0000        	call	c_rtol
4287                     ; 409        temp_tc_pt  = (int16_t)((temp_tc_fil + FILTER_ROUND) >> FILTER_SHIFT); 
4289  064c ae0000        	ldw	x,#_temp_tc_fil
4290  064f cd0000        	call	c_ltor
4292  0652 a620          	ld	a,#32
4293  0654 cd0000        	call	c_ladc
4295  0657 a606          	ld	a,#6
4296  0659 cd0000        	call	c_lrsh
4298  065c be02          	ldw	x,c_lreg+2
4299  065e bf05          	ldw	_temp_tc_pt,x
4300                     ; 410        temp_tc_pt += eeprom_read_config(EEADR_MENU_ITEM(tc));
4302  0660 a674          	ld	a,#116
4303  0662 cd0000        	call	_eeprom_read_config
4305  0665 72bb0005      	addw	x,_temp_tc_pt
4306  0669 bf05          	ldw	_temp_tc_pt,x
4307  066b               L3622:
4308                     ; 412 } // adc_task()
4311  066b 5b0c          	addw	sp,#12
4312  066d 81            	ret
4338                     ; 420 void std_task(void)
4338                     ; 421 {
4339                     	switch	.text
4340  066e               _std_task:
4344                     ; 422     read_buttons(); // reads the buttons keys, result is stored in _buttons
4346  066e cd0000        	call	_read_buttons
4348                     ; 423     menu_fsm();     // Finite State Machine menu
4350  0671 cd0000        	call	_menu_fsm
4352                     ; 424     pid_to_time();  // Make Slow-PWM signal and send to Solid-State Relay (SSR)
4354  0674 cd04cd        	call	_pid_to_time
4356                     ; 425 } // std_task()
4359  0677 81            	ret
4438                     ; 433 void ctrl_task(void)
4438                     ; 434 {
4439                     	switch	.text
4440  0678               _ctrl_task:
4442  0678 5207          	subw	sp,#7
4443       00000007      OFST:	set	7
4446                     ; 436    bool    pid_init = false;
4448  067a 0f03          	clr	(OFST-4,sp)
4450                     ; 438     if (eeprom_read_config(EEADR_MENU_ITEM(CF))) // true = Fahrenheit
4452  067c a67a          	ld	a,#122
4453  067e cd0000        	call	_eeprom_read_config
4455  0681 a30000        	cpw	x,#0
4456  0684 2706          	jreq	L7232
4457                     ; 439          fahrenheit = true;
4459  0686 72100000      	bset	_fahrenheit
4461  068a 2004          	jra	L1332
4462  068c               L7232:
4463                     ; 440     else fahrenheit = false;
4465  068c 72110000      	bres	_fahrenheit
4466  0690               L1332:
4467                     ; 441     if (eeprom_read_config(EEADR_MENU_ITEM(HrS))) // true = hours
4469  0690 a67c          	ld	a,#124
4470  0692 cd0000        	call	_eeprom_read_config
4472  0695 a30000        	cpw	x,#0
4473  0698 2706          	jreq	L3332
4474                     ; 442          minutes = false; // control-timing is in hours 
4476  069a 72110000      	bres	_minutes
4478  069e 2004          	jra	L5332
4479  06a0               L3332:
4480                     ; 443     else minutes = true;  // control-timing is in minutes
4482  06a0 72100000      	bset	_minutes
4483  06a4               L5332:
4484                     ; 444     if (eeprom_read_config(EEADR_MENU_ITEM(At))) // true = Auto-Tuning active
4486  06a4 a67b          	ld	a,#123
4487  06a6 cd0000        	call	_eeprom_read_config
4489  06a9 a30000        	cpw	x,#0
4490  06ac 2706          	jreq	L7332
4491                     ; 445          auto_tuning = true;
4493  06ae 72100000      	bset	_auto_tuning
4495  06b2 2004          	jra	L1432
4496  06b4               L7332:
4497                     ; 446     else auto_tuning = false;
4499  06b4 72110000      	bres	_auto_tuning
4500  06b8               L1432:
4501                     ; 449    if (temp_err)
4503                     	btst	_temp_err
4504  06bd 2432          	jruge	L3432
4505                     ; 451        relay_alarm1 = true;
4507  06bf 72100001      	bset	_relay_alarm1
4508                     ; 452        if (menu_is_idle)
4510                     	btst	_menu_is_idle
4511  06c8 2503          	jrult	L27
4512  06ca cc07ed        	jp	L7432
4513  06cd               L27:
4514                     ; 454           top_100 = LED_A; top_10  = LED_L;
4516  06cd 35770000      	mov	_top_100,#119
4519  06d1 35e00000      	mov	_top_10,#224
4520                     ; 455           top_1   = LED_0; top_01  = LED_1; // sensor not connected alarm
4522  06d5 35e70000      	mov	_top_1,#231
4525  06d9 35030000      	mov	_top_01,#3
4526                     ; 456           bot_100 = LED_n; bot_10  = LED_o;
4528  06dd 35510000      	mov	_bot_100,#81
4531  06e1 35d10000      	mov	_bot_10,#209
4532                     ; 457           bot_1   = LED_P; bot_01  = LED_b; // noPb = no Probe
4534  06e5 35760000      	mov	_bot_1,#118
4537  06e9 35f10000      	mov	_bot_01,#241
4538  06ed aced07ed      	jpf	L7432
4539  06f1               L3432:
4540                     ; 460        relay_alarm1 = false; // reset the piezo buzzer
4542  06f1 72110001      	bres	_relay_alarm1
4543                     ; 461        if(((uint8_t)eeprom_read_config(EEADR_MENU_ITEM(rn))) < THERMOSTAT_MODE)
4545  06f5 a681          	ld	a,#129
4546  06f7 cd0000        	call	_eeprom_read_config
4548  06fa 9f            	ld	a,xl
4549  06fb a106          	cp	a,#6
4550  06fd 2408          	jruge	L1532
4551                     ; 462             leds_out |=  (LED_AT | LED_AT_BLINK); // Indicate profile mode
4553  06ff b608          	ld	a,_leds_out+1
4554  0701 aac0          	or	a,#192
4555  0703 b708          	ld	_leds_out+1,a
4557  0705 2006          	jra	L3532
4558  0707               L1532:
4559                     ; 463        else leds_out &= ~(LED_AT | LED_AT_BLINK);
4561  0707 b608          	ld	a,_leds_out+1
4562  0709 a43f          	and	a,#63
4563  070b b708          	ld	_leds_out+1,a
4564  070d               L3532:
4565                     ; 465        sa = eeprom_read_config(EEADR_MENU_ITEM(SA)); // Show Alarm parameter
4567  070d a676          	ld	a,#118
4568  070f cd0000        	call	_eeprom_read_config
4570  0712 1f04          	ldw	(OFST-3,sp),x
4572                     ; 466        if (sa)
4574  0714 1e04          	ldw	x,(OFST-3,sp)
4575  0716 275b          	jreq	L5532
4576                     ; 468             if (minutes) // is timing-control in minutes?
4578                     	btst	_minutes
4579  071d 240a          	jruge	L7532
4580                     ; 469                  diff = temp_tc_pt - setpoint;
4582  071f be05          	ldw	x,_temp_tc_pt
4583  0721 72b00000      	subw	x,_setpoint
4584  0725 1f06          	ldw	(OFST-1,sp),x
4587  0727 200e          	jra	L1632
4588  0729               L7532:
4589                     ; 470             else diff = temp_tc_pt - eeprom_read_config(EEADR_MENU_ITEM(SP));
4591  0729 a672          	ld	a,#114
4592  072b cd0000        	call	_eeprom_read_config
4594  072e 1f01          	ldw	(OFST-6,sp),x
4596  0730 be05          	ldw	x,_temp_tc_pt
4597  0732 72f001        	subw	x,(OFST-6,sp)
4598  0735 1f06          	ldw	(OFST-1,sp),x
4600  0737               L1632:
4601                     ; 471             if (diff < 0) 
4603  0737 9c            	rvf
4604  0738 1e06          	ldw	x,(OFST-1,sp)
4605  073a 2e05          	jrsge	L3632
4606                     ; 472                  diff = -diff;
4608  073c 1e06          	ldw	x,(OFST-1,sp)
4609  073e 50            	negw	x
4610  073f 1f06          	ldw	(OFST-1,sp),x
4612  0741               L3632:
4613                     ; 473             if (sa < 0)
4615  0741 9c            	rvf
4616  0742 1e04          	ldw	x,(OFST-3,sp)
4617  0744 2e1a          	jrsge	L5632
4618                     ; 475                  sa = -sa;
4620  0746 1e04          	ldw	x,(OFST-3,sp)
4621  0748 50            	negw	x
4622  0749 1f04          	ldw	(OFST-3,sp),x
4624                     ; 476                  relay_alarm1 = (diff <= sa); // enable relay if diff is small
4626  074b 9c            	rvf
4627  074c 1e06          	ldw	x,(OFST-1,sp)
4628  074e 1304          	cpw	x,(OFST-3,sp)
4629  0750 2d02          	jrsle	L47
4630  0752 2006          	jp	L26
4631  0754               L47:
4632  0754 72100001      	bset	_relay_alarm1
4633  0758 2004          	jra	L46
4634  075a               L26:
4635  075a 72110001      	bres	_relay_alarm1
4636  075e               L46:
4638  075e 2013          	jra	L5532
4639  0760               L5632:
4640                     ; 478                  relay_alarm1 = (diff >= sa); // enable relay if diff is large
4642  0760 9c            	rvf
4643  0761 1e06          	ldw	x,(OFST-1,sp)
4644  0763 1304          	cpw	x,(OFST-3,sp)
4645  0765 2e02          	jrsge	L67
4646  0767 2006          	jp	L66
4647  0769               L67:
4648  0769 72100001      	bset	_relay_alarm1
4649  076d 2004          	jra	L07
4650  076f               L66:
4651  076f 72110001      	bres	_relay_alarm1
4652  0773               L07:
4653  0773               L5532:
4654                     ; 481        if (ts != eeprom_read_config(EEADR_MENU_ITEM(Ts))) // Read Ts [seconds]
4656  0773 a680          	ld	a,#128
4657  0775 cd0000        	call	_eeprom_read_config
4659  0778 b600          	ld	a,_ts
4660  077a 905f          	clrw	y
4661  077c 9097          	ld	yl,a
4662  077e 90bf00        	ldw	c_y,y
4663  0781 b300          	cpw	x,c_y
4664  0783 270d          	jreq	L1732
4665                     ; 483            pid_init = true;
4667  0785 a601          	ld	a,#1
4668  0787 6b03          	ld	(OFST-4,sp),a
4670                     ; 484            ts       = eeprom_read_config(EEADR_MENU_ITEM(Ts));
4672  0789 a680          	ld	a,#128
4673  078b cd0000        	call	_eeprom_read_config
4675  078e 01            	rrwa	x,a
4676  078f b700          	ld	_ts,a
4677  0791 02            	rlwa	x,a
4678  0792               L1732:
4679                     ; 486        if (ts == 0)
4681  0792 3d00          	tnz	_ts
4682  0794 2605          	jrne	L3732
4683                     ; 487             temperature_control(); // Run thermostat if TS == 0
4685  0796 cd0000        	call	_temperature_control
4688  0799 2011          	jra	L5732
4689  079b               L3732:
4690                     ; 488        else if (auto_tuning)
4692                     	btst	_auto_tuning
4693  07a0 2405          	jruge	L7732
4694                     ; 489             pid_auto_tuning();     // Run PID Auto-Tuning algorithm
4696  07a2 cd0000        	call	_pid_auto_tuning
4699  07a5 2005          	jra	L5732
4700  07a7               L7732:
4701                     ; 490        else pid_control(pid_init); // Run PID controller
4703  07a7 7b03          	ld	a,(OFST-4,sp)
4704  07a9 cd0000        	call	_pid_control
4706  07ac               L5732:
4707                     ; 492        if (menu_is_idle)           // show temperature if menu is idle
4709                     	btst	_menu_is_idle
4710  07b1 243a          	jruge	L7432
4711                     ; 494            switch (sensor2_selected)
4713  07b3 b600          	ld	a,_sensor2_selected
4715                     ; 504                  break;
4716  07b5 4d            	tnz	a
4717  07b6 2705          	jreq	L5722
4718  07b8 4a            	dec	a
4719  07b9 2718          	jreq	L7722
4720  07bb 2030          	jra	L7432
4721  07bd               L5722:
4722                     ; 496             case 0:
4722                     ; 497                  value_to_led(temp_tc_pt,LEDS_TEMP,ROW_TOP); // display temperature on top-row
4724  07bd 4b02          	push	#2
4725  07bf 4b01          	push	#1
4726  07c1 be05          	ldw	x,_temp_tc_pt
4727  07c3 cd0000        	call	_value_to_led
4729  07c6 85            	popw	x
4730                     ; 498                  value_to_led(setpoint  ,LEDS_TEMP,ROW_BOT); // display setpoint on bottom-row
4732  07c7 4b03          	push	#3
4733  07c9 4b01          	push	#1
4734  07cb be00          	ldw	x,_setpoint
4735  07cd cd0000        	call	_value_to_led
4737  07d0 85            	popw	x
4738                     ; 499                  break;
4740  07d1 201a          	jra	L7432
4741  07d3               L7722:
4742                     ; 500             case 1:
4742                     ; 501                  top_100 = LED_P; top_10 = LED_I;
4744  07d3 35760000      	mov	_top_100,#118
4747  07d7 35030000      	mov	_top_10,#3
4748                     ; 502                  top_1   = LED_d; top_01 = LED_EQ;
4750  07db 35d30000      	mov	_top_1,#211
4753  07df 35900000      	mov	_top_01,#144
4754                     ; 503                  value_to_led(pid_out, LEDS_TEMP,ROW_BOT); // display pid_out on bottom row
4756  07e3 4b03          	push	#3
4757  07e5 4b01          	push	#1
4758  07e7 be00          	ldw	x,_pid_out
4759  07e9 cd0000        	call	_value_to_led
4761  07ec 85            	popw	x
4762                     ; 504                  break;
4764  07ed               L7042:
4765  07ed               L7432:
4766                     ; 508    if (relay_alarm1)
4768                     	btst	_relay_alarm1
4769  07f2 240c          	jruge	L1142
4770                     ; 510         leds_out |= LED_ALM1 | LED_ALM1_BLINK;
4772  07f4 b608          	ld	a,_leds_out+1
4773  07f6 aa03          	or	a,#3
4774  07f8 b708          	ld	_leds_out+1,a
4775                     ; 511         ALARM_ON;
4777  07fa 72145000      	bset	_PA_ODR,#2
4779  07fe 200a          	jra	L3142
4780  0800               L1142:
4781                     ; 515        leds_out &= ~(LED_ALM1 | LED_ALM1_BLINK);
4783  0800 b608          	ld	a,_leds_out+1
4784  0802 a4fc          	and	a,#252
4785  0804 b708          	ld	_leds_out+1,a
4786                     ; 516        ALARM_OFF;
4788  0806 72155000      	bres	_PA_ODR,#2
4789  080a               L3142:
4790                     ; 518 } // ctrl_task()
4793  080a 5b07          	addw	sp,#7
4794  080c 81            	ret
4797                     	bsct
4798  0012               L5142_min:
4799  0012 00            	dc.b	0
4833                     ; 526 void prfl_task(void)
4833                     ; 527 {
4834                     	switch	.text
4835  080d               _prfl_task:
4839                     ; 530     if (minutes)
4841                     	btst	_minutes
4842  0812 2407          	jruge	L5342
4843                     ; 532         update_profile();
4845  0814 cd0000        	call	_update_profile
4847                     ; 533         min = 0;
4849  0817 3f12          	clr	L5142_min
4851  0819 200d          	jra	L7342
4852  081b               L5342:
4853                     ; 535         if (++min >= 60)
4855  081b 3c12          	inc	L5142_min
4856  081d b612          	ld	a,L5142_min
4857  081f a13c          	cp	a,#60
4858  0821 2505          	jrult	L7342
4859                     ; 537             min = 0;
4861  0823 3f12          	clr	L5142_min
4862                     ; 538             update_profile(); 
4864  0825 cd0000        	call	_update_profile
4866  0828               L7342:
4867                     ; 541 } // prfl_task();
4870  0828 81            	ret
4900                     ; 549 void initialise_system_clock(void)
4900                     ; 550 {
4901                     	switch	.text
4902  0829               _initialise_system_clock:
4906                     ; 551 	CLK_ICKCR  = 0;                //  Reset the Internal Clock Register.
4908  0829 725f50c0      	clr	_CLK_ICKCR
4909                     ; 552     CLK_ICKCR |= CLK_ICKCR_HSIEN;  //  Enable the HSI.
4911  082d 721050c0      	bset	_CLK_ICKCR,#0
4913  0831               L5542:
4914                     ; 553     while ((CLK_ICKCR & CLK_ICKCR_HSIRDY) == 0); //  Wait for the HSI to be ready for use.
4916  0831 c650c0        	ld	a,_CLK_ICKCR
4917  0834 a502          	bcp	a,#2
4918  0836 27f9          	jreq	L5542
4919                     ; 554     CLK_CKDIVR     = 0;            //  Ensure the clocks are running at full speed.
4921  0838 725f50c6      	clr	_CLK_CKDIVR
4922                     ; 558     ADC_CR1     &= ~ADC_CR1_SPSEL_MSK;
4924  083c c65401        	ld	a,_ADC_CR1
4925  083f a48f          	and	a,#143
4926  0841 c75401        	ld	_ADC_CR1,a
4927                     ; 559     ADC_CR1     |= 0x20;          //  Set prescaler (SPSEL bits) to 4, fADC = 4 MHz
4929  0844 721a5401      	bset	_ADC_CR1,#5
4930                     ; 560     CLK_SWIMCCR  = 0x00;          //  Set SWIM to run at clock / 2.
4932  0848 725f50cd      	clr	_CLK_SWIMCCR
4933                     ; 561     CLK_SWR      = 0xE1;          //  Use HSI as the clock source.
4935  084c 35e150c4      	mov	_CLK_SWR,#225
4936                     ; 562     CLK_SWCR     = 0x00;          //  Reset the clock switch control register.
4938  0850 725f50c5      	clr	_CLK_SWCR
4939                     ; 563     CLK_SWCR    |= CLK_SWCR_SWEN; //  Enable switching.
4941  0854 721250c5      	bset	_CLK_SWCR,#1
4943  0858               L3642:
4944                     ; 564     while ((CLK_SWCR & CLK_SWCR_SWBSY) != 0);  //  Pause while the clock switch is busy.
4946  0858 c650c5        	ld	a,_CLK_SWCR
4947  085b a501          	bcp	a,#1
4948  085d 26f9          	jrne	L3642
4949                     ; 565 } // initialise_system_clock()
4952  085f 81            	ret
5006                     ; 574 int main(void)
5006                     ; 575 {
5007                     	switch	.text
5008  0860               _main:
5010  0860 89            	pushw	x
5011       00000002      OFST:	set	2
5014                     ; 577 	int ee = eedata[0]; // This is to prevent the linker from removing .eeprom section
5016  0861 ce0000        	ldw	x,_eedata
5017  0864 1f01          	ldw	(OFST-1,sp),x
5019                     ; 579 	disable_interrupts();      // no interrupts yet
5022  0866 9b            sim
5024                     ; 580 	initialise_system_clock(); // set main-clock to 16 MHz
5027  0867 adc0          	call	_initialise_system_clock
5029                     ; 581 	setup_gpio_ports();        // Initialise all GPIO ports
5031  0869 cd0420        	call	_setup_gpio_ports
5033                     ; 582 	setup_timer2();            // set TMR2 clock to 1 kHz for interrupt
5035  086c cd040b        	call	_setup_timer2
5037                     ; 583     spi_init();                // Init. SPI interface
5039  086f cd0000        	call	_spi_init
5041                     ; 584     max31865_init();           // Init. PT100 device
5043  0872 cd0000        	call	_max31865_init
5045                     ; 587     scheduler_init();                    // init. task scheduler
5047  0875 cd0000        	call	_scheduler_init
5049                     ; 588     add_task(adc_task ,"ADC",  0,  500); // every 500 msec.
5051  0878 ae01f4        	ldw	x,#500
5052  087b 89            	pushw	x
5053  087c 5f            	clrw	x
5054  087d 89            	pushw	x
5055  087e ae000c        	ldw	x,#L5052
5056  0881 89            	pushw	x
5057  0882 ae056c        	ldw	x,#_adc_task
5058  0885 cd0000        	call	_add_task
5060  0888 5b06          	addw	sp,#6
5061                     ; 589     add_task(std_task ,"STD", 50,  100); // every 100 msec.
5063  088a ae0064        	ldw	x,#100
5064  088d 89            	pushw	x
5065  088e ae0032        	ldw	x,#50
5066  0891 89            	pushw	x
5067  0892 ae0008        	ldw	x,#L7052
5068  0895 89            	pushw	x
5069  0896 ae066e        	ldw	x,#_std_task
5070  0899 cd0000        	call	_add_task
5072  089c 5b06          	addw	sp,#6
5073                     ; 590     add_task(ctrl_task,"CTL",200, 1000); // every second
5075  089e ae03e8        	ldw	x,#1000
5076  08a1 89            	pushw	x
5077  08a2 ae00c8        	ldw	x,#200
5078  08a5 89            	pushw	x
5079  08a6 ae0004        	ldw	x,#L1152
5080  08a9 89            	pushw	x
5081  08aa ae0678        	ldw	x,#_ctrl_task
5082  08ad cd0000        	call	_add_task
5084  08b0 5b06          	addw	sp,#6
5085                     ; 591     add_task(prfl_task,"PRF",300,60000); // every minute / hour
5087  08b2 aeea60        	ldw	x,#60000
5088  08b5 89            	pushw	x
5089  08b6 ae012c        	ldw	x,#300
5090  08b9 89            	pushw	x
5091  08ba ae0000        	ldw	x,#L3152
5092  08bd 89            	pushw	x
5093  08be ae080d        	ldw	x,#_prfl_task
5094  08c1 cd0000        	call	_add_task
5096  08c4 5b06          	addw	sp,#6
5097                     ; 592 	enable_interrupts();                 // enable interrupts
5100  08c6 9a            rim
5102  08c7               L5152:
5103                     ; 596         dispatch_tasks();     // Run task-scheduler()
5105  08c7 cd0000        	call	_dispatch_tasks
5107                     ; 597         wait_for_interrupt(); // do nothing
5110  08ca 8f            wfi
5114  08cb 20fa          	jra	L5152
5242                     	xdef	_main
5243                     	xdef	_prfl_task
5244                     	xdef	_ctrl_task
5245                     	xdef	_std_task
5246                     	xdef	_adc_task
5247                     	xdef	_pid_to_time
5248                     	xdef	_TIM2_UPD_OVF_IRQHandler
5249                     	xdef	_set_one_led
5250                     	xref.b	_t2_millis
5251                     	xref.b	_pid_out
5252                     	xref.b	_ts
5253                     	xref.b	_setpoint
5254                     	xbit	_fahrenheit
5255                     	xbit	_menu_is_idle
5256                     	xbit	_minutes
5257                     	xref.b	_sensor2_selected
5258                     	xbit	_pwr_on
5259                     	xref.b	_bot_01
5260                     	xref.b	_bot_1
5261                     	xref.b	_bot_10
5262                     	xref.b	_bot_100
5263                     	xref.b	_top_01
5264                     	xref.b	_top_1
5265                     	xref.b	_top_10
5266                     	xref.b	_top_100
5267                     	xref	_eedata
5268                     	switch	.ubsct
5269  0000               _blink_tmr:
5270  0000 00000000      	ds.b	4
5271                     	xdef	_blink_tmr
5272                     	xdef	_std
5273  0004               _hc164_val:
5274  0004 00            	ds.b	1
5275                     	xdef	_hc164_val
5276                     	xdef	_pwr_on_tmr
5277                     	xdef	_mpx_nr
5278                     	xdef	_temp_err
5279                     	xdef	_temp_pt_fil
5280                     	xdef	_temp_tc_fil
5281  0005               _temp_tc_pt:
5282  0005 0000          	ds.b	2
5283                     	xdef	_temp_tc_pt
5284  0007               _leds_out:
5285  0007 0000          	ds.b	2
5286                     	xdef	_leds_out
5287                     	xdef	_relay_alarm1
5288                     	xdef	_auto_tuning
5289                     	xref	_max31865_read
5290                     	xref	_max31865_init
5291                     	xref	_max31855_read
5292                     	xref	_spi_init
5293                     	xref	_add_task
5294                     	xref	_dispatch_tasks
5295                     	xref	_scheduler_isr
5296                     	xref	_scheduler_init
5297                     	xref	_pid_control
5298                     	xref	_temperature_control
5299                     	xref	_menu_fsm
5300                     	xref	_read_buttons
5301                     	xref	_update_profile
5302                     	xref	_value_to_led
5303                     	xref	_pid_auto_tuning
5304                     	xref	_eeprom_read_config
5305                     	xdef	_setup_gpio_ports
5306                     	xdef	_initialise_system_clock
5307                     	xdef	_setup_timer2
5308                     	xdef	_multiplexer
5309                     	xdef	_set_hc164
5310                     .const:	section	.text
5311  0000               L3152:
5312  0000 50524600      	dc.b	"PRF",0
5313  0004               L1152:
5314  0004 43544c00      	dc.b	"CTL",0
5315  0008               L7052:
5316  0008 53544400      	dc.b	"STD",0
5317  000c               L5052:
5318  000c 41444300      	dc.b	"ADC",0
5319                     	xref.b	c_lreg
5320                     	xref.b	c_x
5321                     	xref.b	c_y
5341                     	xref	c_ladc
5342                     	xref	c_ladd
5343                     	xref	c_itolx
5344                     	xref	c_lsub
5345                     	xref	c_rtol
5346                     	xref	c_lrsh
5347                     	xref	c_ltor
5348                     	xref	c_lgadc
5349                     	end
