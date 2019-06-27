reset:
	sei
	ldx #$00
	stx $4015
	ldx #$40
	stx $4017
	ldx #$ff
	txs
	inx
	stx $2000
	stx save2000
	stx $2001

:	lda #$00
	sta $000, x
	sta $100, x
	sta $300, x
	sta $500, x
	sta $600, x
	sta $700, x
	lda #$f0
	sta $200, x
	sta $400, x
	inx
	bne :-

:	bit $2002
	bpl :-

;	jsr CopyFlashRoutine

	ldy #2
	jsr bank_save
	jsr decompress_title

	lda #$3f
	sta $2006
	ldx #$00
	stx $2006
:	lda palette_title, x
	sta $2007
	sta pal_address, x
	inx
	cpx #$11
	bne :-

	lda #$02
	sta temp_16bit_2+1
	lda #$20
	sta nametable



	lda #<loop_title
	sta loop_pointer+0
	lda #>loop_title
	sta loop_pointer+1
	lda #<nmi_nothing
	sta nmi_addy+0
	lda #>nmi_nothing
	sta nmi_addy+1

	ldx #$00
	stx level
;	ldx #$01
;	stx boss_switch
	lda #$08
	sta anim_ticker
	lda #$20
	sta kyr_speed
	lda #$02
	sta lives
	sta eye_speed
	sta lightning_speed
	sta rain_speed

	ldx #$10
	jmp return_music_routine
return_level2:

	lda #$00
	sta scroll_x
	sta scroll_y
	sta $2005
	sta $2005

:	bit $2002
	bpl :-

	lda #%10101000
	sta $2000
	sta save2000
	lda #%00011000
	sta $2001
	jsr nmi_wait

;	jmp clear_it
;	lda nmi_num						; Wait for an NMI to happen before running
;:	cmp nmi_num						; the main loop again
;	beq :-							;
