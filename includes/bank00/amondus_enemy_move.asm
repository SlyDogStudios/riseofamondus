
e_move_table:
	.addr none-1
	.addr move_goblin_right-1, move_leaf_right-1, move_tornado_right-1, none-1, move_goblin_taken-1			; $01-$05
	.addr move_shooterA-1, move_balloon-1, move_goblin_ball-1, move_goblin_fall-1, move_balloon2-1			; $06-$0a
	.addr move_turret-1, move_capeA-1, none-1, move_shooterB-1, move_bat-1									; $0b-$0f
	.addr move_gob_climb-1, move_aim-1, move_aim_top-1, move_debris_leaf1-1, move_debris_tree1-1			; $10-$14
	.addr move_debris_leaf2-1, move_debris_tree2-1, move_debris_leaf3-1, move_eyeball-1, move_goblin_ball2-1; $15-$19
	.addr move_goblin_left-1, move_goblin_right-1, move_grave-1, move_ghost-1, move_boss3-1					; $1a-$1e
	.addr move_garb1-1, move_garb2-1, move_garb3-1, move_garb4-1, none-1									; $1f-$23
	.addr move_energy-1, move_nature-1, move_branch-1, move_goblin_taken-1 ; $24-
e_move_jumper:
	asl a
	tay
	lda e_move_table+1, y
	pha
	lda e_move_table, y
	pha
	ldx e_type_offset
	ldy e_slot_offset, x
	rts

move_branch:
	dec e_move_count, x
	lda e_move_count, x
	bne :++
		lda number_times_beaten
		beq :+
			lda #$d0
			sta e_move_count, x
:		tya
		sta e_bullet_sprite_offset, x
		lda e_type, x
		sta e_bullet_type, x
		lda #$00
		sta e_bullet_offset, x
		sta flash_grave
		lda enemy_spr0_0x, y
		sta enemy_spr0_shot1x, y
;		sta enemy_spr0_shot2x, y
;		sta enemy_spr0_shot3x, y
		lda enemy_spr0_0y, y
		sta enemy_spr0_shot1y, y
		lda #$ef
		sta enemy_spr0_shot1tile, y
		lda #$00
		sta enemy_spr0_shot1attr, y
		rts
:	cmp #$32;#$19
	bcs nothing_boss
		cmp #$31
		bne no_beep
			lda e_dir, x
			bne :+
				ldx #$11
				jmp return_sfx_routine
return_beeper1:
				jmp no_beep
:			cmp #$01
			bne :+
				ldx #$12
				jmp return_sfx_routine
return_beeper2:
				jmp no_beep
:			cmp #$02
			bne :+
				
				ldx #$13
				jmp return_sfx_routine
return_beeper3:
				jmp no_beep
:			
			ldx #$14
			jmp return_sfx_routine
return_beeper4:
no_beep:
		ldx e_type_offset
		ldy e_slot_offset, x
		lda e_move_count, x
		tax
		lda enemy_spr0_0x, y
		clc
		adc shake_leaf, x
		sta enemy_spr0_0x, y
		lda #$01
		sta flash_grave
		sta enemy_spr0_0attr, y
		rts
nothing_boss:
	lda #$00
	sta enemy_spr0_0attr, y
	rts
shake_leaf:
	.byte $00,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04
	.byte $00,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04,$fc,$04

move_nature:
	lda enemy_spr0_0y, y
	cmp #$f7
	bne @move_it
		inc e_move_count, x
		lda e_move_count, x
		cmp #(nature_x - nature_y)
		bne :+
			lda #$00
			sta e_move_count, x
:			tax
			lda nature_y, x
			sta enemy_spr0_0y, y	;$464
			lda nature_x, x
			sta enemy_spr0_0x, y	;$467
			ldx e_type_offset
@move_it:
	lda e_move_count, x
	tax
	lda enemy_spr0_0y, y		;$464
	clc
	adc nature_add, x
	sta enemy_spr0_0y, y		;$464
	rts
nature_y:
	.byte $bf,$bf,$bf,$bf,$bf,$bf,$bf,$bf,$bf,$bf,$bf,$bf,$af,$0f,$1f,$1f,$0f,$0f,$1f,$1f,$0f,$ff,$ff,$ff,$ff,$ff
nature_x:
	.byte $d0,$c0,$b0,$a0,$90,$80,$70,$60,$50,$40,$30,$20,$10,$10,$20,$30,$40,$50,$60,$70,$80,$90,$a0,$b0,$c0,$d0
nature_add:
	.byte $fc,$fc,$fc,$fc,$fc,$fc,$fc,$fc,$fc,$fc,$fc,$fc,$fc,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04

energy_x:
	.byte $20,$20,$d0,$d0
energy_y:
	.byte $20,$d0,$d0,$20
move_energy:
	inc e_dir, x
	lda e_dir, x
	cmp #$04
	bne :+
		lda #$00
		sta e_dir, x
:
	lda enemy_spr0_0y, y
	cmp #$f0
	bcc @move_it
		dec e_move_count, x
		lda e_move_count, x
		beq :+
			rts
:		lda e_dir, x
		tax
		lda energy_x, x
		sta enemy_spr0_0x, y
		lda energy_y, x
		sta enemy_spr0_0y, y
		ldx e_type_offset
@move_it:
	lda e_left, x
	cmp p_right
	bcc @move_right
		lda e_x_fine, x
		sec
		sbc #<energy_speed
		sta e_x_fine, x
		lda enemy_spr0_0x, y
		sbc #>energy_speed
		sta enemy_spr0_0x, y
		jmp @up_down
@move_right:
	lda e_x_fine, x
	clc
	adc #<energy_speed
	sta e_x_fine, x
	lda enemy_spr0_0x, y
	adc #>energy_speed
	sta enemy_spr0_0x, y
@up_down:
	lda e_top, x
	cmp p_top
	bcc @up
		lda e_y_pos, x
		sec
		sbc #<energy_speed
		sta e_y_pos, x
		lda enemy_spr0_0y, y
		sbc #>energy_speed
		sta enemy_spr0_0y, y
		rts
@up:
	lda e_y_pos, x
	clc
	adc #<energy_speed
	sta e_y_pos, x
	lda enemy_spr0_0y, y
	adc #>energy_speed
	sta enemy_spr0_0y, y
	rts

move_boss3:
	rts

move_garb1:
	lda e_move_count, x
	cmp #$20
	bcc :+
		cmp #$40
		bcc :++
			lda #$01
			sta e_dir, x
			lda #$00
			sta e_move_count, x
:	lda enemy_spr0_0y, y
	sec
	sbc #$01
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	sec
	sbc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
	jmp @shot
:	lda enemy_spr0_0y, y
	clc
	adc #$01
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
@shot:
	lda e_dir, x
	cmp #$01
	bne :+
		jsr kyr_bullet
:	rts

kyr_bullet:
	tya
	sta e_bullet_sprite_offset, x
	lda e_type, x
	sta e_bullet_type, x
	lda enemy_spr0_0x, y
	sta enemy_spr0_shot1x, y
	lda enemy_spr0_0y, y
	sta enemy_spr0_shot1y, y
	lda #$49
	sta enemy_spr0_shot1tile, y
	lda #$01
	sta enemy_spr0_shot1attr, y
	lda #$00
	sta e_dir, x
	rts

move_garb2:
	lda e_move_count, x
	cmp #$20
	bcc :+
		cmp #$40
		bcc :++
			lda #$01
			sta e_dir, x
			lda #$00
			sta e_move_count, x
:	lda enemy_spr0_0y, y
	sec
	sbc #$01
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
	jmp @shot
:	lda enemy_spr0_0y, y
	clc
	adc #$01
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	sec
	sbc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
@shot:
	lda e_dir, x
	cmp #$01
	bne :+
		jsr kyr_bullet
:	rts

move_garb3:
	lda e_move_count, x
	cmp #$20
	bcc :+
		cmp #$40
		bcc :++
			lda #$01
			sta e_dir, x
			lda #$00
			sta e_move_count, x
:	lda enemy_spr0_0y, y
	clc
	adc #$01
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	sec
	sbc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
	jmp @shot
:	lda enemy_spr0_0y, y
	sec
	sbc #$01
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
@shot:
	lda e_dir, x
	cmp #$01
	bne :+
		jsr kyr_bullet
:	rts

move_garb4:
	lda e_move_count, x
	cmp #$20
	bcc :+
		cmp #$40
		bcc :++
			lda #$01
			sta e_dir, x
			lda #$00
			sta e_move_count, x
:	lda enemy_spr0_0y, y
	clc
	adc #$01
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
	jmp @shot
:	lda enemy_spr0_0y, y
	sec
	sbc #$01
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	sec
	sbc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
@shot:
	lda e_dir, x
	cmp #$01
	bne :+
		jsr kyr_bullet
:	rts

move_ghost:
	lda e_move_count, x
	cmp #(ghost_x - ghost_y)
	bne :+
		lda #$00
		sta e_move_count, x
:	tax
	lda enemy_spr0_0y, y
	clc
	adc ghost_y, x
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc ghost_x, x
	sta enemy_spr0_0x, y
	ldx e_type_offset
	inc e_move_count, x
	rts
; do not move ghost_x from beneath ghost_y
ghost_y:
	.byte $ff,$ff,$fe,$fe,$fe,$ff,$ff, $01,$01,$02,$02,$02,$01,$01, $01,$01,$02,$02,$02,$01,$01, $ff,$ff,$fe,$fe,$fe,$ff,$ff
ghost_x:
	.byte $02,$02,$03,$03,$03,$02,$02, $02,$02,$03,$03,$03,$02,$02, $ff,$ff,$fe,$fe,$fe,$ff,$ff, $ff,$ff,$fe,$fe,$fe,$ff,$ff

move_grave:
	lda e_dir, x
	beq :+
		lda e_dir, x
		sta enemy_spr0_0x, y
		lda #$00
		sta e_dir, x
:
	lda e_x_fine, x
	clc
	adc #<scroll_speed
	sta e_x_fine, x
	lda enemy_spr0_0x, y
	adc #>scroll_speed
	sta enemy_spr0_0x, y
	dec e_move_count, x
	lda e_move_count, x
	bne :+
		tya
		sta e_bullet_sprite_offset, x
		lda e_type, x
		sta e_bullet_type, x
		lda #$00
		sta e_bullet_offset, x
		sta flash_grave
		lda enemy_spr0_1x, y
		sta enemy_spr0_shot1x, y
		sta enemy_spr0_shot2x, y
		sta enemy_spr0_shot3x, y
		lda enemy_spr0_1y, y
		sta enemy_spr0_shot1y, y
		sta enemy_spr0_shot2y, y
		sta enemy_spr0_shot3y, y
		lda #$8f
		sta enemy_spr0_shot1tile, y
		sta enemy_spr0_shot2tile, y
		sta enemy_spr0_shot3tile, y
		lda #$02
		sta enemy_spr0_shot1attr, y
		sta enemy_spr0_shot2attr, y
		sta enemy_spr0_shot3attr, y
		rts
:	cmp #$19
	bcs :+
		tax
		lda enemy_spr0_0x, y
		clc
		adc shake_grave, x
		sta enemy_spr0_0x, y
		lda #$01
		sta flash_grave
:	rts
shake_grave:
	.byte $00,$fd,$03,$fd,$03,$fd,$03,$fd,$03,$fd,$03,$fd,$03,$fd,$03,$fd,$03,$fd,$03,$fd,$03,$fd,$03,$fd,$03

move_balloon2:
	lda enemy_spr0_0x, y
	sec
	sbc #$01
	sta enemy_spr0_0x, y
	cmp p_left_side+3
	bcc :+
		lda enemy_spr0_0x, y
		cmp p_right_side+3
		bcs :+
		lda enemy_spr0_0y, y
		cmp p_left_side
		bcs :+
			lda #$04
			sta e_type, x
			lda #$00
			sta e_anim_count, x
			sta e_dir, x
			sta e_move_count, x
:
	rts
move_goblin_ball2:
	lda enemy_spr0_0x, y
	sec
	sbc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
	lda e_move_count, x
	cmp #$10
	bne :+
		dec e_x_pos, x
		lda #$00
		sta e_move_count, x
:
		ldy #$00
:		lda e_dir, y
		clc
		adc #$01
		cmp e_dir, x
		beq :+
			iny
			cpy #$07
			bne :-


		clc
		lda e_y_pos, x
		and #$f0
		ror
		ror
		ror
		ror
		sta e_y_pos, x
		dec e_x_pos, x
		lda #$00
		sta e_dir, x
		lda #$09
		sta e_type, x
:
	rts

do_windy:
	ldx #$0f
	jmp return_sfx_routine
return_windy:
	rts
do_rain:
	ldx #$0d
	jmp return_sfx_routine
return_rain:
	rts
do_wind:
	ldx #$0e
	jmp return_sfx_routine
return_wind:
	rts

move_eyeball:
	lda e_dir+8
	cmp #$06
	bne :+
		lda #$01
		sta e_y_pos, x
		jmp :++
:	lda #$00
	sta e_y_pos, x
:
	lda e_dir, x
	bne move_down_eye
		lda enemy_spr0_0y, y
		cmp enemy_spr1_0y
		bcs :+
			lda #$01
			sta e_dir, x
			rts
:		lda enemy_spr0_0y, y
		sec
		sbc eye_speed;#$03
		sta enemy_spr0_0y, y
		jmp shots_eye
move_down_eye:
	cmp #$02
	bne :+
		jmp move_over_eye
:	cmp #$03
	bne :+
		jmp move_back_eye
:	lda enemy_spr0_0y, y
	cmp enemy_spr5_0y
	bcc move_it_eye
		lda #$00
		sta e_dir, x
		inc e_dir+8
		lda e_dir+8
		cmp #$07
		bne :++
			lda e_x_fine+8
			bne :+
				lda #$02
				sta e_dir, x
				jsr do_windy
				rts
:			lda #$03
			sta e_dir, x
			jsr do_windy
:		rts
move_it_eye:
	lda enemy_spr0_0y, y
	clc
	adc eye_speed;#$03
	sta enemy_spr0_0y, y
shots_eye:
	dec e_x_fine, x
	lda e_x_fine, x
	cmp #$40
	bne :+
		tya
		sta e_bullet_sprite_offset, x
		tya
		pha
		jsr do_rain
		pla
		tay
		lda enemy_spr0_0y, y
		sta enemy_spr0_shot1y
		lda enemy_spr0_0x, y
		sta enemy_spr0_shot1x
		lda #$49
		sta enemy_spr0_shot1tile
		lda #$01
		sta enemy_spr0_shot1attr
		rts
:	cmp #$20
	bne :+
		tya
		pha
		jsr do_rain
		pla
		tay
		lda enemy_spr0_0y, y
		sta enemy_spr0_shot2y
		lda enemy_spr0_0x, y
		sta enemy_spr0_shot2x
		lda #$49
		sta enemy_spr0_shot2tile
		lda #$01
		sta enemy_spr0_shot2attr
		rts
:	cmp #$00
	bne :+
		tya
		pha
		jsr do_wind
		pla
		tay
	lda enemy_spr0_0y, y
	sta enemy_spr0_shot3y
	lda enemy_spr0_0x, y
	sta enemy_spr0_shot3x
	lda #$49
	sta enemy_spr0_shot3tile
	lda #$01
	sta enemy_spr0_shot3attr
	ldx e_type_offset
	lda e_type, x
	sta e_bullet_type, x
:	rts
move_over_eye:
	lda e_dir+7
	cmp #$39
	bne :+
		lda #$00
		sta e_dir, x
		sta e_dir+8
		sta e_dir+7
		lda #$01
		sta e_x_fine+8
		rts
	ldx #$00
:	ldy e_slot_offset, x
	lda enemy_spr0_0x, y
	sec
	sbc #$03
	sta enemy_spr0_0x, y
	inx
	cpx #$06
	bne :-
	inc e_dir+7
	rts;jmp @shots
move_back_eye:
	lda e_dir+7
	cmp #$39
	bne :+
		lda #$00
		sta e_dir, x
		sta e_dir+8
		sta e_dir+7
		lda #$00
		sta e_x_fine+8
		rts
	ldx #$00
:	ldy e_slot_offset, x
	lda enemy_spr0_0x, y
	clc
	adc #$03
	sta enemy_spr0_0x, y
	inx
	cpx #$06
	bne :-
	inc e_dir+7
	rts;jmp @shots

move_leaf_right:
	lda e_dir, x
	tax
	lda enemy_spr0_0y+3, y
	clc
	adc #$01						; move_leaf_x, y
	sta enemy_spr0_0y+3, y
	lda enemy_spr0_0y+0, y
	clc
	adc move_leaf_y, x
	sta enemy_spr0_0y+0, y
	ldx e_type_offset
	inc e_dir, x
	lda e_dir, x
	cmp #32
	bne :+
		lda #$00
		sta e_dir, x
:
	rts
move_leaf_y:
	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	.byte $fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe,$fe
;move_leaf_x:
;	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
;	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01

move_debris_leaf1:
	lda e_move_count, x
	cmp #$28
	bne :+
		lda #$00
		sta e_move_count, x
:	tax
	lda enemy_spr0_0y, y
	clc
	adc debris1_y, x
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc debris1_x, x
	sta enemy_spr0_0x, y
	inx
	txa
	ldx e_type_offset
	sta e_move_count, x
	rts
debris1_x:
	.byte $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc
	.byte $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04
debris1_y:
	.byte $ff,$00, $00,$01, $00,$00, $01,$00, $00,$01, $00,$00, $01,$00, $00,$01, $00,$00, $01,$00
	.byte $ff,$00, $00,$ff, $00,$00, $ff,$00, $00,$ff, $00,$00, $ff,$00, $00,$ff, $00,$00, $01,$00

move_debris_tree1:
	lda e_move_count, x
	cmp #$20
	bne :+
		lda #$00
		sta e_move_count, x
:	tax
	lda enemy_spr0_0y, y
	clc
	adc debris2_y, x
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc debris2_x, x
	sta enemy_spr0_0x, y
	inx
	txa
	ldx e_type_offset
	sta e_move_count, x
	rts
debris2_x:
	.byte $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc
	.byte $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04
debris2_y:
	.byte $ff,$00, $00,$01, $00,$00, $01,$00, $00,$01, $00,$00, $00,$00, $01,$00
	.byte $ff,$00, $00,$ff, $00,$00, $ff,$00, $00,$ff, $00,$00, $00,$00, $01,$00

move_debris_leaf2:
	lda e_move_count, x
	cmp #$1c
	bne :+
		lda #$00
		sta e_move_count, x
:	tax
	lda enemy_spr0_0y, y
	clc
	adc debris3_y, x
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc debris3_x, x
	sta enemy_spr0_0x, y
	inx
	txa
	ldx e_type_offset
	sta e_move_count, x
	rts
debris3_x:
	.byte $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc
	.byte $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04
debris3_y:
	.byte $ff,$00, $00,$01, $00,$00, $01,$00, $00,$01, $00,$00, $01,$00
	.byte $ff,$00, $00,$ff, $00,$00, $ff,$00, $00,$ff, $00,$00, $01,$00


move_debris_tree2:
	lda e_move_count, x
	cmp #$18
	bne :+
		lda #$00
		sta e_move_count, x
:	tax
	lda enemy_spr0_0y, y
	clc
	adc debris4_y, x
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc debris4_x, x
	sta enemy_spr0_0x, y
	inx
	txa
	ldx e_type_offset
	sta e_move_count, x
	rts
debris4_x:
	.byte $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc
	.byte $04,$04, $04,$04, $04,$04, $04,$04, $04,$04, $04,$04
debris4_y:
	.byte $ff,$00, $00,$01, $00,$00, $01,$00, $00,$01, $01,$00
	.byte $ff,$00, $00,$ff, $00,$00, $ff,$00, $00,$ff, $01,$00

move_debris_leaf3:
	lda e_move_count, x
	cmp #$14
	bne :+
		lda #$00
		sta e_move_count, x
:	tax
	lda enemy_spr0_0y, y
	clc
	adc debris5_y, x
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc debris5_x, x
	sta enemy_spr0_0x, y
	inx
	txa
	ldx e_type_offset
	sta e_move_count, x
	rts
debris5_x:
	.byte $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc, $fc,$fc
	.byte $04,$04, $04,$04, $04,$04, $04,$04, $04,$04
debris5_y:
	.byte $ff,$00, $00,$01, $01,$00, $00,$01, $01,$00
	.byte $ff,$00, $00,$ff, $ff,$00, $00,$ff, $01,$00

move_goblin_left:
	lda e_dir, x
	cmp #$03
	bne :+
		dec e_x_pos, x
		lda #$00
		sta e_dir, x
:	lda e_dir, x
	bne @not_right
	lda enemy_spr0_0x, y
	sec
	sbc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
	lda e_move_count, x
	cmp #$10
	bne :+++
		lda #$00
		sta e_move_count, x
		dec e_x_pos, x
		lda e_x_pos, x
;		sec
;		sbc #$01
		pha
		clc
		lda e_y_pos, x
;		adc #$10
		and #$f0
		ror
		ror
		ror
		ror
		tax
		pla
		jsr mult_it
		ldy #64
		lda (coll_addy), y
		bne :+
			ldx e_type_offset
			lda #$01
			sta e_dir, x
			rts
:		ldy #$00
		lda (coll_addy), y
		cmp #$01
		beq :+
			rts
:		ldx e_type_offset
		lda #$02
		sta e_dir, x
:		rts
@not_right:
	cmp #$01
	bne @not_down
		lda enemy_spr0_0y, y
		clc
		adc #$01
		sta enemy_spr0_0y, y
		inc e_move_count, x
		lda e_move_count, x
		cmp #$10
		bne :+++
			lda #$00
			sta e_move_count, x
			lda e_x_pos, x
			pha
			lda e_y_pos, x
			adc #$10
			sta e_y_pos, x
			and #$f0
			ror
			ror
			ror
			ror
			tax
			pla
			jsr mult_it
			ldy #64
			lda (coll_addy), y
			bne :+
				rts
:			cmp #$01
			bne :+
				ldx e_type_offset
				lda #$00
				sta e_dir, x
				rts
:		ldx e_type_offset
		lda #$04
		sta e_type, x
		lda #$00
		sta e_anim_count, x
		sta e_dir, x
:		rts
@not_down:
	lda enemy_spr0_0y, y
	sec
	sbc #$01
	sta enemy_spr0_0y, y
	inc e_move_count, x
	lda e_move_count, x
	cmp #$10
	bne :+
		lda #$00
		sta e_move_count, x
		lda e_y_pos, x
		sec
		sbc #$10
		sta e_y_pos, x
		lda #$00
		sta e_dir, x
:		rts

move_goblin_right:
	lda e_dir, x
	cmp #$03
	bne :+
		inc e_x_pos, x
		lda #$00
		sta e_dir, x
:	lda e_dir, x
	bne @not_right
	lda enemy_spr0_0x, y
	clc
	adc #$01
	sta enemy_spr0_0x, y
	lda e_x_fine, x
	clc
	adc #<scroll_speed
	sta e_x_fine, x
	lda enemy_spr0_0x, y
	adc #>scroll_speed
	sta enemy_spr0_0x, y
	inc e_move_count, x
	lda e_move_count, x
	cmp #$10
	bne :+++
		lda #$00
		sta e_move_count, x
		inc e_x_pos, x
		lda e_x_pos, x
		pha
		clc
		lda e_y_pos, x
;		adc #$10
		and #$f0
		ror
		ror
		ror
		ror
		tax
		pla
		jsr mult_it
		ldy #64
		lda (coll_addy), y
		bne :+
			ldx e_type_offset
			lda #$01
			sta e_dir, x
			rts
:		ldy #$01
		lda (coll_addy), y
		cmp #$01
		beq :+
			rts
:		ldx e_type_offset
		lda #$02
		sta e_dir, x
:		rts
@not_right:
	cmp #$01
	bne @not_down
		lda enemy_spr0_0y, y
		clc
		adc #$01
		sta enemy_spr0_0y, y
		inc e_move_count, x
		lda e_move_count, x
		cmp #$10
		bne :+++
			lda #$00
			sta e_move_count, x
			lda e_x_pos, x
			pha
			lda e_y_pos, x
			adc #$10
			sta e_y_pos, x
			and #$f0
			ror
			ror
			ror
			ror
			tax
			pla
			jsr mult_it
			ldy #64
			lda (coll_addy), y
			bne :+
				rts
:			cmp #$01
			bne :+
				ldx e_type_offset
				lda #$00
				sta e_dir, x
				rts
:		ldx e_type_offset
		lda #$04
		sta e_type, x
		lda #$00
		sta e_anim_count, x
		sta e_dir, x
:		rts
@not_down:
	lda enemy_spr0_0y, y
	sec
	sbc #$01
	sta enemy_spr0_0y, y
	inc e_move_count, x
	lda e_move_count, x
	cmp #$10
	bne :+
		lda #$00
		sta e_move_count, x
		lda e_y_pos, x
		sec
		sbc #$10
		sta e_y_pos, x
		lda #$00
		sta e_dir, x
:		rts

move_tornado_right:
	lda e_x_fine, x
	clc
	adc #<tornado_speed
	sta e_x_fine, x
	lda enemy_spr0_0y+3, y
	adc #>tornado_speed
	sta enemy_spr0_0y+3, y
	rts

move_goblin_taken:
	lda p_anim_state
	cmp #$06
	bcc :+
		lda #$00
		sta e_type, x
		lda #$00
		sta e_move_count, x
		sta e_dir, x
		sta e_anim_count, x
		rts
:	lda #$40
	sta e_hp, x
	lda enemy_spr0_0y, y
	cmp #$f1
	bcs :+
		sec
		sbc #$02
		sta enemy_spr0_0y, y
		rts
:	lda e_type, x
	cmp #$27
	bne :+
		lda #$24
		sta e_type, x
		rts
:	lda #$00
	sta e_type, x
	sta e_move_count, x
	sta e_dir, x
	sta e_anim_count, x
	jsr decrement_goblins
	lda #$01
	sta score_thousands_add
	jsr add_score
	ldx #$0a
	jmp return_sfx_routine
return_got:
	rts
decrement_goblins:
	lda goblin_tens
	bne :+
		lda goblin_ones
		bne :+
			rts
:	lda goblin_ones
	bne :+
		dec goblin_tens
		lda #$09
		sta goblin_ones
		bne :++
:	dec goblin_ones
:	rts


move_shooterA:
	lda e_dir, x
	bne :+++
		lda enemy_spr0_0x, y
		cmp #$20
		beq :+
			clc
			adc #$01
			sta enemy_spr0_0x, y
			rts
:	lda e_move_count, x
	cmp #$30
	beq :+
		inc e_move_count, x
		rts
:
	lda #$01
	sta e_dir, x
	jsr behind_shot
	rts
:	lda enemy_spr0_0y+3, y
	cmp #$ff
	beq :+
		sec
		sbc #$01
		sta enemy_spr0_0y+3, y
		rts
:	jsr finish_guy
	rts



move_shooterB:
	lda e_dir, x
	bne :+++
		lda enemy_spr0_0x, y
		cmp #$e0
		beq :+
			sec
			sbc #$01
			sta enemy_spr0_0x, y
			rts
:	lda e_move_count, x
	cmp #$30
	beq :+
		inc e_move_count, x
		rts
:
	lda #$01
	sta e_dir, x
	jsr behind_shot
	rts
:	lda enemy_spr0_0x, y
	cmp #$f8
	beq :+
		clc
		adc #$01
		sta enemy_spr0_0x, y
		rts
:	jsr finish_guy
	rts



move_aim:
	lda e_dir, x
	bne :+
		lda #$10
		sta enemy_spr0_0x, y
		inc e_dir, x
:	cmp #$01
	bne :++
		lda enemy_spr0_0y, y
		cmp #$90
		bne :+
			inc e_dir, x
			jmp @find_shot
:		sec
		sbc #$01
		sta enemy_spr0_0y, y
		rts
:	lda enemy_spr0_0y, y
	cmp #$f0
	beq @finished
		clc
		adc #$01
		sta enemy_spr0_0y, y
		rts
@find_shot:
	jsr behind_shot
	rts
@finished:
	jsr finish_guy
	rts
behind_shot:
	tya
	sta e_bullet_sprite_offset, x
	lda e_type, x
	sta e_bullet_type, x
	lda #$00
	sta e_bullet_offset, x
	lda enemy_spr0_0x, y	;enemy_spr0_1x, y
	sta enemy_spr0_shot1x, y
	sta enemy_spr0_shot2x, y
	sta enemy_spr0_shot3x, y
	lda enemy_spr0_0y, y	;enemy_spr0_1y, y
	sta enemy_spr0_shot1y, y
	sta enemy_spr0_shot2y, y
	sta enemy_spr0_shot3y, y
	lda #$49
	sta enemy_spr0_shot1tile, y
	sta enemy_spr0_shot2tile, y
	sta enemy_spr0_shot3tile, y
	lda #$01
	sta enemy_spr0_shot1attr, y
	sta enemy_spr0_shot2attr, y
	sta enemy_spr0_shot3attr, y
	rts
finish_guy:
	lda #$00
	sta e_type, x
	sta e_anim_count, x
	sta e_dir, x
	sta e_move_count, x
	lda #$00
	sta enemy_spr0_0x, y
	lda #$f0
	sta enemy_spr0_0y, y
	rts

move_aim_top:
	lda e_dir, x
	bne :+
		lda #$10
		sta enemy_spr0_0x, y
		inc e_dir, x
:	cmp #$01
	bne :++
		lda enemy_spr0_0y, y
		cmp #$58
		bne :+
			inc e_dir, x
			jmp @find_shot
:		clc
		adc #$01
		sta enemy_spr0_0y, y
		rts
:	lda enemy_spr0_0y, y
	cmp #$f0
	beq @finished
		sec
		sbc #$01
		sta enemy_spr0_0y, y
		rts
@find_shot:
	jsr behind_shot
	rts
@finished:
	jsr finish_guy
	rts



move_balloon:
	lda enemy_spr0_0x, y
	clc
	adc #$01
	sta enemy_spr0_0x, y
	cmp p_left_side+3
	bcc :+
;		lda enemy_spr0_0x, y
;		cmp p_right_side+3
;		bcs :+
		lda enemy_spr0_0y, y
		cmp p_left_side
		bcs :+
			lda #$04
			sta e_type, x
			lda #$00
			sta e_anim_count, x
			sta e_dir, x
			sta e_move_count, x
:
	rts
move_goblin_ball:
	lda enemy_spr0_0x, y
	clc
	adc #$01
	sta enemy_spr0_0x, y
	inc e_move_count, x
	lda e_move_count, x
	cmp #$10
	bne :+
		inc e_x_pos, x
		lda #$00
		sta e_move_count, x
:
		ldy #$00
:		lda e_dir, y
		clc
		adc #$01
		cmp e_dir, x
		beq :+
			iny
			cpy #$07
			bne :-


		clc
		lda e_y_pos, x
		and #$f0
		ror
		ror
		ror
		ror
		sta e_y_pos, x
		inc e_x_pos, x
		lda #$00
		sta e_dir, x
		lda #$09
		sta e_type, x
:
	rts
move_goblin_fall:
	lda enemy_spr0_0y, y
	clc
	adc #$04
	sta enemy_spr0_0y, y
	inc e_dir, x
	lda e_dir, x
	cmp #$04
	bne @go_rts
		inc e_y_pos, x
		lda #$00
		sta e_dir, x
		lda e_x_pos, x
		pha
		lda e_y_pos, x
		tax
		pla
		jsr mult_it

		ldx e_type_offset
		ldy #64
		lda (coll_addy), y
		cmp #$01
		bne @not_one
			lda scroll_dir
			cmp #$01
			beq :+
				lda #$1a
				sta e_type, x
				bne :++
:			lda #$01
			sta e_type, x
			sta e_anim_state, x
:			lda #$00
			sta e_dir, x
			sta e_anim_count, x
			clc
			lda e_y_pos, x
			and #$0f
			rol
			rol
			rol
			rol
			sta e_y_pos, x
			rts
@not_one:
		cmp #$02
		bne @go_rts
			lda #$04
			sta e_type, x
			lda #$00
			sta e_anim_count, x
			sta e_dir, x
@go_rts:
	rts


move_turret:
	lda e_x_fine, x
	sec
	sbc #<scroll_speed
	sta e_x_fine, x
	lda enemy_spr0_0x, y
	sbc #>scroll_speed
	sta enemy_spr0_0x, y
	inc e_move_count, x
	lda e_move_count, x
	bne :+
		tya
		sta e_bullet_sprite_offset, x
		lda e_type, x
		sta e_bullet_type, x
		lda enemy_spr0_0x, y
		sec
		sbc #$07
		sta enemy_spr0_shot1x, y
		lda enemy_spr0_0y, y
		sec
		sbc #$06
		sta enemy_spr0_shot1y, y
		lda #$7f
		sta enemy_spr0_shot1tile, y
		lda #$02
		sta enemy_spr0_shot1attr, y
:
	rts

move_capeA:
	lda e_dir, x
	beq @move_down_right
		bne @move_left
@move_down_right:
	lda e_move_count, x
	cmp #$04
	bne :+
		lda #$00
		sta e_move_count, x
:	tax
	lda enemy_spr0_0y, y
	clc
	adc cape_yA, x
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	clc
	adc #$02
	sta enemy_spr0_0x, y
	ldx e_type_offset
	inc e_move_count, x
	rts
@move_left:
	lda e_move_count, x
	cmp #$04
	bne :+
		lda #$00
		sta e_move_count, x
:	tax
	lda enemy_spr0_0y, y
	clc
	adc cape_yA, x
	sta enemy_spr0_0y, y
	lda enemy_spr0_0x, y
	sec
	sbc #$02
	sta enemy_spr0_0x, y
	ldx e_type_offset
	inc e_move_count, x
	rts
cape_yA:
	.byte $01,$00,$00,$00



move_bat:
	lda e_x_fine, x
	cmp #$10
	bcc :+
		lda #$00
		sta e_x_fine, x
		jmp @up_or_down_test
:	lda scroll_dir
	cmp #$01
	beq @other_way
	lda e_x_fine, x
	cmp #$08
	bcc :+
		lda enemy_spr0_0x, y
		clc
		adc #$01
		sta enemy_spr0_0x, y
		inc e_x_fine, x
		jmp @up_or_down_test
:	lda enemy_spr0_0x, y
	sec
	sbc #$03
	sta enemy_spr0_0x, y
	inc e_x_fine, x
	jmp @up_or_down_test
@other_way:
	lda e_x_fine, x
	cmp #$08
	bcc :+
		lda enemy_spr0_0x, y
		sec
		sbc #$01
		sta enemy_spr0_0x, y
		inc e_x_fine, x
		jmp @up_or_down_test
:	lda enemy_spr0_0x, y
	clc
	adc #$03
	sta enemy_spr0_0x, y
	inc e_x_fine, x
@up_or_down_test:
	lda e_move_count, x
	beq @down
@up:
		lda e_dir, x
		and #$f0
		sta e_y_pos, x
		lda enemy_spr0_0y, y
		and #$f0
		cmp e_y_pos, x
		bne :+
			lda #$00
			sta e_move_count, x
			rts
:		lda enemy_spr0_0y, y
		sec
		sbc #$02
		sta enemy_spr0_0y, y
		rts
@down:
	lda e_dir, x
	and #$0f
	sta e_y_pos, x
	lda enemy_spr0_0y, y
	clc
	and #$f0
	ror
	ror
	ror
	ror
	cmp e_y_pos, x
	bne :+
		lda #$01
		sta e_move_count, x
		rts
:	lda enemy_spr0_0y, y
	clc
	adc #$02
	sta enemy_spr0_0y, y
	rts

move_gob_climb:
	lda e_left, x
	sec
	sbc p_right
	cmp #$70
	bcs :+
		lda e_bot, x
		cmp p_top
		bcs :+
		lda #$0c
		sta e_type, x
		lda #$00
		sta e_move_count, x
		lda #$02
		sta e_dir, x
		rts
:	lda e_x_fine, x
	sec
	sbc #<scroll_speed
	sta e_x_fine, x
	lda enemy_spr0_0x, y
	sbc #>scroll_speed
	sta enemy_spr0_0x, y
@up_or_down_test:
	lda e_move_count, x
	beq @down
@up:
		lda e_dir, x
		and #$f0
		sta e_y_pos, x
		lda enemy_spr0_0y, y
		and #$f0
		cmp e_y_pos, x
		bne :+
			lda #$00
			sta e_move_count, x
			rts
:		lda enemy_spr0_0y, y
		sec
		sbc #$01
		sta enemy_spr0_0y, y
		rts
@down:
	lda e_dir, x
	and #$0f
	sta e_y_pos, x
	lda enemy_spr0_0y, y
	clc
	and #$f0
	ror
	ror
	ror
	ror
	cmp e_y_pos, x
	bne :+
		lda #$01
		sta e_move_count, x
		rts
:	lda enemy_spr0_0y, y
	clc
	adc #$01
	sta enemy_spr0_0y, y
	rts



