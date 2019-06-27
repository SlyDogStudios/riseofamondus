; Basic constants

; Sprite ram
e0			=	$200
e1			=	$204		
e2			=	$208
e3			=	$20c
e4			=	$210
e5			=	$214
e6			=	$218
e7			=	$21c
e8			=	$220
e9			=	$224
e10			=	$228
e11			=	$22c
e12			=	$230
e13			=	$234
e14			=	$238
e15			=	$23c
e16			=	$240
e17			=	$244
e18			=	$248
e19			=	$24c
e20			=	$250
e21			=	$254
e22			=	$258
e23			=	$25c
e24			=	$260
e25			=	$264
e26			=	$268
e27			=	$26c
e28			=	$270
e29			=	$274
e30			=	$278
e31			=	$27c
e32			=	$280
e33			=	$284
e34			=	$288

score_h			=	$28c
score_t			=	$290
score_o			=	$294

ship			=	$298
shot			=	$29c

p1_left			=	$500
p1_right		=	$501
p1_top			=	$502
p1_bottom		=	$503
e_i_left		= 	$504
e_i_right		=	$527
e_i_top			=	$54a
e_i_bottom		=	$56d
e_i_sprite		=	$590
e_i_lo			=	$5b3
e_i_speed_lo	=	$5d6
e_i_speed_hi	=	$5d7
direction		=	$5d8
font_lo			=	$5d9


i_reset:
	sei
	ldx #$ff
	txs
	inx
	stx $2000
	stx $2001

:	bit $2002
	bpl :-

	txa
	sta temp_addy+0
	sta temp_addy+1
clrmem:
	sta (temp_addy),y
	iny
	bne clrmem
	inc temp_addy+1
	dex
	bne clrmem

	tay

clrvid:
	sta $2007
	dex
	bne clrvid
	dey
	bne clrvid

	lda #$11
	sta font_lo

:	lda #$00
	sta $2006
	lda font_lo
	sta $2006
:	lda zero, y
	sta $2007
	iny
	tya
	cmp font_offsets, x
	bne :-
		inx
		cpx #$0a
		beq :+
		lda font_lo
		clc
		adc #$10
		sta font_lo
		bne :--					; 41 bytes
:

	lda #$0f
	sta $4015
	ldx #$00
	stx $2006
	lda #$b1
	sta $2006
:	lda patterns, x
	sta $2007
	inx
	bne :-

	lda #$3f						; Set the values for the bg palette
	sta $2006						;
	ldx #$00						;
	stx $2006						;
:	lda pal_bg, x					;
	sta pal_address, x
	sta $2007						;
	inx								;
	cpx #$03						;
	bne :-							;

;	ldx #$00						; 24 bytes
;	lda #$3f						; Set the values for the sprite palette
;	sta $2006						;
;	lda #$10						;
;	sta $2006						;
;:	lda pal_spr, x					;
;	sta $2007						;
;	inx								;
;	cpx #14							;
;	bne :-							;

	ldx #$00						; 24 bytes
	stx e_i_speed_hi
	lda #$3f						; Set the values for the sprite palette
	sta $2006						;
	lda #$10						;
	sta $2006						;
:	lda pal_spr, x					;
	sta pal_address+16, x
	sta $2007						;
	inx								;
	cpx #14							;
	bne :-							;

	ldx #$00
:	lda score_start, x
	sta score_h, x
	inx
	cpx #18
	bne :-

	lda #$20
	sta e_i_speed_lo
	sta bonus_game

setup:

	ldx #$00						; Pull in bytes for sprites and their
	stx direction
:	lda i_sprites, x				;  attributes which are stored in the
	sta e0, x						;  'i_sprites' table. Use X as an index
	inx								;  to load and store each byte, which
	cpx #140						;  get stored starting in $200, where
	bne :-							;  'car1_1' is located at.

	ldx #$00
	ldy #$00
:	lda e0+3, x
	sta e_i_left, y
	clc
	adc #$08
	sta e_i_right, y
	lda e0, x
	sta e_i_top, y
	clc
	adc #$08
	sta e_i_bottom, y
	lda e0+1, x
	sta e_i_sprite, y
	lda #$10
	sta e_i_lo, y
	inx
	inx
	inx
	inx
	iny
	cpy #35
	bne :-

:	bit $2002
	bpl :-
		lda #<i_nmi
		sta nmi_addy+0
		lda #>i_nmi
		sta nmi_addy+1
		lda #<i_loop
		sta loop_pointer+0
		lda #>i_loop
		sta loop_pointer+1
	lda #%10000000
	sta $2000
	lda #%00011110
	sta $2001
i_loop:

	ldx #$00
:	lda e_i_sprite, x
	bne :+
		inx
		cpx #35
		bne :-
			lda e_i_speed_lo
			clc
			adc #$20
			sta e_i_speed_lo
			bne setup
				inc e_i_speed_hi
;:			bne setup
:




	ldx #$00
	ldy #$00
@looper_35:
	lda e_i_left, x
	cmp p1_right
		bcs @no_coll
	lda e_i_right, x
	cmp p1_left
		bcc @no_coll
	lda e_i_top, x
	cmp p1_bottom
		bcs @no_coll
	lda e_i_bottom, x
	cmp p1_top
		bcc @no_coll
			lda e_i_sprite, x
			beq @no_coll
			lda #$00
			sta e_i_sprite, x
			lda #$ff
			sta shot
			lda #%01000101
			sta $400c
			sta $400e
			sta $400f
			jsr do_i_score
@no_coll:

	lda e_i_bottom, x
	cmp ship
	bcc @not_game_over
		lda e_i_sprite, x
		beq @not_game_over
			jmp game_over
@not_game_over:

	lda e_i_left, x
	sta e0+3, y
	clc
	adc #$08
	sta e_i_right, x
	lda e_i_top, x
	sta e0, y
	clc
	adc #$08
	sta e_i_bottom, x
	lda e_i_sprite, x
	sta e0+1, y
	iny
	iny
	iny
	iny
	inx
	cpx #35
	bne @looper_35


	ldx #$00
	lda direction
	bne @test_left
:		lda e_i_lo, x
		clc
		adc e_i_speed_lo
		sta e_i_lo, x
		lda e_i_left, x
		adc e_i_speed_hi
		sta e_i_left, x
		inx
		cpx #35
		bne :-
			lda e6+3
			cmp #$f8
			bcc :+
				bne @down
:		jmp @done_move
@test_left:
:		sec
		lda e_i_lo, x
		sbc e_i_speed_lo
		sta e_i_lo, x
		lda e_i_left, x
		sbc e_i_speed_hi
		sta e_i_left, x
		inx
		cpx #35
		bne :-
			lda e0+3
			cmp #$02
			bcs :+
				bcc @down
:		bne @done_move
@down:
	ldx #$00
:	lda e_i_top, x
	clc
	adc #$08
	sta e_i_top, x
	inx
	cpx #35
	bne :-
		lda direction
		beq :+
			dec direction
			beq @done_move
:	inc direction
@done_move:

	lda shot
	sta p1_top
	clc
	adc #$08
	sta p1_bottom
	lda shot+3
	clc
	adc #$03
	sta p1_left
	clc
	adc #$01
	sta p1_right

	lda shot
	cmp #$ff
	beq :+
		lda shot
		sec
		sbc #$04
		sta shot
:	bcs :+
		lda #$ff
		sta shot
:


@do_controls:
	lda control_pad
	and #left_punch
	beq @no_left
		lda ship+3
		cmp #$10
		beq @no_left
			dec ship+3
			dec ship+3
@no_left:
	lda control_pad
	and #right_punch
	beq @no_right
		lda ship+3
		cmp #$f0
		beq @no_right
			inc ship+3
			inc ship+3
@no_right:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a
		lda ship
		sta shot
		lda ship+3
		sta shot+3
		lda #%01000101
		sta $4008
		sta $400a
		sta $400b
@no_a:

	jmp end_loop

game_over:
	lda control_pad
	and #start_punch
	beq @no_start
		jmp i_reset
@no_start:
	lda control_pad
	and #b_punch
	beq @no_b
		jmp reset
@no_b:
	jmp game_over

do_i_score:
	lda score_h+1			; scoring
	cmp #$05
	bne :+
		lda score_t+1
		cmp #$06
		bne :+
			lda score_o+1
			cmp #$05
			bne :+
				beq game_over;beq @done			; CHANGED FROM JMP TO BEQ TO SAVE A BYTE
:		lda score_o+1
		cmp #$0a
		beq :+
			inc score_o+1
			bne @done
:		lda #$01
		sta score_o+1
		lda score_t+1
		cmp #$0a
		beq :+
			inc score_t+1
			bne @done				; CHANGED FROM JMP TO BEQ TO SAVE A BYTE
:		lda #$01
		sta score_t+1
		lda score_h+1
		cmp #$0a
		beq @done
			inc score_h+1
@done:
	rts

i_nmi:

;	lda #$00
;	sta $2005
;	sta $2005
i_irq:
	jmp end_nmi

pal_bg:
	.byte $0f,$21;,$30

patterns:
	.incbin "includes\bank06\the_invasion.chr"

; Sprite definitions
i_sprites:
	.byte $30,$0d,$00,$20			; row 1
	.byte $30,$0d,$00,$30			; 
	.byte $30,$0d,$00,$40			; 
	.byte $30,$0d,$00,$50			; 
	.byte $30,$0d,$00,$60			; 
	.byte $30,$0d,$00,$70			; 
	.byte $30,$0d,$00,$80			; 

	.byte $40,$0d,$01,$20			; row 2
	.byte $40,$0d,$01,$30			; 
	.byte $40,$0d,$01,$40			; 
	.byte $40,$0d,$01,$50			; 
	.byte $40,$0d,$01,$60			; 
	.byte $40,$0d,$01,$70			; 
	.byte $40,$0d,$01,$80			; 

	.byte $50,$0d,$01,$20			; row 3
	.byte $50,$0d,$01,$30			; 
	.byte $50,$0d,$01,$40			; 
	.byte $50,$0d,$01,$50			; 
	.byte $50,$0d,$01,$60			; 
	.byte $50,$0d,$01,$70			; 
	.byte $50,$0d,$01,$80			; 

	.byte $60,$0d,$02,$20			; row 4
	.byte $60,$0d,$02,$30			; 
	.byte $60,$0d,$02,$40			; 
	.byte $60,$0d,$02,$50			; 
	.byte $60,$0d,$02,$60			; 
	.byte $60,$0d,$02,$70			; 
	.byte $60,$0d,$02,$80			; 

	.byte $70,$0d,$02,$20			; row 5
	.byte $70,$0d,$02,$30			; 
	.byte $70,$0d,$02,$40			; 
	.byte $70,$0d,$02,$50			; 
	.byte $70,$0d,$02,$60			; 
	.byte $70,$0d,$02,$70			; 
	.byte $70,$0d,$02,$80			; 

score_start:
	.byte $10,$01,$00,$c0			; hundreds
	.byte $10,$01,$00,$c8			; tens
	.byte $10,$01,$00,$d0			; ones

	.byte $d0,$0b,$00,$78			; ship
	.byte $ff,$0c;,$00,$ff			; shot



font_offsets:
	.byte 5,10,15,20,25,30,35,40,45	; 9 bytes
pal_spr:
	.byte $0f,$30,$16,$19,$0f;,$1c,$3c,$2c
zero:
	.byte $3c,$24,$24,$24,$3c
one:
	.byte $18,$08,$08,$08,$1c
two:
	.byte $3c,$04,$3c,$20,$3c
three:
	.byte $3c,$04,$1c,$04,$3c
four:
	.byte $24,$24,$3c,$04,$04
five:
	.byte $3c,$20,$3c,$04,$3c
six:
	.byte $3c,$20,$3c,$24,$3c
seven:
	.byte $3c,$04,$08,$08,$08
eight:
	.byte $3c,$24,$3c,$24,$3c
nine:
	.byte $3c,$24,$3c,$04,$04	; 50 bytes

