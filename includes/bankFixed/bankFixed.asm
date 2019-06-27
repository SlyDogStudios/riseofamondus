.segment "BANKFIXED"
.include "includes\bankFixed\amondus_reset.asm"

loop_main:
	jmp (loop_pointer)
end_loop:
	jsr nmi_wait
	jmp loop_main

nmi:
	pha								; Save the registers
	txa								;
	pha								;
	tya								;
	pha								;

	lda $2002

	inc nmi_num

	lda #$02						; Do sprite transfer
	sta $4014						;

	ldx #$00
	lda #$3f						; refresh the palette
	sta $2006						;
	lda #$00						;
	sta $2006						;
:	lda pal_address, x				;
	sta $2007						;
	inx								;
	cpx #32							;
	bne :-							;

	jmp (nmi_addy)
end_nmi:
	lda #$01
	sta $4016
	lda #$00
	sta $4016
	lda control_pad
	sta control_old
	ldx #$08
:	lda $4016
	lsr A
	ror control_pad
	dex
	bne :-
    lda control_pad2
    sta control_old2
    ldx #$08
:   lda $4017
    lsr A
    ror control_pad2
    dex
    bne :-

	lda nametable
	sta $2006
	lda #$00
	sta $2006
	lda scroll_x
	sta $2005
	lda scroll_y
	sta $2005

	lda bonus_game
	bne :+
	ldy #$01
	jsr bankswitch
	jsr music_play	; music play here
	ldy bank
	jsr bank_save
:
	pla								; Restore the registers
	tay								;
	pla								;
	tax								;
	pla								;
irq:
	rti

nmi_wait:
	lda nmi_num						; Wait for an NMI to happen before running
:	cmp nmi_num						; the main loop again
	beq :-							;
	rts

loop_gameplay:
	lda dead_count
	beq @not_dead
		jsr test_do_away
		dec dead_count
		lda dead_count
		cmp #$01
		bne @not_dead
			jmp clear_it
@not_dead:
	lda cam_count
	bne :++
		lda scroll_dir
		cmp #$01
		bne :+
			dec cam
			jmp :++
:		inc cam
:	lda cam_count
	clc
	adc #$01
	sta cam_count
	lda scroll_x_fine
	cmp #$e0
	bne :+
		inc when_to_lay
:
		lda when_to_lay
		cmp #$20
		bne :+
			lda #$00
			sta lay_tiles
			sta when_to_lay
:
	lda lay_tiles
	bne :+
			jsr ready_tiles
:
	lda scroll_dir
	cmp #$01
	bne :+
		jsr scrolling_left
		jmp :++
:	jsr scrolling_right


:
	jsr anim_that_amon

;	jmp @end_test					; REMOVE THIS WHEN READY FOR ENEMY STUFF
	ldy #$00
	sty e_type_offset
@e_start:
	ldy e_type_offset
	lda e_type, y
	beq :++
:		jmp @do_em;:+++
:	lda e_bullet_type, y
	bne :--
	ldx level
	ldy enemy_offset
	lda enemy_x_lo, x
	sta e_x_addy+0
	lda enemy_x_hi, x
	sta e_x_addy+1
	lda enemy_x_fine_lo, x
	sta e_x_fine_addy+0
	lda enemy_x_fine_hi, x
	sta e_x_fine_addy+1
	lda (e_x_addy), y
	cmp cam
	beq :+
		jmp @do_em
:		lda (e_x_fine_addy), y
		cmp cam_count
		bne @do_em
			lda enemy_type_lo, x
			sta e_type_addy+0
			lda enemy_type_hi, x
			sta e_type_addy+1
			lda (e_type_addy), y
			pha
			lda enemy_dir_lo, x
			sta e_dir_addy+0
			lda enemy_dir_hi, x
			sta e_dir_addy+1
			lda (e_dir_addy), y
			pha
			lda enemy_y_lo, x
			sta e_y_addy+0
			lda enemy_y_hi, x
			sta e_y_addy+1
			lda (e_y_addy), y
			ldy e_type_offset
			clc
			adc #$01
			sta e_y_pos, y
			lda cam
			sta e_x_pos, y
			pla
			sta e_dir, y
			pla
			sta e_type, y
			sta e_anim_state, y
			tax
			lda enemy_hp_table, x
			sta e_hp, y
			lda e_hp, y
			clc
			adc number_times_beaten
			sta e_hp, y
			lda #$00
			sta e_anim_count, y
			sta e_move_count, y
			ldx e_type_offset	;lda e_type_offset
			lda boss2_slot, x	;jsr choose_e_slot
			sta e_slot_offset, x
			jsr enemy_place_sprites
			inc enemy_offset
@do_em:
	jsr process_enemies
@e_increment:
	ldy e_type_offset
	iny
	sty e_type_offset
	cpy #$09
	beq :+
		jmp @e_start
:

@end_test:
	jsr b_hit_amondus
	jsr e_hit_amondus
	jsr ravens_hit_enemies
	jsr missiles_go
	jsr missiles_hit_enemies
	jsr reticle_hit_enemies
	jsr gargoyle_move
	jsr gargoyle_hit_enemies
	jsr e_hit_evil
	jsr enemy_sprite_associate
	jsr palette_animation_routine
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
	jsr evil_flicker
	jsr flicker_em
	jsr test_one_up
	jsr player2_on_off
	lda p_left_side
	cmp #$f0
	beq :+
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq :+
		lda #<loop_pause
		sta loop_pointer+0
		lda #>loop_pause
		sta loop_pointer+1
		lda #<nmi_pause
		sta nmi_addy+0
		lda #>nmi_pause
		sta nmi_addy+1
		ldy #1
		jsr bankswitch
		jsr music_stopsfx
		ldy bank
		jsr bank_save
		jsr nmi_wait
		jsr paused_music
		jsr load_pause_music
;		jmp end_loop
:
@do_nmi:
	jmp end_loop

load_pause_music:
	ldx #$04
	jmp return_music_routine
return_pause:
	rts

the_sprites:
	.byte $6f,$05,$01,$c0
	.byte $6f,$05,$41,$c8
	.byte $f8,$11,$01,$80
	.byte $f8,$13,$01,$88
	.byte $4f,$01,$00,$c0
	.byte $4f,$03,$00,$c8
	.byte $f8,$09,$00,$40
	.byte $f8,$09,$00,$50
	.byte $f8,$09,$00,$60
	.byte $00,$0f,$00,$f0
	.byte $e0,$0f,$00,$f0
	.byte $f0,$41,$01,$70
mm_spr:
	.byte $ff,$43,$01,$ff
	.byte $ff,$43,$01,$ff
	.byte $ff,$43,$01,$ff
	.byte $ff,$43,$01,$ff

palette_animation_routine:
	dec anim_ticker					; anim_ticker was set to #$08 towards
	bne :++							;  the beginning of the program.
		lda #$08					;  When it is zero, reset it to the
		sta anim_ticker				;  same value (it's a delay).
		ldx anim_offset				; If anim_offset is 1, then set it
		cpx #$01					;  back to zero. This is used to find
		bne :+						;  the proper value in pal_animation1.
			ldx #$00				;
			stx anim_offset			;
			jmp @next
:		inx
		stx anim_offset
		jmp @next
:	ldx anim_offset					; Put the data in the proper palette
	lda pal_animation1, x			;  using the value in anim_offset
	sta pal_address+21

	lda on_map
	beq :+
		rts
:	lda level
	bne @one
		lda star1, x
		sta pal_address+13
		lda boss_switch
		beq :++
			lda e_dir+4
			beq :+
				dec e_dir+4
				lda pal_light1, x
				sta pal_address+1
				lda pal_light2, x
				sta pal_address+2
				lda pal_light3, x
				sta pal_address+0
				sta pal_address+16
				rts
:			lda pal_light4, x
			sta pal_address+1
			lda pal_light5, x
			sta pal_address+2
			lda pal_light6, x
			sta pal_address+0
			sta pal_address+16
:			rts
@one:
	cmp #$01
	bne @two
		lda boss_switch
		beq :++
			lda e_y_pos
			beq :+
				lda pal_light_it, x
				sta pal_address+1
				rts
:			lda pal_light4, x
			sta pal_address+1
:			rts
@two:
	cmp #$02
	bne @three
		lda on_map
		bne :++
			lda rain1, x
			sta pal_address+13
			lda rain2, x
			sta pal_address+14
		lda boss_switch
		bne :++
		lda flash_grave
		beq :+
			lda #$16
			sta pal_address+31
			sta pal_address+11
			rts
:		lda #$0f
		sta pal_address+31
		lda #$00
		sta pal_address+11
:		rts
@three:
	lda water1, x
	sta pal_address+13
	lda water2, x
	sta pal_address+14
@next:
	rts

pal_animation1:
	.byte $2a,$25
water1:
	.byte $12,$21
water2:
	.byte $21,$12
pal_light1:
	.byte $1a,$1a
pal_light2:
	.byte $2a,$2a
pal_light3:
	.byte $30,$30
pal_light4:
	.byte $0a,$0a
pal_light5:
	.byte $19,$19
pal_light6:
	.byte $0f,$0f
pal_light_it:
	.byte $30,$09
rain1:
	.byte $0c,$0f
rain2:
	.byte $0f,$0c
star1:
	.byte $0f,$28


loop_pause:
	jsr palette_animation_routine
	jsr evil_flicker
	jsr flicker_em
;	lda control_pad
;	and #up_punch
;	beq :+
;		inc level
;		lda #$00
;		sta boss_switch
;		sta goblin_switch
;		jmp clear_it
;:
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq @stay_paused
		lda #<loop_gameplay
		sta loop_pointer+0
		lda #>loop_gameplay
		sta loop_pointer+1
		lda #<nmi_lay_em
		sta nmi_addy+0
		lda #>nmi_lay_em
		sta nmi_addy+1
;		lda cam
;		cmp #$02
;		bcs :++
;:			jsr load_boss_music
;			jmp :++
;:		cmp #$3e
;		bcs :--
;		jsr load_level_music
;:
		jsr paused_music_returns
@stay_paused:
	jmp end_loop
nmi_pause:
	jmp end_nmi
paused_music:
	ldx #$00
:	lda $300, x
	sta $500, x
	inx
	cpx #$40
	bne :-
	lda $380
	sta $580
	lda $381
	sta $581
	lda $382
	sta $582
	lda $583
	sta $583
	ldx #$00
:	lda $fa, x
	sta $5fa, x
	inx
	cpx #$06
	bne :-
	rts
paused_music_returns:
	ldx #$00
:	lda $500, x
	sta $300, x
	inx
	cpx #$40
	bne :-
	lda $580
	sta $380
	lda $581
	sta $381
	lda $582
	sta $382
	lda $583
	sta $383
	ldx #$00
:	lda $5fa, x
	sta $fa, x
	inx
	cpx #$06
	bne :-
	rts

nmi_nothing:
	jmp end_nmi
loop_nada:
	jmp end_loop
;i_reset:
;	jmp i_reset
invasion_init:
	lda $700
	ldx #$12
	jmp return_music_routine
return_stop_title2:
	jsr nmi_wait
	ldy #6
	jsr bank_save
	lda #<nmi_nothing
	sta nmi_addy+0
	lda #>nmi_nothing
	sta nmi_addy+1
	lda #<loop_nada
	sta loop_pointer+0
	lda #>loop_nada
	sta loop_pointer+1
	jmp i_reset
code_check:
	.byte down_punch, down_punch, down_punch, right_punch
	.byte right_punch, right_punch, right_punch
test_secret_controller_code:
	ldx temp_8bit_2
	lda control_pad
	eor control_old
	and control_pad
	and code_check, x
	beq :+
		lda #$10
		sta temp_16bit_3+0
		lda temp_8bit_2
		clc
		adc #$01
		sta temp_8bit_2
		cmp #$07
		bne :+
			lda #$01
			sta temp_16bit_3+1	;success
			rts
:	lda temp_16bit_3+0
	beq :+
		sec
		sbc #$01
		sta temp_16bit_3+0
		rts
:	lda #$00
	sta temp_8bit_2
	rts

level_song_list:
	.byte $03,$0f,$0d,$0c
boss_song_list:
	.byte $08,$08,$08,$0e
return_music_lo:
	.byte <return_none
	.byte <return_story, <return_startit, <return_level1, <return_pause, <return_load
	.byte <return_dead, <return_shake, <return_boss1, <return_none2, <return_none3
	.byte <return_done, <return_level1, <return_level1, <return_boss1, <return_level1
	.byte <return_level2, <return_stop_title1, <return_stop_title2
return_music_hi:
	.byte >return_none
	.byte >return_story, >return_startit, >return_level1, >return_pause, >return_load
	.byte >return_dead, >return_shake, >return_boss1, >return_none2, >return_none3
	.byte >return_done, >return_level1, >return_level1, >return_boss1, >return_level1
	.byte >return_level2, >return_stop_title1, >return_stop_title2
return_music_routine:
	lda return_music_lo, x
	sta return_music+0
	lda return_music_hi, x
	sta return_music+1
	ldy #1
	jsr bankswitch
	txa
	jsr music_loadsong
	ldy bank
	jsr bankswitch
	jmp (return_music)
return_sfx_lo:
	.byte <return_silence
	.byte <return_reticle,<return_magic1,<return_ping1,<return_hit1,<return_silence
	.byte <return_raven1,<return_missile,<return_laugh,<return_enough,<return_got
	.byte <return_oneup,<return_thunder,<return_rain,<return_wind,<return_windy
	.byte <return_ghost, <return_beeper1, <return_beeper2, <return_beeper3, <return_beeper4
	.byte <return_energy,<return_toggle,<return_raven2,<return_raven3,<return_magic2
	.byte <return_magic3,<return_open
return_sfx_hi:
	.byte >return_silence
	.byte >return_reticle,>return_magic1,>return_ping1,>return_hit1,>return_silence
	.byte >return_raven1,>return_missile,>return_laugh,>return_enough,>return_got
	.byte >return_oneup,>return_thunder,>return_rain,>return_wind,>return_windy
	.byte >return_ghost, >return_beeper1, >return_beeper2, >return_beeper3, >return_beeper4
	.byte >return_energy,>return_toggle,>return_raven2,>return_raven3,>return_magic2
	.byte >return_magic3,>return_open
return_sfx_routine:
	lda return_sfx_lo, x
	sta return_sfx+0
	lda return_sfx_hi, x
	sta return_sfx+1
	ldy #1
	jsr bankswitch
	txa
	cmp #$0b
	beq :+
		cmp #$0c
		bne :++
:		clc
		adc #$80
:	jsr music_loadsfx
	ldy bank
	jsr bankswitch
	jmp (return_sfx)
return_silence:

palette:
.incbin "includes\bankFixed\amondus.pal"
.byte $0f,$13,$09,$1a, $0f,$2a,$28,$38, $0f,$00,$21,$31, $0f,$10,$00,$0f
pal_map:
.incbin "includes\bankFixed\amondus_map.pal"
.byte $0f,$13,$09,$1a, $0f,$2a,$28,$38, $0f,$00,$21,$31, $0f,$21,$30,$30
pal_manual:
.incbin "includes\bankFixed\manual_blue.pal"
.byte $30

.include "includes\bankFixed\amondus_levels.asm"
.include "includes\bankFixed\amondus_setups.asm"
.include "includes\bankFixed\amondus_player.asm"
.include "includes\bankFixed\amondus_player_anim.asm"
.include "includes\bankFixed\amondus_manual.asm"

.segment "BANKTABLE"
banks:
	.byte $00,$01,$02,$03,$04,$05,$06
bank_save:
	sty bank
bankswitch:
	lda banks, y		; read a byte from the banktable (banks)
	sta banks, y		;  and write it back, switching banks
	rts					;  store the current bank in RAM

.segment "VECTORS"
	.addr nmi
	.addr reset
	.addr irq
