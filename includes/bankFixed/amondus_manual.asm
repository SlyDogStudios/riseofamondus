loop_chr_load_change:
	ldx temp_8bit_1
	lda chr_load_lo, x
	sta temp_16bit_1+0
	lda chr_load_hi, x
	sta temp_16bit_1+1
	ldy chr_bank, x
	jsr bank_save

	ldy #0
	sty $2006
	sty $2006
	ldx #16
:
	lda (temp_16bit_1), y
	sta $2007
	iny
	bne :-
		inc temp_16bit_1+1
		dex
		bne :-
	ldx temp_8bit_1
	lda nam_load_lo, x
	sta temp_16bit_1+0
	lda nam_load_hi, x
	sta temp_16bit_1+1
	ldy nam_bank, x
	jsr bank_save

	ldy #$00
	ldx #$04
	lda #$20
	sta $2006
	lda #$00
	sta $2006
:	lda (temp_16bit_1),y
	sta $2007
	iny
	bne :-
		inc temp_16bit_1+1
		dex
		bne :-
;	jmp loop_manual
:	bit $2002
	bpl :-
	lda #$00
	sta $2006
	sta $2006
	lda #%10001000
	sta $2000
	lda #%00011010
	sta $2001
		jsr nmi_wait
		lda #<loop_manual
		sta loop_pointer+0
		lda #>loop_manual
		sta loop_pointer+1
	jmp end_loop

chr_bank:
	.byte                 5,                5,                4
	.byte                 5,                5,                5
	.byte                 4,                5,                5
	.byte                 5,                5,                5
	.byte                 5,                5,                4
	.byte                 4,                4,                4
	.byte                 5,                4,                5
	.byte                 4
chr_load_lo:
	.byte  <manual_chr3, <manual_chr6, <manual_chr3
	.byte  <manual_chr3, <manual_chr3, <manual_chr3
	.byte  <manual_chr1, <manual_chr3, <manual_chr3
	.byte  <manual_chr3, <manual_chr4, <manual_chr4
	.byte  <manual_chr3, <manual_chr3, <manual_chr1
	.byte  <manual_chr1, <manual_chr1, <manual_chr1
	.byte  <manual_chr3, <manual_chr1, <manual_chr5
	.byte  <manual_chr2
chr_load_hi:
	.byte  >manual_chr3, >manual_chr6, >manual_chr3
	.byte  >manual_chr3, >manual_chr3, >manual_chr3
	.byte  >manual_chr3, >manual_chr3, >manual_chr3
	.byte  >manual_chr1, >manual_chr4, >manual_chr4
	.byte  >manual_chr3, >manual_chr3, >manual_chr1
	.byte  >manual_chr1, >manual_chr1, >manual_chr1
	.byte  >manual_chr3, >manual_chr1, >manual_chr5
	.byte  >manual_chr2
nam_bank:
	.byte                 3,                3,                3
	.byte                 3,                3,                3
	.byte                 3,                3,                3
	.byte                 3,                3,                3
	.byte                 3,                3,                3
	.byte                 3,                4,                4
	.byte                 4,                4,                4
	.byte                 4
nam_load_lo:
	.byte            <page00,          <page01,         <page02
	.byte            <page03,          <page04,         <page05
	.byte            <page06,          <page07,         <page08
	.byte            <page09,          <page10,         <page11
	.byte            <page12,          <page13,         <page14
	.byte            <page15,          <page16,         <page17
	.byte            <page18,          <page19,         <page20
	.byte            <page21
nam_load_hi:
	.byte            >page00,          >page01,         >page02
	.byte            >page03,          >page04,         >page05
	.byte            >page06,          >page07,         >page08
	.byte            >page09,          >page10,         >page11
	.byte            >page12,          >page13,         >page14
	.byte            >page15,          >page16,         >page17
	.byte            >page18,          >page19,         >page20
	.byte            >page21

loop_manual:
	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq :+++
		ldx temp_8bit_1
		beq :+++
			dex
			stx temp_8bit_1
		lda #$0f
:		sta pal_address, x
		inx
		cpx #$20
		bne :-
		jsr nmi_wait
		lda #$00
		sta $2000
		sta $2001
		lda #$3f
		sta $2006
		lda #$00
		sta $2006
		lda #$0f
:		sta $2007
		inx
		cpx #$20
		bne :-
		jmp loop_chr_load_change
		jmp end_loop
:
	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq :+++
		ldx temp_8bit_1
		cpx #21
		beq :+++
			inx
			stx temp_8bit_1
		lda #$0f
:		sta pal_address, x
		inx
		cpx #$20
		bne :-
		jsr nmi_wait
		lda #$00
		sta $2000
		sta $2001
		lda #$3f
		sta $2006
		lda #$00
		sta $2006
		lda #$0f
:		sta $2007
		inx
		cpx #$20
		bne :-
		jmp loop_chr_load_change
:
	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq :+
		jmp reset
:
	lda temp_8bit_1				; TELLS WHICH PAGE YOU ARE ON
	beq :+
	cmp #$01
	beq :++++
	cmp #21
	bne :++
:		lda #$0f
		sta pal_address+0
		sta pal_address+16
		lda #$00
		sta pal_address+1
		lda #$10
		sta pal_address+2
		lda #$30
		sta pal_address+3
		sta pal_address+5
		jmp end_loop
:
	ldx #$00
:	lda pal_manual, x
	sta pal_address, x
	inx
	cpx #$11
	bne :-
	jmp end_loop
:	lda #$0f
	sta pal_address+0
	sta pal_address+4
	sta pal_address+8
	sta pal_address+12
	lda #$30
	sta pal_address+2
	lda #$05
	sta pal_address+3
	jmp end_loop

pal_cover:
;	.incbin "includes\bankFixed\manual_cover.pal"