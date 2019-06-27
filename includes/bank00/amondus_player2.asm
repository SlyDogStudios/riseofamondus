player2_controls:
;	lda control_pad2
;	eor control_old2
;	and control_pad2
;	and #start_punch
;	beq @no_start
;		lda g_dir
;		bne :+
;			jsr adjust_charwit_pos
;			jsr switch_char_rant
;:
;@no_start:
	lda control_pad2
	eor control_old2
	and control_pad2
	and #b_punch
	beq no_b_p2
		lda g_left_side
		cmp #$f8
		beq :+
			jmp :++
:		lda reticle_on
		bne :+
		lda reticle_switch
		beq :+
			ldy g_hold
			lda enemy_spr0_0x, y
			sta g_left_side+3
			lda #$00
			sta g_left_side
			ldx #$1a
			jmp return_sfx_routine
return_magic3:
			lda #$01
			sta g_dir
			jmp no_b_p2
:		lda reticle_on
		bne :+
			jmp no_b_p2
:		lda char_dir
		bne no_b_p2
			lda scroll_dir
			cmp #$01
			bne :+
				lda g_left_side
				sta charwit_fire
				lda g_left_side+3
				sec
				sbc #$08
				sta charwit_fire+3
				lda #$01
				sta char_dir
				sta charwit_fire+2
				jmp no_b_p2
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
no_b_p2:
;		lda g_dir
;		beq :+
;			jmp @reticle_done
;:
	lda control_pad2
	and #up_punch
	beq @no_up
		lda reticle_on
		beq :++
			lda g_left_side
			cmp #$10
			bcc :+
				dec g_left_side
:			jmp @no_up
:
		lda r_left_side
		cmp #$08
		beq @no_up
			sec
			sbc #$01
			sta r_left_side
@no_up:
	lda control_pad2
	and #down_punch
	beq @no_down
		lda reticle_on
		beq :++
			lda g_left_side
			cmp #$d0
			bcs :+
				inc g_left_side
:			jmp @no_down
:
		lda r_left_side
		cmp #$d0
		beq @no_down
			clc
			adc #$01
			sta r_left_side
@no_down:
	lda control_pad2
	and #left_punch
	beq @no_left
		lda reticle_on
		beq :++
			lda g_left_side+3
			cmp #$10
			bcc :+
				dec g_left_side+3
:			jmp @no_left
:
		lda r_left_side+3
		cmp #$08
		beq @no_left
			sec
			sbc #$01
			sta r_left_side+3
@no_left:
	lda control_pad2
	and #right_punch
	beq @no_right
		lda reticle_on
		beq :++
			lda g_left_side+3
			cmp #$e0
			bcs :+
				inc g_left_side+3
:			jmp @no_right
:
		lda r_left_side+3
		cmp #$f0
		beq @no_right
			clc
			adc #$01
			sta r_left_side+3
@no_right:
@reticle_done:
	lda raven_flap
	cmp #$08
	bcc @other_flap
		lda reticle_on
		beq :++
			lda scroll_dir
			cmp #$01
			bne :+
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
	lda reticle_on
	beq :++
		lda scroll_dir
		cmp #$01
		bne :+
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
	jsr char_hit_by_enemies
	rts

player2_on_off:
	lda char_stun
	bne no_select_p2
	lda control_pad2
	eor control_old2
	and control_pad2
	and #select_punch
	beq no_select_p2
		ldx #$16
		jmp return_sfx_routine
return_toggle:
		lda player2
		eor #$01
		sta player2
no_select_p2:
	rts

char_hit_by_enemies:
	lda reticle_on
	bne :+
		jmp @done_coll2
:	lda g_left_side
	sta char_top
	clc
	adc #$0f
	sta char_bot
	lda g_left_side+3
	sta char_left
	clc
	adc #$0f
	sta char_right
	ldx #$00
@tests:
	lda char_bot
	cmp e_top, x
		bcc @no_coll
	lda char_top
	cmp e_bot, x
		bcs @no_coll
	lda char_left
	cmp e_right, x
		bcs @no_coll
	lda char_right
	cmp e_left, x
		bcc @no_coll
			lda #$b4
			sta char_stun
			lda #$10
			sta pal_address+22
			lda #$1c
			sta pal_address+23
			rts
@no_coll:
	inx
	cpx #$09
	bne @tests

	ldx #$00
	ldy #$00
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
		cmp char_right
			bcs @no_coll2
		lda b_right, x
		cmp char_left
			bcc @no_coll2
		lda b_top, x
		cmp char_bot
			bcs @no_coll2
		lda b_bot, x
		cmp char_top
			bcc @no_coll2
				lda #$b4
				sta char_stun
				lda #$10
				sta pal_address+22
				lda #$1c
				sta pal_address+23
				rts
@no_coll2:
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
	beq @done_coll2
		jmp @do
@done_coll2:

	rts