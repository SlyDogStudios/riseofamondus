map_line_lo:
	.byte <map_line1,<map_line3,<map_line4,<map_line5,<map_line6,<map_line7,<map_line8
map_line_hi:
	.byte >map_line1,>map_line3,>map_line4,>map_line5,>map_line6,>map_line7,>map_line8
map_end_lo:
	.byte <map_line2e,<map_line3,<map_line4,<map_line5,<map_line2e,<map_line2e,<map_line2e
map_end_hi:
	.byte >map_line2e,>map_line3,>map_line4,>map_line5,>map_line2e,>map_line2e,>map_line2e
map_addy_lo:
	.byte $6c,$2c,$4c,$67,$07,$87,$c7
map_addy_hi:
	.byte $20,$21,$21,$21,$22,$22,$22
map_line1:
	.byte "LEVEL"
	.byte $ff
map_line2a:
	.byte " CANOPY"
	.byte $ff
map_line2b:
	.byte " BRIDGE"
	.byte $ff
map_line2c:
	.byte "GRAVEYARD"
	.byte $ff
map_line2d:
	.byte "ELDERWOOD"
map_line2e:
	.byte $ff
map_line3:
	.byte $05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f,$03,$13,$14
	.byte $ff
map_line4:
	.byte $15,$00,$17,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f,$00,$01,$02
	.byte $ff
map_line5:
	.byte $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f,$10,$11,$12
	.byte $ff
map_line6:
	.byte "CAPTURE    GOBLINS"
	.byte $ff
map_line7:
	.byte "LIVES"
	.byte $ff
map_line8:
	.byte "SCORE"
	.byte $ff

map_attr_lo:
	.byte $c3,$c4,$cb,$cc,$cd,$d3,$d4,$d5,$d6,$e1,$e2,$e3,$e4,$e5,$e6,$e9,$ea,$ec,$ed,$ee
map_attr:
	.byte $f0,$f0,$0f,$0f,$0f,$05,$55,$95,$20,$0c,$0f,$0f,$0f,$0f,$03,$cc,$ff,$c0,$f0,$33

level_number:
	.byte $31,$32,$33,$34,$00
level_name_lo:
	.byte <map_line2a,<map_line2b,<map_line2c,<map_line2d,<map_line2e
level_name_hi:
	.byte >map_line2a,>map_line2b,>map_line2c,>map_line2d,>map_line2e
level_sprite_y:
	.byte $40,$4c,$54,$54,$f0
level_sprite_x:
	.byte $5c,$64,$34,$a4,$00

load_map:
		ldx #$00
@more:
	lda level
	cmp #$04
	bne :+
		lda map_end_lo, x
		sta temp_16bit_1+0
		lda map_end_hi, x
		sta temp_16bit_1+1
		jmp :++
:	lda map_line_lo, x
	sta temp_16bit_1+0
	lda map_line_hi, x
	sta temp_16bit_1+1
:	lda map_addy_hi, x
	sta $2006
	lda map_addy_lo, x
	sta $2006
	ldy #$00
:	lda (temp_16bit_1), y
	cmp #$ff
	beq :+
		sta $2007
		iny
		jmp :-
:	inx
	cpx #$07
	bne @more;:----

	ldx level
	cpx #$04
	bne :+
		jmp @attr
:	lda level_name_lo, x
	sta temp_16bit_1+0
	lda level_name_hi, x
	sta temp_16bit_1+1
	lda #$20
	sta $2006
	lda #$73
	sta $2006
	lda level_number, x
	sta $2007
	ldy #$00
	lda #$20
	sta $2006
	lda #$ac
	sta $2006
:	lda (temp_16bit_1), y
	cmp #$ff
	beq :+
		sta $2007
		iny
		bne :-
:	lda #$22
	sta $2006
	lda #$0f
	sta $2006
	lda goblin_tens
	bne :+
		lda #$00
		sta $2007
		beq :++
:	clc
	adc #$30	;level_tens, x
	sta $2007
:	lda goblin_ones
	clc
	adc #$30	;level_ones, x
	sta $2007
	lda #$22
	sta $2006
	lda #$98
	sta $2006
	lda lives
	cmp #$09
	bcc :+
		lda #$09
:	clc
	adc #$30
	sta $2007
	lda lives
	cmp #$0a
	bcc :+
		lda #$5d
		sta $2007
:


	lda #$22
	sta $2006
	lda #$d0
	sta $2006
	jsr write_score

@attr:
	ldy #$00
:	lda #$23
	sta $2006
	lda map_attr_lo, y
	sta $2006
	lda map_attr, y
	sta $2007
	iny
	cpy #$14
	bne :-
	
	lda #$c0
	sta temp_8bit_1
	ldy #$00
:	lda #$23
	sta $2006
	lda temp_8bit_1
	sta $2006
	lda #$ff
	sta $2007
	inc temp_8bit_1
	iny
	cpy #$10
	bne :-

	lda level_sprite_y, x
	sta r_left_side
	sta r_right_side
	lda level_sprite_x, x
	sta r_left_side+3
	clc
	adc #$28
	sta r_right_side+3
	lda #$05
	sta r_left_side+1
	sta r_right_side+1
	lda #$01
	sta r_left_side+2
	lda #$41
	sta r_right_side+2


	lda level
	cmp #$04
	bne set_map_pointers
		ldx #$00
		stx e_x_fine
		stx flash_grave
		stx e_move_count
		stx hold_y
		stx dead_count
		stx temp_8bit_2
:		lda end_spr, x
		sta raven1, x
		inx
		cpx #56
		bne :-
		lda #$20
		sta ppu_addy+1
		lda #$63
		sta ppu_addy+0
		ldx #1
		jmp return_music_routine
return_story:
		lda #<loop_end1
		sta loop_pointer+0
		lda #>loop_end1
		sta loop_pointer+1
		lda #<nmi_end1
		sta nmi_addy+0
		lda #>nmi_end1
		sta nmi_addy+1
		jmp :+
set_map_pointers:
	lda #<loop_map
	sta loop_pointer+0
	lda #>loop_map
	sta loop_pointer+1
	lda #<nmi_map
	sta nmi_addy+0
	lda #>nmi_map
	sta nmi_addy+1
:
	lda #$00
	sta scroll_x
	sta scroll_y
:	bit $2002
	bpl :-

	lda #$20
	sta nametable

	lda #$ff
	sta temp_8bit_1

	lda #%10101000
	sta $2000
	sta save2000
	lda #%00011000
	sta $2001
	jsr nmi_wait

	ldx #$00
:	lda pal_map, x
	sta pal_address, x
	inx
	cpx #32
	bne :-
	lda level
	cmp #$04
	bne :+
		lda #$11
		sta pal_address+22
		lda #$36
		sta pal_address+23
		lda #$13
		sta pal_address+25
		lda #$23
		sta pal_address+26
		lda #$05
		sta pal_address+29
		lda #$15
		sta pal_address+30
		lda #$30
		sta pal_address+31
:
	jmp end_loop

loop_map:
	dec temp_8bit_1
	lda temp_8bit_1
	bne :+
		lda #$00
		sta on_map
		jmp clear_it2
:
	jsr flicker_em
	jsr palette_animation_routine
	jmp end_loop
nmi_map:
	jmp end_nmi

write_score:
	lda score_millions
	bne :+
		lda #$00
		sta $2007
		sta $2007
		beq :++
:	clc
	adc #$30
	sta $2007
	lda #$3c
	sta $2007
	
:	lda score_hun_thousands
	bne :+
		lda score_millions
		bne :+
			lda #$00
			sta $2007
			beq :++
:	lda score_hun_thousands
	clc
	adc #$30
	sta $2007
:	lda score_ten_thousands
	bne :+
		lda score_hun_thousands
		bne :+
			lda score_millions
			bne :+
				lda #$00
				sta $2007
				beq :++
:	lda score_ten_thousands
	clc
	adc #$30
	sta $2007
:	lda score_thousands
	bne :+
		lda score_ten_thousands
		bne :+
			lda score_hun_thousands
			bne :+
				lda score_millions
				bne :+
					lda #$00
					sta $2007
					sta $2007
					beq :++
:	lda score_thousands
	clc
	adc #$30
	sta $2007
	lda #$3c
	sta $2007
:	lda score_hundreds
	bne :+
		lda score_thousands
		bne :+
			lda score_ten_thousands
			bne :+
				lda score_hun_thousands
				bne :+
					lda score_millions
					bne :+
						lda #$00
						sta $2007
						beq :++
:	lda score_hundreds
	clc
	adc #$30
	sta $2007
:	lda score_tens
	bne :+
		lda score_hundreds
		bne :+
			lda score_thousands
			bne :+
				lda score_ten_thousands
				bne :+
					lda score_hun_thousands
					bne :+
						lda score_millions
						bne :+
							lda #$00
							sta $2007
							beq :++
:	lda score_tens
	clc
	adc #$30
	sta $2007
:	lda score_ones
	clc
	adc #$30
	sta $2007
	rts


;write_score_hi:
;	lda hi_mills
;	bne :+
;		lda #$00
;		sta $2007
;		sta $2007
;		beq :++
;:	clc
;	adc #$30
;	sta $2007
;	lda #$3c
;	sta $2007
;	
;:	lda hi_hun_thous
;	bne :+
;		lda hi_mills
;		bne :+
;			lda #$00
;			sta $2007
;			beq :++
;:	lda hi_hun_thous
;	clc
;	adc #$30
;	sta $2007
;:	lda hi_ten_thous
;	bne :+
;		lda hi_hun_thous
;		bne :+
;			lda hi_mills
;			bne :+
;				lda #$00
;				sta $2007
;				beq :++
;:	lda hi_ten_thous
;	clc
;	adc #$30
;	sta $2007
;:	lda hi_thous
;	bne :+
;		lda hi_ten_thous
;		bne :+
;			lda hi_hun_thous
;			bne :+
;				lda hi_mills
;				bne :+
;					lda #$00
;					sta $2007
;					sta $2007
;					beq :++
;:	lda hi_thous
;	clc
;	adc #$30
;	sta $2007
;	lda #$3c
;	sta $2007
;:	lda hi_huns
;	bne :+
;		lda hi_thous
;		bne :+
;			lda hi_ten_thous
;			bne :+
;				lda hi_hun_thous
;				bne :+
;					lda hi_mills
;					bne :+
;						lda #$00
;						sta $2007
;						beq :++
;:	lda hi_huns
;	clc
;	adc #$30
;	sta $2007
;:	lda hi_tens
;	bne :+
;		lda hi_huns
;		bne :+
;			lda hi_thous
;			bne :+
;				lda hi_ten_thous
;				bne :+
;					lda hi_hun_thous
;					bne :+
;						lda hi_mills
;						bne :+
;							lda #$00
;							sta $2007
;							beq :++
;:	lda hi_tens
;	clc
;	adc #$30
;	sta $2007
;:	lda hi_ones
;	clc
;	adc #$30
;	sta $2007
;	rts

; stuff for NOT ENOUGH GOBLINS at the end of the levels
gob_lo:
	.byte $04,$24,$44,$64
gob1_clear_lo:
	.byte <gob_empty,<gob_empty,<gob_empty,<gob_empty
gob1_clear_hi:
	.byte >gob_empty,>gob_empty,>gob_empty,>gob_empty
gob_empty:
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
gob_words:
	.byte "NOT ENOUGH GOBLINS!"

nmi_gob:
	lda end_level_switch
	cmp #$04
	beq @second
		cmp #$05
		beq @third
			cmp #$06
			bne :+
				jmp @all_done
:		tax
		lda gob1_clear_lo, x
		sta temp_16bit_1+0
		lda gob1_clear_hi, x
		sta temp_16bit_1+1
		lda level
		beq :+
			cmp #$02
			beq :+
				lda #$25
				sta $2006
				bne :++
:		lda #$21
		sta $2006
:		lda gob_lo, x
		sta $2006
		ldy #$00
:		lda (temp_16bit_1), y
		sta $2007
		iny
		cpy #$18
		bne :-
			inx
			stx end_level_switch
			jmp @done
@second:
	ldx #$00
	lda level
	beq :+
		cmp #$02
		beq :+
			lda #$27
			sta $2006
			bne :++
:	lda #$23
	sta $2006
:	lda #$d1
	sta $2006
	lda #$aa
:	sta $2007
	inx
	cpx #$06
	bne :-
		inc end_level_switch
		jmp @done
@third:
	ldx #$00
	lda level
	beq :+
		cmp #$02
		beq :+
			lda #$25
			sta $2006
			bne :++
:	lda #$21
	sta $2006
:	lda #$27
	sta $2006
:	lda gob_words, x
	sta $2007
	inx
	cpx #$13
	bne :-
		inc end_level_switch
		jmp @done
@all_done:
	lda #$ff
	sta temp_8bit_1
	lda #<loop_gob_wait
	sta loop_pointer+0
	lda #>loop_gob_wait
	sta loop_pointer+1
	lda #<nmi_map
	sta nmi_addy+0
	lda #>nmi_map
	sta nmi_addy+1
@done:
	jmp end_nmi
loop_gob_wait:
	dec temp_8bit_1
	lda temp_8bit_1
	bne :+
		jmp clear_it
:
	jmp end_loop
loop_nothing:
	lda #$f0
	sta evil
	sta evil2
	sta g_left_side
	sta g_right_side
	jsr flicker_em
	jmp end_loop

tree_open_spr:
	.byte $2f,$7e,$03,$de
	.byte $2f,$7e,$03,$e6
	.byte $2f,$7e,$03,$ee
	.byte $2f,$7e,$03,$f6
loop_tree_open:
	dec temp_8bit_2
	lda temp_8bit_2
	beq done_open
	cmp #$78
	beq :+
		jmp end_loop
:		ldx #$1b
		jmp return_sfx_routine
return_open:
		ldx #$00
:		lda tree_open_spr, x
		sta mm1, x
		inx
		cpx #16
		bne :-
		jsr flicker_em
		jmp end_loop
done_open:
	jmp clear_it
;	jmp end_loop
