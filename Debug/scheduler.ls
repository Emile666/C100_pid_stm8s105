   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  14                     	bsct
  15  0000               _max_tasks:
  16  0000 00            	dc.b	0
  47                     ; 36 void scheduler_init(void)
  47                     ; 37 {
  49                     	switch	.text
  50  0000               _scheduler_init:
  54                     ; 38 	  memset(task_list,0x00,sizeof(task_list)); // clear task_list array
  56  0000 ae0069        	ldw	x,#105
  57  0003               L6:
  58  0003 6fff          	clr	(_task_list-1,x)
  59  0005 5a            	decw	x
  60  0006 26fb          	jrne	L6
  61                     ; 39 } // scheduler_init()
  64  0008 81            	ret
 100                     ; 48 void scheduler_isr(void)
 100                     ; 49 {
 101                     	switch	.text
 102  0009               _scheduler_isr:
 104  0009 88            	push	a
 105       00000001      OFST:	set	1
 108                     ; 50 	uint8_t index = 0; // index in task_list struct
 110  000a 0f01          	clr	(OFST+0,sp)
 113  000c 2048          	jra	L34
 114  000e               L73:
 115                     ; 55 		if(task_list[index].Delay > 0)
 117  000e 7b01          	ld	a,(OFST+0,sp)
 118  0010 97            	ld	xl,a
 119  0011 a615          	ld	a,#21
 120  0013 42            	mul	x,a
 121  0014 e611          	ld	a,(_task_list+17,x)
 122  0016 ea10          	or	a,(_task_list+16,x)
 123  0018 2712          	jreq	L74
 124                     ; 57 			task_list[index].Delay--;
 126  001a 7b01          	ld	a,(OFST+0,sp)
 127  001c 97            	ld	xl,a
 128  001d a615          	ld	a,#21
 129  001f 42            	mul	x,a
 130  0020 9093          	ldw	y,x
 131  0022 ee10          	ldw	x,(_task_list+16,x)
 132  0024 1d0001        	subw	x,#1
 133  0027 90ef10        	ldw	(_task_list+16,y),x
 135  002a 2028          	jra	L15
 136  002c               L74:
 137                     ; 61 			task_list[index].Counter--;
 139  002c 7b01          	ld	a,(OFST+0,sp)
 140  002e 97            	ld	xl,a
 141  002f a615          	ld	a,#21
 142  0031 42            	mul	x,a
 143  0032 9093          	ldw	y,x
 144  0034 ee12          	ldw	x,(_task_list+18,x)
 145  0036 1d0001        	subw	x,#1
 146  0039 90ef12        	ldw	(_task_list+18,y),x
 147                     ; 62 			if(task_list[index].Counter == 0)
 149  003c 7b01          	ld	a,(OFST+0,sp)
 150  003e 97            	ld	xl,a
 151  003f a615          	ld	a,#21
 152  0041 42            	mul	x,a
 153  0042 e613          	ld	a,(_task_list+19,x)
 154  0044 ea12          	or	a,(_task_list+18,x)
 155  0046 260c          	jrne	L15
 156                     ; 65 				task_list[index].Status |= TASK_READY;
 158  0048 7b01          	ld	a,(OFST+0,sp)
 159  004a 97            	ld	xl,a
 160  004b a615          	ld	a,#21
 161  004d 42            	mul	x,a
 162  004e e614          	ld	a,(_task_list+20,x)
 163  0050 aa01          	or	a,#1
 164  0052 e714          	ld	(_task_list+20,x),a
 165  0054               L15:
 166                     ; 68 		index++;
 168  0054 0c01          	inc	(OFST+0,sp)
 170  0056               L34:
 171                     ; 52 	while ((index < MAX_TASKS) && task_list[index].pFunction)
 173  0056 7b01          	ld	a,(OFST+0,sp)
 174  0058 a105          	cp	a,#5
 175  005a 240c          	jruge	L55
 177  005c 7b01          	ld	a,(OFST+0,sp)
 178  005e 97            	ld	xl,a
 179  005f a615          	ld	a,#21
 180  0061 42            	mul	x,a
 181  0062 e601          	ld	a,(_task_list+1,x)
 182  0064 ea00          	or	a,(_task_list,x)
 183  0066 26a6          	jrne	L73
 184  0068               L55:
 185                     ; 70 } // scheduler_isr()
 188  0068 84            	pop	a
 189  0069 81            	ret
 225                     ; 78 void dispatch_tasks(void)
 225                     ; 79 {
 226                     	switch	.text
 227  006a               _dispatch_tasks:
 229  006a 88            	push	a
 230       00000001      OFST:	set	1
 233                     ; 80 	uint8_t  index = 0;
 235  006b 0f01          	clr	(OFST+0,sp)
 238  006d 2032          	jra	L101
 239  006f               L57:
 240                     ; 85 		if((task_list[index].Status & (TASK_READY | TASK_ENABLED)) == (TASK_READY | TASK_ENABLED))
 242  006f 7b01          	ld	a,(OFST+0,sp)
 243  0071 97            	ld	xl,a
 244  0072 a615          	ld	a,#21
 245  0074 42            	mul	x,a
 246  0075 e614          	ld	a,(_task_list+20,x)
 247  0077 a403          	and	a,#3
 248  0079 a103          	cp	a,#3
 249  007b 2622          	jrne	L501
 250                     ; 87 			task_list[index].pFunction(); // run the task
 252  007d 7b01          	ld	a,(OFST+0,sp)
 253  007f 97            	ld	xl,a
 254  0080 a615          	ld	a,#21
 255  0082 42            	mul	x,a
 256  0083 ee00          	ldw	x,(_task_list,x)
 257  0085 fd            	call	(x)
 259                     ; 88 			task_list[index].Status  &= ~TASK_READY; // reset the task when finished
 261  0086 7b01          	ld	a,(OFST+0,sp)
 262  0088 97            	ld	xl,a
 263  0089 a615          	ld	a,#21
 264  008b 42            	mul	x,a
 265  008c e614          	ld	a,(_task_list+20,x)
 266  008e a4fe          	and	a,#254
 267  0090 e714          	ld	(_task_list+20,x),a
 268                     ; 89 			task_list[index].Counter  = task_list[index].Period; // reset counter
 270  0092 7b01          	ld	a,(OFST+0,sp)
 271  0094 97            	ld	xl,a
 272  0095 a615          	ld	a,#21
 273  0097 42            	mul	x,a
 274  0098 9093          	ldw	y,x
 275  009a 90ee0e        	ldw	y,(_task_list+14,y)
 276  009d ef12          	ldw	(_task_list+18,x),y
 277  009f               L501:
 278                     ; 91 		index++;
 280  009f 0c01          	inc	(OFST+0,sp)
 282  00a1               L101:
 283                     ; 83 	while ((index < MAX_TASKS) && task_list[index].pFunction)
 285  00a1 7b01          	ld	a,(OFST+0,sp)
 286  00a3 a105          	cp	a,#5
 287  00a5 240c          	jruge	L701
 289  00a7 7b01          	ld	a,(OFST+0,sp)
 290  00a9 97            	ld	xl,a
 291  00aa a615          	ld	a,#21
 292  00ac 42            	mul	x,a
 293  00ad e601          	ld	a,(_task_list+1,x)
 294  00af ea00          	or	a,(_task_list,x)
 295  00b1 26bc          	jrne	L57
 296  00b3               L701:
 297                     ; 94 } // dispatch_tasks()
 300  00b3 84            	pop	a
 301  00b4 81            	ret
 397                     ; 104 uint8_t add_task(void (*task_ptr)(), char *Name, uint16_t delay, uint16_t period)
 397                     ; 105 {
 398                     	switch	.text
 399  00b5               _add_task:
 401  00b5 89            	pushw	x
 402  00b6 5205          	subw	sp,#5
 403       00000005      OFST:	set	5
 406                     ; 106 	uint8_t  index = 0;
 408  00b8 0f05          	clr	(OFST+0,sp)
 410                     ; 107 	uint16_t temp1 = (uint16_t)(delay  * TICKS_PER_SEC / 1000);
 412  00ba 1e0c          	ldw	x,(OFST+7,sp)
 413  00bc 1f01          	ldw	(OFST-4,sp),x
 415                     ; 108 	uint16_t temp2 = (uint16_t)(period * TICKS_PER_SEC / 1000);
 417  00be 1e0e          	ldw	x,(OFST+9,sp)
 418  00c0 1f03          	ldw	(OFST-2,sp),x
 420                     ; 110 	if (max_tasks >= MAX_TASKS) return ERR_MAX_TASKS;
 422  00c2 b600          	ld	a,_max_tasks
 423  00c4 a105          	cp	a,#5
 424  00c6 2506          	jrult	L361
 427  00c8 a605          	ld	a,#5
 429  00ca 201c          	jra	L02
 430  00cc               L161:
 431                     ; 112 	while ((index < MAX_TASKS) && task_list[index].Period) index++;
 433  00cc 0c05          	inc	(OFST+0,sp)
 435  00ce               L361:
 438  00ce 7b05          	ld	a,(OFST+0,sp)
 439  00d0 a105          	cp	a,#5
 440  00d2 240c          	jruge	L761
 442  00d4 7b05          	ld	a,(OFST+0,sp)
 443  00d6 97            	ld	xl,a
 444  00d7 a615          	ld	a,#21
 445  00d9 42            	mul	x,a
 446  00da e60f          	ld	a,(_task_list+15,x)
 447  00dc ea0e          	or	a,(_task_list+14,x)
 448  00de 26ec          	jrne	L161
 449  00e0               L761:
 450                     ; 113   if (index >= MAX_TASKS)     return ERR_MAX_TASKS;
 452  00e0 7b05          	ld	a,(OFST+0,sp)
 453  00e2 a105          	cp	a,#5
 454  00e4 2505          	jrult	L171
 457  00e6 a605          	ld	a,#5
 459  00e8               L02:
 461  00e8 5b07          	addw	sp,#7
 462  00ea 81            	ret
 463  00eb               L171:
 464                     ; 119 	if (task_list[index].Period == 0)
 466  00eb 7b05          	ld	a,(OFST+0,sp)
 467  00ed 97            	ld	xl,a
 468  00ee a615          	ld	a,#21
 469  00f0 42            	mul	x,a
 470  00f1 e60f          	ld	a,(_task_list+15,x)
 471  00f3 ea0e          	or	a,(_task_list+14,x)
 472  00f5 265c          	jrne	L371
 473                     ; 121 		task_list[index].pFunction    = task_ptr;       // Pointer to Function
 475  00f7 7b05          	ld	a,(OFST+0,sp)
 476  00f9 97            	ld	xl,a
 477  00fa a615          	ld	a,#21
 478  00fc 42            	mul	x,a
 479  00fd 1606          	ldw	y,(OFST+1,sp)
 480  00ff ef00          	ldw	(_task_list,x),y
 481                     ; 122 		task_list[index].Period       = temp2;          // Period in msec.
 483  0101 7b05          	ld	a,(OFST+0,sp)
 484  0103 97            	ld	xl,a
 485  0104 a615          	ld	a,#21
 486  0106 42            	mul	x,a
 487  0107 1603          	ldw	y,(OFST-2,sp)
 488  0109 ef0e          	ldw	(_task_list+14,x),y
 489                     ; 123 		task_list[index].Counter      = temp2;	        // Countdown timer
 491  010b 7b05          	ld	a,(OFST+0,sp)
 492  010d 97            	ld	xl,a
 493  010e a615          	ld	a,#21
 494  0110 42            	mul	x,a
 495  0111 1603          	ldw	y,(OFST-2,sp)
 496  0113 ef12          	ldw	(_task_list+18,x),y
 497                     ; 124 		task_list[index].Delay        = temp1;          // Initial delay before start
 499  0115 7b05          	ld	a,(OFST+0,sp)
 500  0117 97            	ld	xl,a
 501  0118 a615          	ld	a,#21
 502  011a 42            	mul	x,a
 503  011b 1601          	ldw	y,(OFST-4,sp)
 504  011d ef10          	ldw	(_task_list+16,x),y
 505                     ; 125 		task_list[index].Status      |= TASK_ENABLED;   // Enable task by default
 507  011f 7b05          	ld	a,(OFST+0,sp)
 508  0121 97            	ld	xl,a
 509  0122 a615          	ld	a,#21
 510  0124 42            	mul	x,a
 511  0125 e614          	ld	a,(_task_list+20,x)
 512  0127 aa02          	or	a,#2
 513  0129 e714          	ld	(_task_list+20,x),a
 514                     ; 126 		task_list[index].Status      &= ~TASK_READY;    // Task not ready to run
 516  012b 7b05          	ld	a,(OFST+0,sp)
 517  012d 97            	ld	xl,a
 518  012e a615          	ld	a,#21
 519  0130 42            	mul	x,a
 520  0131 e614          	ld	a,(_task_list+20,x)
 521  0133 a4fe          	and	a,#254
 522  0135 e714          	ld	(_task_list+20,x),a
 523                     ; 127 		strncpy(task_list[index].Name, Name, NAME_LEN); // Name of Task
 525  0137 ae000c        	ldw	x,#12
 526  013a 89            	pushw	x
 527  013b 1e0c          	ldw	x,(OFST+7,sp)
 528  013d 89            	pushw	x
 529  013e 7b09          	ld	a,(OFST+4,sp)
 530  0140 97            	ld	xl,a
 531  0141 a615          	ld	a,#21
 532  0143 42            	mul	x,a
 533  0144 01            	rrwa	x,a
 534  0145 ab02          	add	a,#_task_list+2
 535  0147 2401          	jrnc	L61
 536  0149 5c            	incw	x
 537  014a               L61:
 538  014a 5f            	clrw	x
 539  014b 97            	ld	xl,a
 540  014c cd0000        	call	_strncpy
 542  014f 5b04          	addw	sp,#4
 543                     ; 128 		max_tasks++; // increase number of tasks
 545  0151 3c00          	inc	_max_tasks
 546  0153               L371:
 547                     ; 130 	return NO_ERR;
 549  0153 4f            	clr	a
 551  0154 2092          	jra	L02
 607                     ; 138 uint8_t enable_task(char *Name)
 607                     ; 139 {
 608                     	switch	.text
 609  0156               _enable_task:
 611  0156 89            	pushw	x
 612  0157 89            	pushw	x
 613       00000002      OFST:	set	2
 616                     ; 140 	uint8_t index = 0;
 618  0158 0f02          	clr	(OFST+0,sp)
 620                     ; 141 	bool    found = false;
 622  015a 0f01          	clr	(OFST-1,sp)
 624                     ; 144 	if(task_list[index].Period != 0)
 626  015c be0e          	ldw	x,_task_list+14
 627  015e 2741          	jreq	L322
 629  0160 202d          	jra	L722
 630  0162               L522:
 631                     ; 148 			if (!strcmp(task_list[index].Name,Name))
 633  0162 1e03          	ldw	x,(OFST+1,sp)
 634  0164 89            	pushw	x
 635  0165 7b04          	ld	a,(OFST+2,sp)
 636  0167 97            	ld	xl,a
 637  0168 a615          	ld	a,#21
 638  016a 42            	mul	x,a
 639  016b 01            	rrwa	x,a
 640  016c ab02          	add	a,#_task_list+2
 641  016e 2401          	jrnc	L42
 642  0170 5c            	incw	x
 643  0171               L42:
 644  0171 5f            	clrw	x
 645  0172 97            	ld	xl,a
 646  0173 cd0000        	call	_strcmp
 648  0176 5b02          	addw	sp,#2
 649  0178 a30000        	cpw	x,#0
 650  017b 2610          	jrne	L332
 651                     ; 150 				task_list[index].Status |= TASK_ENABLED;
 653  017d 7b02          	ld	a,(OFST+0,sp)
 654  017f 97            	ld	xl,a
 655  0180 a615          	ld	a,#21
 656  0182 42            	mul	x,a
 657  0183 e614          	ld	a,(_task_list+20,x)
 658  0185 aa02          	or	a,#2
 659  0187 e714          	ld	(_task_list+20,x),a
 660                     ; 151 				found = true;
 662  0189 a601          	ld	a,#1
 663  018b 6b01          	ld	(OFST-1,sp),a
 665  018d               L332:
 666                     ; 153 			index++;
 668  018d 0c02          	inc	(OFST+0,sp)
 670  018f               L722:
 671                     ; 146 		while ((task_list[index].Period != 0) && !found)
 673  018f 7b02          	ld	a,(OFST+0,sp)
 674  0191 97            	ld	xl,a
 675  0192 a615          	ld	a,#21
 676  0194 42            	mul	x,a
 677  0195 e60f          	ld	a,(_task_list+15,x)
 678  0197 ea0e          	or	a,(_task_list+14,x)
 679  0199 270a          	jreq	L732
 681  019b 0d01          	tnz	(OFST-1,sp)
 682  019d 27c3          	jreq	L522
 683  019f 2004          	jra	L732
 684  01a1               L322:
 685                     ; 156 	else return ERR_EMPTY;
 687  01a1 a605          	ld	a,#5
 689  01a3 2006          	jra	L62
 690  01a5               L732:
 691                     ; 157 	if (!found)
 693  01a5 0d01          	tnz	(OFST-1,sp)
 694  01a7 2605          	jrne	L142
 695                     ; 158 	     return ERR_NAME;
 697  01a9 a604          	ld	a,#4
 699  01ab               L62:
 701  01ab 5b04          	addw	sp,#4
 702  01ad 81            	ret
 703  01ae               L142:
 704                     ; 159 	else return NO_ERR;	
 706  01ae 4f            	clr	a
 708  01af 20fa          	jra	L62
 764                     ; 167 uint8_t disable_task(char *Name)
 764                     ; 168 {
 765                     	switch	.text
 766  01b1               _disable_task:
 768  01b1 89            	pushw	x
 769  01b2 89            	pushw	x
 770       00000002      OFST:	set	2
 773                     ; 169 	uint8_t index = 0;
 775  01b3 0f02          	clr	(OFST+0,sp)
 777                     ; 170 	bool    found = false;
 779  01b5 0f01          	clr	(OFST-1,sp)
 781                     ; 173 	if(task_list[index].Period != 0)
 783  01b7 be0e          	ldw	x,_task_list+14
 784  01b9 2741          	jreq	L372
 786  01bb 202d          	jra	L772
 787  01bd               L572:
 788                     ; 177 			if (!strcmp(task_list[index].Name,Name))
 790  01bd 1e03          	ldw	x,(OFST+1,sp)
 791  01bf 89            	pushw	x
 792  01c0 7b04          	ld	a,(OFST+2,sp)
 793  01c2 97            	ld	xl,a
 794  01c3 a615          	ld	a,#21
 795  01c5 42            	mul	x,a
 796  01c6 01            	rrwa	x,a
 797  01c7 ab02          	add	a,#_task_list+2
 798  01c9 2401          	jrnc	L23
 799  01cb 5c            	incw	x
 800  01cc               L23:
 801  01cc 5f            	clrw	x
 802  01cd 97            	ld	xl,a
 803  01ce cd0000        	call	_strcmp
 805  01d1 5b02          	addw	sp,#2
 806  01d3 a30000        	cpw	x,#0
 807  01d6 2610          	jrne	L303
 808                     ; 179 				task_list[index].Status &= ~TASK_ENABLED;
 810  01d8 7b02          	ld	a,(OFST+0,sp)
 811  01da 97            	ld	xl,a
 812  01db a615          	ld	a,#21
 813  01dd 42            	mul	x,a
 814  01de e614          	ld	a,(_task_list+20,x)
 815  01e0 a4fd          	and	a,#253
 816  01e2 e714          	ld	(_task_list+20,x),a
 817                     ; 180 				found = true;
 819  01e4 a601          	ld	a,#1
 820  01e6 6b01          	ld	(OFST-1,sp),a
 822  01e8               L303:
 823                     ; 182 			index++;
 825  01e8 0c02          	inc	(OFST+0,sp)
 827  01ea               L772:
 828                     ; 175 		while ((task_list[index].Period != 0) && !found)
 830  01ea 7b02          	ld	a,(OFST+0,sp)
 831  01ec 97            	ld	xl,a
 832  01ed a615          	ld	a,#21
 833  01ef 42            	mul	x,a
 834  01f0 e60f          	ld	a,(_task_list+15,x)
 835  01f2 ea0e          	or	a,(_task_list+14,x)
 836  01f4 270a          	jreq	L703
 838  01f6 0d01          	tnz	(OFST-1,sp)
 839  01f8 27c3          	jreq	L572
 840  01fa 2004          	jra	L703
 841  01fc               L372:
 842                     ; 185 	else return ERR_EMPTY;
 844  01fc a605          	ld	a,#5
 846  01fe 2006          	jra	L43
 847  0200               L703:
 848                     ; 186 	if (!found)
 850  0200 0d01          	tnz	(OFST-1,sp)
 851  0202 2605          	jrne	L113
 852                     ; 187 	     return ERR_NAME;
 854  0204 a604          	ld	a,#4
 856  0206               L43:
 858  0206 5b04          	addw	sp,#4
 859  0208 81            	ret
 860  0209               L113:
 861                     ; 188 	else return NO_ERR;	
 863  0209 4f            	clr	a
 865  020a 20fa          	jra	L43
 931                     ; 197 uint8_t set_task_time_period(uint16_t Period, char *Name)
 931                     ; 198 {
 932                     	switch	.text
 933  020c               _set_task_time_period:
 935  020c 89            	pushw	x
 936  020d 89            	pushw	x
 937       00000002      OFST:	set	2
 940                     ; 199 	uint8_t index = 0;
 942  020e 0f02          	clr	(OFST+0,sp)
 944                     ; 200 	bool    found = false;
 946  0210 0f01          	clr	(OFST-1,sp)
 948                     ; 203 	if(task_list[index].Period != 0)
 950  0212 be0e          	ldw	x,_task_list+14
 951  0214 273f          	jreq	L743
 953  0216 202b          	jra	L353
 954  0218               L153:
 955                     ; 207 			if (!strcmp(task_list[index].Name,Name))
 957  0218 1e07          	ldw	x,(OFST+5,sp)
 958  021a 89            	pushw	x
 959  021b 7b04          	ld	a,(OFST+2,sp)
 960  021d 97            	ld	xl,a
 961  021e a615          	ld	a,#21
 962  0220 42            	mul	x,a
 963  0221 01            	rrwa	x,a
 964  0222 ab02          	add	a,#_task_list+2
 965  0224 2401          	jrnc	L04
 966  0226 5c            	incw	x
 967  0227               L04:
 968  0227 5f            	clrw	x
 969  0228 97            	ld	xl,a
 970  0229 cd0000        	call	_strcmp
 972  022c 5b02          	addw	sp,#2
 973  022e a30000        	cpw	x,#0
 974  0231 260e          	jrne	L753
 975                     ; 209 				task_list[index].Period = (uint16_t)(Period * TICKS_PER_SEC / 1000);
 977  0233 7b02          	ld	a,(OFST+0,sp)
 978  0235 97            	ld	xl,a
 979  0236 a615          	ld	a,#21
 980  0238 42            	mul	x,a
 981  0239 1603          	ldw	y,(OFST+1,sp)
 982  023b ef0e          	ldw	(_task_list+14,x),y
 983                     ; 210 				found = true;
 985  023d a601          	ld	a,#1
 986  023f 6b01          	ld	(OFST-1,sp),a
 988  0241               L753:
 989                     ; 212 			index++;
 991  0241 0c02          	inc	(OFST+0,sp)
 993  0243               L353:
 994                     ; 205 		while ((task_list[index].Period != 0) && !found)
 996  0243 7b02          	ld	a,(OFST+0,sp)
 997  0245 97            	ld	xl,a
 998  0246 a615          	ld	a,#21
 999  0248 42            	mul	x,a
1000  0249 e60f          	ld	a,(_task_list+15,x)
1001  024b ea0e          	or	a,(_task_list+14,x)
1002  024d 270a          	jreq	L363
1004  024f 0d01          	tnz	(OFST-1,sp)
1005  0251 27c5          	jreq	L153
1006  0253 2004          	jra	L363
1007  0255               L743:
1008                     ; 215 	else return ERR_EMPTY;
1010  0255 a605          	ld	a,#5
1012  0257 2006          	jra	L24
1013  0259               L363:
1014                     ; 216 	if (!found)
1016  0259 0d01          	tnz	(OFST-1,sp)
1017  025b 2605          	jrne	L563
1018                     ; 217 	     return ERR_NAME;
1020  025d a604          	ld	a,#4
1022  025f               L24:
1024  025f 5b04          	addw	sp,#4
1025  0261 81            	ret
1026  0262               L563:
1027                     ; 218 	else return NO_ERR;	
1029  0262 4f            	clr	a
1031  0263 20fa          	jra	L24
1123                     	xdef	_max_tasks
1124                     	switch	.ubsct
1125  0000               _task_list:
1126  0000 000000000000  	ds.b	105
1127                     	xdef	_task_list
1128                     	xdef	_disable_task
1129                     	xdef	_enable_task
1130                     	xdef	_set_task_time_period
1131                     	xdef	_add_task
1132                     	xdef	_dispatch_tasks
1133                     	xdef	_scheduler_isr
1134                     	xdef	_scheduler_init
1135                     	xref	_strcmp
1136                     	xref	_strncpy
1156                     	end
