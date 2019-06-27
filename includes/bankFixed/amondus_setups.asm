load_level_music:
	ldx level
	lda level_song_list, x
	tax
	jmp return_music_routine
return_level1:
	rts


loop_load_level:
	lda lay_tiles
	cmp #$01
	bne more_tiles
				lda #<loop_gameplay
				sta loop_pointer+0
				lda #>loop_gameplay
				sta loop_pointer+1
			jsr load_level_music
		jmp end_loop
more_tiles:
	jsr ready_tiles
	jmp end_loop

ready_tiles:
	ldy level
	lda level_lo, y
	sta level_pointer+0
	lda level_hi, y
	sta level_pointer+1

	ldy level_offset
	lda (level_pointer), y
	tay
	lda tile32_a, y
	tax
		lda tile16_a, x
		sta store_meta_16
		lda tile16_b, x
		sta store_meta_16+1
		lda tile16_c, x
		sta store_meta_16+4
		lda tile16_d, x
		sta store_meta_16+5
	lda tile32_b, y
	tax
		lda tile16_a, x
		sta store_meta_16+2
		lda tile16_b, x
		sta store_meta_16+3
		lda tile16_c, x
		sta store_meta_16+6
		lda tile16_d, x
		sta store_meta_16+7
	lda tile32_c, y
	tax
		lda tile16_a, x
		sta store_meta_16+8
		lda tile16_b, x
		sta store_meta_16+9
		lda tile16_c, x
		sta store_meta_16+12
		lda tile16_d, x
		sta store_meta_16+13
	lda tile32_d, y
	tax
		lda tile16_a, x
		sta store_meta_16+10
		lda tile16_b, x
		sta store_meta_16+11
		lda tile16_c, x
		sta store_meta_16+14
		lda tile16_d, x
		sta store_meta_16+15
	lda tile32_e, y
		sta bg_attribs_byte

	lda level_offset
	cmp #224
	bcs :+
			lda level_offset
			clc
			adc #32
			sta level_offset
			rts

:	lda scroll_dir
	cmp #$01
	bne :+
		lda level_offset
		sec
		sbc #$e1
		sta level_offset
		rts
:	lda level_offset
	sec
	sbc #223
	sta level_offset
	rts

nmi_gameplay:
	lda lay_tiles
	beq @lay
		lda lay_tiles
		cmp #$01
		bne :+
			jmp end_nmi
:		lda scroll_dir
		cmp #$01
		bne :+
			lda ppu_offset
			cmp #$05
			bne :++
				lda #$01
				sta lay_tiles
				lda level_offset
				sec
				sbc #32
				sta level_offset
				lda #<nmi_lay_em
				sta nmi_addy+0
				lda #>nmi_lay_em
				sta nmi_addy+1
				jmp end_nmi
:		lda ppu_offset
		cmp #$0a
		bne :+
			lda #$01
			sta lay_tiles
			lda level_offset
			sec
			sbc #32
			sta level_offset
			lda #<nmi_lay_em
			sta nmi_addy+0
			lda #>nmi_lay_em
			sta nmi_addy+1
			jmp end_nmi
:
@lay:
	jsr lay_metatiles

	lda ppu_offset
	cmp #112
	bcc @continue_column
		lda scroll_dir
		cmp #$01					; #$01 == left
		bne :+
			lda ppu_offset
			sec
			sbc #$71
			sta ppu_offset
			jmp end_nmi
:		lda ppu_offset
		sec
		sbc #$6f
		sta ppu_offset
		jmp end_nmi
@continue_column:
	lda ppu_offset
	clc
	adc #$10
	sta ppu_offset
	jmp end_nmi






nmi_lay_em:
	lda lay_tiles
	beq :+
		jmp end_nmi
:
	jsr lay_metatiles

	lda ppu_offset
	cmp #112
	bcc @continue_column
		lda scroll_dir
		cmp #$01					; #$01 == left
		bne :++
			lda ppu_offset
			sec
			sbc #$71
			sta ppu_offset
			cmp #$ff
			bne :+
				lda #$0f
				sta ppu_offset
:
		lda #$01
		sta lay_tiles
		lda #$00
		sta stop_laying
			jmp end_nmi
:
		lda ppu_offset
		cmp #127
		bne :+
			lda #$00
			sta ppu_offset
			jmp :++
:		sec
		sbc #$6f
		sta ppu_offset
:
		lda #$01
		sta lay_tiles
		lda #$00
		sta stop_laying
		jmp end_nmi
@continue_column:
	lda ppu_offset
	clc
	adc #$10
	sta ppu_offset
;	inc stop_laying
;	lda stop_laying
;	cmp #$08
;	bne :+
;		lda #$01
;		sta lay_tiles
;		lda #$00
;		sta stop_laying
;:
	jmp end_nmi

scrolling_right:
	lda cam
	cmp #$3f
	bne :+
		lda cam_count
		cmp #$01
		bne :+
			jsr load_boss_music
:
	lda scroll_x
	cmp #$ff
	bne :++
		lda scroll_x_fine
		cmp #$f0
		bne :++
		lda nametable
		cmp #$24
		bne :+
			lda #$20
			sta nametable
			bne @go_scroll
:	lda #$24
	sta nametable
:	lda cam
	cmp #$41
	bne @go_scroll
		lda boss_switch
		beq :+
			lda #$20
			sta nametable
			jsr test_gob
			jmp @done
:
		lda #$24
		sta nametable
		jsr test_gob
		jmp @done
@go_scroll:
	lda scroll_x_fine
	clc
	adc #<scroll_speed
	sta scroll_x_fine
	lda scroll_x
	adc #>scroll_speed
	sta scroll_x
	lda p_x_fine
	sec
	sbc #<scroll_speed
	sta p_x_fine
	lda p_left_side+3
	sbc #>scroll_speed
	sta p_left_side+3
	lda p_left_side+3
	cmp #$0c
	bcs @done
		jsr he_die
@done:
	rts

load_boss_music:
	ldx level
	lda boss_song_list, x
	tax
	jmp return_music_routine
return_boss1:
	rts

scrolling_left:
	lda cam
	cmp #$01
	bne :+
		lda cam_count
		cmp #$01
		bne :+
			jsr load_boss_music
:
	lda scroll_x
	bne :++
		lda scroll_x_fine
		bne :++
		lda nametable
		cmp #$24
		bne :+
			lda #$20
			sta nametable
			bne :++
:	lda #$24
	sta nametable
:	lda cam
	cmp #$ff
	bne :+
		lda #$20
		sta nametable
		jsr test_gob
		jmp @done
:	lda scroll_x_fine
	sec
	sbc #<scroll_speed
	sta scroll_x_fine
	lda scroll_x
	sbc #>scroll_speed
	sta scroll_x
	lda p_x_fine
	clc
	adc #<scroll_speed
	sta p_x_fine
	lda p_left_side+3
	adc #>scroll_speed
	sta p_left_side+3
	lda p_left_side+3
	cmp #$e3
	bcc @done
		jsr he_die
@done:
	rts

loop_die_wait:
	jsr anim_that_amon
	jsr amondus_sprites
	jsr palette_animation_routine
	lda boss_switch
	bne :+
	jsr evil_flicker
:	jsr flicker_em
	jmp end_loop
nmi_die:
	jmp end_nmi

clear_both_nt:
	lda #$20
	sta ppu_addy+1
	ldx #$00
:	ldy #$00
:	lda ppu_addy+1
	sta $2006
	lda #$00
	sta $2006
	lda #$00
:	sta $2007
	inx
	bne :-
		inc ppu_addy+1
		iny
		cpy #$04
		bne :--
			lda ppu_addy+1
			cmp #$28
			bne :---
	rts

clear_it:
	ldy #0
	jsr bank_save
	jsr pal_all_black
	jsr spr_all_offscreen
	jsr nmi_wait
	lda #$00
	sta $2000
	sta $2001
	jsr clear_both_nt
	lda lives
	bmi @over
		lda goblin_switch
		bne :+
			ldx level
			lda g_tens, x
			sta goblin_tens
			lda g_ones, x
			sta goblin_ones
			lda #$01
			sta goblin_switch
:		lda #$01
		sta on_map
		jmp load_map
@over:
	jmp load_game_over

clear_it2:
	ldy #0
	jsr bank_save
	jsr pal_all_black
	jsr spr_all_offscreen
	jsr nmi_wait
	lda #$00
	sta $2000
	sta $2001
	jsr clear_both_nt
	ldx #$00						; Pull in bytes for sprites and their
:	lda the_sprites, x				;  attributes which are stored in the
	sta r_left_side, x
									;  'the_sprites' table. Use X as an index
	inx								;  to load and store each byte, which
	cpx #48 					;  get stored starting in $200, where
	bne :-							;  'car1_1' is located at.
	ldx #$00						; Pull in bytes for sprites and their
:	lda mm_spr, x				;  attributes which are stored in the
	sta mm1, x
									;  'the_sprites' table. Use X as an index
	inx								;  to load and store each byte, which
	cpx #16 					;  get stored starting in $200, where
	bne :-							;  'car1_1' is located at.
	ldx level
	lda scroll_start, x;		#$01		; 
	sta scroll_dir
	lda nt_start, x;		#$24		; 
	sta nametable
	lda ppu_start, x;		#15			; 
	sta ppu_offset
	lda level_start, x;		#31			; 
	sta level_offset
	lda cam_start, x;		#48			; 
	sta cam
	lda x_fine_start, x
	sta scroll_x
	lda pspr_y_start, x
	sta p_left_side
	clc
	adc #$20
	sta r_left_side
	lda pspr_x_start, x
	sta p_left_side+3
	sta r_left_side+3
	lda e_x_start, x
	sta evil+3
	sta evil2+3
	lda e1_y_start, x
	sta evil
	lda e2_y_start, x
	sta evil2
	lda e_att_start, x
	sta evil+2
	sta evil2+2
	lda p_y_pos_start, x
	sta top_left_y
	sta bot_left_y
	sta top_right_y
	sta bot_right_y
	lda p_x_pos_start, x
	sta top_left_x
	sta bot_left_x
	sta top_right_x
	sta bot_right_x
	lda boss_switch
	beq :+
		lda boss_level_start, x;		#31			; 
		sta level_offset
		lda boss_cam_start, x;		#48			; 
		sta cam
		lda boss_p_x_pos_start, x
		sta top_left_x
		sta bot_left_x
		sta top_right_x
		sta bot_right_x
:
	lda #$00
	sta map_pos
	sta p_anim_state
	sta cam_count
	sta enemy_offset
	sta e_type_offset
	sta slot_offset
	sta e_bullet_type_offset
	sta up_pos
	sta down_pos
	sta left_pos
	sta right_pos
	sta g_hold
	sta g_hold_offset
	sta g_dir
	sta reticle_on
	sta end_level_switch
	

	lda #$6f
	sta reticle_save

	lda #$02
	sta lay_tiles
	lda #$08
	sta anim_ticker


	lda #<loop_load_level
	sta loop_pointer+0
	lda #>loop_load_level
	sta loop_pointer+1
	lda #<nmi_gameplay
	sta nmi_addy+0
	lda #>nmi_gameplay
	sta nmi_addy+1
	ldy #1
	jsr bankswitch
	ldx #$05
	jmp return_music_routine
return_load:
	lda bank
	jsr bankswitch

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

	ldx #$00
:	lda palette, x
	sta pal_address, x
	inx
	cpx #32
	bne :-
	lda level
	bne :+
		lda #$27
		sta pal_address+14
		lda #$30
		sta pal_address+15
:	cmp #$01
	beq :+
		cmp #$02
		bne :++
:		lda #$05
		sta pal_address+29
		lda #$30
		sta pal_address+31
:	lda level
	cmp #$02
	bne :+
		lda #$13
		sta pal_address+25
		lda #$09
		sta pal_address+26
		lda #$30
		sta pal_address+27
		lda #$00
		sta pal_address+15
:
	jmp loop_load_level

pal_all_black:
	ldx #$00
	lda #$0f
:	sta pal_address, x
	inx
	cpx #$20
	bne :-
	rts

spr_all_offscreen:
	ldx #$00
:	lda #$00
	sta r_left_side+3, x
	sta $203, x
	lda #$f0
	sta r_left_side, x
	sta $200, x
	inx
	inx
	inx
	inx
	bne :-
	lda #$00
:	sta e_type, x
	sta e_move_count, x
	sta e_dir, x
	sta e_anim_count, x
	sta e_anim_state, x
	sta e_x_pos, x
	sta e_x_fine, x
	sta e_y_pos, x
	sta e_hp, x
	sta e_slot_offset, x
	sta e_bullet_type, x
	sta e_bullet_offset, x
	sta e_bullet_sprite_offset, x
	sta e_left, x
	sta e_right, x
	sta e_top, x
	sta e_bot, x
	inx
	cpx #$09
	bne :-
	ldx #$00
	txa
:	sta b_finished, x
	sta b_left, x
	sta b_right, x
	sta b_top, x
	sta b_bot, x
	inx
	cpx #27
	bne :-
	rts

over_lo:
	.byte <over_words,<cont_words,<end_words
over_hi:
	.byte >over_words,>cont_words,>end_words
over_addy_lo:
	.byte $0b,$8c,$cf
;over_attr_lo:
;	.byte $d2,$d3,$d4,$d5,$db,$dc
over_words:
	.byte "GAME  OVER"
	.byte $ff
cont_words:
	.byte "CONTINUE"
	.byte $ff
end_words:
	.byte "END"
	.byte $ff
load_game_over:
	ldx #$00
:	lda over_lo, x
	sta temp_16bit_1+0
	lda over_hi, x
	sta temp_16bit_1+1
	lda #$21
	sta $2006
	lda over_addy_lo, x
	sta $2006
	ldy #$00
:	lda (temp_16bit_1), y
	cmp #$ff
	beq :+
		sta $2007
		iny
		bne :-
:		inx
		cpx #$03
		bne :---

	lda #$22
	sta $2006
	lda #$c7
	sta $2006
	ldx #$00
:	lda map_line8, x
	cmp #$ff
	beq :+
		inx
		sta $2007
		bne :-
:
	lda #$22
	sta $2006
	lda #$d0
	sta $2006
	jsr write_score

	ldx #$00
	lda #$23
	sta $2006
	lda #$c0
	sta $2006
	lda #$ff
:	sta $2007
	inx
	cpx #$40
	bne :-

	lda #$5b
	sta r_left_side
	sta r_right_side
	lda #$59
	sta r_left_side+3
	lda #$a0
	sta r_right_side+3

	lda #<loop_over
	sta loop_pointer+0
	lda #>loop_over
	sta loop_pointer+1
	lda #<nmi_map
	sta nmi_addy+0
	lda #>nmi_map
	sta nmi_addy+1

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
	jmp end_loop
	
loop_over:
	jsr palette_animation_routine
	jsr flicker_em
	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq :+
		lda #$5b
		sta r_left_side
		sta r_right_side
		lda #$59
		sta r_left_side+3
		lda #$a0
		sta r_right_side+3
		bne :++
:	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq :+
		lda #$6b
		sta r_left_side
		sta r_right_side
		lda #$71
		sta r_left_side+3
		lda #$90
		sta r_right_side+3
:	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda r_left_side
		cmp #$5b
		bne :+
			lda #$02
			sta lives
			lda #$00
			sta score_tens
			sta score_hundreds
			sta score_thousands
			sta score_ten_thousands
			sta score_hun_thousands
			sta score_millions
			sta goblin_switch
			sta boss_switch
			sta one_up_test
			jmp clear_it
:		jsr pal_all_black
		jsr spr_all_offscreen
		jsr nmi_wait
		lda #$00
		sta $2000
		sta $2001
		jmp reset
@no_a:
	jmp end_loop

test_gob:
	lda goblin_tens
	bne not_enough
		lda goblin_ones
		bne not_enough
			ldx level
			lda boss_addy_lo, x
			sta boss_addy+0
			lda boss_addy_hi, x
			sta boss_addy+1
			lda boss_setup_lo, x
			sta temp_16bit_1+0
			lda boss_setup_hi, x
			sta temp_16bit_1+1
			jmp (temp_16bit_1)
return_boss_setup:
			lda #$b4
			sta name_counter
			lda #<loop_boss
			sta loop_pointer+0
			lda #>loop_boss
			sta loop_pointer+1
			lda #<nmi_boss
			sta nmi_addy+0
			lda #>nmi_boss
			sta nmi_addy+1
			rts
not_enough:
	ldx #$00
	jmp return_music_routine
return_none:
	ldx #$09
	jmp return_sfx_routine
return_enough:
	jsr spr_all_offscreen
	lda #$f0
	sta evil
	sta evil2
	sta g_left_side
	sta g_right_side
	lda #<loop_nothing
	sta loop_pointer+0
	lda #>loop_nothing
	sta loop_pointer+1
	lda #<nmi_gob
	sta nmi_addy+0
	lda #>nmi_gob
	sta nmi_addy+1
	rts

lay_metatiles:
	ldx ppu_offset
	lda ppu_hi, x
	sta ppu_addy+1
	lda ppu_lo, x
	sta ppu_addy+0

	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	sta $2006
	lda store_meta_16+0
	sta $2007
	lda store_meta_16+1
	sta $2007
	lda store_meta_16+2
	sta $2007
	lda store_meta_16+3
	sta $2007
	lda ppu_addy+0
	clc
	adc #32
	sta ppu_addy+0

	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	sta $2006
	lda store_meta_16+4
	sta $2007
	lda store_meta_16+5
	sta $2007
	lda store_meta_16+6
	sta $2007
	lda store_meta_16+7
	sta $2007
	lda ppu_addy+0
	clc
	adc #32
	sta ppu_addy+0

	lda ppu_offset
	cmp #112
	bcs :+
	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	sta $2006
	lda store_meta_16+8
	sta $2007
	lda store_meta_16+9
	sta $2007
	lda store_meta_16+10
	sta $2007
	lda store_meta_16+11
	sta $2007
	lda ppu_addy+0
	clc
	adc #32
	sta ppu_addy+0

	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	sta $2006
	lda store_meta_16+12
	sta $2007
	lda store_meta_16+13
	sta $2007
	lda store_meta_16+14
	sta $2007
	lda store_meta_16+15
	sta $2007
:
	lda ppu_att_hi, x
	sta $2006
	lda ppu_at, x
	sta $2006
	lda bg_attribs_byte
	sta $2007
	rts
