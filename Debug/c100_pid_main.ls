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
2604                     ; 35 void set_hc164(uint8_t x)
2604                     ; 36 {
2606                     	switch	.text
2607  0000               _set_hc164:
2609  0000 88            	push	a
2610  0001 5203          	subw	sp,#3
2611       00000003      OFST:	set	3
2614                     ; 37     uint8_t i, j, p = 0x80;
2616  0003 a680          	ld	a,#128
2617  0005 6b01          	ld	(OFST-2,sp),a
2619                     ; 39     hc164_val = x; // save value
2621  0007 7b04          	ld	a,(OFST+1,sp)
2622  0009 b700          	ld	_hc164_val,a
2623                     ; 40     SET_CLK_0;
2625  000b 72155000      	bres	_PA_ODR,#2
2626                     ; 41     SET_SDIN_0;
2628  000f 72175000      	bres	_PA_ODR,#3
2629                     ; 42     for (i = 0; i < 8; i++)
2631  0013 0f02          	clr	(OFST-1,sp)
2633  0015               L3661:
2634                     ; 44         if (x & p) SET_SDIN_1;
2636  0015 7b04          	ld	a,(OFST+1,sp)
2637  0017 1501          	bcp	a,(OFST-2,sp)
2638  0019 2706          	jreq	L1761
2641  001b 72165000      	bset	_PA_ODR,#3
2643  001f 2004          	jra	L3761
2644  0021               L1761:
2645                     ; 45         else       SET_SDIN_0;
2647  0021 72175000      	bres	_PA_ODR,#3
2648  0025               L3761:
2649                     ; 46         SET_CLK_1;
2651  0025 72145000      	bset	_PA_ODR,#2
2652                     ; 47         p >>= 1;
2654  0029 0401          	srl	(OFST-2,sp)
2656                     ; 48         for (j = 0; j < 10; j++); // small delay
2658  002b 0f03          	clr	(OFST+0,sp)
2660  002d               L5761:
2664  002d 0c03          	inc	(OFST+0,sp)
2668  002f 7b03          	ld	a,(OFST+0,sp)
2669  0031 a10a          	cp	a,#10
2670  0033 25f8          	jrult	L5761
2671                     ; 49         SET_CLK_0;
2673  0035 72155000      	bres	_PA_ODR,#2
2674                     ; 42     for (i = 0; i < 8; i++)
2676  0039 0c02          	inc	(OFST-1,sp)
2680  003b 7b02          	ld	a,(OFST-1,sp)
2681  003d a108          	cp	a,#8
2682  003f 25d4          	jrult	L3661
2683                     ; 51 } // set_hc164()
2686  0041 5b04          	addw	sp,#4
2687  0043 81            	ret
2724                     ; 60 void multiplexer(void)
2724                     ; 61 {
2725                     	switch	.text
2726  0044               _multiplexer:
2728  0044 88            	push	a
2729       00000001      OFST:	set	1
2732                     ; 62     LEDS_OFF;             // clear LEDs
2734  0045 72135000      	bres	_PA_ODR,#1
2735                     ; 63     PC_ODR |= PORTC_LEDS; // disable 7-segment displays
2737  0049 c6500a        	ld	a,_PC_ODR
2738  004c aaf8          	or	a,#248
2739  004e c7500a        	ld	_PC_ODR,a
2740                     ; 64     PD_ODR |= PORTD_LEDS; // disable 7-segment displays
2742  0051 c6500f        	ld	a,_PD_ODR
2743  0054 aa1c          	or	a,#28
2744  0056 c7500f        	ld	_PD_ODR,a
2745                     ; 65     set_hc164(0x00);      // clear 7-segment displays
2747  0059 4f            	clr	a
2748  005a ada4          	call	_set_hc164
2750                     ; 67     switch (mpx_nr)
2752  005c b606          	ld	a,_mpx_nr
2754                     ; 124             break;
2755  005e 4d            	tnz	a
2756  005f 2731          	jreq	L3071
2757  0061 4a            	dec	a
2758  0062 275f          	jreq	L5071
2759  0064 4a            	dec	a
2760  0065 2603          	jrne	L01
2761  0067 cc00f4        	jp	L7071
2762  006a               L01:
2763  006a 4a            	dec	a
2764  006b 2603          	jrne	L21
2765  006d cc0125        	jp	L1171
2766  0070               L21:
2767  0070 4a            	dec	a
2768  0071 2603          	jrne	L41
2769  0073 cc0156        	jp	L3171
2770  0076               L41:
2771  0076 4a            	dec	a
2772  0077 2603          	jrne	L61
2773  0079 cc017c        	jp	L5171
2774  007c               L61:
2775  007c 4a            	dec	a
2776  007d 2603          	jrne	L02
2777  007f cc01ad        	jp	L7171
2778  0082               L02:
2779  0082 4a            	dec	a
2780  0083 2603          	jrne	L22
2781  0085 cc01dc        	jp	L1271
2782  0088               L22:
2783  0088 4a            	dec	a
2784  0089 2603          	jrne	L42
2785  008b cc020b        	jp	L3271
2786  008e               L42:
2787  008e ac340234      	jpf	L5271
2788  0092               L3071:
2789                     ; 69         case 0: // output CA1 BOTTOM display (LSB)
2789                     ; 70             set_hc164(0x01);
2791  0092 a601          	ld	a,#1
2792  0094 cd0000        	call	_set_hc164
2794                     ; 71             PC_ODR &= ~(led_e & PORTC_LEDS); // Update PC7..PC3
2796  0097 b600          	ld	a,_led_e
2797  0099 a4f8          	and	a,#248
2798  009b 43            	cpl	a
2799  009c c4500a        	and	a,_PC_ODR
2800  009f c7500a        	ld	_PC_ODR,a
2801                     ; 72             PD_ODR &= ~PD_LEDS(led_e);       // Update PD4..PD2
2803  00a2 b600          	ld	a,_led_e
2804  00a4 97            	ld	xl,a
2805  00a5 a610          	ld	a,#16
2806  00a7 42            	mul	x,a
2807  00a8 9f            	ld	a,xl
2808  00a9 a410          	and	a,#16
2809  00ab 6b01          	ld	(OFST+0,sp),a
2811  00ad b600          	ld	a,_led_e
2812  00af 48            	sll	a
2813  00b0 a40c          	and	a,#12
2814  00b2 1a01          	or	a,(OFST+0,sp)
2815  00b4 43            	cpl	a
2816  00b5 c4500f        	and	a,_PD_ODR
2817  00b8 c7500f        	ld	_PD_ODR,a
2818                     ; 73             mpx_nr = 1;
2820  00bb 35010006      	mov	_mpx_nr,#1
2821                     ; 74             break;
2823  00bf ac360236      	jpf	L1471
2824  00c3               L5071:
2825                     ; 75         case 1: // output CA2 BOTTOM display
2825                     ; 76             set_hc164(0x02);
2827  00c3 a602          	ld	a,#2
2828  00c5 cd0000        	call	_set_hc164
2830                     ; 77             PC_ODR &= ~(led_01 & PORTC_LEDS); // Update PC7..PC3
2832  00c8 b600          	ld	a,_led_01
2833  00ca a4f8          	and	a,#248
2834  00cc 43            	cpl	a
2835  00cd c4500a        	and	a,_PC_ODR
2836  00d0 c7500a        	ld	_PC_ODR,a
2837                     ; 78             PD_ODR &= ~PD_LEDS(led_01);       // Update PD4..PD2
2839  00d3 b600          	ld	a,_led_01
2840  00d5 97            	ld	xl,a
2841  00d6 a610          	ld	a,#16
2842  00d8 42            	mul	x,a
2843  00d9 9f            	ld	a,xl
2844  00da a410          	and	a,#16
2845  00dc 6b01          	ld	(OFST+0,sp),a
2847  00de b600          	ld	a,_led_01
2848  00e0 48            	sll	a
2849  00e1 a40c          	and	a,#12
2850  00e3 1a01          	or	a,(OFST+0,sp)
2851  00e5 43            	cpl	a
2852  00e6 c4500f        	and	a,_PD_ODR
2853  00e9 c7500f        	ld	_PD_ODR,a
2854                     ; 79             mpx_nr = 2;
2856  00ec 35020006      	mov	_mpx_nr,#2
2857                     ; 80             break;
2859  00f0 ac360236      	jpf	L1471
2860  00f4               L7071:
2861                     ; 81         case 2: // output CA3 BOTTOM display
2861                     ; 82             set_hc164(0x04);
2863  00f4 a604          	ld	a,#4
2864  00f6 cd0000        	call	_set_hc164
2866                     ; 83             PC_ODR &= ~(led_1 & PORTC_LEDS); // Update PC7..PC3
2868  00f9 b600          	ld	a,_led_1
2869  00fb a4f8          	and	a,#248
2870  00fd 43            	cpl	a
2871  00fe c4500a        	and	a,_PC_ODR
2872  0101 c7500a        	ld	_PC_ODR,a
2873                     ; 84             PD_ODR &= ~PD_LEDS(led_1);       // Update PD4..PD2
2875  0104 b600          	ld	a,_led_1
2876  0106 97            	ld	xl,a
2877  0107 a610          	ld	a,#16
2878  0109 42            	mul	x,a
2879  010a 9f            	ld	a,xl
2880  010b a410          	and	a,#16
2881  010d 6b01          	ld	(OFST+0,sp),a
2883  010f b600          	ld	a,_led_1
2884  0111 48            	sll	a
2885  0112 a40c          	and	a,#12
2886  0114 1a01          	or	a,(OFST+0,sp)
2887  0116 43            	cpl	a
2888  0117 c4500f        	and	a,_PD_ODR
2889  011a c7500f        	ld	_PD_ODR,a
2890                     ; 85             mpx_nr = 3;
2892  011d 35030006      	mov	_mpx_nr,#3
2893                     ; 86             break;
2895  0121 ac360236      	jpf	L1471
2896  0125               L1171:
2897                     ; 87         case 3: // outputs CA4 BOTTOM display (MSB)
2897                     ; 88             set_hc164(0x08);
2899  0125 a608          	ld	a,#8
2900  0127 cd0000        	call	_set_hc164
2902                     ; 89             PC_ODR &= ~(led_10 & PORTC_LEDS); // Update PC7..PC3
2904  012a b600          	ld	a,_led_10
2905  012c a4f8          	and	a,#248
2906  012e 43            	cpl	a
2907  012f c4500a        	and	a,_PC_ODR
2908  0132 c7500a        	ld	_PC_ODR,a
2909                     ; 90             PD_ODR &= ~PD_LEDS(led_10);       // Update PD4..PD2
2911  0135 b600          	ld	a,_led_10
2912  0137 97            	ld	xl,a
2913  0138 a610          	ld	a,#16
2914  013a 42            	mul	x,a
2915  013b 9f            	ld	a,xl
2916  013c a410          	and	a,#16
2917  013e 6b01          	ld	(OFST+0,sp),a
2919  0140 b600          	ld	a,_led_10
2920  0142 48            	sll	a
2921  0143 a40c          	and	a,#12
2922  0145 1a01          	or	a,(OFST+0,sp)
2923  0147 43            	cpl	a
2924  0148 c4500f        	and	a,_PD_ODR
2925  014b c7500f        	ld	_PD_ODR,a
2926                     ; 91             mpx_nr = 4;
2928  014e 35040006      	mov	_mpx_nr,#4
2929                     ; 92             break;
2931  0152 ac360236      	jpf	L1471
2932  0156               L3171:
2933                     ; 93         case 4: // set Frontpanel LEDs
2933                     ; 94             set_hc164(0x00);
2935  0156 4f            	clr	a
2936  0157 cd0000        	call	_set_hc164
2938                     ; 95             LEDS_ENABLE;
2940  015a 72125000      	bset	_PA_ODR,#1
2941                     ; 96             PC_ODR &= ~(leds_out & (LED_OUT1 | LED_AT));
2943  015e b609          	ld	a,_leds_out
2944  0160 a4a0          	and	a,#160
2945  0162 43            	cpl	a
2946  0163 c4500a        	and	a,_PC_ODR
2947  0166 c7500a        	ld	_PC_ODR,a
2948                     ; 97             PD_ODR &= ~(leds_out & (LED_ALM1 | LED_ALM2));
2950  0169 b609          	ld	a,_leds_out
2951  016b a40c          	and	a,#12
2952  016d 43            	cpl	a
2953  016e c4500f        	and	a,_PD_ODR
2954  0171 c7500f        	ld	_PD_ODR,a
2955                     ; 98             mpx_nr = 5;
2957  0174 35050006      	mov	_mpx_nr,#5
2958                     ; 99             break;
2960  0178 ac360236      	jpf	L1471
2961  017c               L5171:
2962                     ; 100         case 5: // output CA1 TOP display (LSB)
2962                     ; 101             set_hc164(0x10);
2964  017c a610          	ld	a,#16
2965  017e cd0000        	call	_set_hc164
2967                     ; 102             PC_ODR &= ~(top_01 & PORTC_LEDS); // Update PC7..PC3
2969  0181 b601          	ld	a,_top_01
2970  0183 a4f8          	and	a,#248
2971  0185 43            	cpl	a
2972  0186 c4500a        	and	a,_PC_ODR
2973  0189 c7500a        	ld	_PC_ODR,a
2974                     ; 103             PD_ODR &= ~PD_LEDS(top_01);       // Update PD4..PD2
2976  018c b601          	ld	a,_top_01
2977  018e 97            	ld	xl,a
2978  018f a610          	ld	a,#16
2979  0191 42            	mul	x,a
2980  0192 9f            	ld	a,xl
2981  0193 a410          	and	a,#16
2982  0195 6b01          	ld	(OFST+0,sp),a
2984  0197 b601          	ld	a,_top_01
2985  0199 48            	sll	a
2986  019a a40c          	and	a,#12
2987  019c 1a01          	or	a,(OFST+0,sp)
2988  019e 43            	cpl	a
2989  019f c4500f        	and	a,_PD_ODR
2990  01a2 c7500f        	ld	_PD_ODR,a
2991                     ; 104             mpx_nr = 6;
2993  01a5 35060006      	mov	_mpx_nr,#6
2994                     ; 105             break;
2996  01a9 ac360236      	jpf	L1471
2997  01ad               L7171:
2998                     ; 106         case 6: // output CA2 TOP display
2998                     ; 107             set_hc164(0x20);
3000  01ad a620          	ld	a,#32
3001  01af cd0000        	call	_set_hc164
3003                     ; 108             PC_ODR &= ~(top_1 & PORTC_LEDS); // Update PC7..PC3
3005  01b2 b602          	ld	a,_top_1
3006  01b4 a4f8          	and	a,#248
3007  01b6 43            	cpl	a
3008  01b7 c4500a        	and	a,_PC_ODR
3009  01ba c7500a        	ld	_PC_ODR,a
3010                     ; 109             PD_ODR &= ~PD_LEDS(top_1);       // Update PD4..PD2
3012  01bd b602          	ld	a,_top_1
3013  01bf 97            	ld	xl,a
3014  01c0 a610          	ld	a,#16
3015  01c2 42            	mul	x,a
3016  01c3 9f            	ld	a,xl
3017  01c4 a410          	and	a,#16
3018  01c6 6b01          	ld	(OFST+0,sp),a
3020  01c8 b602          	ld	a,_top_1
3021  01ca 48            	sll	a
3022  01cb a40c          	and	a,#12
3023  01cd 1a01          	or	a,(OFST+0,sp)
3024  01cf 43            	cpl	a
3025  01d0 c4500f        	and	a,_PD_ODR
3026  01d3 c7500f        	ld	_PD_ODR,a
3027                     ; 110             mpx_nr = 7;
3029  01d6 35070006      	mov	_mpx_nr,#7
3030                     ; 111             break;
3032  01da 205a          	jra	L1471
3033  01dc               L1271:
3034                     ; 112         case 7: // output CA3 TOP display
3034                     ; 113             set_hc164(0x40);
3036  01dc a640          	ld	a,#64
3037  01de cd0000        	call	_set_hc164
3039                     ; 114             PC_ODR &= ~(top_10 & PORTC_LEDS); // Update PC7..PC3
3041  01e1 b603          	ld	a,_top_10
3042  01e3 a4f8          	and	a,#248
3043  01e5 43            	cpl	a
3044  01e6 c4500a        	and	a,_PC_ODR
3045  01e9 c7500a        	ld	_PC_ODR,a
3046                     ; 115             PD_ODR &= ~PD_LEDS(top_10);       // Update PD4..PD2
3048  01ec b603          	ld	a,_top_10
3049  01ee 97            	ld	xl,a
3050  01ef a610          	ld	a,#16
3051  01f1 42            	mul	x,a
3052  01f2 9f            	ld	a,xl
3053  01f3 a410          	and	a,#16
3054  01f5 6b01          	ld	(OFST+0,sp),a
3056  01f7 b603          	ld	a,_top_10
3057  01f9 48            	sll	a
3058  01fa a40c          	and	a,#12
3059  01fc 1a01          	or	a,(OFST+0,sp)
3060  01fe 43            	cpl	a
3061  01ff c4500f        	and	a,_PD_ODR
3062  0202 c7500f        	ld	_PD_ODR,a
3063                     ; 116             mpx_nr = 8;
3065  0205 35080006      	mov	_mpx_nr,#8
3066                     ; 117             break;
3068  0209 202b          	jra	L1471
3069  020b               L3271:
3070                     ; 118         case 8: // outputs CA4 TOP display (MSB)
3070                     ; 119             set_hc164(0x80);
3072  020b a680          	ld	a,#128
3073  020d cd0000        	call	_set_hc164
3075                     ; 120             PC_ODR &= ~(top_100 & PORTC_LEDS); // Update PC7..PC3
3077  0210 b604          	ld	a,_top_100
3078  0212 a4f8          	and	a,#248
3079  0214 43            	cpl	a
3080  0215 c4500a        	and	a,_PC_ODR
3081  0218 c7500a        	ld	_PC_ODR,a
3082                     ; 121             PD_ODR &= ~PD_LEDS(top_100);       // Update PD4..PD2
3084  021b b604          	ld	a,_top_100
3085  021d 97            	ld	xl,a
3086  021e a610          	ld	a,#16
3087  0220 42            	mul	x,a
3088  0221 9f            	ld	a,xl
3089  0222 a410          	and	a,#16
3090  0224 6b01          	ld	(OFST+0,sp),a
3092  0226 b604          	ld	a,_top_100
3093  0228 48            	sll	a
3094  0229 a40c          	and	a,#12
3095  022b 1a01          	or	a,(OFST+0,sp)
3096  022d 43            	cpl	a
3097  022e c4500f        	and	a,_PD_ODR
3098  0231 c7500f        	ld	_PD_ODR,a
3099  0234               L5271:
3100                     ; 122         default: // FALL-THROUGH (less code-size)
3100                     ; 123             mpx_nr = 0;
3102  0234 3f06          	clr	_mpx_nr
3103                     ; 124             break;
3105  0236               L1471:
3106                     ; 126 } // multiplexer()
3109  0236 84            	pop	a
3110  0237 81            	ret
3143                     ; 135 @interrupt void TIM2_UPD_OVF_IRQHandler(void)
3143                     ; 136 {
3144                     	switch	.text
3145  0238               _TIM2_UPD_OVF_IRQHandler:
3147  0238 8a            	push	cc
3148  0239 84            	pop	a
3149  023a a4bf          	and	a,#191
3150  023c 88            	push	a
3151  023d 86            	pop	cc
3152  023e 3b0002        	push	c_x+2
3153  0241 be00          	ldw	x,c_x
3154  0243 89            	pushw	x
3155  0244 3b0002        	push	c_y+2
3156  0247 be00          	ldw	x,c_y
3157  0249 89            	pushw	x
3160                     ; 137     scheduler_isr();  // Run scheduler interrupt function
3162  024a cd0000        	call	_scheduler_isr
3164                     ; 138     if (!pwr_on)
3166                     	btst	_pwr_on
3167  0252 2514          	jrult	L3571
3168                     ; 140 	led_10     = LED_O;
3170  0254 35e70000      	mov	_led_10,#231
3171                     ; 141 	led_1      = led_01 = LED_F;
3173  0258 35740000      	mov	_led_01,#116
3174  025c 450000        	mov	_led_1,_led_01
3175                     ; 142         led_e      = LED_OFF;
3177  025f 3f00          	clr	_led_e
3178                     ; 143         pwr_on_tmr = 2000; // 2 seconds
3180  0261 ae07d0        	ldw	x,#2000
3181  0264 bf07          	ldw	_pwr_on_tmr,x
3183  0266 2019          	jra	L5571
3184  0268               L3571:
3185                     ; 145     else if (pwr_on_tmr > 0)
3187  0268 9c            	rvf
3188  0269 be07          	ldw	x,_pwr_on_tmr
3189  026b 2d14          	jrsle	L5571
3190                     ; 147         pwr_on_tmr--;
3192  026d be07          	ldw	x,_pwr_on_tmr
3193  026f 1d0001        	subw	x,#1
3194  0272 bf07          	ldw	_pwr_on_tmr,x
3195                     ; 148         led_10 = led_1 = led_01 = led_e = LED_ON;
3197  0274 35ff0000      	mov	_led_e,#255
3198  0278 450000        	mov	_led_01,_led_e
3199  027b 450000        	mov	_led_1,_led_01
3200  027e 450000        	mov	_led_10,_led_1
3201  0281               L5571:
3202                     ; 150     multiplexer();    // Run multiplexer for Display and Keys
3204  0281 cd0044        	call	_multiplexer
3206                     ; 151     TIM2_SR1 &= ~TIM2_SR1_UIF; // Reset interrupt (UIF bit) so it will not fire again straight away.
3208  0284 72115302      	bres	_TIM2_SR1,#0
3209                     ; 152 } // TIM2_UPD_OVF_IRQHandler()
3212  0288 85            	popw	x
3213  0289 bf00          	ldw	c_y,x
3214  028b 320002        	pop	c_y+2
3215  028e 85            	popw	x
3216  028f bf00          	ldw	c_x,x
3217  0291 320002        	pop	c_x+2
3218  0294 80            	iret
3246                     ; 160 void setup_timer2(void)
3246                     ; 161 {
3247                     	switch	.text
3248  0295               _setup_timer2:
3252                     ; 162     TIM2_PSCR = 0x04;  //  Prescaler = 16
3254  0295 3504530c      	mov	_TIM2_PSCR,#4
3255                     ; 163     TIM2_ARRH = 0x03;  //  High byte of 1000
3257  0299 3503530d      	mov	_TIM2_ARRH,#3
3258                     ; 164     TIM2_ARRL = 0xE8;  //  Low  byte of 1000
3260  029d 35e8530e      	mov	_TIM2_ARRL,#232
3261                     ; 165     TIM2_IER  = TIM2_IER_UIE; //  Enable the update interrupts, disable all others
3263  02a1 35015301      	mov	_TIM2_IER,#1
3264                     ; 166     TIM2_CR1  = TIM2_CR1_CEN; //  Finally enable the timer
3266  02a5 35015300      	mov	_TIM2_CR1,#1
3267                     ; 167 } // setup_timer2()
3270  02a9 81            	ret
3305                     ; 175 void setup_gpio_ports(void)
3305                     ; 176 {
3306                     	switch	.text
3307  02aa               _setup_gpio_ports:
3311                     ; 177     PA_ODR      = 0x00; // Turn off all pins from Port A
3313  02aa 725f5000      	clr	_PA_ODR
3314                     ; 178     PA_DDR     |= (LEDS | CLOCK | SDIN); // Set as output
3316  02ae c65002        	ld	a,_PA_DDR
3317  02b1 aa0e          	or	a,#14
3318  02b3 c75002        	ld	_PA_DDR,a
3319                     ; 179     PA_CR1     |= (LEDS | CLOCK | SDIN); // Set to Push-Pull
3321  02b6 c65003        	ld	a,_PA_CR1
3322  02b9 aa0e          	or	a,#14
3323  02bb c75003        	ld	_PA_CR1,a
3324                     ; 181     PB_ODR     &= ~KEYS;  // Turn off all pins from Port B
3326  02be 721b5005      	bres	_PB_ODR,#5
3327                     ; 182     PB_DDR     &= ~KEYS;  // Set PB5 as input
3329  02c2 721b5007      	bres	_PB_DDR,#5
3330                     ; 183     PB_CR1     &= ~KEYS;  // Set PB5 to Floating-Input
3332  02c6 721b5008      	bres	_PB_CR1,#5
3333                     ; 185     PC_ODR     &= ~PORTC_LEDS; // Turn off all pins from Port C
3335  02ca c6500a        	ld	a,_PC_ODR
3336  02cd a407          	and	a,#7
3337  02cf c7500a        	ld	_PC_ODR,a
3338                     ; 186     PC_DDR     |= PORTC_LEDS;  // Set PC7..PC3 as outputs
3340  02d2 c6500c        	ld	a,_PC_DDR
3341  02d5 aaf8          	or	a,#248
3342  02d7 c7500c        	ld	_PC_DDR,a
3343                     ; 187     PC_CR1     |= PORTC_LEDS;  // Set PC7..PC3 to Push-Pull
3345  02da c6500d        	ld	a,_PC_CR1
3346  02dd aaf8          	or	a,#248
3347  02df c7500d        	ld	_PC_CR1,a
3348                     ; 189     PD_ODR     &= ~PORTD_LEDS; // Turn off all pins from Port D
3350  02e2 c6500f        	ld	a,_PD_ODR
3351  02e5 a4e3          	and	a,#227
3352  02e7 c7500f        	ld	_PD_ODR,a
3353                     ; 190     PD_DDR     |= PORTD_LEDS;  // Set PD4..PD2 as outputs
3355  02ea c65011        	ld	a,_PD_DDR
3356  02ed aa1c          	or	a,#28
3357  02ef c75011        	ld	_PD_DDR,a
3358                     ; 191     PD_CR1     |= PORTD_LEDS;  // Set PD4..PD2 to Push-Pull
3360  02f2 c65012        	ld	a,_PD_CR1
3361  02f5 aa1c          	or	a,#28
3362  02f7 c75012        	ld	_PD_CR1,a
3363                     ; 192 } // setup_gpio_ports()
3366  02fa 81            	ret
3391                     ; 200 void std_task(void)
3391                     ; 201 {
3392                     	switch	.text
3393  02fb               _std_task:
3397                     ; 202     read_buttons(); // reads the buttons keys, result is stored in _buttons
3399  02fb cd0000        	call	_read_buttons
3401                     ; 203     menu_fsm();     // Finite State Machine menu
3403  02fe cd0000        	call	_menu_fsm
3405                     ; 205 } // std_task()
3408  0301 81            	ret
3438                     ; 213 void initialise_system_clock(void)
3438                     ; 214 {
3439                     	switch	.text
3440  0302               _initialise_system_clock:
3444                     ; 215 	CLK_ICKCR  = 0;                //  Reset the Internal Clock Register.
3446  0302 725f50c0      	clr	_CLK_ICKCR
3447                     ; 216     CLK_ICKCR |= CLK_ICKCR_HSIEN;  //  Enable the HSI.
3449  0306 721050c0      	bset	_CLK_ICKCR,#0
3451  030a               L3202:
3452                     ; 217     while ((CLK_ICKCR & CLK_ICKCR_HSIRDY) == 0); //  Wait for the HSI to be ready for use.
3454  030a c650c0        	ld	a,_CLK_ICKCR
3455  030d a502          	bcp	a,#2
3456  030f 27f9          	jreq	L3202
3457                     ; 218     CLK_CKDIVR     = 0;            //  Ensure the clocks are running at full speed.
3459  0311 725f50c6      	clr	_CLK_CKDIVR
3460                     ; 222     ADC_CR1     &= ~ADC_CR1_SPSEL_MSK;
3462  0315 c65401        	ld	a,_ADC_CR1
3463  0318 a48f          	and	a,#143
3464  031a c75401        	ld	_ADC_CR1,a
3465                     ; 223     ADC_CR1     |= 0x20;          //  Set prescaler (SPSEL bits) to 4, fADC = 4 MHz
3467  031d 721a5401      	bset	_ADC_CR1,#5
3468                     ; 224     CLK_SWIMCCR  = 0x00;          //  Set SWIM to run at clock / 2.
3470  0321 725f50cd      	clr	_CLK_SWIMCCR
3471                     ; 225     CLK_SWR      = 0xE1;          //  Use HSI as the clock source.
3473  0325 35e150c4      	mov	_CLK_SWR,#225
3474                     ; 226     CLK_SWCR     = 0x00;          //  Reset the clock switch control register.
3476  0329 725f50c5      	clr	_CLK_SWCR
3477                     ; 227     CLK_SWCR    |= CLK_SWCR_SWEN; //  Enable switching.
3479  032d 721250c5      	bset	_CLK_SWCR,#1
3481  0331               L1302:
3482                     ; 228     while ((CLK_SWCR & CLK_SWCR_SWBSY) != 0);  //  Pause while the clock switch is busy.
3484  0331 c650c5        	ld	a,_CLK_SWCR
3485  0334 a501          	bcp	a,#1
3486  0336 26f9          	jrne	L1302
3487                     ; 229 } // initialise_system_clock()
3490  0338 81            	ret
3535                     ; 238 int main(void)
3535                     ; 239 {
3536                     	switch	.text
3537  0339               _main:
3539  0339 89            	pushw	x
3540       00000002      OFST:	set	2
3543                     ; 241 	int ee = eedata[0]; // This is to prevent the linker from removing .eeprom section
3545  033a ce0000        	ldw	x,_eedata
3546  033d 1f01          	ldw	(OFST-1,sp),x
3548                     ; 243 	disable_interrupts();
3551  033f 9b            sim
3553                     ; 244 	initialise_system_clock();
3556  0340 adc0          	call	_initialise_system_clock
3558                     ; 245 	setup_gpio_ports();
3560  0342 cd02aa        	call	_setup_gpio_ports
3562                     ; 246 	setup_timer2();
3564  0345 cd0295        	call	_setup_timer2
3566                     ; 249     add_task(std_task ,"STD", 50,  100); // every 100 msec.
3568  0348 ae0064        	ldw	x,#100
3569  034b 89            	pushw	x
3570  034c ae0032        	ldw	x,#50
3571  034f 89            	pushw	x
3572  0350 ae0000        	ldw	x,#L3502
3573  0353 89            	pushw	x
3574  0354 ae02fb        	ldw	x,#_std_task
3575  0357 cd0000        	call	_add_task
3577  035a 5b06          	addw	sp,#6
3578                     ; 250 	enable_interrupts();
3581  035c 9a            rim
3583  035d               L5502:
3584                     ; 254         dispatch_tasks();     // Run task-scheduler()
3586  035d cd0000        	call	_dispatch_tasks
3588                     ; 255         wait_for_interrupt(); // do nothing
3591  0360 8f            wfi
3595  0361 20fa          	jra	L5502
3728                     	xdef	_main
3729                     	xdef	_std_task
3730                     	xdef	_TIM2_UPD_OVF_IRQHandler
3731                     	xbit	_pwr_on
3732                     	xref.b	_led_01
3733                     	xref.b	_led_1
3734                     	xref.b	_led_10
3735                     	xref.b	_led_e
3736                     	xref	_eedata
3737                     	switch	.ubsct
3738  0000               _hc164_val:
3739  0000 00            	ds.b	1
3740                     	xdef	_hc164_val
3741  0001               _top_01:
3742  0001 00            	ds.b	1
3743                     	xdef	_top_01
3744  0002               _top_1:
3745  0002 00            	ds.b	1
3746                     	xdef	_top_1
3747  0003               _top_10:
3748  0003 00            	ds.b	1
3749                     	xdef	_top_10
3750  0004               _top_100:
3751  0004 00            	ds.b	1
3752                     	xdef	_top_100
3753                     	xdef	_pwr_on_tmr
3754                     	xdef	_mpx_nr
3755  0005               _temp_ntc2:
3756  0005 0000          	ds.b	2
3757                     	xdef	_temp_ntc2
3758  0007               _temp_ntc1:
3759  0007 0000          	ds.b	2
3760                     	xdef	_temp_ntc1
3761  0009               _leds_out:
3762  0009 00            	ds.b	1
3763                     	xdef	_leds_out
3764                     	xdef	_probe2
3765                     	xdef	_irq_cnt
3766                     	xdef	_delay_val
3767                     	xref	_add_task
3768                     	xref	_dispatch_tasks
3769                     	xref	_scheduler_isr
3770                     	xref	_menu_fsm
3771                     	xref	_read_buttons
3772                     	xdef	_setup_gpio_ports
3773                     	xdef	_initialise_system_clock
3774                     	xdef	_setup_timer2
3775                     	xdef	_multiplexer
3776                     	xdef	_set_hc164
3777                     .const:	section	.text
3778  0000               L3502:
3779  0000 53544400      	dc.b	"STD",0
3780                     	xref.b	c_x
3781                     	xref.b	c_y
3801                     	end
