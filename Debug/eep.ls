   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2580                     ; 33 uint16_t eeprom_read_config(uint8_t eeprom_address)
2580                     ; 34 {
2582                     	switch	.text
2583  0000               _eeprom_read_config:
2585  0000 5204          	subw	sp,#4
2586       00000004      OFST:	set	4
2589                     ; 36   char    *address = (char *)EEP_BASE_ADDR; //  EEPROM base address.
2591  0002 ae4000        	ldw	x,#16384
2592  0005 1f01          	ldw	(OFST-3,sp),x
2594                     ; 38 	address += (eeprom_address << 1); // convert to byte-address in EEPROM
2596  0007 5f            	clrw	x
2597  0008 97            	ld	xl,a
2598  0009 58            	sllw	x
2599  000a 72fb01        	addw	x,(OFST-3,sp)
2600  000d 1f01          	ldw	(OFST-3,sp),x
2602                     ; 39   data      = *address++;           // read MSB first
2604  000f 1e01          	ldw	x,(OFST-3,sp)
2605  0011 1c0001        	addw	x,#1
2606  0014 1f01          	ldw	(OFST-3,sp),x
2607  0016 1d0001        	subw	x,#1
2609  0019 f6            	ld	a,(x)
2610  001a 5f            	clrw	x
2611  001b 97            	ld	xl,a
2612  001c 1f03          	ldw	(OFST-1,sp),x
2614                     ; 40   data    <<= 8;                    // SHL 8
2616  001e 7b04          	ld	a,(OFST+0,sp)
2617  0020 6b03          	ld	(OFST-1,sp),a
2618  0022 0f04          	clr	(OFST+0,sp)
2620                     ; 41 	data     |= *address;             // read LSB
2622  0024 1e01          	ldw	x,(OFST-3,sp)
2623  0026 f6            	ld	a,(x)
2624  0027 5f            	clrw	x
2625  0028 97            	ld	xl,a
2626  0029 01            	rrwa	x,a
2627  002a 1a04          	or	a,(OFST+0,sp)
2628  002c 01            	rrwa	x,a
2629  002d 1a03          	or	a,(OFST-1,sp)
2630  002f 01            	rrwa	x,a
2631  0030 1f03          	ldw	(OFST-1,sp),x
2633                     ; 42 	return data;                      // Return result
2635  0032 1e03          	ldw	x,(OFST-1,sp)
2638  0034 5b04          	addw	sp,#4
2639  0036 81            	ret
2696                     ; 52 void eeprom_write_config(uint8_t eeprom_address,uint16_t data)
2696                     ; 53 {
2697                     	switch	.text
2698  0037               _eeprom_write_config:
2700  0037 88            	push	a
2701  0038 89            	pushw	x
2702       00000002      OFST:	set	2
2705                     ; 54     char *address = (char *)EEP_BASE_ADDR; //  EEPROM base address.
2707  0039 ae4000        	ldw	x,#16384
2708  003c 1f01          	ldw	(OFST-1,sp),x
2710                     ; 57     if (data == eeprom_read_config(eeprom_address)) return;
2712  003e adc0          	call	_eeprom_read_config
2714  0040 1306          	cpw	x,(OFST+4,sp)
2715  0042 272a          	jreq	L01
2718                     ; 59     address += (eeprom_address << 1); // convert to byte-address in EEPROM
2720  0044 7b03          	ld	a,(OFST+1,sp)
2721  0046 5f            	clrw	x
2722  0047 97            	ld	xl,a
2723  0048 58            	sllw	x
2724  0049 72fb01        	addw	x,(OFST-1,sp)
2725  004c 1f01          	ldw	(OFST-1,sp),x
2727                     ; 63         FLASH_DUKR = 0xae;
2729  004e 35ae5064      	mov	_FLASH_DUKR,#174
2730                     ; 64         FLASH_DUKR = 0x56;
2732  0052 35565064      	mov	_FLASH_DUKR,#86
2733                     ; 67     *address++ = (char)((data >> 8) & 0xff); // write MSB
2735  0056 7b06          	ld	a,(OFST+4,sp)
2736  0058 1e01          	ldw	x,(OFST-1,sp)
2737  005a 1c0001        	addw	x,#1
2738  005d 1f01          	ldw	(OFST-1,sp),x
2739  005f 1d0001        	subw	x,#1
2741  0062 f7            	ld	(x),a
2742                     ; 68     *address   = (char)(data & 0xff);        // write LSB
2744  0063 7b07          	ld	a,(OFST+5,sp)
2745  0065 a4ff          	and	a,#255
2746  0067 1e01          	ldw	x,(OFST-1,sp)
2747  0069 f7            	ld	(x),a
2748                     ; 69     FLASH_IAPSR &= ~DUL;                     // write-protect EEPROM again
2750  006a 7217505f      	bres	_FLASH_IAPSR,#3
2751                     ; 70 } // eeprom_write_config()
2752  006e               L01:
2755  006e 5b03          	addw	sp,#3
2756  0070 81            	ret
2769                     	xdef	_eeprom_write_config
2770                     	xdef	_eeprom_read_config
2789                     	end
