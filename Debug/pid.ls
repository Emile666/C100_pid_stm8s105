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
 104                     ; 67 void init_pid(uint16_t kc, uint16_t ti, uint16_t td, uint8_t ts, int16_t yk)
 104                     ; 68 {
 106                     	switch	.text
 107  0000               _init_pid:
 109  0000 89            	pushw	x
 110  0001 5204          	subw	sp,#4
 111       00000004      OFST:	set	4
 114                     ; 69    if (ti == 0) ki = 0;
 116  0003 1e09          	ldw	x,(OFST+5,sp)
 117  0005 260c          	jrne	L74
 120  0007 ae0000        	ldw	x,#0
 121  000a bf12          	ldw	_ki+2,x
 122  000c ae0000        	ldw	x,#0
 123  000f bf10          	ldw	_ki,x
 125  0011 2020          	jra	L15
 126  0013               L74:
 127                     ; 70    else         ki = (((uint32_t)kc * ts) / ti);
 129  0013 1e09          	ldw	x,(OFST+5,sp)
 130  0015 cd0000        	call	c_uitolx
 132  0018 96            	ldw	x,sp
 133  0019 1c0001        	addw	x,#OFST-3
 134  001c cd0000        	call	c_rtol
 137  001f 1e05          	ldw	x,(OFST+1,sp)
 138  0021 7b0d          	ld	a,(OFST+9,sp)
 139  0023 cd0000        	call	c_cmulx
 141  0026 96            	ldw	x,sp
 142  0027 1c0001        	addw	x,#OFST-3
 143  002a cd0000        	call	c_ludv
 145  002d ae0010        	ldw	x,#_ki
 146  0030 cd0000        	call	c_rtol
 148  0033               L15:
 149                     ; 71    if (ts == 0) kd = 0;
 151  0033 0d0d          	tnz	(OFST+9,sp)
 152  0035 260c          	jrne	L35
 155  0037 ae0000        	ldw	x,#0
 156  003a bf0e          	ldw	_kd+2,x
 157  003c ae0000        	ldw	x,#0
 158  003f bf0c          	ldw	_kd,x
 160  0041 2025          	jra	L55
 161  0043               L35:
 162                     ; 72    else         kd = (((uint32_t)kc * td) / ts);
 164  0043 7b0d          	ld	a,(OFST+9,sp)
 165  0045 b703          	ld	c_lreg+3,a
 166  0047 3f02          	clr	c_lreg+2
 167  0049 3f01          	clr	c_lreg+1
 168  004b 3f00          	clr	c_lreg
 169  004d 96            	ldw	x,sp
 170  004e 1c0001        	addw	x,#OFST-3
 171  0051 cd0000        	call	c_rtol
 174  0054 1e05          	ldw	x,(OFST+1,sp)
 175  0056 160b          	ldw	y,(OFST+7,sp)
 176  0058 cd0000        	call	c_umul
 178  005b 96            	ldw	x,sp
 179  005c 1c0001        	addw	x,#OFST-3
 180  005f cd0000        	call	c_ludv
 182  0062 ae000c        	ldw	x,#_kd
 183  0065 cd0000        	call	c_rtol
 185  0068               L55:
 186                     ; 74    if (kc > 0)
 188  0068 1e05          	ldw	x,(OFST+1,sp)
 189  006a 270a          	jreq	L75
 190                     ; 76        pid_max = GMA_HLIM;
 192  006c ae03e8        	ldw	x,#1000
 193  006f bf02          	ldw	_pid_max,x
 194                     ; 77        pid_min = 0;
 196  0071 5f            	clrw	x
 197  0072 bf00          	ldw	_pid_min,x
 199  0074 2008          	jra	L16
 200  0076               L75:
 201                     ; 81        pid_max = 0;
 203  0076 5f            	clrw	x
 204  0077 bf02          	ldw	_pid_max,x
 205                     ; 82        pid_min = GMA_LLIM;
 207  0079 aefc18        	ldw	x,#64536
 208  007c bf00          	ldw	_pid_min,x
 209  007e               L16:
 210                     ; 84    yk_2 = yk_1 = yk; // init. previous samples to current temperature
 212  007e 1e0e          	ldw	x,(OFST+10,sp)
 213  0080 bf06          	ldw	_yk_1,x
 214  0082 be06          	ldw	x,_yk_1
 215  0084 bf04          	ldw	_yk_2,x
 216                     ; 85 } // init_pid()
 219  0086 5b06          	addw	sp,#6
 220  0088 81            	ret
 281                     ; 98 void pid_ctrl(int16_t yk, int16_t *uk, int16_t tset)
 281                     ; 99 {
 282                     	switch	.text
 283  0089               _pid_ctrl:
 285  0089 89            	pushw	x
 286  008a 5204          	subw	sp,#4
 287       00000004      OFST:	set	4
 290                     ; 109     pp   = (uint32_t)kc * (yk_1 - yk);               // Kc.(y[k-1]-y[k])
 292  008c be06          	ldw	x,_yk_1
 293  008e 72f005        	subw	x,(OFST+1,sp)
 294  0091 cd0000        	call	c_itolx
 296  0094 96            	ldw	x,sp
 297  0095 1c0001        	addw	x,#OFST-3
 298  0098 cd0000        	call	c_rtol
 301  009b be00          	ldw	x,_kc
 302  009d cd0000        	call	c_uitolx
 304  00a0 96            	ldw	x,sp
 305  00a1 1c0001        	addw	x,#OFST-3
 306  00a4 cd0000        	call	c_lmul
 308  00a7 ae0008        	ldw	x,#_pp
 309  00aa cd0000        	call	c_rtol
 311                     ; 110     pp  += (uint32_t)ki * (tset - yk);               // (Kc.Ts/Ti).e[k]
 313  00ad 1e0b          	ldw	x,(OFST+7,sp)
 314  00af 72f005        	subw	x,(OFST+1,sp)
 315  00b2 cd0000        	call	c_itolx
 317  00b5 ae0010        	ldw	x,#_ki
 318  00b8 cd0000        	call	c_lmul
 320  00bb ae0008        	ldw	x,#_pp
 321  00be cd0000        	call	c_lgadd
 323                     ; 111     pp  += (uint32_t)kd * ((yk_1 << 1) - yk - yk_2); // (Kc.Td/Ts).(2.y[k-1]-y[k]-y[k-2])
 325  00c1 be06          	ldw	x,_yk_1
 326  00c3 58            	sllw	x
 327  00c4 72f005        	subw	x,(OFST+1,sp)
 328  00c7 72b00004      	subw	x,_yk_2
 329  00cb cd0000        	call	c_itolx
 331  00ce ae000c        	ldw	x,#_kd
 332  00d1 cd0000        	call	c_lmul
 334  00d4 ae0008        	ldw	x,#_pp
 335  00d7 cd0000        	call	c_lgadd
 337                     ; 112     *uk += (int16_t)pp;
 339  00da 1e09          	ldw	x,(OFST+5,sp)
 340  00dc 9093          	ldw	y,x
 341  00de fe            	ldw	x,(x)
 342  00df 72bb000a      	addw	x,_pp+2
 343  00e3 90ff          	ldw	(y),x
 344                     ; 114     if (*uk > pid_max)      *uk = pid_max;
 346  00e5 9c            	rvf
 347  00e6 1e09          	ldw	x,(OFST+5,sp)
 348  00e8 9093          	ldw	y,x
 349  00ea 90fe          	ldw	y,(y)
 350  00ec 90b302        	cpw	y,_pid_max
 351  00ef 2d08          	jrsle	L111
 354  00f1 1e09          	ldw	x,(OFST+5,sp)
 355  00f3 90be02        	ldw	y,_pid_max
 356  00f6 ff            	ldw	(x),y
 358  00f7 2012          	jra	L311
 359  00f9               L111:
 360                     ; 115     else if (*uk < pid_min) *uk = pid_min;
 362  00f9 9c            	rvf
 363  00fa 1e09          	ldw	x,(OFST+5,sp)
 364  00fc 9093          	ldw	y,x
 365  00fe 90fe          	ldw	y,(y)
 366  0100 90b300        	cpw	y,_pid_min
 367  0103 2e06          	jrsge	L311
 370  0105 1e09          	ldw	x,(OFST+5,sp)
 371  0107 90be00        	ldw	y,_pid_min
 372  010a ff            	ldw	(x),y
 373  010b               L311:
 374                     ; 117     yk_2  = yk_1; // y[k-2] = y[k-1]
 376  010b be06          	ldw	x,_yk_1
 377  010d bf04          	ldw	_yk_2,x
 378                     ; 118     yk_1  = yk;   // y[k-1] = y[k]
 380  010f 1e05          	ldw	x,(OFST+1,sp)
 381  0111 bf06          	ldw	_yk_1,x
 382                     ; 119 } // pid_ctrl()
 385  0113 5b06          	addw	sp,#6
 386  0115 81            	ret
 409                     ; 121 void pid_auto_tuning(void)
 409                     ; 122 {
 410                     	switch	.text
 411  0116               _pid_auto_tuning:
 415                     ; 123 } // pid_auto_tuning()
 418  0116 81            	ret
 532                     	switch	.ubsct
 533  0000               _pid_min:
 534  0000 0000          	ds.b	2
 535                     	xdef	_pid_min
 536  0002               _pid_max:
 537  0002 0000          	ds.b	2
 538                     	xdef	_pid_max
 539  0004               _yk_2:
 540  0004 0000          	ds.b	2
 541                     	xdef	_yk_2
 542  0006               _yk_1:
 543  0006 0000          	ds.b	2
 544                     	xdef	_yk_1
 545  0008               _pp:
 546  0008 00000000      	ds.b	4
 547                     	xdef	_pp
 548  000c               _kd:
 549  000c 00000000      	ds.b	4
 550                     	xdef	_kd
 551  0010               _ki:
 552  0010 00000000      	ds.b	4
 553                     	xdef	_ki
 554                     	xdef	_ts
 555                     	xdef	_td
 556                     	xdef	_ti
 557                     	xdef	_kc
 558                     	xdef	_pid_auto_tuning
 559                     	xdef	_pid_ctrl
 560                     	xdef	_init_pid
 561                     	xref.b	c_lreg
 562                     	xref.b	c_x
 563                     	xref.b	c_y
 583                     	xref	c_lgadd
 584                     	xref	c_lmul
 585                     	xref	c_itolx
 586                     	xref	c_umul
 587                     	xref	c_ludv
 588                     	xref	c_rtol
 589                     	xref	c_uitolx
 590                     	xref	c_cmulx
 591                     	end
