amondus_controls:
	lda control_pad
	and #a_punch
	beq :++
		lda player2
		bne :+
		lda reticle_on
		bne :+
;			lda g_dir
;			bne :+
			jsr reticle_control
:		jmp @no_right
:	lda p_anim_state
	cmp #$04
	bcc :+
		jmp @no_right
:	lda control_pad
	and #up_punch
	beq @no_up
		jsr do_up
@no_up:
	lda control_pad
	and #down_punch
	beq @no_down
		jsr do_down
@no_down:
	lda control_pad
	and #left_punch
	beq @no_left
		lda p_left_side+3
		cmp #$09
		bcc @no_left
			jsr do_left
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda p_right_side+3
		cmp #$f8
		bcs @no_right
			jsr do_right
@no_right:
	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	bne :+
		jmp no_b_amondus
:	lda player2
	bne raven_start_shot
		lda g_left_side
		cmp #$f8
		beq :+
			jmp skip_reticle
:		lda reticle_on
		bne skip_reticle
		lda reticle_switch
		beq skip_reticle
			ldy g_hold
			lda enemy_spr0_0x, y	;r_left_side+3
			sta g_left_side+3
			lda #$00
			sta g_left_side
			ldx #$19
			jmp return_sfx_routine
return_magic2:
			lda #$01
			sta g_dir
			jmp raven_none_shot;bne @raven_start;:+++
skip_reticle:
		lda reticle_on
		bne :+
			jmp raven_start_shot;:++
:		lda char_dir
		bne raven_start_shot;:+
			lda p_left_side+3
			cmp #$88
			bcc :+
				lda g_left_side
				sta charwit_fire
				lda g_left_side+3
				sec
				sbc #$08
				sta charwit_fire+3
				lda #$01
				sta char_dir
				sta charwit_fire+2
				jmp raven_start_shot
:			lda g_left_side
			sta charwit_fire
			lda g_left_side+3
			clc
			adc #$10
			sta charwit_fire+3
			lda #$02
			sta char_dir
			lda #$41
			sta charwit_fire+2
raven_start_shot:
		lda p_anim_state
		cmp #$03
		bne do_raven_shot
			lda mm_launcher
			bne :+
			ldx #$08
			jmp return_sfx_routine
return_laugh:
			lda #$00
			sta p_anim_count
			lda #$04
			sta p_anim_state
:			jmp raven_none_shot
do_raven_shot:
		lda p_anim_state
		cmp #$03
		bcc :+
			jmp raven_none_shot
:		lda raven1
		cmp #$f8
		bne raven_dos
			lda #$00
			sta raven1fine
			ldx #$06
			jmp return_sfx_routine
return_raven1:
			lda p_left_side+3
			cmp #$88
			bcc :+
				sta raven1+3
				ldx top_left_x
				stx raven1x
				lda #$01
				sta raven_dir+0
				bne :++
:			clc
			adc #$08
			sta raven1+3
			ldx top_right_x
			stx raven1x
			lda #$02
			sta raven_dir+0
:			lda p_left_side
			sta raven1
			clc
			adc #$09
			and #$f0
			ror
			ror
			ror
			ror
			sta raven1y
			jmp no_b_amondus
raven_dos:
		lda raven2
		cmp #$f8
		bne raven_tres
			lda #$00
			sta raven2fine
			ldx #$17
			jmp return_sfx_routine
return_raven2:
			lda p_left_side+3
			cmp #$88
			bcc :+
				sta raven2+3
				ldx top_left_x
				stx raven2x
				lda #$01
				sta raven_dir+1
				bne :++
:			clc
			adc #$08
			sta raven2+3
			ldx top_right_x
			stx raven2x
			lda #$02
			sta raven_dir+1
:			lda p_left_side
			sta raven2
			clc
			adc #$09
			and #$f0
			ror
			ror
			ror
			ror
			sta raven2y
			jmp no_b_amondus
raven_tres:
		lda raven3
		cmp #$f8
		bne raven_none_shot
			lda #$00
			sta raven3fine
			ldx #$18
			jmp return_sfx_routine
return_raven3:
			lda p_left_side+3
			cmp #$88
			bcc :+
				sta raven3+3
				ldx top_left_x
				stx raven3x
				lda #$01
				sta raven_dir+2
				bne :++
:			clc
			adc #$08
			sta raven3+3
			ldx top_right_x
			stx raven3x
			lda #$02
			sta raven_dir+2
:			lda p_left_side
			sta raven3
			clc
			adc #$09
			and #$f0
			ror
			ror
			ror
			ror
			sta raven3y
raven_none_shot:
no_b_amondus:
	lda p_anim_state
	cmp #$06
	bcs @no_start
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq @no_start
		lda g_dir
		bne @no_start
			jsr adjust_charwit_pos
			jsr switch_char_rant
@no_start:
	rts
switch_char_rant:
		lda reticle_on
		beq :+
			lda #$28
			sta pal_address+22
			lda #$38
			sta pal_address+23
			lda reticle_save
			sta r_left_side
			lda #$f8
			sta g_left_side
			lda #$00
			sta reticle_on
			beq done_with_switch
:		lda g_dir
		bne done_with_switch
		lda #$27
		sta pal_address+22
		lda #$16
		sta pal_address+23
		lda r_left_side
		sta reticle_save
		lda #$f0
		sta r_left_side
		ldx #$02
		jmp return_sfx_routine
return_magic1:
		lda #$01
		sta reticle_on
done_with_switch:
		rts

ravens_move:
	lda raven_dir+0
	beq @raven2_move
		cmp #$01
		bne @raven1right
			lda #$00
			sta raven1+2
			lda raven1+3
			cmp #$04
			bcs :+
				lda #$f8
				sta raven1
				lda #$00
				sta raven_dir+0
				jmp @raven2_move
:			sec
			sbc #$02
			sta raven1+3
			inc raven1fine
			lda raven1fine
			cmp #$08
			bne :+
				dec raven1x
				lda #$00
				sta raven1fine
:			jmp @raven2_move
@raven1right:
		lda #$40
		sta raven1+2
		lda raven1+3
		cmp #$fc
		bcc :+
			lda #$f8
			sta raven1
			lda #$00
			sta raven_dir+0
			jmp @raven2_move
:		clc
		adc #$02
		sta raven1+3
		inc raven1fine
		lda raven1fine
		cmp #$08
		bne :+
			inc raven1x
			lda #$00
			sta raven1fine
:
@raven2_move:
	lda raven_dir+1
	beq @raven3_move
		cmp #$01
		bne @raven2right
			lda #$00
			sta raven2+2
			lda raven2+3
			cmp #$04
			bcs :+
				lda #$f8
				sta raven2
				lda #$00
				sta raven_dir+1
				jmp @raven3_move
:			sec
			sbc #$02
			sta raven2+3
			inc raven2fine
			lda raven2fine
			cmp #$08
			bne :+
				dec raven2x
				lda #$00
				sta raven2fine
:
			jmp @raven3_move
@raven2right:
		lda #$40
		sta raven2+2
		lda raven2+3
		cmp #$fc
		bcc :+
			lda #$f8
			sta raven2
			lda #$00
			sta raven_dir+1
			jmp @raven3_move
:		clc
		adc #$02
		sta raven2+3
		inc raven2fine
		lda raven2fine
		cmp #$08
		bne :+
			inc raven2x
			lda #$00
			sta raven2fine
:
@raven3_move:
	lda raven_dir+2
	beq @ravens_done
		cmp #$01
		bne @raven3right
			lda #$00
			sta raven3+2
			lda raven3+3
			cmp #$04
			bcs :+
				lda #$f8
				sta raven3
				lda #$00
				sta raven_dir+2
				jmp @ravens_done
:			sec
			sbc #$02
			sta raven3+3
			inc raven3fine
			lda raven3fine
			cmp #$08
			bne :+
				dec raven3x
				lda #$00
				sta raven3fine
:
			jmp @ravens_done
@raven3right:
		lda #$40
		sta raven3+2
		lda raven3+3
		cmp #$fc
		bcc :+
			lda #$f8
			sta raven3
			lda #$00
			sta raven_dir+2
			jmp @ravens_done
:		clc
		adc #$02
		sta raven3+3
		inc raven3fine
		lda raven3fine
		cmp #$08
		bne :+
			inc raven3x
			lda #$00
			sta raven3fine
:
@ravens_done:
	rts

reticle_control:
	lda control_pad
	and #up_punch
	beq :+
		lda r_left_side
		cmp #$08
		beq :+
			sec
			sbc #$01
			sta r_left_side
:
	lda control_pad
	and #down_punch
	beq :+
		lda r_left_side
		cmp #$d0
		beq :+
			clc
			adc #$01
			sta r_left_side
:
	lda control_pad
	and #left_punch
	beq :+
		lda r_left_side+3
		cmp #$08
		beq :+
			sec
			sbc #$01
			sta r_left_side+3
:
	lda control_pad
	and #right_punch
	beq :+
		lda r_left_side+3
		cmp #$f0
		beq :+
			clc
			adc #$01
			sta r_left_side+3
:	rts

adjust_charwit_pos:
		lda p_left_side
		cmp #$5f
		bcs :+
			clc
			adc #$12
			sta g_left_side
			bne :++
:		sec
		sbc #$12
		sta g_left_side
:		lda p_left_side+3
		cmp #$88
		bcc @other_char_pos
			cmp #$ce
			bcs :+
			clc
			adc #$11
:			sta g_left_side+3
			jmp @reticle_instead
@other_char_pos:
		cmp #$23
		bcc :+
		sec
		sbc #$12
:		sta g_left_side+3
@reticle_instead:
	rts

amondus_sprites:
	lda player2
	bne @reticle_instead
	lda reticle_on
	beq @reticle_instead
		jsr adjust_charwit_pos
@reticle_instead:
	lda p_left_side
	sta p_right_side
	clc
	adc #$01
	sta p_top
	clc
	adc #$0e
	sta p_bot
	lda p_left_side+3
	clc
	adc #$06
	sta p_left
	clc
	adc #$02
	sta p_right_side+3
	clc
	adc #$05
	sta p_right

;	jsr get_corner_pos

	lda r_left_side
	sta r_right_side
	sta r_top
	clc
	adc #$0f
	sta r_bot
	lda r_left_side+3
	sta r_left
	clc
	adc #$08
	sta r_right_side+3
	clc
	adc #$08
	sta r_right

	lda g_left_side
	sta g_right_side
	sta g_top
	clc
	adc #$0f
	sta g_bot
	lda g_left_side+3
	sta g_left
	clc
	adc #$08
	sta g_right_side+3
	clc
	adc #$07
	sta g_right

	lda charwit_fire
	clc
	adc #$05
	sta charwit_fire_top
	clc
	adc #$08
	sta charwit_fire_bot
	lda charwit_fire+3
	sta charwit_fire_left
	clc
	adc #$07
	sta charwit_fire_right

	inc raven_flap
	lda raven_flap
	cmp #$08
	bcc @other_flap
		lda #$0b
		sta raven1+1
		sta raven2+1
		sta raven3+1
		lda player2
		beq :+
			jmp @flaps_set
:		lda reticle_on
		beq :++
			lda p_left_side+3
			cmp #$88
			bcc :+
				lda #$31
				sta g_left_side+1
				lda #$33
				sta g_right_side+1
				lda #$01
				sta g_left_side+2
				sta g_right_side+2
				jmp @flaps_set
:			lda #$33
			sta g_left_side+1
			lda #$31
			sta g_right_side+1
			lda #$41
			sta g_left_side+2
			sta g_right_side+2
			jmp @flaps_set
:		lda #$11
		sta g_left_side+1
		lda #$13
		sta g_right_side+1
		lda #$01
		sta g_left_side+2
		sta g_right_side+2
		jmp @flaps_set
@other_flap:
	lda #$09
	sta raven1+1
	sta raven2+1
	sta raven3+1
	lda player2
	bne @flaps_set
	lda reticle_on
	beq :++
		lda p_left_side+3
		cmp #$88
		bcc :+
			lda #$35
			sta g_left_side+1
			lda #$37
			sta g_right_side+1
			lda #$01
			sta g_left_side+2
			sta g_left_side+2
			jmp @flaps_set
:		lda #$37
		sta g_left_side+1
		lda #$35
		sta g_right_side+1
		lda #$41
		sta g_left_side+2
		sta g_right_side+2
		jmp @flaps_set
:	lda #$15
	sta g_left_side+1
	lda #$17
	sta g_right_side+1
	lda #$01
	sta g_left_side+2
	sta g_left_side+2
@flaps_set:
	lda raven_flap
	cmp #$10
	bne :+
		lda #$00
		sta raven_flap
:	
	ldy #$00
	ldx #$00
:	cpx #$03
	beq :+
	lda raven1, y
	clc
	adc #$05
	sta raven_top, x
	clc
	adc #$06
	sta raven_bot, x
	lda raven1_x, y
	sta raven_left, x
	clc
	adc #$08
	sta raven_right, x
:	lda mm1, y
	clc
	adc #$05
	sta mm_top, x
	clc
	adc #$06
	sta mm_bot, x
	lda mm1x, y
	sta mm_left, x
	clc
	adc #$08
	sta mm_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$04
	bne :--
	rts

ravens_pos:
	ldy #$00
@startit:
	lda raven1fine, y
	cmp #$01
	bne @increment
	ldx raven1y, y
	lda raven1x, y
	jsr mult_it
	tya
	pha
	ldy #$00
	lda (coll_addy), y
	beq @pull
		pla
		tay
		cpy #$01
		bne :+
			lda #$f8
			sta raven2
			lda #$00
			sta raven_dir+1
			beq @increment
:		cpy #$02
		bne :+
			lda #$f8
			sta raven3
			lda #$00
			sta raven_dir+2
			beq @increment
:		lda #$f8
		sta raven1
		lda #$00
		sta raven_dir+0
		beq @increment
@pull:
	pla
	tay
@increment:
	iny
	cpy #$03
	bne @startit
	rts



evil_flicker:
	lda evil
	cmp #$70
	bne :+
		lda #$00
		sta evil
		beq :++
:	clc
	adc #$10
	sta evil
:	lda evil2
	cmp #$70
	bne :+
		lda #$e0
		sta evil2
		rts
:	sec
	sbc #$10
	sta evil2
	rts


ravens_hit_enemies:
	ldx #$00
@new_raven:
	ldy #$00
@same_raven:
	lda raven_left, x
	cmp e_right, y
		bcs @no_coll
	lda raven_right, x
	cmp e_left, y
		bcc @no_coll
	lda raven_top, x
	cmp e_bot, y
		bcs @no_coll
	lda raven_bot, x
	cmp e_top, y
		bcc @no_coll
			lda e_type, y
			beq @no_coll
				cmp #$1d
				beq :+
					cmp #$04
					beq @no_coll
						jsr raven_leave
:			lda e_hp, y
			sec
			sbc #$01
			sta e_hp, y
			sty hold_y
			lda e_type, y
			jsr e_hit_jumper
			rts
@no_coll:
	iny
	cpy #$09
	bne @same_raven
		inx
		cpx #$03
		beq :+
			jmp @new_raven
:
@done_coll:
	rts
@no_reticle:
	lda #$00
	sta reticle_switch
	rts
done:
jmp done

raven_leave:
	cpx #$01
	bne :+
		lda #$f8
		sta raven2
		bne :+++
:	cpx #$02
	bne :+
		lda #$f8
		sta raven3
		bne :++
:	lda #$f8
	sta raven1
:	rts

gargoyle_hit_enemies:
	lda reticle_on
	bne @no_coll
	ldx g_hold_offset;#$00
@tests:
	lda g_bot
	cmp e_top, x
		bcc @no_coll
	lda g_top
	cmp e_bot, x
		bcs @no_coll
	lda g_left
	cmp e_right, x
		bcs @no_coll
	lda g_right
	cmp e_left, x
		bcc @no_coll
			lda #$02
			sta g_dir
			lda boss_switch
			beq :+
				lda #$27
				sta e_type, x
				rts
:			lda #$05
			sta e_type, x
			lda #$00
			sta e_hp, x
@no_coll:
	rts

reticle_hit_enemies:
	lda g_dir
	beq :+
		rts
:	ldy #$00
@next:
	lda r_left
	cmp e_right, y
		bcs @no_coll
	lda r_right
	cmp e_left, y
		bcc @no_coll
	lda r_top
	cmp e_bot, y
		bcs @no_coll
	lda r_bot
	cmp e_top, y
		bcc @no_coll
					lda dead_count
					beq :+
						rts
:
			lda e_type, y
			beq @no_coll
			tax
			cmp pass_table, x
			bne @no_coll
;				cmp #$0a
;				beq @no_coll
;					cmp #$1c
;					beq @no_coll
					tya
					tax
					lda e_type, y
					jsr g_test_take
			rts

@no_coll:
	iny
	cpy #$09
	bne @next
@done_coll:
	lda #$00
	sta reticle_switch
	rts


gargoyle_move:
	lda p_anim_state
	cmp #$06
	bcc :+
		rts
:
	lda g_dir
	bne :+
		rts
:
	lda g_dir
	cmp #$01
	bne @next
		ldy g_hold_offset
		lda g_left_side
		cmp e_top, y
		bcc :+
			lda #$02
			sta g_dir
			rts
:		clc
		adc #$02
		sta g_left_side
@x_move:
		ldy g_hold
		lda enemy_spr0_0x, y
		beq :+
		sta g_left_side+3
		ldy g_hold_offset
		lda e_type, y
		bne :++
:			lda #$02
			sta g_dir
:
		rts
@next:
	lda g_left_side
	cmp #$f4
	bcc :+
		lda #$00
		sta g_dir
		sta reticle_switch
		lda #$f8
		sta g_left_side
		rts
:	sec
	sbc #$02
	sta g_left_side
	rts

charwit_fire_move:
	lda char_dir
	bne :+
		rts
:	cmp #$01
	bne :++
		lda charwit_fire+3
		cmp #$04
		bcc :+
			sec
			sbc #$03
			sta charwit_fire+3
			rts
:		lda #$f0
		sta charwit_fire
		lda #$70
		sta charwit_fire+3
		lda #$00
		sta char_dir
		rts
:	lda charwit_fire+3
	cmp #$fc
	bcs :--
		clc
		adc #$03
		sta charwit_fire+3
		rts
charwit_hit_enemies:
	lda charwit_fire
	cmp #$f0
	bne :+
		rts
:
	ldy #$00
@tests:
	lda charwit_fire_left
	cmp e_right, y
		bcs @no_coll
	lda charwit_fire_right
	cmp e_left, y
		bcc @no_coll
	lda charwit_fire_bot
	cmp e_top, y
		bcc @no_coll
	lda charwit_fire_top
	cmp e_bot, y
		bcs @no_coll
			lda e_type, y
			cmp #$1d
			beq :+
				lda #$00
				sta char_dir
				lda #$f0
				sta charwit_fire
				lda #$70
				sta charwit_fire+3
:			lda e_hp, y
			sec
			sbc #$02
			sta e_hp, y
			sty hold_y
			lda e_type, y
			jsr e_hit_jumper
			rts
@no_coll:
	iny
	cpy #$09
	bne @tests
@done_coll:
	rts

missiles_go:
	lda mm_launcher
	bne :+
		rts
:	lda mm1
	cmp #$ff
	bne :+
		lda mm2
		cmp #$ff
		bne :+
			lda mm3
			cmp #$ff
			bne :+
				lda mm4
				cmp #$ff
				bne :+
					lda #$00
					sta mm_launcher
					rts
:	lda mm1
	cmp #$ff
	bne :+
		jmp @do4
:	lda mm1+3
	cmp #$04
	bcs :+
		lda #$ff
		sta mm1
		jmp @do4
:	sec
	sbc #$02
	sta mm1+3
@do4:
	lda mm4
	cmp #$ff
	bne :+
		jmp @do2
:	lda mm4+3
	cmp #$fc
	bcc :+
		lda #$ff
		sta mm4
		jmp @do2
:	clc
	adc #$02
	sta mm4+3
@do2:
	lda mm2
	cmp #$ff
	bne :+
		jmp @do3
:	lda p_left_side
	cmp #$5f
	bcc @fire_down1
		lda mm2
		cmp #$04
		bcs :+
			lda #$ff
			sta mm2
			jmp @do3
:		sec
		sbc #$02
		sta mm2
		lda mm2+3
		cmp #$04
		bcs :+
			lda #$ff
			sta mm2
			jmp @do3
:		sec
		sbc #$02
		sta mm2+3
		jmp @do3
@fire_down1:
		lda mm2
		cmp #$ec
		bcc :+
			lda #$ff
			sta mm2
			jmp @do3
:		clc
		adc #$02
		sta mm2
		lda mm2+3
		cmp #$04
		bcs :+
			lda #$ff
			sta mm2
			jmp @do3
:		sec
		sbc #$02
		sta mm2+3
@do3:
	lda mm3
	cmp #$ff
	bne :+
		jmp @done
:	lda p_left_side
	cmp #$5f
	bcc @fire_down2
		lda mm3
		cmp #$04
		bcs :+
			lda #$ff
			sta mm3
			jmp @done
:		sec
		sbc #$02
		sta mm3
		lda mm3+3
		cmp #$fc
		bcc :+
			lda #$ff
			sta mm3
			jmp @done
:		clc
		adc #$02
		sta mm3+3
		jmp @done
@fire_down2:
		lda mm3
		cmp #$ec
		bcc :+
			lda #$ff
			sta mm3
			jmp @done
:		clc
		adc #$02
		sta mm3
		lda mm3+3
		cmp #$fc
		bcc :+
			lda #$ff
			sta mm3
			jmp @done
:		clc
		adc #$02
		sta mm3+3
@done:
	rts

missiles_hit_enemies:
	lda mm_launcher
	bne :+
		rts
:	ldx #$00
@new_missile:
	ldy #$00
@same_missile:
	lda mm_left, x
	cmp e_right, y
		bcs @no_coll
	lda mm_right, x
	cmp e_left, y
		bcc @no_coll
	lda mm_top, x
	cmp e_bot, y
		bcs @no_coll
	lda mm_bot, x
	cmp e_top, y
		bcc @no_coll
			jsr missile_leave
			lda e_type, y
			cmp #$18
			beq :+
			lda e_hp, y
			sec
			sbc #$03
			sta e_hp, y
			sty hold_y
			lda e_type, y
			jsr e_hit_jumper
:			rts
@no_coll:
	iny
	cpy #$09
	bne @same_missile
		inx
		cpx #$04
		beq :+
			jmp @new_missile
:
@done_coll:
	rts
missile_leave:
	cpx #$01
	bne :+
		lda #$ff
		sta mm2
		bne :++++
:	cpx #$02
	bne :+
		lda #$ff
		sta mm3
		bne :+++
:	cpx #$03
	bne :+
		lda #$ff
		sta mm4
		bne :++
:	lda #$ff
	sta mm1
:	rts






; push up
do_up:
	lda up_pos
	bne @move
		ldx top_left_y
		dex
		lda top_left_x
	jsr mult_it
		ldy #00
		lda (coll_addy), y
		beq :+
			rts
:	ldx top_right_y
	dex
	lda top_right_x
	jsr mult_it
	ldy #00
	lda (coll_addy), y
	beq @shift_pos
		rts
@shift_pos:
	dec top_left_y
	dec top_right_y
@move:
	dec p_left_side
	lda up_pos
	sec
	sbc #$10
	sta up_pos
	lda down_pos
	sec
	sbc #$10
	sta down_pos
;	cmp #$f0
	bne :+
		dec bot_left_y
		dec bot_right_y
:
	rts



; push down
do_down:
	lda down_pos
	bne @move
		ldx bot_left_y
		inx
		lda bot_left_x
	jsr mult_it
		ldy #00
		lda (coll_addy), y
		beq :+
			rts
:	ldx bot_right_y
	inx
	lda bot_right_x
	jsr mult_it
	ldy #00
	lda (coll_addy), y
	beq @shift_pos
		rts
@shift_pos:
	inc bot_left_y
	inc bot_right_y
@move:
	inc p_left_side
	lda down_pos
	clc
	adc #$10
	sta down_pos
	lda up_pos
	clc
	adc #$10
	sta up_pos
	bne :+
		inc top_left_y
		inc top_right_y
:
	rts

; push left
do_left:
	lda left_pos
	bne @move
		ldx top_left_y
		lda top_left_x
		sec
		sbc #$01
	jsr mult_it
		ldy #00
		lda (coll_addy), y
		beq :+
			rts
:	ldx bot_left_y
	lda bot_left_x
	sec
	sbc #$01
	jsr mult_it
	ldy #00
	lda (coll_addy), y
	beq @shift_pos
		rts
@shift_pos:
	dec top_left_x
	dec bot_left_x
@move:
	dec p_left_side+3
	lda left_pos
	sec
	sbc #$10
	sta left_pos
	lda right_pos
	sec
	sbc #$10
	sta right_pos
	bne :+
		dec top_right_x
		dec bot_right_x
:
	rts

; push right
do_right:
	lda right_pos
	bne @move
		ldx top_right_y
		lda top_right_x
		clc
		adc #$01
	jsr mult_it
		ldy #00
		lda (coll_addy), y
		beq :+
			rts
:	ldx bot_right_y
	lda bot_right_x
	clc
	adc #$01
	jsr mult_it
	ldy #00
	lda (coll_addy), y
	beq @shift_pos
		rts
@shift_pos:
	inc top_right_x
	inc bot_right_x
@move:
	inc p_left_side+3
	lda right_pos
	clc
	adc #$10
	sta right_pos
	lda left_pos
	clc
	adc #$10
	sta left_pos
	bne :+
		inc top_left_x
		inc bot_left_x
:
	rts

mult_it:

	clc
	adc multiply_lo, x		; add low byte of our multiply table to X coord
	sta temp_16bit_1+0		; save it in low byte of address
	lda multiply_hi, x		; get high byte of multiply table
	adc #000h				; add our carry on
	sta temp_16bit_1+1		; save it in high byte of address
	ldx level
	clc
	lda coll_lo, x
	adc temp_16bit_1+0
	sta coll_addy+0
	lda coll_hi, x
	adc temp_16bit_1+1
	sta coll_addy+1
	rts

add_score:
	lda score_tens
	clc
	adc score_tens_add
	sta score_tens
	cmp #$0a
	bcc @do_hundreds
	lda score_tens
	sec
	sbc #$0a
	sta score_tens
	inc score_hundreds
@do_hundreds:
	lda score_hundreds
	clc
	adc score_hundreds_add
	sta score_hundreds
	cmp #$0a
	bcc @do_thousands
	lda score_hundreds
	sec
	sbc #$0a
	sta score_hundreds
	inc score_thousands
@do_thousands:
	lda score_thousands
	clc
	adc score_thousands_add
	sta score_thousands
	cmp #$0a
	bcc @do_ten_thousands
	lda score_thousands
	sec
	sbc #$0a
	sta score_thousands
	inc score_ten_thousands
@do_ten_thousands:
	lda score_ten_thousands
	clc
	adc score_ten_thousands_add
	sta score_ten_thousands
	cmp #$0a
	bcc @do_hun_thousands
	lda score_ten_thousands
	sec
	sbc #$0a
	sta score_ten_thousands
	inc score_hun_thousands
@do_hun_thousands:
	lda score_hun_thousands
	clc
	adc score_hun_thousands_add
	sta score_hun_thousands
	cmp #$0a
	bcc @do_millions
	lda score_hun_thousands
	sec
	sbc #$0a
	sta score_hun_thousands
	inc score_millions
@do_millions:
	lda score_millions
	clc
	adc score_millions_add
	sta score_millions
@finish_up:
	lda #$00
	sta score_tens_add
	sta score_hundreds_add
	sta score_thousands_add
	sta score_ten_thousands_add
	sta score_hun_thousands_add
	sta score_millions_add
	rts



