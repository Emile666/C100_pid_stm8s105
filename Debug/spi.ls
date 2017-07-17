   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2553                     ; 33 @interrupt void SPI_Handler(void)
2553                     ; 34 {   // Useful for debugging purposes
2555                     	switch	.text
2556  0000               _SPI_Handler:
2560                     ; 35     spi_error = SPI_DR;
2562  0000 5552040000    	mov	_spi_error,_SPI_DR
2563                     ; 36     spi_error = SPI_SR; // This clears the OVR bit
2565  0005 5552030000    	mov	_spi_error,_SPI_SR
2566                     ; 37 } // I2C_IRQHandler()
2569  000a 80            	iret
2595                     ; 44 void spi_init(void)
2595                     ; 45 {
2596                     	switch	.text
2597  000b               _spi_init:
2601                     ; 46 	SPI_CR1   &= ~SPI_CR1_SPE; // Disable SPI
2603  000b 721d5200      	bres	_SPI_CR1,#6
2604                     ; 47     SPI_CR1    = 0x0D;         // MSB first, disable SPI, 4 MHz clock, Master mode, SPI mode 1
2606  000f 350d5200      	mov	_SPI_CR1,#13
2607                     ; 48 	SPI_CR2    = 0x03;         // Select SW Slave Management and Master mode
2609  0013 35035201      	mov	_SPI_CR2,#3
2610                     ; 49 	SPI_ICR    = 0x00;         // Disable SPI interrupt on error
2612  0017 725f5202      	clr	_SPI_ICR
2613                     ; 50     SPI_CR1   |=  SPI_CR1_SPE; // Enable SPI
2615  001b 721c5200      	bset	_SPI_CR1,#6
2616                     ; 52 } // spi_init()
2619  001f 81            	ret
2656                     ; 59 void spi_write(uint8_t data)
2656                     ; 60 {
2657                     	switch	.text
2658  0020               _spi_write:
2660  0020 88            	push	a
2661       00000000      OFST:	set	0
2664  0021 2006          	jra	L1761
2665  0023               L7661:
2666                     ; 61 	while (!(SPI_SR & SPI_SR_TXE)) delay_usec(5); // wait until TX Register is empty
2668  0023 ae0005        	ldw	x,#5
2669  0026 cd0000        	call	_delay_usec
2671  0029               L1761:
2674  0029 c65203        	ld	a,_SPI_SR
2675  002c a502          	bcp	a,#2
2676  002e 27f3          	jreq	L7661
2677                     ; 62 	SPI_DR = data; // send byte over SPI bus
2679  0030 7b01          	ld	a,(OFST+1,sp)
2680  0032 c75204        	ld	_SPI_DR,a
2682  0035 2006          	jra	L1071
2683  0037               L5761:
2684                     ; 63 	while (!(SPI_SR & SPI_SR_TXE)) delay_usec(5); // wait until TX Register is empty
2686  0037 ae0005        	ldw	x,#5
2687  003a cd0000        	call	_delay_usec
2689  003d               L1071:
2692  003d c65203        	ld	a,_SPI_SR
2693  0040 a502          	bcp	a,#2
2694  0042 27f3          	jreq	L5761
2696  0044 2006          	jra	L7071
2697  0046               L5071:
2698                     ; 64 	while (SPI_SR & SPI_SR_BSY)    delay_usec(5); // wait until SPI is not busy anymore
2700  0046 ae0005        	ldw	x,#5
2701  0049 cd0000        	call	_delay_usec
2703  004c               L7071:
2706  004c c65203        	ld	a,_SPI_SR
2707  004f a580          	bcp	a,#128
2708  0051 26f3          	jrne	L5071
2709                     ; 65 } // spi_write()
2712  0053 84            	pop	a
2713  0054 81            	ret
2759                     ; 72 uint8_t spi_read(void)
2759                     ; 73 {   
2760                     	switch	.text
2761  0055               _spi_read:
2763  0055 89            	pushw	x
2764       00000002      OFST:	set	2
2767  0056 2006          	jra	L7371
2768  0058               L5371:
2769                     ; 76 	while (!(SPI_SR & SPI_SR_RXNE)) delay_usec(5); // wait until RX Register is full
2771  0058 ae0005        	ldw	x,#5
2772  005b cd0000        	call	_delay_usec
2774  005e               L7371:
2777  005e c65203        	ld	a,_SPI_SR
2778  0061 a501          	bcp	a,#1
2779  0063 27f3          	jreq	L5371
2780                     ; 77     reg = SPI_DR;
2782  0065 c65204        	ld	a,_SPI_DR
2783  0068 6b02          	ld	(OFST+0,sp),a
2785                     ; 78     x1  = SPI_SR; // clear possible OVR flag
2787  006a c65203        	ld	a,_SPI_SR
2788                     ; 79     return reg;
2790  006d 7b02          	ld	a,(OFST+0,sp)
2793  006f 85            	popw	x
2794  0070 81            	ret
2860                     ; 88 int16_t max31855_read(uint8_t *err)
2860                     ; 89 {
2861                     	switch	.text
2862  0071               _max31855_read:
2864  0071 89            	pushw	x
2865  0072 5208          	subw	sp,#8
2866       00000008      OFST:	set	8
2869                     ; 90     uint32_t d = 0;
2871                     ; 93     CS_TC_0;         // Set chip-select for MAX31855 active
2873  0074 721f5005      	bres	_PB_ODR,#7
2874                     ; 94     delay_usec(1);   // at least 100 nsec. delay
2876  0078 ae0001        	ldw	x,#1
2877  007b cd0000        	call	_delay_usec
2879                     ; 95     spi_write(0xFF);
2881  007e a6ff          	ld	a,#255
2882  0080 ad9e          	call	_spi_write
2884                     ; 96     d = spi_read();  // Read byte 1
2886  0082 add1          	call	_spi_read
2888  0084 6b08          	ld	(OFST+0,sp),a
2889  0086 4f            	clr	a
2890  0087 6b07          	ld	(OFST-1,sp),a
2891  0089 6b06          	ld	(OFST-2,sp),a
2892  008b 6b05          	ld	(OFST-3,sp),a
2894                     ; 97     d <<= 8;
2896  008d 96            	ldw	x,sp
2897  008e 1c0005        	addw	x,#OFST-3
2898  0091 a608          	ld	a,#8
2899  0093 cd0000        	call	c_lglsh
2902                     ; 98     spi_write(0xFF);
2904  0096 a6ff          	ld	a,#255
2905  0098 ad86          	call	_spi_write
2907                     ; 99     d |= spi_read(); // Read byte 2
2909  009a adb9          	call	_spi_read
2911  009c b703          	ld	c_lreg+3,a
2912  009e 3f02          	clr	c_lreg+2
2913  00a0 3f01          	clr	c_lreg+1
2914  00a2 3f00          	clr	c_lreg
2915  00a4 96            	ldw	x,sp
2916  00a5 1c0005        	addw	x,#OFST-3
2917  00a8 cd0000        	call	c_lgor
2920                     ; 100     d <<= 8;
2922  00ab 96            	ldw	x,sp
2923  00ac 1c0005        	addw	x,#OFST-3
2924  00af a608          	ld	a,#8
2925  00b1 cd0000        	call	c_lglsh
2928                     ; 101     spi_write(0xFF); 
2930  00b4 a6ff          	ld	a,#255
2931  00b6 cd0020        	call	_spi_write
2933                     ; 102     d |= spi_read(); // Read byte 3
2935  00b9 ad9a          	call	_spi_read
2937  00bb b703          	ld	c_lreg+3,a
2938  00bd 3f02          	clr	c_lreg+2
2939  00bf 3f01          	clr	c_lreg+1
2940  00c1 3f00          	clr	c_lreg
2941  00c3 96            	ldw	x,sp
2942  00c4 1c0005        	addw	x,#OFST-3
2943  00c7 cd0000        	call	c_lgor
2946                     ; 103     d <<= 8;
2948  00ca 96            	ldw	x,sp
2949  00cb 1c0005        	addw	x,#OFST-3
2950  00ce a608          	ld	a,#8
2951  00d0 cd0000        	call	c_lglsh
2954                     ; 104     spi_write(0xFF); 
2956  00d3 a6ff          	ld	a,#255
2957  00d5 cd0020        	call	_spi_write
2959                     ; 105     d |= spi_read(); // Read byte 4
2961  00d8 cd0055        	call	_spi_read
2963  00db b703          	ld	c_lreg+3,a
2964  00dd 3f02          	clr	c_lreg+2
2965  00df 3f01          	clr	c_lreg+1
2966  00e1 3f00          	clr	c_lreg
2967  00e3 96            	ldw	x,sp
2968  00e4 1c0005        	addw	x,#OFST-3
2969  00e7 cd0000        	call	c_lgor
2972                     ; 106     CS_TC_1;         // Set chip-select for MAX31855 inactive again
2974  00ea 721e5005      	bset	_PB_ODR,#7
2975                     ; 108     *err = (d & 0x07); // Contains error bits
2977  00ee 7b08          	ld	a,(OFST+0,sp)
2978  00f0 a407          	and	a,#7
2979  00f2 1e09          	ldw	x,(OFST+1,sp)
2980  00f4 f7            	ld	(x),a
2981                     ; 109     if (d & 0x80000000) 
2983  00f5 7b05          	ld	a,(OFST-3,sp)
2984  00f7 a580          	bcp	a,#128
2985  00f9 272b          	jreq	L5771
2986                     ; 112         v = (int32_t)(0xFFFFC000 | ((d >> 18) & 0x00003FFFF));
2988  00fb 96            	ldw	x,sp
2989  00fc 1c0005        	addw	x,#OFST-3
2990  00ff cd0000        	call	c_ltor
2992  0102 a612          	ld	a,#18
2993  0104 cd0000        	call	c_lursh
2995  0107 b601          	ld	a,c_lreg+1
2996  0109 a403          	and	a,#3
2997  010b b701          	ld	c_lreg+1,a
2998  010d 3f00          	clr	c_lreg
2999  010f b602          	ld	a,c_lreg+2
3000  0111 aac0          	or	a,#192
3001  0113 b702          	ld	c_lreg+2,a
3002  0115 a6ff          	ld	a,#255
3003  0117 b701          	ld	c_lreg+1,a
3004  0119 a6ff          	ld	a,#255
3005  011b b700          	ld	c_lreg,a
3006  011d 96            	ldw	x,sp
3007  011e 1c0005        	addw	x,#OFST-3
3008  0121 cd0000        	call	c_rtol
3012  0124 2013          	jra	L7771
3013  0126               L5771:
3014                     ; 117         v = (int32_t)(d >>= 18);
3016  0126 96            	ldw	x,sp
3017  0127 1c0005        	addw	x,#OFST-3
3018  012a cd0000        	call	c_ltor
3020  012d a612          	ld	a,#18
3021  012f cd0000        	call	c_lursh
3023  0132 96            	ldw	x,sp
3024  0133 1c0005        	addw	x,#OFST-3
3025  0136 cd0000        	call	c_rtol
3029  0139               L7771:
3030                     ; 120     v1 = ((v << 1) + (v >> 1));
3032  0139 96            	ldw	x,sp
3033  013a 1c0005        	addw	x,#OFST-3
3034  013d cd0000        	call	c_ltor
3036  0140 3700          	sra	c_lreg
3037  0142 3601          	rrc	c_lreg+1
3038  0144 3602          	rrc	c_lreg+2
3039  0146 3603          	rrc	c_lreg+3
3040  0148 96            	ldw	x,sp
3041  0149 1c0001        	addw	x,#OFST-7
3042  014c cd0000        	call	c_rtol
3045  014f 96            	ldw	x,sp
3046  0150 1c0005        	addw	x,#OFST-3
3047  0153 cd0000        	call	c_ltor
3049  0156 3803          	sll	c_lreg+3
3050  0158 3902          	rlc	c_lreg+2
3051  015a 3901          	rlc	c_lreg+1
3052  015c 3900          	rlc	c_lreg
3053  015e 96            	ldw	x,sp
3054  015f 1c0001        	addw	x,#OFST-7
3055  0162 cd0000        	call	c_ladd
3057  0165 96            	ldw	x,sp
3058  0166 1c0005        	addw	x,#OFST-3
3059  0169 cd0000        	call	c_rtol
3062                     ; 121     return (int16_t)v1;
3064  016c 1e07          	ldw	x,(OFST-1,sp)
3067  016e 5b0a          	addw	sp,#10
3068  0170 81            	ret
3115                     ; 130 uint8_t max31865_read8(uint8_t reg)
3115                     ; 131 {
3116                     	switch	.text
3117  0171               _max31865_read8:
3119  0171 88            	push	a
3120  0172 88            	push	a
3121       00000001      OFST:	set	1
3124                     ; 134     CS_PT100_0;            // Set chip-select for MAX31865 active
3126  0173 721d5005      	bres	_PB_ODR,#6
3127                     ; 135     delay_usec(1);         // at least 400 nsec. delay
3129  0177 ae0001        	ldw	x,#1
3130  017a cd0000        	call	_delay_usec
3132                     ; 136     spi_write(reg & 0x7F); // register address
3134  017d 7b02          	ld	a,(OFST+1,sp)
3135  017f a47f          	and	a,#127
3136  0181 cd0020        	call	_spi_write
3138                     ; 137 	ret = spi_read();      // dummy read
3140  0184 cd0055        	call	_spi_read
3142                     ; 138     spi_write(0x00);
3144  0187 4f            	clr	a
3145  0188 cd0020        	call	_spi_write
3147                     ; 139 	ret = spi_read();      // read register value
3149  018b cd0055        	call	_spi_read
3151  018e 6b01          	ld	(OFST+0,sp),a
3153                     ; 140     CS_PT100_1;            // Disable chip-select for MAX31865
3155  0190 721c5005      	bset	_PB_ODR,#6
3156                     ; 141     return ret;
3158  0194 7b01          	ld	a,(OFST+0,sp)
3161  0196 85            	popw	x
3162  0197 81            	ret
3208                     ; 151 void max31865_write8(uint8_t reg, uint8_t dat)
3208                     ; 152 {
3209                     	switch	.text
3210  0198               _max31865_write8:
3212  0198 89            	pushw	x
3213       00000000      OFST:	set	0
3216                     ; 153     CS_PT100_0;            // Set chip-select for MAX31865 active
3218  0199 721d5005      	bres	_PB_ODR,#6
3219                     ; 154     delay_usec(1);         // at least 400 nsec. delay
3221  019d ae0001        	ldw	x,#1
3222  01a0 cd0000        	call	_delay_usec
3224                     ; 155     spi_write(reg | 0x80); // Write to register
3226  01a3 7b01          	ld	a,(OFST+1,sp)
3227  01a5 aa80          	or	a,#128
3228  01a7 cd0020        	call	_spi_write
3230                     ; 156     spi_write(dat);        // Write data to register
3232  01aa 7b02          	ld	a,(OFST+2,sp)
3233  01ac cd0020        	call	_spi_write
3235                     ; 157     CS_PT100_1;            // Disable chip-select for MAX31865
3237  01af 721c5005      	bset	_PB_ODR,#6
3238                     ; 158 } // max31865_write8()
3241  01b3 85            	popw	x
3242  01b4 81            	ret
3289                     ; 166 uint16_t max31865_read16(uint8_t reg)
3289                     ; 167 {
3290                     	switch	.text
3291  01b5               _max31865_read16:
3293  01b5 88            	push	a
3294  01b6 89            	pushw	x
3295       00000002      OFST:	set	2
3298                     ; 170     CS_PT100_0;            // Set chip-select for MAX31865 active
3300  01b7 721d5005      	bres	_PB_ODR,#6
3301                     ; 171     delay_usec(1);         // at least 400 nsec. delay
3303  01bb ae0001        	ldw	x,#1
3304  01be cd0000        	call	_delay_usec
3306                     ; 172     spi_write(reg & 0x7F); // register address
3308  01c1 7b03          	ld	a,(OFST+1,sp)
3309  01c3 a47f          	and	a,#127
3310  01c5 cd0020        	call	_spi_write
3312                     ; 173 	ret = spi_read();      // dummy read
3314  01c8 cd0055        	call	_spi_read
3316                     ; 174 	spi_write(0x00);
3318  01cb 4f            	clr	a
3319  01cc cd0020        	call	_spi_write
3321                     ; 175 	ret = spi_read();      // Read MSB
3323  01cf cd0055        	call	_spi_read
3325  01d2 5f            	clrw	x
3326  01d3 97            	ld	xl,a
3327  01d4 1f01          	ldw	(OFST-1,sp),x
3329                     ; 176     ret <<= 8;
3331  01d6 7b02          	ld	a,(OFST+0,sp)
3332  01d8 6b01          	ld	(OFST-1,sp),a
3333  01da 0f02          	clr	(OFST+0,sp)
3335                     ; 177 	spi_write(0x00);
3337  01dc 4f            	clr	a
3338  01dd cd0020        	call	_spi_write
3340                     ; 178 	ret |= spi_read();     // Read LSB
3342  01e0 cd0055        	call	_spi_read
3344  01e3 5f            	clrw	x
3345  01e4 97            	ld	xl,a
3346  01e5 01            	rrwa	x,a
3347  01e6 1a02          	or	a,(OFST+0,sp)
3348  01e8 01            	rrwa	x,a
3349  01e9 1a01          	or	a,(OFST-1,sp)
3350  01eb 01            	rrwa	x,a
3351  01ec 1f01          	ldw	(OFST-1,sp),x
3353                     ; 179     CS_PT100_1;            // Disable chip-select for MAX31865
3355  01ee 721c5005      	bset	_PB_ODR,#6
3356                     ; 180     return ret;
3358  01f2 1e01          	ldw	x,(OFST-1,sp)
3361  01f4 5b03          	addw	sp,#3
3362  01f6 81            	ret
3417                     ; 190 void max31865_write16(uint8_t reg, uint16_t dat)
3417                     ; 191 {
3418                     	switch	.text
3419  01f7               _max31865_write16:
3421  01f7 88            	push	a
3422  01f8 88            	push	a
3423       00000001      OFST:	set	1
3426                     ; 194     CS_PT100_0;            // Set chip-select for MAX31865 active
3428  01f9 721d5005      	bres	_PB_ODR,#6
3429                     ; 195     delay_usec(1);         // at least 400 nsec. delay
3431  01fd ae0001        	ldw	x,#1
3432  0200 cd0000        	call	_delay_usec
3434                     ; 196     spi_write(reg | 0x80); // Write to register
3436  0203 7b02          	ld	a,(OFST+1,sp)
3437  0205 aa80          	or	a,#128
3438  0207 cd0020        	call	_spi_write
3440                     ; 197     dat8 = (uint8_t)(dat >> 8);
3442  020a 7b05          	ld	a,(OFST+4,sp)
3443  020c 6b01          	ld	(OFST+0,sp),a
3445                     ; 198     spi_write(dat8);       // Write MSB
3447  020e 7b01          	ld	a,(OFST+0,sp)
3448  0210 cd0020        	call	_spi_write
3450                     ; 199     dat8 = (uint8_t)(dat & 0x00FF);
3452  0213 7b06          	ld	a,(OFST+5,sp)
3453  0215 a4ff          	and	a,#255
3454  0217 6b01          	ld	(OFST+0,sp),a
3456                     ; 200     spi_write(dat8);       // Write LSB
3458  0219 7b01          	ld	a,(OFST+0,sp)
3459  021b cd0020        	call	_spi_write
3461                     ; 201     CS_PT100_1;            // Disable chip-select for MAX31865
3463  021e 721c5005      	bset	_PB_ODR,#6
3464                     ; 202 } // max31865_write8()
3467  0222 85            	popw	x
3468  0223 81            	ret
3493                     ; 210 void max31865_init(void)
3493                     ; 211 {
3494                     	switch	.text
3495  0224               _max31865_init:
3499                     ; 215     max31865_write8(MAX31865_CONFIG, 0xC3);
3501  0224 ae00c3        	ldw	x,#195
3502  0227 cd0198        	call	_max31865_write8
3504                     ; 216     delay_msec(10);  // Let Vbias settle
3506  022a ae000a        	ldw	x,#10
3507  022d cd0000        	call	_delay_msec
3509                     ; 222 } // max31865_init()
3512  0230 81            	ret
3577                     ; 230 int16_t max31865_read(uint8_t *err)
3577                     ; 231 {
3578                     	switch	.text
3579  0231               _max31865_read:
3581  0231 89            	pushw	x
3582  0232 5207          	subw	sp,#7
3583       00000007      OFST:	set	7
3586                     ; 236     rtd = max31865_read16(MAX31865_RTD_MSB); // Read 16-bit RTD value
3588  0234 a601          	ld	a,#1
3589  0236 cd01b5        	call	_max31865_read16
3591  0239 1f06          	ldw	(OFST-1,sp),x
3593                     ; 237     *err = (rtd & 0x0001);                   // Fault bit
3595  023b 7b07          	ld	a,(OFST+0,sp)
3596  023d a401          	and	a,#1
3597  023f 1e08          	ldw	x,(OFST+1,sp)
3598  0241 f7            	ld	(x),a
3599                     ; 238     if (*err)
3601  0242 1e08          	ldw	x,(OFST+1,sp)
3602  0244 7d            	tnz	(x)
3603  0245 2713          	jreq	L7512
3604                     ; 240         x  = max31865_read8(MAX31865_CONFIG);
3606  0247 4f            	clr	a
3607  0248 cd0171        	call	_max31865_read8
3609  024b 6b01          	ld	(OFST-6,sp),a
3611                     ; 241         x |= CLR_FLT;
3613  024d 7b01          	ld	a,(OFST-6,sp)
3614  024f aa02          	or	a,#2
3615  0251 6b01          	ld	(OFST-6,sp),a
3617                     ; 242         max31865_write8(MAX31865_CONFIG,x); // Clear Fault Bit in Config Register
3619  0253 7b01          	ld	a,(OFST-6,sp)
3620  0255 5f            	clrw	x
3621  0256 97            	ld	xl,a
3622  0257 cd0198        	call	_max31865_write8
3624  025a               L7512:
3625                     ; 244     rtd >>= 1;                             // remove fault bit
3627  025a 0406          	srl	(OFST-1,sp)
3628  025c 0607          	rrc	(OFST+0,sp)
3630                     ; 255     d  = (float)rtd - 8404.8;
3632  025e 1e06          	ldw	x,(OFST-1,sp)
3633  0260 cd0000        	call	c_uitof
3635  0263 ae0008        	ldw	x,#L5612
3636  0266 cd0000        	call	c_fsub
3638  0269 96            	ldw	x,sp
3639  026a 1c0002        	addw	x,#OFST-5
3640  026d cd0000        	call	c_rtol
3643                     ; 256 	d *= 0.309090347;
3645  0270 ae0004        	ldw	x,#L5712
3646  0273 cd0000        	call	c_ltor
3648  0276 96            	ldw	x,sp
3649  0277 1c0002        	addw	x,#OFST-5
3650  027a cd0000        	call	c_fgmul
3653                     ; 257 	rtd = (int16_t)(d + 0.5);
3655  027d 96            	ldw	x,sp
3656  027e 1c0002        	addw	x,#OFST-5
3657  0281 cd0000        	call	c_ltor
3659  0284 ae0000        	ldw	x,#L5022
3660  0287 cd0000        	call	c_fadd
3662  028a cd0000        	call	c_ftoi
3664  028d 1f06          	ldw	(OFST-1,sp),x
3666                     ; 258 	return rtd;
3668  028f 1e06          	ldw	x,(OFST-1,sp)
3671  0291 5b09          	addw	sp,#9
3672  0293 81            	ret
3696                     	xdef	_SPI_Handler
3697                     	switch	.ubsct
3698  0000               _spi_error:
3699  0000 00            	ds.b	1
3700                     	xdef	_spi_error
3701                     	xref	_delay_usec
3702                     	xref	_delay_msec
3703                     	xdef	_max31865_read
3704                     	xdef	_max31865_init
3705                     	xdef	_max31865_write16
3706                     	xdef	_max31865_read16
3707                     	xdef	_max31865_write8
3708                     	xdef	_max31865_read8
3709                     	xdef	_max31855_read
3710                     	xdef	_spi_read
3711                     	xdef	_spi_write
3712                     	xdef	_spi_init
3713                     .const:	section	.text
3714  0000               L5022:
3715  0000 3f000000      	dc.w	16128,0
3716  0004               L5712:
3717  0004 3e9e4117      	dc.w	16030,16663
3718  0008               L5612:
3719  0008 46035333      	dc.w	17923,21299
3720                     	xref.b	c_lreg
3721                     	xref.b	c_x
3741                     	xref	c_ftoi
3742                     	xref	c_fadd
3743                     	xref	c_fgmul
3744                     	xref	c_fsub
3745                     	xref	c_uitof
3746                     	xref	c_ladd
3747                     	xref	c_rtol
3748                     	xref	c_lursh
3749                     	xref	c_ltor
3750                     	xref	c_lgor
3751                     	xref	c_lglsh
3752                     	end
