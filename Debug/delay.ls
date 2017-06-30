   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2523                     	bsct
2524  0000               _t2_millis:
2525  0000 00000000      	dc.l	0
2568                     ; 13 uint32_t millis(void)
2568                     ; 14 {
2570                     	switch	.text
2571  0000               _millis:
2573  0000 5204          	subw	sp,#4
2574       00000004      OFST:	set	4
2577                     ; 18 	disable_interrupts();
2580  0002 9b            sim
2582                     ; 19 	m = t2_millis;
2585  0003 be02          	ldw	x,_t2_millis+2
2586  0005 1f03          	ldw	(OFST-1,sp),x
2587  0007 be00          	ldw	x,_t2_millis
2588  0009 1f01          	ldw	(OFST-3,sp),x
2590                     ; 20 	enable_interrupts();
2593  000b 9a            rim
2595                     ; 21 	return m;
2598  000c 96            	ldw	x,sp
2599  000d 1c0001        	addw	x,#OFST-3
2600  0010 cd0000        	call	c_ltor
2604  0013 5b04          	addw	sp,#4
2605  0015 81            	ret
2667                     ; 32 void delay_msec(uint16_t ms)
2667                     ; 33 {
2668                     	switch	.text
2669  0016               _delay_msec:
2671  0016 89            	pushw	x
2672  0017 520d          	subw	sp,#13
2673       0000000d      OFST:	set	13
2676                     ; 36 	uint32_t start = millis();
2678  0019 ade5          	call	_millis
2680  001b 96            	ldw	x,sp
2681  001c 1c000a        	addw	x,#OFST-3
2682  001f cd0000        	call	c_rtol
2685  0022               L1071:
2686                     ; 40         for (i = 0; i < 100; i++) ;
2688  0022 0f09          	clr	(OFST-4,sp)
2690  0024               L7071:
2694  0024 0c09          	inc	(OFST-4,sp)
2698  0026 7b09          	ld	a,(OFST-4,sp)
2699  0028 a164          	cp	a,#100
2700  002a 25f8          	jrult	L7071
2701                     ; 41         tmr = millis();
2703  002c add2          	call	_millis
2705  002e 96            	ldw	x,sp
2706  002f 1c0005        	addw	x,#OFST-8
2707  0032 cd0000        	call	c_rtol
2710                     ; 42 		if (tmr < start)
2712  0035 96            	ldw	x,sp
2713  0036 1c0005        	addw	x,#OFST-8
2714  0039 cd0000        	call	c_ltor
2716  003c 96            	ldw	x,sp
2717  003d 1c000a        	addw	x,#OFST-3
2718  0040 cd0000        	call	c_lcmp
2720  0043 2421          	jruge	L3071
2721                     ; 44            start = 0xffffffff - start;
2723  0045 aeffff        	ldw	x,#65535
2724  0048 bf02          	ldw	c_lreg+2,x
2725  004a aeffff        	ldw	x,#-1
2726  004d bf00          	ldw	c_lreg,x
2727  004f 96            	ldw	x,sp
2728  0050 1c000a        	addw	x,#OFST-3
2729  0053 cd0000        	call	c_lsub
2731  0056 96            	ldw	x,sp
2732  0057 1c000a        	addw	x,#OFST-3
2733  005a cd0000        	call	c_rtol
2736                     ; 45            start++;
2738  005d 96            	ldw	x,sp
2739  005e 1c000a        	addw	x,#OFST-3
2740  0061 a601          	ld	a,#1
2741  0063 cd0000        	call	c_lgadc
2744  0066               L3071:
2745                     ; 47 	} while ((tmr - start) < ms);
2747  0066 96            	ldw	x,sp
2748  0067 1c0005        	addw	x,#OFST-8
2749  006a cd0000        	call	c_ltor
2751  006d 96            	ldw	x,sp
2752  006e 1c000a        	addw	x,#OFST-3
2753  0071 cd0000        	call	c_lsub
2755  0074 96            	ldw	x,sp
2756  0075 1c0001        	addw	x,#OFST-12
2757  0078 cd0000        	call	c_rtol
2760  007b 1e0e          	ldw	x,(OFST+1,sp)
2761  007d cd0000        	call	c_uitolx
2763  0080 96            	ldw	x,sp
2764  0081 1c0001        	addw	x,#OFST-12
2765  0084 cd0000        	call	c_lcmp
2767  0087 2299          	jrugt	L1071
2768                     ; 48 } // delay_msec()
2771  0089 5b0f          	addw	sp,#15
2772  008b 81            	ret
2828                     ; 55 uint16_t tmr2_val(void)
2828                     ; 56 {
2829                     	switch	.text
2830  008c               _tmr2_val:
2832  008c 5204          	subw	sp,#4
2833       00000004      OFST:	set	4
2836                     ; 60 	disable_interrupts();
2839  008e 9b            sim
2841                     ; 61 	h = TIM2_CNTRH;
2844  008f c6530a        	ld	a,_TIM2_CNTRH
2845  0092 6b01          	ld	(OFST-3,sp),a
2847                     ; 62 	l = TIM2_CNTRL;
2849  0094 c6530b        	ld	a,_TIM2_CNTRL
2850  0097 6b02          	ld	(OFST-2,sp),a
2852                     ; 63 	enable_interrupts();
2855  0099 9a            rim
2857                     ; 64 	tmr   = h;
2860  009a 7b01          	ld	a,(OFST-3,sp)
2861  009c 5f            	clrw	x
2862  009d 97            	ld	xl,a
2863  009e 1f03          	ldw	(OFST-1,sp),x
2865                     ; 65 	tmr <<= 8;
2867  00a0 7b04          	ld	a,(OFST+0,sp)
2868  00a2 6b03          	ld	(OFST-1,sp),a
2869  00a4 0f04          	clr	(OFST+0,sp)
2871                     ; 66 	tmr  |= l;	
2873  00a6 7b02          	ld	a,(OFST-2,sp)
2874  00a8 5f            	clrw	x
2875  00a9 97            	ld	xl,a
2876  00aa 01            	rrwa	x,a
2877  00ab 1a04          	or	a,(OFST+0,sp)
2878  00ad 01            	rrwa	x,a
2879  00ae 1a03          	or	a,(OFST-1,sp)
2880  00b0 01            	rrwa	x,a
2881  00b1 1f03          	ldw	(OFST-1,sp),x
2883                     ; 67 	return tmr;
2885  00b3 1e03          	ldw	x,(OFST-1,sp)
2888  00b5 5b04          	addw	sp,#4
2889  00b7 81            	ret
2942                     ; 77 void delay_usec(uint16_t us)
2942                     ; 78 {
2943                     	switch	.text
2944  00b8               _delay_usec:
2946  00b8 89            	pushw	x
2947  00b9 5204          	subw	sp,#4
2948       00000004      OFST:	set	4
2951                     ; 80 	uint16_t start = tmr2_val();
2953  00bb adcf          	call	_tmr2_val
2955  00bd 1f03          	ldw	(OFST-1,sp),x
2957  00bf               L3771:
2958                     ; 83 		tmr = tmr2_val();
2960  00bf adcb          	call	_tmr2_val
2962  00c1 1f01          	ldw	(OFST-3,sp),x
2964                     ; 84 		if (tmr < start) start = 1001 - start;
2966  00c3 1e01          	ldw	x,(OFST-3,sp)
2967  00c5 1303          	cpw	x,(OFST-1,sp)
2968  00c7 2408          	jruge	L5771
2971  00c9 ae03e9        	ldw	x,#1001
2972  00cc 72f003        	subw	x,(OFST-1,sp)
2973  00cf 1f03          	ldw	(OFST-1,sp),x
2975  00d1               L5771:
2976                     ; 85     } while ((tmr - start) < us);
2978  00d1 1e01          	ldw	x,(OFST-3,sp)
2979  00d3 72f003        	subw	x,(OFST-1,sp)
2980  00d6 1305          	cpw	x,(OFST+1,sp)
2981  00d8 25e5          	jrult	L3771
2982                     ; 86 } // delay_usec()
2985  00da 5b06          	addw	sp,#6
2986  00dc 81            	ret
3010                     	xdef	_tmr2_val
3011                     	xdef	_t2_millis
3012                     	xdef	_delay_usec
3013                     	xdef	_delay_msec
3014                     	xdef	_millis
3015                     	xref.b	c_lreg
3034                     	xref	c_uitolx
3035                     	xref	c_lgadc
3036                     	xref	c_lsub
3037                     	xref	c_lcmp
3038                     	xref	c_rtol
3039                     	xref	c_ltor
3040                     	end
