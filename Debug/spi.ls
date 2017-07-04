   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2553                     ; 32 @interrupt void SPI_Handler(void)
2553                     ; 33 {   // Useful for debugging purposes
2555                     	switch	.text
2556  0000               _SPI_Handler:
2560                     ; 34     spi_error = SPI_DR;
2562  0000 5552040000    	mov	_spi_error,_SPI_DR
2563                     ; 35     spi_error = SPI_SR; // This clears the OVR bit
2565  0005 5552030000    	mov	_spi_error,_SPI_SR
2566                     ; 36 } // I2C_IRQHandler()
2569  000a 80            	iret
2595                     ; 43 void spi_init(void)
2595                     ; 44 {
2596                     	switch	.text
2597  000b               _spi_init:
2601                     ; 45 	SPI_CR1   &= ~SPI_CR1_SPE; // Disable SPI
2603  000b 721d5200      	bres	_SPI_CR1,#6
2604                     ; 46     SPI_CR1    = 0x0C;         // MSB first, disable SPI, 4 MHz clock, Master mode, SPI mode 0
2606  000f 350c5200      	mov	_SPI_CR1,#12
2607                     ; 47 	SPI_CR2    = 0x03;         // Select SW Slave Management and Master mode
2609  0013 35035201      	mov	_SPI_CR2,#3
2610                     ; 48 	SPI_ICR    = 0x00;         // Disable SPI interrupt on error
2612  0017 725f5202      	clr	_SPI_ICR
2613                     ; 50 } // spi_init()
2616  001b 81            	ret
2653                     ; 57 void spi_write(uint8_t data)
2653                     ; 58 {
2654                     	switch	.text
2655  001c               _spi_write:
2657  001c 88            	push	a
2658       00000000      OFST:	set	0
2661  001d 2006          	jra	L1761
2662  001f               L7661:
2663                     ; 59 	while (!(SPI_SR & SPI_SR_TXE)) delay_usec(5); // wait until TX Register is empty
2665  001f ae0005        	ldw	x,#5
2666  0022 cd0000        	call	_delay_usec
2668  0025               L1761:
2671  0025 c65203        	ld	a,_SPI_SR
2672  0028 a502          	bcp	a,#2
2673  002a 27f3          	jreq	L7661
2674                     ; 60 	SPI_DR = data; // send byte over SPI bus
2676  002c 7b01          	ld	a,(OFST+1,sp)
2677  002e c75204        	ld	_SPI_DR,a
2679  0031 2006          	jra	L1071
2680  0033               L5761:
2681                     ; 61 	while (!(SPI_SR & SPI_SR_TXE)) delay_usec(5); // wait until TX Register is empty
2683  0033 ae0005        	ldw	x,#5
2684  0036 cd0000        	call	_delay_usec
2686  0039               L1071:
2689  0039 c65203        	ld	a,_SPI_SR
2690  003c a502          	bcp	a,#2
2691  003e 27f3          	jreq	L5761
2693  0040 2006          	jra	L7071
2694  0042               L5071:
2695                     ; 62 	while (SPI_SR & SPI_SR_BSY)    delay_usec(5); // wait until SPI is not busy anymore
2697  0042 ae0005        	ldw	x,#5
2698  0045 cd0000        	call	_delay_usec
2700  0048               L7071:
2703  0048 c65203        	ld	a,_SPI_SR
2704  004b a580          	bcp	a,#128
2705  004d 26f3          	jrne	L5071
2706                     ; 63 } // spi_write()
2709  004f 84            	pop	a
2710  0050 81            	ret
2756                     ; 70 uint8_t spi_read(void)
2756                     ; 71 {   
2757                     	switch	.text
2758  0051               _spi_read:
2760  0051 89            	pushw	x
2761       00000002      OFST:	set	2
2764  0052 2006          	jra	L7371
2765  0054               L5371:
2766                     ; 74 	while (!(SPI_SR & SPI_SR_RXNE)) delay_usec(5); // wait until RX Register is full
2768  0054 ae0005        	ldw	x,#5
2769  0057 cd0000        	call	_delay_usec
2771  005a               L7371:
2774  005a c65203        	ld	a,_SPI_SR
2775  005d a501          	bcp	a,#1
2776  005f 27f3          	jreq	L5371
2777                     ; 75     reg = SPI_DR;
2779  0061 c65204        	ld	a,_SPI_DR
2780  0064 6b02          	ld	(OFST+0,sp),a
2782                     ; 76     x1  = SPI_SR; // clear possible OVR flag
2784  0066 c65203        	ld	a,_SPI_SR
2785                     ; 77     return reg;
2787  0069 7b02          	ld	a,(OFST+0,sp)
2790  006b 85            	popw	x
2791  006c 81            	ret
2857                     ; 86 int16_t max31855_read(uint8_t *err)
2857                     ; 87 {
2858                     	switch	.text
2859  006d               _max31855_read:
2861  006d 89            	pushw	x
2862  006e 5208          	subw	sp,#8
2863       00000008      OFST:	set	8
2866                     ; 88     uint32_t d = 0;
2868                     ; 91     CS_TC_0;         // Set chip-select for MAX31855 active
2870  0070 721f5005      	bres	_PB_ODR,#7
2871                     ; 92     delay_usec(1);   // at least 100 nsec. delay
2873  0074 ae0001        	ldw	x,#1
2874  0077 cd0000        	call	_delay_usec
2876                     ; 93     spi_write(0xFF);
2878  007a a6ff          	ld	a,#255
2879  007c ad9e          	call	_spi_write
2881                     ; 94     d = spi_read();  // Read byte 1
2883  007e add1          	call	_spi_read
2885  0080 6b08          	ld	(OFST+0,sp),a
2886  0082 4f            	clr	a
2887  0083 6b07          	ld	(OFST-1,sp),a
2888  0085 6b06          	ld	(OFST-2,sp),a
2889  0087 6b05          	ld	(OFST-3,sp),a
2891                     ; 95     d <<= 8;
2893  0089 96            	ldw	x,sp
2894  008a 1c0005        	addw	x,#OFST-3
2895  008d a608          	ld	a,#8
2896  008f cd0000        	call	c_lglsh
2899                     ; 96     spi_write(0xFF);
2901  0092 a6ff          	ld	a,#255
2902  0094 ad86          	call	_spi_write
2904                     ; 97     d |= spi_read(); // Read byte 2
2906  0096 adb9          	call	_spi_read
2908  0098 b703          	ld	c_lreg+3,a
2909  009a 3f02          	clr	c_lreg+2
2910  009c 3f01          	clr	c_lreg+1
2911  009e 3f00          	clr	c_lreg
2912  00a0 96            	ldw	x,sp
2913  00a1 1c0005        	addw	x,#OFST-3
2914  00a4 cd0000        	call	c_lgor
2917                     ; 98     d <<= 8;
2919  00a7 96            	ldw	x,sp
2920  00a8 1c0005        	addw	x,#OFST-3
2921  00ab a608          	ld	a,#8
2922  00ad cd0000        	call	c_lglsh
2925                     ; 99     spi_write(0xFF); 
2927  00b0 a6ff          	ld	a,#255
2928  00b2 cd001c        	call	_spi_write
2930                     ; 100     d |= spi_read(); // Read byte 3
2932  00b5 ad9a          	call	_spi_read
2934  00b7 b703          	ld	c_lreg+3,a
2935  00b9 3f02          	clr	c_lreg+2
2936  00bb 3f01          	clr	c_lreg+1
2937  00bd 3f00          	clr	c_lreg
2938  00bf 96            	ldw	x,sp
2939  00c0 1c0005        	addw	x,#OFST-3
2940  00c3 cd0000        	call	c_lgor
2943                     ; 101     d <<= 8;
2945  00c6 96            	ldw	x,sp
2946  00c7 1c0005        	addw	x,#OFST-3
2947  00ca a608          	ld	a,#8
2948  00cc cd0000        	call	c_lglsh
2951                     ; 102     spi_write(0xFF); 
2953  00cf a6ff          	ld	a,#255
2954  00d1 cd001c        	call	_spi_write
2956                     ; 103     d |= spi_read(); // Read byte 4
2958  00d4 cd0051        	call	_spi_read
2960  00d7 b703          	ld	c_lreg+3,a
2961  00d9 3f02          	clr	c_lreg+2
2962  00db 3f01          	clr	c_lreg+1
2963  00dd 3f00          	clr	c_lreg
2964  00df 96            	ldw	x,sp
2965  00e0 1c0005        	addw	x,#OFST-3
2966  00e3 cd0000        	call	c_lgor
2969                     ; 104     CS_TC_1;         // Set chip-select for MAX31855 inactive again
2971  00e6 721e5005      	bset	_PB_ODR,#7
2972                     ; 106     *err = (d & 0x07); // Contains error bits
2974  00ea 7b08          	ld	a,(OFST+0,sp)
2975  00ec a407          	and	a,#7
2976  00ee 1e09          	ldw	x,(OFST+1,sp)
2977  00f0 f7            	ld	(x),a
2978                     ; 107     if (d & 0x80000000) 
2980  00f1 7b05          	ld	a,(OFST-3,sp)
2981  00f3 a580          	bcp	a,#128
2982  00f5 272b          	jreq	L5771
2983                     ; 110         v = (int32_t)(0xFFFFC000 | ((d >> 18) & 0x00003FFFF));
2985  00f7 96            	ldw	x,sp
2986  00f8 1c0005        	addw	x,#OFST-3
2987  00fb cd0000        	call	c_ltor
2989  00fe a612          	ld	a,#18
2990  0100 cd0000        	call	c_lursh
2992  0103 b601          	ld	a,c_lreg+1
2993  0105 a403          	and	a,#3
2994  0107 b701          	ld	c_lreg+1,a
2995  0109 3f00          	clr	c_lreg
2996  010b b602          	ld	a,c_lreg+2
2997  010d aac0          	or	a,#192
2998  010f b702          	ld	c_lreg+2,a
2999  0111 a6ff          	ld	a,#255
3000  0113 b701          	ld	c_lreg+1,a
3001  0115 a6ff          	ld	a,#255
3002  0117 b700          	ld	c_lreg,a
3003  0119 96            	ldw	x,sp
3004  011a 1c0005        	addw	x,#OFST-3
3005  011d cd0000        	call	c_rtol
3009  0120 2013          	jra	L7771
3010  0122               L5771:
3011                     ; 115         v = (int32_t)(d >>= 18);
3013  0122 96            	ldw	x,sp
3014  0123 1c0005        	addw	x,#OFST-3
3015  0126 cd0000        	call	c_ltor
3017  0129 a612          	ld	a,#18
3018  012b cd0000        	call	c_lursh
3020  012e 96            	ldw	x,sp
3021  012f 1c0005        	addw	x,#OFST-3
3022  0132 cd0000        	call	c_rtol
3026  0135               L7771:
3027                     ; 118     v1 = ((v << 1) + (v >> 1));
3029  0135 96            	ldw	x,sp
3030  0136 1c0005        	addw	x,#OFST-3
3031  0139 cd0000        	call	c_ltor
3033  013c 3700          	sra	c_lreg
3034  013e 3601          	rrc	c_lreg+1
3035  0140 3602          	rrc	c_lreg+2
3036  0142 3603          	rrc	c_lreg+3
3037  0144 96            	ldw	x,sp
3038  0145 1c0001        	addw	x,#OFST-7
3039  0148 cd0000        	call	c_rtol
3042  014b 96            	ldw	x,sp
3043  014c 1c0005        	addw	x,#OFST-3
3044  014f cd0000        	call	c_ltor
3046  0152 3803          	sll	c_lreg+3
3047  0154 3902          	rlc	c_lreg+2
3048  0156 3901          	rlc	c_lreg+1
3049  0158 3900          	rlc	c_lreg
3050  015a 96            	ldw	x,sp
3051  015b 1c0001        	addw	x,#OFST-7
3052  015e cd0000        	call	c_ladd
3054  0161 96            	ldw	x,sp
3055  0162 1c0005        	addw	x,#OFST-3
3056  0165 cd0000        	call	c_rtol
3059                     ; 119     return (int16_t)v1;
3061  0168 1e07          	ldw	x,(OFST-1,sp)
3064  016a 5b0a          	addw	sp,#10
3065  016c 81            	ret
3091                     ; 128 void max31865_init(void)
3091                     ; 129 {
3092                     	switch	.text
3093  016d               _max31865_init:
3097                     ; 130     CS_PT100_0;                        // Set chip-select for MAX31865 active
3099  016d 721d5005      	bres	_PB_ODR,#6
3100                     ; 131     delay_usec(1);                     // at least 400 nsec. delay
3102  0171 ae0001        	ldw	x,#1
3103  0174 cd0000        	call	_delay_usec
3105                     ; 132     spi_write(MAX31856_CONFIG | 0x80); // Write to CONFIG register
3107  0177 a680          	ld	a,#128
3108  0179 cd001c        	call	_spi_write
3110                     ; 133     spi_write(0x03);                   // Bias off, auto mode off, 2-wires, clear fault, 50 Hz filter
3112  017c a603          	ld	a,#3
3113  017e cd001c        	call	_spi_write
3115                     ; 134     CS_PT100_1;                        // Disable chip-select for MAX31865
3117  0181 721c5005      	bset	_PB_ODR,#6
3118                     ; 135 } // max31865_init()
3121  0185 81            	ret
3178                     .const:	section	.text
3179  0000               L22:
3180  0000 0001ab07      	dc.l	109319
3181  0004               L42:
3182  0004 0000002a      	dc.l	42
3183                     ; 143 int16_t max31865_read(void)
3183                     ; 144 {
3184                     	switch	.text
3185  0186               _max31865_read:
3187  0186 520b          	subw	sp,#11
3188       0000000b      OFST:	set	11
3191                     ; 149     CS_PT100_0;                            // Set chip-select for MAX31865 active
3193  0188 721d5005      	bres	_PB_ODR,#6
3194                     ; 150     delay_usec(1);                         // at least 400 nsec. delay
3196  018c ae0001        	ldw	x,#1
3197  018f cd0000        	call	_delay_usec
3199                     ; 151     spi_write(MAX31856_CONFIG | 0x80);     // Write to CONFIG register
3201  0192 a680          	ld	a,#128
3202  0194 cd001c        	call	_spi_write
3204                     ; 152     spi_write(VBIAS | CLR_FLT | FIL_50HZ); // Vbias ON, clear faults, 50 Hz filter
3206  0197 a683          	ld	a,#131
3207  0199 cd001c        	call	_spi_write
3209                     ; 153     CS_PT100_1;                            // Disable chip-select for MAX31865
3211  019c 721c5005      	bset	_PB_ODR,#6
3212                     ; 154     delay_msec(10);                        // Let Vbias settle
3214  01a0 ae000a        	ldw	x,#10
3215  01a3 cd0000        	call	_delay_msec
3217                     ; 156     CS_PT100_0;                            // Set chip-select for MAX31865 active again
3219  01a6 721d5005      	bres	_PB_ODR,#6
3220                     ; 157 	spi_write(MAX31856_CONFIG | 0x80);     // Write to CONFIG register
3222  01aa a680          	ld	a,#128
3223  01ac cd001c        	call	_spi_write
3225                     ; 158     spi_write(0xFF);               
3227  01af a6ff          	ld	a,#255
3228  01b1 cd001c        	call	_spi_write
3230                     ; 159 	t = spi_read() | ONE_SHOT;         
3232  01b4 cd0051        	call	_spi_read
3234  01b7 aa20          	or	a,#32
3235  01b9 6b05          	ld	(OFST-6,sp),a
3237                     ; 160     CS_PT100_1;                            // Disable chip-select for MAX31865
3239  01bb 721c5005      	bset	_PB_ODR,#6
3240                     ; 161     delay_usec(1);                         // at least 400 nsec. delay
3242  01bf ae0001        	ldw	x,#1
3243  01c2 cd0000        	call	_delay_usec
3245                     ; 163     CS_PT100_0;                            // Set chip-select for MAX31865 active again
3247  01c5 721d5005      	bres	_PB_ODR,#6
3248                     ; 164     spi_write(MAX31856_CONFIG | 0x80);     // Write to CONFIG register
3250  01c9 a680          	ld	a,#128
3251  01cb cd001c        	call	_spi_write
3253                     ; 165     spi_write(t);                          // Set one-shot conversion
3255  01ce 7b05          	ld	a,(OFST-6,sp)
3256  01d0 cd001c        	call	_spi_write
3258                     ; 166     CS_PT100_1;                            // Disable chip-select for MAX31865
3260  01d3 721c5005      	bset	_PB_ODR,#6
3261                     ; 167     delay_msec(65);                        // Wait for conversion-end
3263  01d7 ae0041        	ldw	x,#65
3264  01da cd0000        	call	_delay_msec
3266                     ; 169     CS_PT100_0;                            // Set chip-select for MAX31865 active again
3268  01dd 721d5005      	bres	_PB_ODR,#6
3269                     ; 170     spi_write(MAX31856_RTD_MSB);           // MSB of RTD register address
3271  01e1 a601          	ld	a,#1
3272  01e3 cd001c        	call	_spi_write
3274                     ; 171 	spi_write(0xFF);
3276  01e6 a6ff          	ld	a,#255
3277  01e8 cd001c        	call	_spi_write
3279                     ; 172 	rtd = spi_read();                      // Read MSB
3281  01eb cd0051        	call	_spi_read
3283  01ee 5f            	clrw	x
3284  01ef 97            	ld	xl,a
3285  01f0 1f0a          	ldw	(OFST-1,sp),x
3287                     ; 173 	rtd <<= 8;
3289  01f2 7b0b          	ld	a,(OFST+0,sp)
3290  01f4 6b0a          	ld	(OFST-1,sp),a
3291  01f6 0f0b          	clr	(OFST+0,sp)
3293                     ; 174 	rtd |= spi_read();                     // Read LSB
3295  01f8 cd0051        	call	_spi_read
3297  01fb 5f            	clrw	x
3298  01fc 97            	ld	xl,a
3299  01fd 01            	rrwa	x,a
3300  01fe 1a0b          	or	a,(OFST+0,sp)
3301  0200 01            	rrwa	x,a
3302  0201 1a0a          	or	a,(OFST-1,sp)
3303  0203 01            	rrwa	x,a
3304  0204 1f0a          	ldw	(OFST-1,sp),x
3306                     ; 175 	rtd >>= 1;                             // remove fault bit
3308  0206 040a          	srl	(OFST-1,sp)
3309  0208 060b          	rrc	(OFST+0,sp)
3311                     ; 176     CS_PT100_1;                            // Disable chip-select for MAX31865
3313  020a 721c5005      	bset	_PB_ODR,#6
3314                     ; 177     delay_usec(1);                         // at least 400 nsec. delay
3316  020e ae0001        	ldw	x,#1
3317  0211 cd0000        	call	_delay_usec
3319                     ; 193     x = ((int32_t)rtd << 2) + rtd - 109319L;
3321  0214 1e0a          	ldw	x,(OFST-1,sp)
3322  0216 cd0000        	call	c_uitolx
3324  0219 96            	ldw	x,sp
3325  021a 1c0001        	addw	x,#OFST-10
3326  021d cd0000        	call	c_rtol
3329  0220 1e0a          	ldw	x,(OFST-1,sp)
3330  0222 a604          	ld	a,#4
3331  0224 cd0000        	call	c_cmulx
3333  0227 96            	ldw	x,sp
3334  0228 1c0001        	addw	x,#OFST-10
3335  022b cd0000        	call	c_ladd
3337  022e ae0000        	ldw	x,#L22
3338  0231 cd0000        	call	c_lsub
3340  0234 96            	ldw	x,sp
3341  0235 1c0006        	addw	x,#OFST-5
3342  0238 cd0000        	call	c_rtol
3345                     ; 194 	x /= 42;
3347  023b 96            	ldw	x,sp
3348  023c 1c0006        	addw	x,#OFST-5
3349  023f cd0000        	call	c_ltor
3351  0242 ae0004        	ldw	x,#L42
3352  0245 cd0000        	call	c_ldiv
3354  0248 96            	ldw	x,sp
3355  0249 1c0006        	addw	x,#OFST-5
3356  024c cd0000        	call	c_rtol
3359                     ; 195 	rtd = (int16_t)x;
3361  024f 1e08          	ldw	x,(OFST-3,sp)
3362  0251 1f0a          	ldw	(OFST-1,sp),x
3364                     ; 196 	return rtd;
3366  0253 1e0a          	ldw	x,(OFST-1,sp)
3369  0255 5b0b          	addw	sp,#11
3370  0257 81            	ret
3394                     	xdef	_SPI_Handler
3395                     	switch	.ubsct
3396  0000               _spi_error:
3397  0000 00            	ds.b	1
3398                     	xdef	_spi_error
3399                     	xref	_delay_usec
3400                     	xref	_delay_msec
3401                     	xdef	_max31865_read
3402                     	xdef	_max31865_init
3403                     	xdef	_max31855_read
3404                     	xdef	_spi_read
3405                     	xdef	_spi_write
3406                     	xdef	_spi_init
3407                     	xref.b	c_lreg
3408                     	xref.b	c_x
3428                     	xref	c_ldiv
3429                     	xref	c_lsub
3430                     	xref	c_uitolx
3431                     	xref	c_cmulx
3432                     	xref	c_ladd
3433                     	xref	c_rtol
3434                     	xref	c_lursh
3435                     	xref	c_ltor
3436                     	xref	c_lgor
3437                     	xref	c_lglsh
3438                     	end
