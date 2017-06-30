   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  14                     	bsct
  15  0000               _kc:
  16  0000 0000          	dc.w	0
  17  0002               _ti:
  18  0002 0000          	dc.w	0
  19  0004               _td:
  20  0004 0000          	dc.w	0
  21  0006               _ts:
  22  0006 00            	dc.b	0
 102                     ; 46 void init_pid(uint16_t kc, uint16_t ti, uint16_t td, uint8_t ts, uint16_t yk)
 102                     ; 47 /*------------------------------------------------------------------
 102                     ; 48   Purpose  : This function initialises the Takahashi Type C PID
 102                     ; 49              controller.
 102                     ; 50   Variables: kc: Kc parameter value in %/°C    ; controls P-action
 102                     ; 51              ti: Ti parameter value in seconds ; controls I-action
 102                     ; 52              td: Td parameter value in seconds ; controls D-action
 102                     ; 53              ts: Ts parameter sample-time of pid-controller in seconds
 102                     ; 54              yk: actual temperature value
 102                     ; 55 
 102                     ; 56                    Kc.Ts
 102                     ; 57              ki =  -----   (for I-term)
 102                     ; 58                     Ti
 102                     ; 59 
 102                     ; 60                        Td
 102                     ; 61              kd = Kc . --  (for D-term)
 102                     ; 62                        Ts
 102                     ; 63 
 102                     ; 64   Returns  : No values are returned
 102                     ; 65   ------------------------------------------------------------------*/
 102                     ; 66 {
 104                     	switch	.text
 105  0000               _init_pid:
 107  0000 89            	pushw	x
 108  0001 5204          	subw	sp,#4
 109       00000004      OFST:	set	4
 112                     ; 67    if (ti == 0) ki = 0;
 114  0003 1e09          	ldw	x,(OFST+5,sp)
 115  0005 260c          	jrne	L74
 118  0007 ae0000        	ldw	x,#0
 119  000a bf0e          	ldw	_ki+2,x
 120  000c ae0000        	ldw	x,#0
 121  000f bf0c          	ldw	_ki,x
 123  0011 2020          	jra	L15
 124  0013               L74:
 125                     ; 68    else         ki = (((uint32_t)kc * ts) / ti);
 127  0013 1e09          	ldw	x,(OFST+5,sp)
 128  0015 cd0000        	call	c_uitolx
 130  0018 96            	ldw	x,sp
 131  0019 1c0001        	addw	x,#OFST-3
 132  001c cd0000        	call	c_rtol
 135  001f 1e05          	ldw	x,(OFST+1,sp)
 136  0021 7b0d          	ld	a,(OFST+9,sp)
 137  0023 cd0000        	call	c_cmulx
 139  0026 96            	ldw	x,sp
 140  0027 1c0001        	addw	x,#OFST-3
 141  002a cd0000        	call	c_ludv
 143  002d ae000c        	ldw	x,#_ki
 144  0030 cd0000        	call	c_rtol
 146  0033               L15:
 147                     ; 69    if (ts == 0) kd = 0;
 149  0033 0d0d          	tnz	(OFST+9,sp)
 150  0035 260c          	jrne	L35
 153  0037 ae0000        	ldw	x,#0
 154  003a bf0a          	ldw	_kd+2,x
 155  003c ae0000        	ldw	x,#0
 156  003f bf08          	ldw	_kd,x
 158  0041 2025          	jra	L55
 159  0043               L35:
 160                     ; 70    else         kd = (((uint32_t)kc * td) / ts);
 162  0043 7b0d          	ld	a,(OFST+9,sp)
 163  0045 b703          	ld	c_lreg+3,a
 164  0047 3f02          	clr	c_lreg+2
 165  0049 3f01          	clr	c_lreg+1
 166  004b 3f00          	clr	c_lreg
 167  004d 96            	ldw	x,sp
 168  004e 1c0001        	addw	x,#OFST-3
 169  0051 cd0000        	call	c_rtol
 172  0054 1e05          	ldw	x,(OFST+1,sp)
 173  0056 160b          	ldw	y,(OFST+7,sp)
 174  0058 cd0000        	call	c_umul
 176  005b 96            	ldw	x,sp
 177  005c 1c0001        	addw	x,#OFST-3
 178  005f cd0000        	call	c_ludv
 180  0062 ae0008        	ldw	x,#_kd
 181  0065 cd0000        	call	c_rtol
 183  0068               L55:
 184                     ; 72    yk_2 = yk_1 = yk; // init. previous samples to current temperature
 186  0068 1e0e          	ldw	x,(OFST+10,sp)
 187  006a bf02          	ldw	_yk_1,x
 188  006c be02          	ldw	x,_yk_1
 189  006e bf00          	ldw	_yk_2,x
 190                     ; 73 } // init_pid()
 193  0070 5b06          	addw	sp,#6
 194  0072 81            	ret
 253                     ; 75 void pid_ctrl(int16_t yk, int16_t *uk, uint16_t tset)
 253                     ; 76 /*------------------------------------------------------------------
 253                     ; 77   Purpose  : This function implements the Takahashi Type C PID
 253                     ; 78              controller: the P and D term are no longer dependent
 253                     ; 79              on the setpoint, only on PV.
 253                     ; 80              This function should be called once every TS seconds.
 253                     ; 81   Variables:
 253                     ; 82         yk : The input variable y[k] (= measured temperature in E-1 °C)
 253                     ; 83        *uk : The pid-output variable u[k] [-1000..+1000] in E-1 %
 253                     ; 84       tset : The setpoint value w[k] for the temperature in E-1 °C
 253                     ; 85   Returns  : No values are returned
 253                     ; 86   ------------------------------------------------------------------*/
 253                     ; 87 {
 254                     	switch	.text
 255  0073               _pid_ctrl:
 257  0073 89            	pushw	x
 258  0074 5204          	subw	sp,#4
 259       00000004      OFST:	set	4
 262                     ; 97     pp   = (uint32_t)kc * (yk_1 - yk);               // Kc.(y[k-1]-y[k])
 264  0076 be02          	ldw	x,_yk_1
 265  0078 72f005        	subw	x,(OFST+1,sp)
 266  007b cd0000        	call	c_itolx
 268  007e 96            	ldw	x,sp
 269  007f 1c0001        	addw	x,#OFST-3
 270  0082 cd0000        	call	c_rtol
 273  0085 be00          	ldw	x,_kc
 274  0087 cd0000        	call	c_uitolx
 276  008a 96            	ldw	x,sp
 277  008b 1c0001        	addw	x,#OFST-3
 278  008e cd0000        	call	c_lmul
 280  0091 ae0004        	ldw	x,#_pp
 281  0094 cd0000        	call	c_rtol
 283                     ; 98     pp  += (uint32_t)ki * (tset - yk);               // (Kc.Ts/Ti).e[k]
 285  0097 1e0b          	ldw	x,(OFST+7,sp)
 286  0099 72f005        	subw	x,(OFST+1,sp)
 287  009c cd0000        	call	c_uitolx
 289  009f ae000c        	ldw	x,#_ki
 290  00a2 cd0000        	call	c_lmul
 292  00a5 ae0004        	ldw	x,#_pp
 293  00a8 cd0000        	call	c_lgadd
 295                     ; 99     pp  += (uint32_t)kd * ((yk_1 << 1) - yk - yk_2); // (Kc.Td/Ts).(2.y[k-1]-y[k]-y[k-2])
 297  00ab be02          	ldw	x,_yk_1
 298  00ad 58            	sllw	x
 299  00ae 72f005        	subw	x,(OFST+1,sp)
 300  00b1 72b00000      	subw	x,_yk_2
 301  00b5 cd0000        	call	c_itolx
 303  00b8 ae0008        	ldw	x,#_kd
 304  00bb cd0000        	call	c_lmul
 306  00be ae0004        	ldw	x,#_pp
 307  00c1 cd0000        	call	c_lgadd
 309                     ; 100     *uk += (int16_t)pp;
 311  00c4 1e09          	ldw	x,(OFST+5,sp)
 312  00c6 9093          	ldw	y,x
 313  00c8 fe            	ldw	x,(x)
 314  00c9 72bb0006      	addw	x,_pp+2
 315  00cd 90ff          	ldw	(y),x
 316                     ; 102     if (*uk > GMA_HLIM)      *uk = GMA_HLIM;
 318  00cf 9c            	rvf
 319  00d0 1e09          	ldw	x,(OFST+5,sp)
 320  00d2 9093          	ldw	y,x
 321  00d4 90fe          	ldw	y,(y)
 322  00d6 90a303e9      	cpw	y,#1001
 323  00da 2f09          	jrslt	L501
 326  00dc 1e09          	ldw	x,(OFST+5,sp)
 327  00de 90ae03e8      	ldw	y,#1000
 328  00e2 ff            	ldw	(x),y
 330  00e3 2014          	jra	L701
 331  00e5               L501:
 332                     ; 103     else if (*uk < GMA_LLIM) *uk = GMA_LLIM;
 334  00e5 9c            	rvf
 335  00e6 1e09          	ldw	x,(OFST+5,sp)
 336  00e8 9093          	ldw	y,x
 337  00ea 90fe          	ldw	y,(y)
 338  00ec 90a3fc18      	cpw	y,#64536
 339  00f0 2e07          	jrsge	L701
 342  00f2 1e09          	ldw	x,(OFST+5,sp)
 343  00f4 90aefc18      	ldw	y,#64536
 344  00f8 ff            	ldw	(x),y
 345  00f9               L701:
 346                     ; 105     yk_2  = yk_1; // y[k-2] = y[k-1]
 348  00f9 be02          	ldw	x,_yk_1
 349  00fb bf00          	ldw	_yk_2,x
 350                     ; 106     yk_1  = yk;   // y[k-1] = y[k]
 352  00fd 1e05          	ldw	x,(OFST+1,sp)
 353  00ff bf02          	ldw	_yk_1,x
 354                     ; 107 } // pid_ctrl()
 357  0101 5b06          	addw	sp,#6
 358  0103 81            	ret
 454                     	switch	.ubsct
 455  0000               _yk_2:
 456  0000 0000          	ds.b	2
 457                     	xdef	_yk_2
 458  0002               _yk_1:
 459  0002 0000          	ds.b	2
 460                     	xdef	_yk_1
 461  0004               _pp:
 462  0004 00000000      	ds.b	4
 463                     	xdef	_pp
 464  0008               _kd:
 465  0008 00000000      	ds.b	4
 466                     	xdef	_kd
 467  000c               _ki:
 468  000c 00000000      	ds.b	4
 469                     	xdef	_ki
 470                     	xdef	_ts
 471                     	xdef	_td
 472                     	xdef	_ti
 473                     	xdef	_kc
 474                     	xdef	_pid_ctrl
 475                     	xdef	_init_pid
 476                     	xref.b	c_lreg
 477                     	xref.b	c_x
 478                     	xref.b	c_y
 498                     	xref	c_lgadd
 499                     	xref	c_lmul
 500                     	xref	c_itolx
 501                     	xref	c_umul
 502                     	xref	c_ludv
 503                     	xref	c_rtol
 504                     	xref	c_uitolx
 505                     	xref	c_cmulx
 506                     	end
