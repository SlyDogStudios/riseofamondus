loop_end1:
	lda raven1_x
	cmp #$38
	beq :+
		lda e_x_fine
		clc
		adc #<ship_speed
		sta e_x_fine
		lda raven1_x
		adc #>ship_speed
		sta raven1_x
		sec
		sbc #$08
		sta enemy_spr1_shot1x
		clc
		adc #$10
		sta raven2_x
		adc #$08
		sta raven3_x
		adc #$08
		sta evil+3
:
	lda e_move_count
	cmp #$08
	bcc :+
		lda #$23
		sta charwit_fire+1
		lda #$21
		sta enemy_spr0_0y+1
		bne :++
:	lda #$27
	sta charwit_fire+1
	lda #$25
	sta enemy_spr0_0y+1
:	inc e_move_count
	lda e_move_count
	cmp #$10
	bcc :+
		lda #$00
		sta e_move_count
:	lda flash_grave
	cmp #$0a
	bne :+
		lda #$f0
		sta evil2
		sta charwit_fire
		sta enemy_spr0_0y
		bne :++
:	lda evil2+3
	sec
	sbc #$01
	sta evil2+3
	clc
	adc #$03
	sta charwit_fire+3
	clc
	adc #$08
	sta enemy_spr0_0y+3
	cmp #$0b
	bne :+
		inc flash_grave
		ldx flash_grave
		lda item_list, x
		sta evil2+1
:
	jsr palette_animation_routine
	jsr flicker_em

	lda control_pad
	and #start_punch
	beq :+
		lda #$00
		sta level
		sta boss_switch
		sta goblin_switch
		sta dead_count
		ldx #$0a
		jmp return_music_routine
return_none3:
		jmp clear_it
:
	jmp end_loop

; scroll a0 / sphere 9e / mm a8
item_list:
	.byte $9e,$a0,$9e,$a8,$a2,$a8, $a4, $ac,$a8, $a6
end_spr:
	.byte $47,$98,$02,$10	; raven1 start in sprite constants
	.byte $47,$98,$02,$18
	.byte $47,$9a,$02,$20
	.byte $47,$9c,$02,$28
	.byte $8c,$9e,$01,$ec
	.byte $88,$23,$40,$f0
	.byte $88,$21,$40,$f8
	.byte $70,$f5,$03,$70
	.byte $70,$f7,$03,$78
	.byte $70,$f9,$03,$80
	.byte $70,$fb,$03,$88
	.byte $70,$fd,$01,$80
	.byte $70,$0d,$01,$88
	.byte $47,$aa,$02,$08

end1:
	.byte "AND SO IT WAS THAT AMONDUS "
end2:
	.byte "CONQUERED THE PRIMWOODS AND"
end3:
	.byte "COERCED THE GOBLINS TO EVIL"
end_lo:
	.byte <end1,<end2,<end3
end_hi:
	.byte >end1,>end2,>end3
nmi_end1:
	lda ppu_addy+0
	cmp #$23
	bne :+
		lda #<nmi_final
		sta nmi_addy+0
		lda #>nmi_final
		sta nmi_addy+1
		jmp end_nmi
:
	inc hold_y
	lda hold_y
	cmp #$20
	beq :+
		jmp end_nmi
:	lda #$00
	sta hold_y
	ldx dead_count
	lda end_lo, x
	sta temp_16bit_2+0
	lda end_hi, x
	sta temp_16bit_2+1
	lda ppu_addy+1
	sta $2006
	lda ppu_addy+0
	sta $2006
	ldy temp_8bit_2
	cpy #$1b
	beq :+
		lda (temp_16bit_2), y
		sta $2007
		inc temp_8bit_2
		inc ppu_addy+0
		jmp end_nmi
:	lda ppu_addy+0
	clc
	adc #$25
	sta ppu_addy+0
	lda #$00
	sta temp_8bit_2
	inc dead_count
	jmp end_nmi

nmi_final:
	ldx #$00
	lda #$22
	sta $2006
	lda #$c7
	sta $2006
:	lda map_line8, x
	sta $2007
	inx
	cpx #$05
	bne :-

	lda #$22
	sta $2006
	lda #$d0
	sta $2006
	jsr write_score

	jmp end_nmi
