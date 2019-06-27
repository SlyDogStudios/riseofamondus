
mapping_lo:
;	.byte 
mapping_hi:
;	.byte 



nametable1:
	.incbin "includes\bank02\title1.rle"
	.byte $00
nametable2:
	.incbin "includes\bank02\title2.rle"
	.byte $00
nametable3:
	.incbin "includes\bank02\title3.rle"
	.byte $00
nametable4:
	.incbin "includes\bank02\title4.rle"
	.byte $00
nt_rle_lo:
	.byte <nametable1,<nametable2,<nametable3,<nametable4
nt_rle_hi:
	.byte >nametable1,>nametable2,>nametable3,>nametable4
ppu_rle_hi:
	.byte $20,$21,$22,$23



decompress_title:
	lda #<the_chr
	sta temp_16bit_1
	lda #>the_chr
	sta temp_16bit_1+1
 	ldy #0
	sty $2006
	sty $2006
	ldx #32
chr_load_loop:
	lda (temp_16bit_1), y
	sta $2007
	iny
	bne chr_load_loop
	inc temp_16bit_1+1
	dex
	bne chr_load_loop

;	ldy #$00
;	ldx #$04
;	lda #<title_nam
;	sta temp_16bit_1+0
;	lda #>title_nam
;	sta temp_16bit_1+1
;	lda #$20
;	sta $2006
;	lda #$00
;	sta $2006
;:	lda (temp_16bit_1),y
;	sta $2007
;	iny
;	bne :-
;	inc temp_16bit_1+1
;	dex
;	bne :-
@start_decompress:
	ldx temp_8bit_1
	lda nt_rle_lo, x
	sta ppu_addy+0
	lda nt_rle_hi, x
	sta ppu_addy+1
	ldy #$00
	lda ppu_rle_hi, x	;#$20
	sta $2006
	lda #$00
	sta $2006
:	lda (ppu_addy), y
	beq @finito
		tax
		iny
		tya
		pha
		lda (ppu_addy), y
:		sta $2007
		dex
		bne :-
			pla
			tay
			iny
			bne :--
@finito:
	ldx temp_8bit_1
	inx
	stx temp_8bit_1
	cpx #$04
	bne @start_decompress
	rts
palette_title:
	.incbin "includes\bank02\amondus_title.pal"
	.byte $0f

loop_title:
	lda temp_16bit_3+1
	cmp #$01
	bne :+
		jmp invasion_init
:
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq no_select_the_manual
		ldx #$00
		stx temp_8bit_1
		lda #$0f
:		sta pal_address, x
		inx
		cpx #$20
		bne :-
		ldx #$11
		jmp return_music_routine
return_stop_title1:
	jsr nmi_wait
:	bit $2002
	bpl :-
		lda #$00
		sta $2000
		sta $2001
		jmp loop_chr_load_change
no_select_the_manual:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq no_start
		lda #<loop_title_start
		sta loop_pointer+0
		lda #>loop_title_start
		sta loop_pointer+1
		lda #$ff
		sta temp_8bit_1
		ldx #2
		jmp return_music_routine
return_startit:
		jmp end_loop
no_start:
	jsr test_secret_controller_code
	jmp end_loop

nmi_title:
;	dec temp_16bit_2
;	lda temp_16bit_2
;	bne :+
;	lda #$24
;	sta nametable
;:
	jmp end_nmi

loop_title_start:
	dec temp_8bit_1
	lda temp_8bit_1
	bne @going
;		ldx #$00
;		lda #$0f
;:		sta pal_address, x
;		inx
;		cpx #32
;		bne :-
;		jsr nmi_wait
;		lda #$00
;		sta $2000
;		sta $2001
		jmp clear_it
@going:
	jmp end_loop

loop_load_map:

	jmp loop_load_map


