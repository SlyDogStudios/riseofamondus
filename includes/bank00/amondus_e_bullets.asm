e_bullet_move_table:
	.addr none-1
	.addr none-1, none-1, none-1, none-1, none-1
	.addr shooterA_bullet-1, none-1, none-1, none-1, none-1
	.addr shoot_turret-1, none-1, none-1, shooterB_bullet-1, none-1
	.addr none-1, shooterA_bullet-1, shooterA_bullet-1, none-1, none-1
	.addr none-1, none-1, none-1, eye_shoot-1, none-1
	.addr none-1, none-1, grave_bullet-1, none-1, none-1
	.addr garb1_bullet-1, garb2_bullet-1, garb3_bullet-1, garb4_bullet-1, none-1
	.addr none-1, none-1, branch_bullet-1, none-1
bullet_jumper:
	asl a
	tay
	lda e_bullet_move_table+1, y
	pha
	lda e_bullet_move_table, y
	pha
	rts


branch_box:
	ldx e_type_offset
	lda b_box_increment, x
	tax
	lda enemy_spr0_shot1y, y
	sta b_top, x
	clc
	adc #$04
	sta b_bot, x
	lda enemy_spr0_shot1x, y
	clc
	adc #$02
	sta b_left, x
	clc
	adc #$05
	sta b_right, x
	rts
branch_path1:
	.byte $00,$00,$00,$00
branch_path2:
	.byte $01,$00,$00,$00
branch_path3:
	.byte $01,$01,$01,$01
branch_bullet:
	ldx e_type_offset
	ldy e_bullet_sprite_offset, x
	lda enemy_spr0_shot1y, y
	sec
	sbc #$02
	sta enemy_spr0_shot1y, y
	lda enemy_spr0_shot1y, y
	cmp #$04
	bcc @done_branch
	lda e_dir, x
	bne @second
			lda enemy_spr0_shot1x, y
			sec
			sbc #$01
			sta enemy_spr0_shot1x, y
			jsr branch_box
			rts
@second:
	cmp #$01
	bne @third
			jsr branch_box
			rts
@third:
	cmp #$02
	bne @fourth
			lda enemy_spr0_shot1x, y
			clc
			adc #$01
			sta enemy_spr0_shot1x, y
			jsr branch_box
			rts
@fourth:
			lda enemy_spr0_shot1x, y
			clc
			adc #$02
			sta enemy_spr0_shot1x, y
			jsr branch_box
			rts
@done_branch:
	inc e_dir, x
	lda e_dir, x
	cmp #$04
	bne :+
		lda #$00
		sta e_dir, x
:
	lda #$ff
	sta enemy_spr0_shot1y, y
	lda #$00
	sta e_bullet_type, x
	rts

garb_box:
	lda b_box_increment, x
	tax
	lda enemy_spr0_shot1y, y
	clc
	adc #$06
	sta b_top, x
	clc
	adc #$04
	sta b_bot, x
	lda enemy_spr0_shot1x, y
	clc
	adc #$02
	sta b_left, x
	clc
	adc #$04
	sta b_right, x
	rts

garb1_bullet:
	ldx e_type_offset
	ldy e_bullet_sprite_offset, x
	lda enemy_spr0_shot1x, y
	cmp #$04
	bcc :+
		ldx e_type_offset
		lda enemy_spr0_shot1x, y
		sec
		sbc #$02
		sta enemy_spr0_shot1x, y
		jsr garb_box
		rts
:	lda #$ff
	sta enemy_spr0_shot1y, y
	lda #$00
	sta e_bullet_type, x
	rts

garb2_bullet:
	ldx e_type_offset
	ldy e_bullet_sprite_offset, x
	lda enemy_spr0_shot1y, y
	cmp #$04
	bcc :+
		ldx e_type_offset
		lda enemy_spr0_shot1y, y
		sec
		sbc #$02
		sta enemy_spr0_shot1y, y
		jsr garb_box
		rts
:	lda #$ff
	sta enemy_spr0_shot1y, y
	lda #$00
	sta e_bullet_type, x
	rts

garb3_bullet:
	ldx e_type_offset
	ldy e_bullet_sprite_offset, x
	lda enemy_spr0_shot1y, y
	cmp #$fc
	bcs :+
		ldx e_type_offset
		lda enemy_spr0_shot1y, y
		clc
		adc #$02
		sta enemy_spr0_shot1y, y
		jsr garb_box
		rts
:	lda #$ff
	sta enemy_spr0_shot1y, y
	lda #$00
	sta e_bullet_type, x
	rts

garb4_bullet:
	ldx e_type_offset
	ldy e_bullet_sprite_offset, x
	lda enemy_spr0_shot1x, y
	cmp #$fc
	bcs :+
		ldx e_type_offset
		lda enemy_spr0_shot1x, y
		clc
		adc #$02
		sta enemy_spr0_shot1x, y
		jsr garb_box
		rts
:	lda #$ff
	sta enemy_spr0_shot1y, y
	lda #$00
	sta e_bullet_type, x
	rts



grave_bullet:
	ldx e_type_offset
	ldy e_bullet_sprite_offset, x
	lda enemy_spr0_shot1y, y
	cmp #$f0
	bne @move
		lda enemy_spr0_shot2y, y
		cmp #$f0
		bne @move
			lda enemy_spr0_shot3y, y
			cmp #$f0
			bne @move
				lda e_y_pos, x
				beq :+
					lda #$00
					sta e_y_pos, x
					beq :++
:				lda #$01
				sta e_y_pos, x
				lda #$00
:				sta e_bullet_type, x
				rts
@move:
	lda e_y_pos, x
	beq @angle
		lda enemy_spr0_shot2y, y
		cmp #$f0
		beq @one
		lda enemy_spr0_shot2x, y
		cmp #$04
		bcs :+
			lda #$f0
			sta enemy_spr0_shot2y, y
			jmp @one
:		sec
		sbc #$01
		sta enemy_spr0_shot2x, y
		jmp @one
@angle:
	lda enemy_spr0_shot2y, y
	cmp #$f0
	beq @one
	cmp #$04
	bcs :+
		lda #$f0
		sta enemy_spr0_shot2y, y
		jmp @one
:	sec
	sbc #$01
	sta enemy_spr0_shot2y, y
@one:
	lda enemy_spr0_shot1y, y
	cmp #$f0
	beq @three
	cmp #$04
	bcs :+
		lda #$f0
		sta enemy_spr0_shot1y, y
		jmp @three
:	sec
	sbc #$01
	sta enemy_spr0_shot1y, y
	lda enemy_spr0_shot1x, y
	cmp #$05
	bcs :+
		lda #$f0
		sta enemy_spr0_shot1y, y
		jmp @three
:	sec
	sbc #$01
	sta enemy_spr0_shot1x, y
@three:
	lda enemy_spr0_shot3y, y
	cmp #$f0
	beq @done
	cmp #$04
	bcs :+
		lda #$f0
		sta enemy_spr0_shot3y, y
		jmp @done
:	sec
	sbc #$01
	sta enemy_spr0_shot3y, y
	lda enemy_spr0_shot3x, y
	cmp #$fc
	bcc :+
		lda #$f0
		sta enemy_spr0_shot3y, y
		jmp @done
:	clc
	adc #$01
	sta enemy_spr0_shot3x, y
@done:
	ldx e_type_offset
	lda b_box_increment, x
	tax
	lda enemy_spr0_shot1y, y
	sta b_top, x
	clc
	adc #$06
	sta b_bot, x
	lda enemy_spr0_shot1x, y
	sta b_left, x
	clc
	adc #$05
	sta b_right, x

	inx
	lda enemy_spr0_shot2y, y
	sta b_top, x
	clc
	adc #$06
	sta b_bot, x
	lda enemy_spr0_shot2x, y
	sta b_left, x
	clc
	adc #$05
	sta b_right, x

	inx
	lda enemy_spr0_shot3y, y
	sta b_top, x
	clc
	adc #$06
	sta b_bot, x
	lda enemy_spr0_shot3x, y
	sta b_left, x
	clc
	adc #$05
	sta b_right, x
	rts





eye_shoot:
	lda e_x_fine+8
	beq @other
	lda enemy_spr0_shot1x
	cmp #$fb
	bcc :+
		lda #$f0
		sta enemy_spr0_shot1y
		bne :++
:	clc
	adc #$03
	sta enemy_spr0_shot1x
:	lda enemy_spr0_shot2x
	cmp #$fb
	bcc :+
		lda #$f0
		sta enemy_spr0_shot2y
		bne :++
:	clc
	adc #$03
	sta enemy_spr0_shot2x
:	lda enemy_spr0_shot3x
	cmp #$fb
	bcc :+
		lda #$f0
		sta enemy_spr0_shot3y
		bne :++
:	clc
	adc #$03
	sta enemy_spr0_shot3x
:	ldx #$00
	ldy #$00
	jsr triple_boxes
	jmp @finish

@other:
	lda enemy_spr0_shot1x
	cmp #$05
	bcs :+
		lda #$f0
		sta enemy_spr0_shot1y
		bne :++
:	sec
	sbc #$03
	sta enemy_spr0_shot1x
:	lda enemy_spr0_shot2x
	cmp #$05
	bcs :+
		lda #$f0
		sta enemy_spr0_shot2y
		bne :++
:	sec
	sbc #$03
	sta enemy_spr0_shot2x
:	lda enemy_spr0_shot3x
	cmp #$05
	bcs :+
		lda #$f0
		sta enemy_spr0_shot3y
		bne :++
:	sec
	sbc #$03
	sta enemy_spr0_shot3x
:	ldx #$00
	ldy #$00
	jsr triple_boxes
@finish:
	lda enemy_spr0_shot3y
	cmp #$f0
	bne :+
		lda enemy_spr0_shot2y
		cmp #$f0
		bne :+
			lda enemy_spr0_shot1y
			cmp #$f0
			bne :+
				lda #$00
				sta e_bullet_type
:
	rts

bullet1_gone:
			txa
			pha
			ldx e_type_offset
			lda b_finished, x
			and #$01
			cmp #$01
			bne :+
				pla
				tax
				rts
:			lda #$01
			eor b_finished, x
			sta b_finished, x
			pla
			tax
			rts
bullet2_gone:
			txa
			pha
			ldx e_type_offset
			lda b_finished, x
			and #$02
			cmp #$02
			bne :+
				pla
				tax
				rts
:			lda #$02
			eor b_finished, x
			sta b_finished, x
			pla
			tax
			rts
bullet3_gone:
			txa
			pha
			ldx e_type_offset
			lda b_finished, x
			and #$04
			cmp #$04
			bne :+
				pla
				tax
				rts
:			lda #$04
			eor b_finished, x
			sta b_finished, x
			pla
			tax
			rts
shooterA_bullet:
	ldx e_type_offset
	lda b_finished, x
	cmp #$07
	bne :+
		lda #$00
		sta e_bullet_type, x
		sta b_finished, x
		rts
:	ldy e_bullet_sprite_offset, x
	lda e_bullet_offset, x
	tax

	lda enemy_spr0_shot1y, y
	cmp #$ff
	bne :+
			jsr bullet1_gone
			jmp @second
:		lda enemy_spr0_shot1x, y
		cmp #$ff
		bne :+
			jsr bullet1_gone
			jmp @second
:	lda enemy_spr0_shot1y, y
	clc
	adc shooterA_path1y, x
	sta enemy_spr0_shot1y, y
	lda enemy_spr0_shot1x, y
	clc
	adc #$01
	sta enemy_spr0_shot1x, y
@second:
	lda enemy_spr0_shot2x, y
	cmp #$ff
	bne :+
		jsr bullet2_gone
		jmp @third
:		lda enemy_spr0_shot2x, y
		clc
		adc #$01
		sta enemy_spr0_shot2x, y
@third:
	lda enemy_spr0_shot3y, y
	cmp #$ff
	bne :+
			jsr bullet3_gone
			jmp @hitbox
:		lda enemy_spr0_shot3x, y
		cmp #$ff
		bne :+
			jsr bullet3_gone
			jmp @hitbox
:	lda enemy_spr0_shot3y, y
	clc
	adc shooterA_path2y, x
	sta enemy_spr0_shot3y, y
	lda enemy_spr0_shot3x, y
	clc
	adc #$01
	sta enemy_spr0_shot3x, y
@hitbox:
	jsr tri_hitbox
	rts
shooterA_path1y:
	.byte $ff,$ff,$00,$00
shooterA_path2y:
	.byte $01,$01,$00,$00
tri_hitbox:
	ldx e_type_offset
	lda b_box_increment, x
	tax
	jsr triple_boxes

	ldx e_type_offset
	lda e_bullet_offset, x
	clc
	adc #$01
	sta e_bullet_offset, x
	cmp #$04
	bne :+
		lda #$00
		sta e_bullet_offset, x
:	rts

triple_boxes:
	lda enemy_spr0_shot1y, y
	clc
	adc #$06
	sta b_top, x
	clc
	adc #$04
	sta b_bot, x
	lda enemy_spr0_shot1x, y
	clc
	adc #$02
	sta b_left, x
	clc
	adc #$04
	sta b_right, x

	inx
	lda enemy_spr0_shot2y, y
	clc
	adc #$06
	sta b_top, x
	clc
	adc #$04
	sta b_bot, x
	lda enemy_spr0_shot2x, y
	clc
	adc #$02
	sta b_left, x
	clc
	adc #$04
	sta b_right, x

	inx
	lda enemy_spr0_shot3y, y
	clc
	adc #$06
	sta b_top, x
	clc
	adc #$04
	sta b_bot, x
	lda enemy_spr0_shot3x, y
	clc
	adc #$02
	sta b_left, x
	clc
	adc #$04
	sta b_right, x
	rts


shooterB_bullet:
	ldx e_type_offset
	lda b_finished, x
	cmp #$07
	bne :+
		lda #$00
		sta e_bullet_type, x
		sta b_finished, x
		rts
:	ldy e_bullet_sprite_offset, x
	lda e_bullet_offset, x
	tax

	lda enemy_spr0_shot1y, y
	cmp #$ff
	bne :+
			jsr bullet1_gone
			jmp @second
:		lda enemy_spr0_shot1x, y
		cmp #$ff
		bne :+
			jsr bullet1_gone
			jmp @second
:	lda enemy_spr0_shot1y, y
	clc
	adc shooterA_path1y, x
	sta enemy_spr0_shot1y, y
	lda enemy_spr0_shot1x, y
	sec
	sbc #$01
	sta enemy_spr0_shot1x, y
@second:
	lda enemy_spr0_shot2x, y
	cmp #$ff
	bne :+
		jsr bullet2_gone
		jmp @third
:		lda enemy_spr0_shot2x, y
		sec
		sbc #$01
		sta enemy_spr0_shot2x, y
@third:
	lda enemy_spr0_shot3y, y
	cmp #$ff
	bne :+
			jsr bullet3_gone
			jmp @hitbox
:		lda enemy_spr0_shot3x, y
		cmp #$ff
		bne :+
			jsr bullet3_gone
			jmp @hitbox
:	lda enemy_spr0_shot3y, y
	clc
	adc shooterA_path2y, x
	sta enemy_spr0_shot3y, y
	lda enemy_spr0_shot3x, y
	sec
	sbc #$01
	sta enemy_spr0_shot3x, y
@hitbox:
	jsr tri_hitbox
	rts




shoot_turret:
	ldx e_type_offset
	ldy e_bullet_sprite_offset, x
	lda enemy_spr0_shot1y, y
	cmp #$04
	bcc :+
		lda enemy_spr0_shot1x, y
		cmp #$05
		bcc :+
		ldx e_type_offset
		lda b_box_increment, x
		tax
		lda enemy_spr0_shot1y, y
		sec
		sbc #$01
		sta enemy_spr0_shot1y, y
		sta b_top, x
		clc
		adc #$08
		sta b_bot, x
		lda enemy_spr0_shot1x, y
		sec
		sbc #$01
		sta enemy_spr0_shot1x, y
		sta b_left, x
		clc
		adc #$08
		sta b_right, x
		rts
:	lda #$ff
	sta enemy_spr0_shot1y, y
	lda #$00
	sta e_bullet_type, x
	rts







b_hit_amondus:
	lda p_anim_state
	cmp #$06
	bcs @done_coll
	ldx #$00
	ldy #$00
;	sty e_bullet_type_offset
@do:
	lda boss_switch
	beq @next_bullet
		lda level
		cmp #$01
		bne @next_bullet
	lda e_bullet_type, y
	beq @no_enemy
@next_bullet:
		lda b_left, x
		cmp p_right
			bcs @no_coll
		lda b_right, x
		cmp p_left
			bcc @no_coll
		lda b_top, x
		cmp p_bot
			bcs @no_coll
		lda b_bot, x
		cmp p_top
			bcc @no_coll
				jsr he_die
				jmp @done_coll
@no_coll:
	inx
	txa
	cmp x_register_increment, y
	beq :+
		jmp @next_bullet
@no_enemy:
	inx
	inx
	inx
:	iny
	cpy #$09
	beq @done_coll
		jmp @do
@done_coll:
	rts

x_register_increment:
	.byte 3,6,9,12,15,18,21,24,27
b_box_increment:
	.byte 0,3,6,9,12,15,18,21,24
