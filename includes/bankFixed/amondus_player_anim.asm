p_anim_table:
	.addr anim_no-1
	.addr anim_left-1, anim_right-1, anim_mid-1, anim_laugh-1, anim_launch-1
	.addr anim_die-1, anim_no-1


anim_no:
	rts

anim_left:
	lda p_anim_count
	cmp #$08
	bcs @next
		lda #<anim_left1
		sta p_anim_addy+0
		lda #>anim_left1
		sta p_anim_addy+1
		jmp @load
@next:
	lda #<anim_left2
	sta p_anim_addy+0
	lda #>anim_left2
	sta p_anim_addy+1
@load:
	jsr p_anim_load
	inc p_anim_count
	lda p_anim_count
	cmp #$10
	bcc :+
		lda #$00
		sta p_anim_count
:	rts
anim_left1:
	.byte $39,$00
	.byte $3b,$00
anim_left2:
	.byte $3d,$00
	.byte $3f,$00

anim_right:
	lda p_anim_count
	cmp #$08
	bcs @next
		lda #<anim_right1
		sta p_anim_addy+0
		lda #>anim_right1
		sta p_anim_addy+1
		jmp @load
@next:
	lda #<anim_right2
	sta p_anim_addy+0
	lda #>anim_right2
	sta p_anim_addy+1
@load:
	jsr p_anim_load
	inc p_anim_count
	lda p_anim_count
	cmp #$10
	bcc :+
		lda #$00
		sta p_anim_count
:	rts
anim_right1:
	.byte $3f,$40
	.byte $3d,$40
anim_right2:
	.byte $3b,$40
	.byte $39,$40

anim_mid:
	lda p_anim_count
	cmp #$08
	bcs @next
		lda #<anim_mid1
		sta p_anim_addy+0
		lda #>anim_mid1
		sta p_anim_addy+1
		jmp @load
@next:
	lda #<anim_mid2
	sta p_anim_addy+0
	lda #>anim_mid2
	sta p_anim_addy+1
@load:
	jsr p_anim_load
@skip_init:
	inc p_anim_count
	lda p_anim_count
	cmp #$10
	bcc :+
		lda #$00
		sta p_anim_count
:	rts
anim_mid1:
	.byte $01,$00
	.byte $01,$40
anim_mid2:
	.byte $03,$00
	.byte $03,$40

anim_laugh:
	lda p_anim_count
	cmp #$08
	bcs @next
		lda #<anim_laugh1
		sta p_anim_addy+0
		lda #>anim_laugh1
		sta p_anim_addy+1
		jmp @load
@next:
	cmp #$10
	bcs @next2
		lda #<anim_laugh2
		sta p_anim_addy+0
		lda #>anim_laugh2
		sta p_anim_addy+1
		jmp @load
@next2:
;	cmp #$18
;	bcs @next3
		lda #<anim_laugh1
		sta p_anim_addy+0
		lda #>anim_laugh1
		sta p_anim_addy+1
;		jmp @load
;@next3:
;	cmp #$20
;	bcs @next4
;	lda #<anim_laugh2
;	sta p_anim_addy+0
;	lda #>anim_laugh2
;	sta p_anim_addy+1
;	jmp @load
;@next4:
;	cmp #$28
;	bcs @next5
;	lda #<anim_laugh1
;	sta p_anim_addy+0
;	lda #>anim_laugh1
;	sta p_anim_addy+1
;	jmp @load
;@next5:
;	lda #<anim_laugh2
;	sta p_anim_addy+0
;	lda #>anim_laugh2
;	sta p_anim_addy+1
@load:
	jsr p_anim_load
	inc p_anim_count
	lda p_anim_count
	cmp #$18
	bcc done_mm_anim
		lda #$00
		sta p_anim_count
		lda #$01
		sta mm_launcher
		ldx #$07
		jmp return_sfx_routine
return_missile:
		lda #$05
		sta p_anim_state
done_mm_anim:
	rts
anim_laugh1:
	.byte $4b,$00
	.byte $4b,$40
anim_laugh2:
	.byte $03,$00
	.byte $03,$40

anim_launch:
	lda p_anim_count
	cmp #$08
	bcs :+
		lda #<anim_launch1
		sta p_anim_addy+0
		lda #>anim_launch1
		sta p_anim_addy+1
		jmp @load
:	cmp #$10
	bcs :+
		lda #<anim_launch2
		sta p_anim_addy+0
		lda #>anim_launch2
		sta p_anim_addy+1
		jmp @load
;:	cmp #$18
;	bcs :+
;		lda #<anim_launch1
;		sta p_anim_addy+0
;		lda #>anim_launch1
;		sta p_anim_addy+1
;		jmp @load
:	lda #$00
	sta p_anim_state
	sta p_anim_count
	rts
@load:
	jsr p_anim_load
	inc p_anim_count
;	lda p_anim_count
;	cmp #$10
;	bcc :+
;		lda #$00
;		sta p_anim_count
;:
	rts
anim_launch1:
	.byte $4d,$00
	.byte $4d,$40
anim_launch2:
	.byte $4f,$00
	.byte $4f,$40


anim_die:
	lda p_anim_count
	cmp #$60
	bcs @next
		lda #<anim_die1
		sta p_anim_addy+0
		lda #>anim_die1
		sta p_anim_addy+1
		jmp @load
@next:
	cmp #$68
	bcs @next2
		lda #<anim_die2
		sta p_anim_addy+0
		lda #>anim_die2
		sta p_anim_addy+1
		jmp @load
@next2:
	cmp #$70
	bcs @next3
		lda #<anim_die3
		sta p_anim_addy+0
		lda #>anim_die3
		sta p_anim_addy+1
		jmp @load
@next3:
	cmp #$78
	bcs @next4
	lda #<anim_die4
	sta p_anim_addy+0
	lda #>anim_die4
	sta p_anim_addy+1
	jmp @load
@next4:
	lda #$f0
	sta p_left_side
	lda #$70
	sta p_left_side+3
	lda boss_switch
	beq :+
		lda #<loop_boss
		sta loop_pointer+0
		lda #>loop_boss
		sta loop_pointer+1
		lda #<nmi_map
		sta nmi_addy+0
		lda #>nmi_map
		sta nmi_addy+1
		rts
:	lda #<loop_gameplay
	sta loop_pointer+0
	lda #>loop_gameplay
	sta loop_pointer+1
	lda #<nmi_lay_em
	sta nmi_addy+0
	lda #>nmi_lay_em
	sta nmi_addy+1
	rts
@load:
	jsr p_anim_load
@skip_init:
	inc p_anim_count
	lda p_anim_count
	cmp #$68
	bne :+
		ldx #$06
		jmp return_music_routine
return_dead:
:	rts
anim_die1:
	.byte $4b,$00
	.byte $4b,$40
anim_die2:
	.byte $81,$00
	.byte $81,$40
anim_die3:
	.byte $83,$00
	.byte $83,$40
anim_die4:
	.byte $85,$00
	.byte $85,$40

p_anim_load:
	ldy #$00
	lda (p_anim_addy), y
	sta p_left_side+1
	iny
	lda (p_anim_addy), y
	sta p_left_side+2
	iny
	lda (p_anim_addy), y
	sta p_right_side+1
	iny
	lda (p_anim_addy), y
	sta p_right_side+2
	rts

p_anim_jumper:
	lda p_anim_state
	asl a
	tay
	lda p_anim_table+1,y
	pha
	lda p_anim_table,y
	pha
	rts

anim_that_amon:
	lda p_anim_state
	cmp #$05
	bcs @anim_him
	cmp #$04
	bne @go_anim
			lda p_left_side
			cmp #$5f
			bcs :+
				lda p_left_side
				sta mm1
				sta mm4
				clc
				adc #$08
				sta mm2
				sta mm3
				bne :++
:			lda p_left_side
			sta mm1
			sta mm4
			sec
			sbc #$08
			sta mm2
			sta mm3
:			lda p_left_side+3
			sec
			sbc #$08
			sta mm1+3
			clc
			adc #$08
			sta mm2+3
			clc
			adc #$08
			sta mm3+3
			clc
			adc #$08
			sta mm4+3
		jmp @anim_him
@go_anim:
	lda p_left_side+3
	cmp #$70
	bcc @left
		cmp #$90
		bcs @right
			lda #$03
			sta p_anim_state
			jmp @anim_him
@right:
		lda #$01
		sta p_anim_state
		jmp @anim_him
@left:
	lda #$02
	sta p_anim_state
@anim_him:
	lda p_anim_state
	jsr p_anim_jumper
	rts

he_die:
	lda reticle_save
	sta r_left_side
	lda #$00
	sta p_anim_count
	sta reticle_on
	sta char_dir
	sta raven_dir
	sta raven_dir+1
	sta raven_dir+2
	sta mm_launcher
	sta g_dir
	ldx #$09
	jmp return_music_routine
return_none2:
	lda #$f0
	sta g_left_side
	sta charwit_fire
	sta mm1
	sta mm2
	sta mm3
	sta mm4
	lda #$f8
	sta raven1
	sta raven2
	sta raven3
	lda #$70
	sta charwit_fire+3
	dec lives
	lda #$06
	sta p_anim_state
	lda #$b4
	sta dead_count
	lda #<loop_die_wait
	sta loop_pointer+0
	lda #>loop_die_wait
	sta loop_pointer+1
	lda #<nmi_die
	sta nmi_addy+0
	lda #>nmi_die
	sta nmi_addy+1
	rts

one_up_lo:
	.byte <score_ten_thousands, <score_ten_thousands, <score_hun_thousands, <score_ten_thousands
	.byte <score_hun_thousands, <score_ten_thousands, <score_hun_thousands, <score_ten_thousands
	.byte <score_hun_thousands, <score_ten_thousands, <score_hun_thousands, <score_ten_thousands
	.byte <score_hun_thousands, <score_ten_thousands, <score_hun_thousands, <score_ten_thousands
	.byte <score_hun_thousands, <score_ten_thousands, <score_hun_thousands, <score_ten_thousands
	.byte <score_millions
one_up_hi:
	.byte >score_ten_thousands, >score_ten_thousands, >score_hun_thousands, >score_ten_thousands
	.byte >score_hun_thousands, >score_ten_thousands, >score_hun_thousands, >score_ten_thousands
	.byte >score_hun_thousands, >score_ten_thousands, >score_hun_thousands, >score_ten_thousands
	.byte >score_hun_thousands, >score_ten_thousands, >score_hun_thousands, >score_ten_thousands
	.byte >score_hun_thousands, >score_ten_thousands, >score_hun_thousands, >score_ten_thousands
	.byte >score_millions
one_up_num:
	.byte $02,$05,$01,$05
	.byte $02,$05,$03,$05
	.byte $04,$05,$05,$05
	.byte $06,$05,$07,$05
	.byte $08,$05,$09,$05
	.byte $01
test_one_up:
	ldx one_up_test					; Load X with variable that keeps track of the offset
	cpx #21							;  for the scoring tables. If it gets to 21, the player
	bcc :+							;  has maxed out the ability to gain one-ups, and
		rts							;  the routine just returns.
:	lda one_up_lo, x				; Get the address for the part of the score that needs
	sta temp_16bit_2+0				;  to be checked...
	lda one_up_hi, x				;
	sta temp_16bit_2+1				;
	ldy #$00						;
	lda (temp_16bit_2), y			; ... and compare it to the number in the one_up_num
	cmp one_up_num, x				;  table.
	bne return_oneup				; If the number doesn't match, do nothing but return
		inc one_up_test				;  to the game, but if they match, increment the player's
		inc lives					;  lives by 1, increment the offset to check for the
		ldx #$0b					;  next one-up, and run the sound effect. After all this
		jmp return_sfx_routine		;  is done, return to the game.
return_oneup:						;
	rts								;



