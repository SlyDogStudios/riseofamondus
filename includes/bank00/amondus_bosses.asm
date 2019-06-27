boss1_name:
	.byte "XECROM'S STORM"
boss2_name:
	.byte "EYE OF PRIM"
boss3_name:
	.byte "KYR"
boss4_name:
	.byte "THE ELDERWOOD"
boss_name_lo:
	.byte <boss1_name,<boss2_name,<boss3_name,<boss4_name
boss_name_hi:
	.byte >boss1_name,>boss2_name,>boss3_name,>boss4_name
name_addy_lo:
	.byte $68,$25,$67,$2d
name_addy_hi:
	.byte $20,$25,$20,$26
name_stop:
	.byte $0e,$0b,$03,$0d

nmi_boss:
	ldy #$00
	lda name_counter
	bne :++
		ldx level
		lda name_addy_hi, x
		sta $2006
		lda name_addy_lo, x
		sta $2006
		lda #$00
:		sta $2007
		iny
		cpy #$0e
		bne :-
		beq :+++
:	dec name_counter
	ldx level
	lda boss_name_lo, x
	sta name+0
	lda boss_name_hi, x
	sta name+1
	lda name_addy_hi, x
	sta $2006
	lda name_addy_lo, x
	sta $2006
:	lda (name), y
	sta $2007
	iny
	tya
	cmp name_stop, x
	bne :-
:	jmp end_nmi

boss_setup_lo:
	.byte <boss1_setup, <boss2_setup, <boss3_setup, <boss4_setup
boss_setup_hi:
	.byte >boss1_setup, >boss2_setup, >boss3_setup, >boss4_setup
boss_addy_lo:
	.byte <boss1_loop, <boss2_loop, <boss3_loop, <boss4_loop
boss_addy_hi:
	.byte >boss1_loop, >boss2_loop, >boss3_loop, >boss4_loop

boss1_setup:
	ldy #$00
:	lda boss1_spr, y
	sta enemy_spr0_0y, y
	iny
	cpy #68
	bne :-
	lda #$20
	sta e_hp
	lda #$0d
	sta e_type
	jmp return_boss_setup
boss2_e_types:
	.byte $18,$13,$14,$15,$16,$17
boss2_e_x_pos:
	.byte $d0,$ff,$f4,$f4,$e9,$e7
boss2_e_y_pos:
	.byte $80,$40,$60,$80,$a0,$c0
boss2_slot:
	.byte 0,20,40,60,80,100,120,140,160
boss2_setup:
	ldx #$00
:	lda boss2_e_types, x
	sta e_type, x
	sta e_anim_state, x
	ldy boss2_slot, x
	sty e_slot_offset, x
	lda boss2_e_x_pos, x
	sta enemy_spr0_0x, y
	lda boss2_e_y_pos, x
	sta enemy_spr0_0y, y
	inx
	cpx #$06
	bne :-
	lda #$0f
	sta pal_address+30
	lda #$18
	sta e_hp
	jmp return_boss_setup
boss3_e_types:
	.byte $1e,$1f,$20,$21,$22
boss3_e_x_pos:
	.byte $38,$30,$40,$30,$40
boss3_e_y_pos:
	.byte $68,$60,$60,$70,$70
boss3_pal:
	.byte $21,$11,$00
boss3_setup:
	ldx #$00
:	lda boss3_e_types, x
	sta e_type, x
	sta e_anim_state, x
	ldy boss2_slot, x				; use same table from boss2 just inx less
	sty e_slot_offset, x
	lda boss3_e_x_pos, x
	sta enemy_spr0_0x, y
	lda boss3_e_y_pos, x
	sta enemy_spr0_0y, y
	inx
	cpx #$05
	bne :-
	ldx #$00
:	lda boss3_pal, x
	sta pal_address+29, x
	inx
	cpx #3
	bne :-
	lda #$40
	sta e_hp
	sta boss_switch
	jmp return_boss_setup

boss4_spr:
	.byte $28,$d9,$03,$f0
	.byte $38,$db,$03,$e0
	.byte $38,$dd,$03,$e8
	.byte $48,$df,$03,$e0
	.byte $48,$e1,$03,$e8
	.byte $48,$e3,$03,$f0
	.byte $58,$e5,$03,$e0
	.byte $58,$e7,$03,$e8
	.byte $58,$e9,$03,$f0
	.byte $68,$eb,$03,$e0
	.byte $68,$ed,$03,$e8
boss4_pal:
	.byte $07,$0a,$19,$0f,$07,$17,$0f
boss4_e_types:
	.byte $23,$24,$25,$26
boss4_e_x_pos:
	.byte $e0,$d0,$d0,$40
boss4_e_y_pos:
	.byte $28,$f0,$f7,$7f
boss4_setup:
	lda #$01
	sta boss_switch
	ldx #$00
:	lda boss4_e_types, x
	sta e_type, x
	sta e_anim_state, x
	ldy boss2_slot, x				; use same table from boss2 just inx less
	sty e_slot_offset, x
	lda boss4_e_x_pos, x
	sta enemy_spr0_0x, y
	lda boss4_e_y_pos, x
	sta enemy_spr0_0y, y
	inx
	cpx #$04
	bne :-
	ldx #$00
:	lda boss4_pal, x
	sta pal_address+25, x
	inx
	cpx #7
	bne :-
	lda #$7f;#$00;
	sta e_hp
	lda #$ff
	sta e_move_count+2
	jmp return_boss_setup

weapons_leave:
	lda #$f8
	sta raven1
	sta raven2
	sta raven3
	lda #$ff
	sta mm1
	sta mm2
	sta mm3
	sta mm4
	lda #$f0
	sta charwit_fire
	lda #$00
	sta mm_launcher
	rts

boss1_loop:
	lda pal_address+29
	cmp #$27
	bne :+
		dec boss_color_counter
		lda boss_color_counter
		bne :+
			lda #$10
			sta pal_address+29
			lda #$00
			sta pal_address+30
:	lda #$f0
	sta evil
	sta evil2
	lda dead_count
	beq @not_dead
		jsr weapons_leave
		lda dead_count
		dec dead_count
		cmp #$01
		bne @not_dead
			jmp clear_it
@not_dead:
	jsr boss1_move
	jsr boss1_spr_assoc
	jsr boss1_shooting
	jsr boss1_rain
	jsr boss1_sideways
	ldx #$00
	txa
:	sta e_left+1, x
	sta e_right+1, x
	sta e_top+1, x
	sta e_bot+1, x
	inx
	cpx #$08
	bne :-
	jmp return_boss_loop

boss2_loop:
	lda #$01
	sta boss_switch
	lda pal_address+29
	cmp #$27
	bne :+
		dec boss_color_counter
		lda boss_color_counter
		bne :+
			lda #$05
			sta pal_address+29
			lda #$0f
			sta pal_address+30
:
	lda #$f0
	sta evil
	sta evil2
	lda dead_count
	beq @not_dead
		jsr weapons_leave
		lda dead_count
		dec dead_count
		cmp #$01
		bne @not_dead
			jmp clear_it
@not_dead:
	ldy #$00
	sty e_type_offset
@again:
	
	jsr process_enemies

	lda e_dir+6
	cmp #$10
	bcs @move_up
		ldx e_type_offset
:		ldy e_slot_offset, x
		lda enemy_spr0_0y, y
		clc
		adc #$01
		sta enemy_spr0_0y, y
		inx
		cpx #$06
		bne :-
		inc e_dir+6
		jmp @done_move
@move_up:
	ldx e_type_offset
:	ldy e_slot_offset, x
	lda enemy_spr0_0y, y
	sec
	sbc #$01
	sta enemy_spr0_0y, y
	inx
	cpx #$06
	bne :-
	inc e_dir+6
	lda e_dir+6
	cmp #$20
	bne :+
		lda #$00
		sta e_dir+6
:
@done_move:
	ldy e_type_offset
	iny
	sty e_type_offset
	cpy #$06
	bne @again
	jsr enemy_sprite_associate
	jmp return_boss_loop

boss3_loop:
	lda pal_address+29
	cmp #$27
	bne :+
		dec boss_color_counter
		lda boss_color_counter
		bne :+
			lda #$21
			sta pal_address+29
			lda #$11
			sta pal_address+30
:
	lda #$f0
	sta evil
	sta evil2
	lda dead_count
	beq @not_dead
		jsr weapons_leave
		lda dead_count
		dec dead_count
		cmp #$01
		bne @not_dead
			jmp clear_it
@not_dead:
	ldy #$00
	sty e_type_offset
@again:
	
	jsr process_enemies

	ldy e_type_offset
	iny
	sty e_type_offset
	cpy #$05
	bne @again

	lda e_left
	cmp p_right
	bcc @move_right
		ldx #$00
:		ldy e_slot_offset, x
		lda e_x_fine, x
		sec
		sbc kyr_speed;#$20;#<boss3_speed
		sta e_x_fine, x
		lda enemy_spr0_0x, y
		sbc #$00;#>boss3_speed
		sta enemy_spr0_0x, y
		inx
		cpx #$05
		bne :-
		jmp @up_down
@move_right:
	ldx #$00
:
	ldy e_slot_offset, x
	lda e_x_fine, x
	clc
	adc kyr_speed;#$20;#<boss3_speed
	sta e_x_fine, x
	lda enemy_spr0_0x, y
	adc #$00;#>boss3_speed
	sta enemy_spr0_0x, y
	inx
	cpx #$05
	bne :-
@up_down:
	lda e_top
	cmp p_bot
	bcc @up
		ldx #$00
:
		ldy e_slot_offset, x
		lda e_y_pos, x
		sec
		sbc kyr_speed;#$20;#<boss3_speed
		sta e_y_pos, x
		lda enemy_spr0_0y, y
		sbc #$00;#>boss3_speed
		sta enemy_spr0_0y, y
		inx
		cpx #$05
		bne :-
		jmp @done_move
@up:
	ldx #$00
:
	ldy e_slot_offset, x
	lda e_y_pos, x
	clc
	adc kyr_speed;#<boss3_speed
	sta e_y_pos, x
	lda enemy_spr0_0y, y
	adc #$00;#>boss3_speed
	sta enemy_spr0_0y, y
	inx
	cpx #$05
	bne :-
@done_move:
@done:
	jsr enemy_sprite_associate
	jmp return_boss_loop


boss4_loop:
	lda pal_address+29
	cmp #$27
	bne :+
		dec boss_color_counter
		lda boss_color_counter
		bne :+
			lda #$07
			sta pal_address+29
			lda #$17
			sta pal_address+30
:

	lda #$f0
	sta evil
	sta evil2
	lda dead_count
	beq @not_dead
		jsr weapons_leave
		lda dead_count
		dec dead_count
		cmp #$01
		bne @not_dead
			jmp clear_it
@not_dead:
	ldy #$00
	sty e_type_offset
@again:
	
	jsr process_enemies

	ldy e_type_offset
	iny
	sty e_type_offset
	cpy #$04
	bne @again
	ldy #$00
:	lda boss4_spr, y
	sta enemy_spr6_0y, y
	iny
	cpy #44
	bne :-
	jsr enemy_sprite_associate
	jsr reticle_hit_enemies
	jsr gargoyle_move
	jsr gargoyle_hit_enemies
	jmp return_boss_loop


loop_boss:
	jmp (boss_addy)
return_boss_loop:
	lda e_hp
	bpl :+
		lda #$27
		sta pal_address+29
		lda #$16
		sta pal_address+30
		lda #$00
		sta temp_8bit_1
		sta temp_8bit_2
;		jsr music_stopsfx
		ldx #$07
		jmp return_music_routine
return_shake:
		lda #<loop_boss_dead
		sta loop_pointer+0
		lda #>loop_boss_dead
		sta loop_pointer+1
		lda #<nmi_map
		sta nmi_addy+0
		lda #>nmi_map
		sta nmi_addy+1
		jmp end_loop
:
	jsr anim_that_amon
	jsr b_hit_amondus
	jsr ravens_hit_enemies
	jsr e_hit_amondus
	jsr missiles_go
	jsr missiles_hit_enemies
	jsr amondus_controls
	lda player2
	beq @no_player2
		lda char_stun
		beq :+
			dec char_stun
			bne @no_player2
			lda #$27
			sta pal_address+22
			lda #$16
			sta pal_address+23
			jmp @no_player2
:		jsr player2_controls
@no_player2:
	jsr ravens_move
	jsr ravens_pos
	jsr charwit_fire_move
	jsr charwit_hit_enemies
	jsr amondus_sprites
	jsr palette_animation_routine
	jsr flicker_em
	jsr player2_on_off
	lda p_left_side
	cmp #$f0
	beq :+
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq :+
		lda #<loop_pause_boss
		sta loop_pointer+0
		lda #>loop_pause_boss
		sta loop_pointer+1
		jsr paused_music
		jsr load_pause_music
;		jmp end_loop
:
	jmp end_loop

loop_pause_boss:
	jsr palette_animation_routine
	jsr flicker_em
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq :+
		lda #<loop_boss
		sta loop_pointer+0
		lda #>loop_boss
		sta loop_pointer+1
		jsr paused_music_returns
:	jmp end_loop

boss_spr_stop:
	.byte $28,$00,$00,$00
boss_spr_lo:
	.byte <boss1_spr,<boss2_spr,<boss3_spr,<boss4_spr
boss_spr_hi:
	.byte >boss1_spr,>boss2_spr,>boss3_spr,>boss4_spr
boss1_spr:
	.byte $a0,$91,$03,$70
	.byte $a0,$93,$03,$78
	.byte $a0,$95,$03,$80
	.byte $a0,$97,$03,$88
	.byte $b0,$99,$03,$70
	.byte $b0,$9b,$03,$78
	.byte $b0,$9d,$03,$80
	.byte $b0,$9f,$03,$88
	.byte $a8,$a1,$03,$68
	.byte $a8,$a3,$03,$90
	.byte $f0,$07,$41,$f0
	.byte $f0,$07,$01,$f0
	.byte $f0,$07,$01,$f0
	.byte $f0,$a5,$02,$a5
	.byte $f0,$a5,$02,$a5
	.byte $f0,$a5,$02,$a5
	.byte $f0,$a7,$02,$a5
boss2_spr:

boss3_spr:

boss1_spr_assoc:
	lda #$01
	sta boss_switch
	lda enemy_spr0_0y+0
	sta e_top
	sta enemy_spr0_0y+4
	sta enemy_spr0_0y+8
	sta enemy_spr0_0y+12
	clc
	adc #$08
	sta enemy_spr0_0y+32
	sta enemy_spr0_0y+36
	clc
	adc #$08
	sta enemy_spr0_0y+16
	sta enemy_spr0_0y+20
	sta enemy_spr0_0y+24
	sta enemy_spr0_0y+28
	clc
	adc #$04
	sta e_bot
	lda enemy_spr0_0x+0
	sta enemy_spr0_0x+16
	sec
	sbc #$08
	sta enemy_spr0_0x+32
	clc
	adc #$08
	sta e_left
	clc
	adc #$08
	sta enemy_spr0_0x+4
	sta enemy_spr0_0x+20
	clc
	adc #$08
	sta enemy_spr0_0x+8
	sta enemy_spr0_0x+24
	clc
	adc #$08
	sta enemy_spr0_0x+12
	sta enemy_spr0_0x+28
	sta e_right
	clc
	adc #$08
	sta enemy_spr0_0x+36

	ldy #$00
	ldx #$00
:	lda enemy_spr0_0y+40, y
	sta b_top, x
	clc
	adc #$0d
	sta b_bot, x
	lda enemy_spr0_0x+40, y
	sta b_left, x
	clc
	adc #$08
	sta b_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$03
	bne :-

;	lda enemy_spr0_0y+44
;	sta b_top+1
;	clc
;	adc #$0d
;	sta b_bot+1
;	lda enemy_spr0_0x+44
;	sta b_left+1
;	clc
;	adc #$08
;	sta b_right+1
;
;	lda enemy_spr0_0y+48
;	sta b_top+2
;	clc
;	adc #$0d
;	sta b_bot+2
;	lda enemy_spr0_0x+48
;	sta b_left+2
;	clc
;	adc #$08
;	sta b_right+2

	ldy #$00
:	lda enemy_spr0_0y+52, y
	sta b_top, x
	clc
	adc #$07
	sta b_bot, x
	lda enemy_spr0_0x+52, y
	sta b_left, x
	clc
	adc #$08
	sta b_right, x
	iny
	iny
	iny
	iny
	inx
	cpx #$06
	bne :-

;	lda enemy_spr0_0y+56
;	sta b_top+4
;	clc
;	adc #$07
;	sta b_bot+4
;	lda enemy_spr0_0x+56
;	sta b_left+4
;	clc
;	adc #$08
;	sta b_right+4
;
;	lda enemy_spr0_0y+60
;	sta b_top+5
;	clc
;	adc #$07
;	sta b_bot+5
;	lda enemy_spr0_0x+60
;	sta b_left+5
;	clc
;	adc #$08
;	sta b_right+5

	lda enemy_spr0_0y+64
	sta b_top+6
	clc
	adc #$0e
	sta b_bot+6
	lda enemy_spr0_0x+64
	sta b_left+6
	clc
	adc #$08
	sta b_right+6

	rts

;e_move_count+0 = y movement bounc
;e_move_count+1 = when to go up
boss1_move:
	lda e_dir
	beq @move_right
		cmp #$01
		beq @move_left
			cmp #$02
			bne :+
				jmp @move_up
:			cmp #$03
			bne :+
				jmp @move_left_top
:			cmp #$04
			bne :+
				jmp @move_right_top
:			jmp @move_down
@move_right:
	lda enemy_spr0_0x+0
	cmp #$e0
	bcc :++
		lda #$01
		sta e_dir
		inc e_move_count+1
		lda e_move_count+1
		cmp #$03
		bne :+
			lda #$02
			sta e_dir
:		rts
:	clc
	adc #$01
	sta enemy_spr0_0x+0
	jmp @y_movement
@move_left:
	lda enemy_spr0_0x+0
	cmp #$08
	bcs :+
		lda #$00
		sta e_dir
		rts
:	sec
	sbc #$01
	sta enemy_spr0_0x+0
@y_movement:
	ldx e_move_count
	lda enemy_spr0_0y+0
	clc
	adc move_leaf_y, x
	sta enemy_spr0_0y+0
	inx
	stx e_move_count
	cpx #32
	bne :+
		lda #$00
		sta e_move_count
:	rts
@move_up:
	lda enemy_spr0_0y+0
	cmp #$10
	bcs :+
		lda #$03
		sta e_dir
		rts
:	sec
	sbc #$01
	sta enemy_spr0_0y+0
	rts
@move_left_top:
	lda enemy_spr0_0x+0
	cmp #$08
	bcs :++
		lda #$04
		sta e_dir
		inc e_move_count+1
		lda e_move_count+1
		cmp #$05
		bne :+
			lda #$05
			sta e_dir
			lda #$00
			sta e_move_count+1
			sta e_move_count
:		rts
:	sec
	sbc #$01
	sta enemy_spr0_0x+0
	rts
@move_right_top:
	lda enemy_spr0_0x+0
	cmp #$e0
	bcc :+
		lda #$03
		sta e_dir
		rts
:	clc
	adc #$01
	sta enemy_spr0_0x+0
	rts
@move_down:
	lda enemy_spr0_0y+0
	cmp #$a0
	bcc :+
		lda #$00
		sta e_dir
		rts
:	clc
	adc #$01
	sta enemy_spr0_0y+0
	rts

boss1_shooting:
	lda e_dir+1
	cmp #$01
	bne :+
		jmp shoot_light_boss1
:
	dec e_move_count+2
	lda e_move_count+2
	beq :+
		rts
:	lda enemy_spr0_0y+0
	sta enemy_spr0_0y+40
	sta enemy_spr0_0y+44
	sta enemy_spr0_0y+48
	lda enemy_spr0_0x+4
	sta enemy_spr0_0x+40
	sta enemy_spr0_0x+44
	sta enemy_spr0_0x+48
	lda #$04
	sta e_dir+4
	lda #$01
	sta e_dir+1
	ldx #$0c
	jmp return_sfx_routine
return_thunder:
	rts
shoot_light_boss1:
	ldx e_move_count+3
	lda enemy_spr0_0y+40
	cmp #$f0
	beq @second
	cmp #$04
	bcs :+
		lda #$f0
		sta enemy_spr0_0y+40
		jmp @second
:	lda enemy_spr0_0x+40
	cmp #$04
	bcs :+
		lda #$f0
		sta enemy_spr0_0y+40
		jmp @second
:	lda enemy_spr0_0y+40
	sec
	sbc lightning_speed;#$03
	sta enemy_spr0_0y+40
	lda enemy_spr0_0x+40
	clc
	adc light_left_x, x
	sta enemy_spr0_0x+40
@second:
	lda enemy_spr0_0y+44
	cmp #$f0
	bne :+
		jmp @third
:	cmp #$04
	bcs :+
		lda #$f0
		sta enemy_spr0_0y+44
		jmp @third
:	sec
	sbc lightning_speed;#$03
	sta enemy_spr0_0y+44
@third:
	lda enemy_spr0_0y+48
	cmp #$f0
	bne :+
		jmp @done
:	cmp #$04
	bcs :+
		lda #$f0
		sta enemy_spr0_0y+48
		jmp @done
:	lda enemy_spr0_0x+48
	cmp #$fc
	bcc :+
		lda #$f0
		sta enemy_spr0_0y+48
		jmp @done
:	lda enemy_spr0_0y+48
	sec
	sbc lightning_speed;#$03
	sta enemy_spr0_0y+48
	lda enemy_spr0_0x+48
	clc
	adc light_right_x, x
	sta enemy_spr0_0x+48
@done:
	lda enemy_spr0_0y+48
	cmp #$f0
	bne :+
		lda enemy_spr0_0y+40
		cmp #$f0
		bne :+
			lda enemy_spr0_0y+44
			cmp #$f0
			bne :+
				lda #$00
				sta e_dir+1
				lda #$3c
				sta e_move_count+2
				lda e_dir
				cmp #$02
				bcc :+
					lda #$01
					sta e_dir+1

:
	lda e_move_count+3
	cmp #$05
	bne :+
		lda #$00
		sta e_move_count+3
:	rts
light_left_x:
	.byte $ff,$00,$00,$00,$00
light_right_x:
	.byte $01,$00,$00,$00,$00

boss1_rain:
	lda e_dir
	cmp #$03
	beq :+
		cmp #$04
		beq :+
			lda #$f0
			sta enemy_spr0_0y+52
			sta enemy_spr0_0y+56
			sta enemy_spr0_0y+60
			rts
:	lda e_dir+2
	bne :+
		jsr do_rain
		lda enemy_spr0_0y+4
		sta enemy_spr0_0y+52
		lda enemy_spr0_0x+4
		sta enemy_spr0_0x+52
:	lda enemy_spr0_0y+52
	cmp #$f0
	bcc :+
		jmp @second
:	clc
	adc rain_speed;#$04
	sta enemy_spr0_0y+52
@second:
	lda e_dir+2
	cmp #$20
	bne :+
		jsr do_rain
		lda enemy_spr0_0y+4
		sta enemy_spr0_0y+56
		lda enemy_spr0_0x+4
		sta enemy_spr0_0x+56
:	lda enemy_spr0_0y+56
	cmp #$f0
	bcc :+
		jmp @third
:	clc
	adc rain_speed;#$04
	sta enemy_spr0_0y+56
@third:
	lda e_dir+2
	cmp #$40
	bne :+
		jsr do_rain
		lda enemy_spr0_0y+4
		sta enemy_spr0_0y+60
		lda enemy_spr0_0x+4
		sta enemy_spr0_0x+60
:	lda enemy_spr0_0y+60
	cmp #$f0
	bcc :+
		jmp @done
:	clc
	adc rain_speed;#$04
	sta enemy_spr0_0y+60
@done:
	inc e_dir+2
	lda e_dir+2
	cmp #$60
	bne :+
		lda #$00
		sta e_dir+2
:
	rts

boss1_sideways:
	lda e_dir+3
	bne @done_coll
	lda e_top
	cmp p_bot
		bcs @no_coll
	lda e_bot
	cmp p_top
		bcc @no_coll
	lda e_left
	cmp p_right
		bcs @fire_left
	lda e_right
	cmp p_left
		bcc @fire_right
;			jsr he_die
			jmp @done_coll
@fire_right:
	jsr do_wind
	lda #$01
	sta e_dir+3
	bne @done_coll
@fire_left:
	jsr do_wind
	lda #$03
	sta e_dir+3
@no_coll:
@done_coll:
	lda e_dir+3
	bne :+
		rts
:	cmp #$01
	bne :+
		lda enemy_spr0_0y+4
		clc
		adc #$04
		sta enemy_spr0_0y+64
		lda enemy_spr0_0x+4
		sta enemy_spr0_0x+64
		inc e_dir+3
:	cmp #$02
	bne :++
		lda enemy_spr0_0x+64
		cmp #$fb
		bcc :+
			lda #$f0
			sta enemy_spr0_0y+64
			lda #$00
			sta e_dir+3
			rts
:	clc
	adc #$04
	sta enemy_spr0_0x+64
	rts
:	cmp #$03
	bne :+
		lda enemy_spr0_0y+8
		sta enemy_spr0_0y+64
		lda enemy_spr0_0x+8
		sta enemy_spr0_0x+64
		inc e_dir+3
:	cmp #$04
	bne :++
		lda enemy_spr0_0x+64
		cmp #$05
		bcs :+
			lda #$f0
			sta enemy_spr0_0y+64
			lda #$00
			sta e_dir+3
			rts
:	sec
	sbc #$04
	sta enemy_spr0_0x+64
:	rts

loop_boss_dead:
	lda #$f8
	sta raven1
	sta raven2
	sta raven3
	lda #$ff
	sta mm1
	sta mm2
	sta mm3
	sta mm4
	lda #$f0
	sta charwit_fire
	lda #$70
	sta charwit_fire+3
	dec temp_8bit_2
	lda temp_8bit_2
	bne :+
		ldx level
		lda boss_done_lo, x	;#<loop_boss1_done
		sta loop_pointer+0
		lda boss_done_hi, x	;#>loop_boss1_done
		sta loop_pointer+1
		lda #$00
		sta temp_8bit_2
		jmp end_loop
:	ldx temp_8bit_1
	cpx #$04
	bne :+
		ldx #$00
		stx temp_8bit_1
:	lda scroll_x
	clc
	adc shake_screen_table, x
	sta scroll_x
	lda level
	cmp #$03
	bne :++
		lda temp_8bit_2
		cmp #$fe
		bcs :++
		ldy #$00
:		lda enemy_spr6_0x, y
		clc
		adc shake_screen_table, x
		sta enemy_spr6_0x, y
		iny
		iny
		iny
		iny
		cpy #44
		bne :-
		lda enemy_spr0_0x
		clc
		adc shake_screen_table, x
		sta enemy_spr0_0x
		lda enemy_spr0_1x
		clc
		adc shake_screen_table, x
		sta enemy_spr0_1x
		txa
		pha
		jsr flicker_em
		pla
		tax
:
	inx
	stx temp_8bit_1
	jmp end_loop
shake_screen_table:
	.byte $02,$02,$fe,$fe
boss_done_lo:
	.byte <loop_boss1_done, <loop_boss2_done, <loop_boss3_done, <loop_boss4_done
boss_done_hi:
	.byte >loop_boss1_done, >loop_boss2_done, >loop_boss3_done, >loop_boss4_done

loop_boss2_done:
	lda #$ff
	sta enemy_spr0_shot1tile
	sta enemy_spr0_shot2tile
	sta enemy_spr0_shot3tile
	ldx temp_8bit_2
	cpx #$05
	beq @eye
	ldy e_slot_offset, x
	lda enemy_spr1_0y, y
	cmp #$f0
	bcc :+
		inx
		stx temp_8bit_2
		jmp @flicker
:	clc
	adc #$04
	sta enemy_spr1_0y, y
	jmp @flicker
@eye:
	ldy #$00
	lda enemy_spr0_0y, y
	cmp #$f0
	bcc :+
		jsr boss_dead_go_to_end_loop
:	clc
	adc #$01
	sta enemy_spr0_0y, y
@flicker:
	jsr enemy_sprite_associate
	jsr flicker_em
	jmp end_loop
loop_boss3_done:
	lda #$ff
	sta enemy_spr0_shot1tile
	sta enemy_spr1_shot1tile
	sta enemy_spr2_shot1tile
	sta enemy_spr3_shot1tile
	sta enemy_spr4_shot1tile
	ldx temp_8bit_2
	cpx #$05
	beq @eye
	ldy e_slot_offset, x
	lda enemy_spr1_0y, y
	cmp #$f0
	bcc :+
		inx
		stx temp_8bit_2
		jmp @flicker
:	clc
	adc #$04
	sta enemy_spr1_0y, y
	jmp @flicker
@eye:

		jsr boss_dead_go_to_end_loop

@flicker:
	jsr enemy_sprite_associate
	jsr flicker_em
	jmp end_loop
loop_boss4_done:
	ldy #$00
	lda #$f0
:	sta enemy_spr0_0y, y
	iny
	iny
	iny
	iny
	cpy #$b0
	bne :-
	jsr flicker_em
		inc number_times_beaten
		lda #$38
		sta kyr_speed
		lda #$03
		sta eye_speed
		sta lightning_speed
		lda #$04
		sta rain_speed
		jsr boss_dead_go_to_end_loop
	jmp end_loop

loop_boss1_done:
	jsr boss1_spr_assoc
	jsr flicker_em
	lda enemy_spr0_0y+0
	cmp #$e0
	bne :+
		jsr boss_dead_go_to_end_loop
		jmp end_loop
:	clc
	adc #$01
	sta enemy_spr0_0y+0
	jmp end_loop
	
loop_boss_dead_wait:
	dec temp_8bit_2
	lda temp_8bit_2
	bne @not_yet
		inc level
		lda #$00
		sta boss_switch
		sta goblin_switch
		lda level
		cmp #$04
		bne :+
			lda #$24
			sta ppu_addy+1
			lda #$c0
			sta ppu_addy+0
			lda #<loop_tree_open
			sta loop_pointer+0
			lda #>loop_tree_open
			sta loop_pointer+1
			jmp end_loop
:		jmp clear_it
@not_yet:
	jmp end_loop

boss_dead_go_to_end_loop:
	ldy #$00
:	lda #$00
	sta enemy_spr0_0x, y
	lda #$f0
	sta enemy_spr0_0y, y
	iny
	iny
	iny
	iny
	cpy #68
	bne :-
	jsr flicker_em
	jsr nmi_wait
	ldx #$0b
	jmp return_music_routine
return_done:
	lda #$ff
	sta temp_8bit_2
	lda #<loop_boss_dead_wait
	sta loop_pointer+0
	lda #>loop_boss_dead_wait
	sta loop_pointer+1
		lda #$f0
		sta $230
		sta $234
		sta $430
		sta $434
	rts
