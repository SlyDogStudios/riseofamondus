enemy_y_lo:
	.byte <enemy0_y, <enemy1_y, <enemy2_y, <enemy3_y
enemy_y_hi:
	.byte >enemy0_y, >enemy1_y, >enemy2_y, >enemy3_y
enemy_x_lo:
	.byte <enemy0_x, <enemy1_x, <enemy2_x, <enemy3_x
enemy_x_hi:
	.byte >enemy0_x, >enemy1_x, >enemy2_x, >enemy3_x
enemy_x_fine_lo:
	.byte <enemy0_x_fine, <enemy1_x_fine, <enemy2_x_fine, <enemy3_x_fine
enemy_x_fine_hi:
	.byte >enemy0_x_fine, >enemy1_x_fine, >enemy2_x_fine, >enemy3_x_fine
enemy_type_lo:
	.byte <enemy0_type, <enemy1_type, <enemy2_type, <enemy3_type
enemy_type_hi:
	.byte >enemy0_type, >enemy1_type, >enemy2_type, >enemy3_type
enemy_dir_lo:
	.byte <enemy0_dir, <enemy1_dir, <enemy2_dir, <enemy3_dir
enemy_dir_hi:
	.byte >enemy0_dir, >enemy1_dir, >enemy2_dir, >enemy3_dir

enemy0_y:
	.byte      $91,$8d,$84,$7f,$51,$4d,$44,$3f, $71,$6d,$64,$5f,$31,$2d,$24,$1f, $41,$3d,$34,$2f, $9f, $91,$8d,$84,$7f, $2f,$3f, $4f, $2f,$3f, $3f,$2f, $5f,$5f,$7f, $3f,$2f,$6f, $6f, $5f,$3f,$8f,$1f, $9f,$7f,$3f,$5f,$64, $41, $87, $42,$53,$64, $8f,$af, $2f,$3f,$6f, $4f,$5f, $3f, $7f,$21,$80,$7f, $2f,$51,$68,$37, $5f,$71,$6d,$64,$5f, $4f,$63,$30, $0f,$1f,$80,$6f,$41, $7f, $53,$64,$75, $86,$3f,$4f,$60, $8f,$9f,$50, $20,$40,$60,$70,$50,$30, $9f, $1f, $2f,$0f,$5f,$6f, $4f, $4f,$3f,$6f,$1f, $3f, $5f,$3f,$50,$8f,$70,$1f, $71,$6d,$64,$5f,$21,$1d,$14,$0f 
enemy0_x:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	.byte      $2e,$2e,$2e,$2e,$2e,$2e,$2e,$2e, $2d,$2d,$2d,$2d,$2d,$2d,$2d,$2d, $2c,$2c,$2c,$2c, $2b, $2a,$2a,$2a,$2a, $29,$29, $28, $27,$27, $25,$25, $24,$24,$24, $23,$23,$23, $22, $21,$21,$21,$21, $20,$20,$20,$20,$20, $1f, $1e, $1d,$1d,$1d, $1c,$1c, $1a,$1a,$1a, $19,$19, $18, $17,$17,$17,$17, $16,$16,$16,$16, $15,$15,$15,$15,$15, $14,$14,$14, $13,$13,$13,$13,$13, $12, $11,$11,$11, $10,$10,$10,$10, $0f,$0f,$0f, $0e,$0e,$0e,$0e,$0e,$0e, $0d, $0c, $0b,$0b,$0b,$0b, $0a, $09,$09,$09,$09, $08, $07,$06,$06,$05,$05,$04, $03,$03,$03,$03,$02,$02,$02,$02, $30
enemy0_x_fine:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	.byte      $01,$21,$41,$61,$81,$a1,$c1,$e1, $01,$21,$41,$61,$81,$a1,$c1,$e1, $21,$41,$61,$81, $f1, $21,$41,$61,$81, $01,$01, $81, $01,$01, $01,$81, $01,$81,$c1, $01,$81,$c1, $01, $01,$21,$41,$61, $01,$21,$41,$61,$81, $01, $01, $81,$81,$81, $01,$f1, $01,$01,$01, $71,$71, $01, $01,$21,$41,$81, $01,$21,$41,$81, $01,$01,$21,$41,$61, $01,$31,$81, $01,$11,$21,$31,$41, $01, $01,$21,$41, $01,$01,$01,$41, $01,$01,$41, $01,$21,$41,$81,$a1,$c1, $f1, $01, $01,$21,$41,$61, $01, $01,$21,$41,$61, $01, $01,$21,$41,$41,$81,$61, $01,$21,$41,$61,$01,$21,$41,$61
enemy0_type:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
	.byte      $02,$02,$02,$02,$02,$02,$02,$02, $02,$02,$02,$02,$02,$02,$02,$02, $02,$02,$02,$02, $01, $02,$02,$02,$02, $07,$08, $06, $07,$08, $03,$06, $03,$06,$06, $03,$06,$06, $03, $02,$02,$02,$02, $02,$02,$02,$02,$06, $06, $06, $06,$06,$06, $03,$01, $07,$08,$03, $07,$08, $03, $03,$02,$02,$06, $03,$02,$02,$06, $03,$02,$02,$02,$02, $03,$06,$06, $06,$02,$06,$02,$06, $02, $06,$06,$06, $06,$07,$08,$02, $07,$08,$0c, $0c,$0c,$0c,$0c,$0c,$0c, $01, $03, $02,$02,$02,$02, $03, $02,$02,$02,$02, $03, $02,$02,$0c,$02,$0c,$02, $02,$02,$02,$02,$02,$02,$02,$02
enemy0_dir:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	.byte      $09,$06,$03,$00,$09,$06,$03,$00, $09,$06,$03,$00,$09,$06,$03,$00, $09,$06,$03,$00, $00, $09,$06,$03,$00, $56,$57, $00, $97,$98, $00,$00, $00,$00,$00, $00,$00,$00, $00, $09,$06,$03,$00, $09,$06,$03,$00,$00, $00, $00, $00,$00,$00, $00,$00, $91,$92,$00, $49,$4a, $00, $00,$09,$06,$00, $00,$09,$03,$00, $00,$09,$06,$03,$00, $00,$00,$00, $00,$09,$00,$06,$00, $00, $00,$00,$00, $00,$59,$5a,$00, $69,$6a,$00, $00,$00,$00,$00,$00,$00, $00, $00, $09,$06,$03,$00, $00, $09,$06,$03,$00, $00, $09,$06,$00,$03,$00,$00, $09,$06,$03,$00,$09,$06,$03,$00

enemy1_y:
	.byte 		$2f,$3f,$6f,$7f, $2f,$8f, $5f,$af,$17, $7a,$27,$98,$15, $ac,$12,$57,$23,$71, $e8, $4f,$bf,$bf,$bf, $bf, $16,$e8,$00, $6f,$20,$4f,$5f, $0f,$4d,$31,$91,$e8,$00, $3f,$4f, $00,$e8, $30,$60,$90, $51,$a9,$23,$33, $0f,$73,$53,$e8,$93, $51,$a9,$00,$23,$33, $bf,$bf,$bf, $8f, $bf, $bf,$bf, $6f,$78,$a4,$00,$e8, $af,$8f,$7f, $98,$a4, $60,$70,$80, $40, $95, $58,$48,$95, $40,$18,$58,$48,$95, $e8,$6a,$52,$a3,$34, $00,$63,$44,$84, $14,$a7,$64, $14,$a7,$64, $20,$30,$40, $80,$90,$a0, $6f,$78,$a4,$00,$e8, $6f,$78,$a4,$00,$e8, $5f,$af,$17
enemy1_x:                                                                                                                                                                                                                                                                                                                                                                                                                                                   ;^ breaking                                                                                                  
	.byte 		$13,$13,$13,$13, $14,$14, $15,$15,$15, $16,$16,$16,$16, $17,$17,$17,$17,$17, $18, $19,$19,$19,$19, $1a, $1b,$1b,$1b, $1c,$1c,$1c,$1c, $1e,$1e,$1e,$1e,$1e,$1e, $1f,$1f, $20,$20, $21,$21,$21, $22,$22,$22,$22, $23,$23,$23,$23,$23, $24,$24,$24,$24,$24, $25,$25,$25, $26, $28, $2a,$2a, $2d,$2d,$2d,$2d,$2d, $2e,$2e,$2e, $2f,$2f, $30,$30,$30, $31, $32, $33,$33,$33, $34,$34,$34,$34,$34, $35,$35,$35,$35,$35, $36,$36,$36,$36, $37,$37,$37, $38,$38,$38, $39,$39,$39, $3a,$3a,$3a, $3b,$3b,$3b,$3b,$3b, $3c,$3c,$3c,$3c,$3c, $3d,$3d,$3d, $ff
enemy1_x_fine:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
	.byte		$01,$01,$81,$81, $01,$81, $01,$41,$81, $01,$21,$41,$81, $01,$21,$41,$61,$81, $01, $01,$01,$11,$21, $01, $01,$81,$c1, $01,$21,$81,$81, $01,$21,$41,$61,$81,$81, $f1,$f1, $81,$81, $01,$01,$01, $01,$21,$41,$61, $01,$21,$41,$51,$61, $01,$21,$31,$41,$61, $01,$11,$21, $01, $01, $81,$91, $01,$21,$41,$61,$81, $01,$41,$81, $01,$21, $01,$21,$41, $01, $61, $21,$41,$61, $01,$01,$21,$41,$61, $01,$21,$41,$61,$81, $41,$61,$81,$a1, $21,$41,$61, $21,$41,$61, $01,$21,$21, $01,$21,$21, $01,$21,$41,$61,$81, $41,$61,$81,$a1,$c1, $01,$41,$81
enemy1_type:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	.byte		$0a,$19,$0a,$19, $10,$0f, $0f,$0f,$0f, $0e,$0e,$0e,$0f, $0f,$0f,$0f,$0f,$0e, $11, $10,$1a,$1a,$1a, $0b, $0e,$11,$12, $0f,$0f,$0a,$19, $0e,$0e,$0e,$0e,$11,$12, $0a,$19, $12,$11, $0e,$0e,$0e, $0f,$0f,$0f,$0f, $0f,$0f,$0f,$11,$0f, $0f,$0f,$12,$0f,$0f, $1a,$1a,$1a, $10, $0b, $0b,$1a, $0f,$0f,$0f,$12,$11, $0e,$0e,$0f, $0f,$0f, $0c,$0c,$0c, $10, $0f, $0f,$0f,$0f, $0e,$0f,$0f,$0f,$0f, $11,$0e,$0e,$0e,$0e, $12,$0e,$0e,$0e, $0f,$0f,$0f, $0f,$0f,$0f, $0c,$0c,$0c, $0c,$0c,$0c, $0f,$0f,$0f,$12,$11, $0f,$0f,$0f,$12,$11, $0f,$0f,$0f
enemy1_dir:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
	.byte		$7a,$7b,$54,$55, $04,$79, $27,$9b,$09, $00,$00,$00,$09, $8d,$03,$46,$13,$00, $00, $07,$00,$00,$00, $00, $00,$00,$00, $48,$19,$34,$35, $00,$00,$00,$00,$00,$00, $36,$37, $00,$00, $00,$00,$00, $18,$6b,$14,$25, $0c,$48,$17,$00,$6a, $18,$6b,$00,$14,$25, $00,$00,$00, $6b, $00, $00,$00, $68,$69,$9b,$00,$00, $00,$00,$6d, $7a,$6b, $02,$02,$02, $07, $6b, $6b,$39,$6b, $00,$19,$6b,$39,$6b, $00,$00,$00,$00,$00, $00,$00,$00,$00, $07,$9b,$57, $07,$9b,$57, $02,$02,$02, $02,$02,$02, $58,$69,$9b,$00,$00, $58,$69,$9b,$00,$00, $27,$9b,$09

enemy2_y:
	.byte		$af,$af, $98, $24, $42,$8f, $7f, $5f, $8f,$70, $32, $8f, $2f, $8f,$41, $71,$8f, $70, $40,$9f, $10, $61,$af, $24, $76, $af,$88, $2b,$50, $49, $af, $af, $34, $79, $53, $97, $af, $af, $10,$9b, $30,$9b, $50,$9b, $70,$9b, $20,$9b, $10,$9b, $60,$9b, $9b, $9b, $98,$15,$32, $8f, $18,$78,$32, $33,$67,$0f, $37,$62,$32, $33,$67,$0f, $4a,$2f
enemy2_x:                                                                                                                                                                                                                                                                                                                                           
	.byte 		$2f,$2e, $2d, $2c, $2b,$2b, $2a, $29, $28,$28, $27, $26, $25, $24,$24, $23,$23, $22, $21,$21, $20, $1f,$1f, $1e, $1d, $1c,$1c, $1b,$1b, $1a, $19, $18, $17, $16, $15, $14, $13, $12, $11,$11, $10,$10, $0f,$0f, $0e,$0e, $0d,$0d, $0c,$0c, $0b,$0b, $0a, $09, $08,$08,$08, $07, $06,$06,$06, $05,$05,$05, $04,$04,$04, $03,$03,$03, $2e,$2e
enemy2_x_fine:                                                                                                                                                                                                                                                                                                                                      
	.byte		$01,$01, $01, $01, $01,$81, $01, $01, $01,$01, $01, $81, $01, $01,$01, $01,$81, $01, $01,$81, $01, $01,$81, $01, $01, $01,$81, $01,$81, $01, $81, $01, $01, $01, $01, $01, $81, $01, $01,$81, $01,$81, $01,$81, $01,$81, $01,$81, $01,$81, $01,$81, $01, $01, $01,$41,$81, $81, $01,$41,$81, $01,$01,$41, $01,$41,$81, $01,$01,$41, $01,$01
enemy2_type:                                                                                                                                                                                                                                                                                                                                        
	.byte		$1c,$1c, $1d, $1d, $1d,$1b, $1d, $1d, $1c,$1d, $1d, $1b, $0f, $1c,$1d, $0f,$1b, $1d, $0f,$1b, $1d, $0f,$1b, $1d, $0f, $1c,$1d, $0f,$1d, $1d, $1b, $1c, $0f, $1d, $0f, $1d, $1b, $1c, $1d,$1d, $1d,$1d, $1d,$1d, $1d,$1d, $1d,$1d, $1d,$1d, $1d,$1d, $1d, $1d, $0f,$1d,$1d, $1b, $0f,$1d,$1d, $0f,$0f,$1d, $0f,$1d,$1d, $0f,$0f,$1d, $1d,$0f
enemy2_dir:                                                                                                                                                                                                                                                                                                                                         
	.byte		$70,$00, $00, $00, $00,$00, $00, $00, $00,$00, $00, $00, $19, $00,$00, $58,$00, $00, $25,$00, $00, $37,$00, $00, $38, $00,$00, $04,$00, $00, $00, $00, $05, $00, $39, $00, $00, $00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00,$00, $00, $00, $59,$00,$00, $00, $05,$00,$00, $04,$4a,$00, $08,$00,$00, $04,$4a,$00, $00,$13

enemy3_y:
	.byte 		$34,$9f, $20,$60, $40,$7f, $10,$20,$30, $23,$50,$61, $10,$20,$30, $08,$28,$40, $20,$60,$10,$40,$70, $e8,$00,$10,$60, $00,$20,$70, $40, $20,$40,$60,$30,$50, $10,$30,$50,$20,$40, $20,$40,$60,$30,$50, $7f,$7f,$7f, $00,$11,$22,$33,$66,$77,$88,$99, $00,$66,$99,$44,$11,$77,$55, $31,$57,$22,$73,$e8, $6a,$52,$a3,$34,$00, $44,$84,$31,$57,$22,$73,$00, $64,$11,$e8,$52,$a3, $87,$63,$71,$34,$21,$14,$84, $52,$87,$63,$71,$34,$21,$88, $16,$63,$71,$34,$21,$48,$84, $30,$63,$71,$24,$56,$7e,$15, $60,$71,$11,$34,$21,$80,$55, $13,$63,$51,$34,$7e,$22,$49, $13,$24,$35,$9f,$80,$60,$30, $1f, $20,$40,$60,$30,$50, $10,$30,$50,$20,$40, $20,$40,$60,$30,$50, $e8,$00, $e8,$00, $e8,$00, $21,$41,$61,$81, $91,$71,$51,$31, $21,$41,$61,$81, $21,$41,$61,$81, $21,$41,$61,$81, $91,$71,$51,$31
enemy3_x:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
	.byte 		$12,$12, $13,$13, $14,$14, $15,$15,$15, $16,$16,$16, $17,$17,$17, $18,$18,$18, $19,$19,$19,$19,$19, $1a,$1a,$1a,$1a, $1b,$1b,$1b, $1c, $1d,$1d,$1d,$1d,$1d, $1e,$1e,$1e,$1e,$1e, $1f,$1f,$1f,$1f,$1f, $20,$20,$20, $25,$25,$25,$25,$25,$25,$25,$25, $26,$26,$26,$26,$26,$26,$26, $27,$27,$27,$27,$27, $28,$28,$28,$28,$28, $29,$29,$29,$29,$29,$29,$29, $2a,$2a,$2a,$2a,$2a, $2b,$2b,$2b,$2b,$2b,$2b,$2b, $2c,$2c,$2c,$2c,$2c,$2c,$2c, $2d,$2d,$2d,$2d,$2d,$2d,$2d, $2e,$2e,$2e,$2e,$2e,$2e,$2e, $2f,$2f,$2f,$2f,$2f,$2f,$2f, $30,$30,$30,$30,$30,$30,$30, $31,$31,$31,$31,$31,$31,$31, $32, $33,$33,$33,$33,$33, $34,$34,$34,$34,$34, $35,$35,$35,$35,$35, $36,$36, $37,$37, $38,$38, $39,$39,$39,$39, $3a,$3a,$3a,$3a, $3b,$3b,$3b,$3b, $3c,$3c,$3c,$3c, $3d,$3d,$3d,$3d, $3e,$3e,$3e,$3e,$ff
enemy3_x_fine:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	.byte 		$01,$81, $01,$01, $01,$81, $01,$21,$41, $01,$81,$c1, $01,$21,$41, $01,$21,$41, $01,$21,$41,$81,$c1, $01,$21,$c1,$e1, $21,$c1,$e1, $21, $01,$01,$01,$21,$21, $01,$01,$01,$21,$21, $01,$01,$01,$21,$21, $81,$a1,$c1, $01,$01,$01,$01,$81,$81,$81,$81, $41,$41,$41,$41,$c1,$c1,$c1, $41,$61,$81,$c1,$e1, $41,$61,$81,$a1,$c1, $21,$41,$61,$81,$a1,$c1,$e1, $41,$61,$81,$a1,$c1, $21,$41,$61,$81,$a1,$c1,$e1, $21,$41,$61,$81,$a1,$c1,$e1, $21,$41,$61,$81,$a1,$c1,$e1, $21,$41,$61,$81,$a1,$c1,$e1, $21,$41,$61,$81,$a1,$c1,$e1, $21,$41,$61,$81,$a1,$c1,$e1, $21,$41,$61,$81,$a1,$c1,$e1, $01, $01,$01,$01,$21,$21, $01,$21,$21,$41,$41, $01,$01,$01,$21,$21, $01,$81, $01,$81, $01,$81, $01,$41,$81,$c1, $01,$41,$81,$c1, $01,$41,$81,$c1, $01,$41,$81,$c1, $01,$41,$81,$c1, $01,$41,$81,$c1
enemy3_type:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	.byte 		$0e,$0b, $0e,$0e, $0c,$0b, $0c,$0c,$0c, $10,$0e,$0e, $0c,$0c,$0c, $0c,$0c,$0c, $0e,$0e,$0c,$0c,$0c, $11,$12,$0c,$0c, $12,$0e,$0e, $0c, $0c,$0c,$0c,$0c,$0c, $0c,$0c,$0c,$0c,$0c, $0c,$0c,$0c,$0c,$0c, $1a,$1a,$1a, $0e,$0e,$0e,$0e,$0e,$0e,$0e,$0e, $0e,$0e,$0e,$0e,$0e,$0e,$0e, $0e,$0e,$0e,$0e,$11, $0e,$0e,$0e,$0e,$12, $0e,$0e,$0e,$0e,$0e,$0e,$12, $0e,$0e,$12,$0e,$0e, $0e,$0e,$0e,$0e,$0e,$0e,$0e, $0e,$0e,$0e,$0e,$0e,$0e,$0e, $0e,$0e,$0e,$0e,$0e,$0e,$0e, $0e,$0e,$0e,$0e,$0e,$0e,$0e, $0e,$0e,$0e,$0e,$0e,$0e,$0e, $0e,$0e,$0e,$0e,$0e,$0e,$0e, $0e,$0e,$0e,$0b,$0e,$0e,$0e, $10, $0c,$0c,$0c,$0c,$0c, $0c,$0c,$0c,$0c,$0c, $0c,$0c,$0c,$0c,$0c, $11,$12, $11,$12, $11,$12, $0c,$0c,$0c,$0c, $0c,$0c,$0c,$0c, $0c,$0c,$0c,$0c, $0c,$0c,$0c,$0c, $0c,$0c,$0c,$0c, $0c,$0c,$0c,$0c
enemy3_dir:                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
	.byte 		$00,$00, $00,$00, $02,$00, $02,$02,$02, $f4,$00,$00, $02,$02,$02, $02,$02,$02, $00,$00,$02,$02,$02, $00,$00,$02,$02, $00,$00,$00, $02, $02,$02,$02,$02,$02, $02,$02,$02,$02,$02, $02,$02,$02,$02,$02, $00,$00,$00, $00,$00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00, $00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00, $00,$00,$00,$00,$00,$00,$00, $f2, $02,$02,$02,$02,$02, $02,$02,$02,$02,$02, $02,$02,$02,$02,$02, $00,$00, $00,$00, $00,$00, $01,$01,$01,$01, $01,$01,$01,$01, $01,$01,$01,$01, $01,$01,$01,$01, $01,$01,$01,$01, $01,$01,$01,$01

hit_none:
	rts
hit_basic:
	lda boss_switch
	beq :+
		lda #$08
		sta boss_color_counter
		lda #$27
		sta pal_address+29
		lda #$16
		sta pal_address+30
:
;	lda p_anim_state
;	cmp #$06
;	bcc :+
;		rts
;:
	ldx #$04
	jmp return_sfx_routine
return_hit1:
	ldy hold_y
	lda e_hp, y
	bmi :+
		rts
:
	lda e_type, y
	pha
	lda boss_switch
	bne :+
		lda #$04
		sta e_type, y
:	lda #$00
	sta e_anim_count, y
	sta e_move_count, y
	sta e_dir, y
	pla
	tay
	lda score_addy_lo, y
	sta temp_16bit_1+0
	lda score_addy_hi, y
	sta temp_16bit_1+1
	lda score_num, y
	ldy #$00
	sta (temp_16bit_1), y
	jsr add_score
	rts
hit_hard:
	ldx #$03
	jmp return_sfx_routine
return_ping1:
	ldy hold_y
	rts
hit_gone:
	ldy hold_y
	lda e_dir, y
	bne return_ghost
		lda #$10
		sta e_y_pos, y
		lda #$01
		sta e_dir, y
		ldx #$10
		jmp return_sfx_routine
return_ghost:
	rts
e_hit_jumper:
	asl a
	tay
	lda e_hit_table+1, y
	pha
	lda e_hit_table, y
	pha
	rts
e_hit_table:
	.addr hit_none-1
	.addr hit_basic-1, hit_basic-1, hit_hard-1, hit_none-1, hit_basic-1
	.addr hit_basic-1, hit_basic-1, hit_basic-1, hit_basic-1, hit_basic-1
	.addr hit_hard-1, hit_basic-1, hit_basic-1, hit_basic-1, hit_basic-1
	.addr hit_basic-1, hit_basic-1, hit_basic-1, hit_hard-1, hit_hard-1
	.addr hit_hard-1, hit_hard-1, hit_hard-1, hit_basic-1, hit_basic-1
	.addr hit_basic-1, hit_basic-1, hit_hard-1, hit_gone-1, hit_basic-1
	.addr hit_hard-1, hit_hard-1, hit_hard-1, hit_hard-1, hit_basic-1
	.addr hit_none-1, hit_hard-1, hit_hard-1, hit_none-1
g_table:
	.addr none-1
	.addr beep-1, none-1, none-1, none-1, none-1
	.addr beep-1, none-1, beep-1, beep-1, none-1
	.addr none-1, beep-1, none-1, beep-1, none-1
	.addr beep-1, beep-1, beep-1, none-1, none-1
	.addr none-1, none-1, none-1, none-1, beep-1
	.addr beep-1, beep-1, none-1, none-1, none-1
	.addr none-1, none-1, none-1, none-1, none-1
	.addr beep-1, none-1, none-1, none-1
pass_table:
	.byte $00
	.byte $01,$00,$00,$00,$00
	.byte $06,$00,$08,$09,$00
	.byte $00,$0c,$00,$0e,$00
	.byte $10,$11,$12,$00,$00
	.byte $00,$00,$00,$00,$19
	.byte $1a,$1b,$00,$00,$00
	.byte $00,$00,$00,$00,$00
	.byte $24,$00,$00,$00
enemy_hp_table:
	.byte $00
	.byte $00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00
	.byte $10,$00,$20,$02,$01
	.byte $04,$00,$00,$00,$00
	.byte $00,$00,$00,$30,$00
	.byte $00,$00,$00,$00,$40
	.byte $20,$20,$20,$20,$7f
	.byte $00,$00,$00,$00
score_num:
	.byte $00
	.byte $01,$05,$00,$00,$01
	.byte $05,$05,$01,$01,$05
	.byte $00,$02,$05,$05,$01
	.byte $05,$05,$05,$00,$00
	.byte $00,$00,$00,$05,$01
	.byte $01,$01,$00,$00,$05
	.byte $00,$00,$00,$00,$05
	.byte $01,$00,$00,$00
score_addy_lo:
	.byte $00
	.byte <score_hundreds_add, <score_tens_add, $00, $00, <score_hundreds_add
	.byte <score_hundreds_add, <score_tens_add, <score_hundreds_add, <score_hundreds_add, <score_tens_add
	.byte $00, <score_hundreds_add, <score_thousands_add, <score_hundreds_add, <score_hundreds_add
	.byte <score_hundreds_add, <score_hundreds_add, <score_hundreds_add,$00,$00
	.byte $00,$00,$00, <score_thousands_add, <score_hundreds_add
	.byte <score_hundreds_add, <score_hundreds_add, $00, $00, <score_thousands_add
	.byte <score_tens_add, <score_tens_add, <score_tens_add, <score_tens_add, <score_thousands_add
	.byte <score_hundreds_add,$00,$00,$00
score_addy_hi:
	.byte $00
	.byte >score_hundreds_add, >score_tens_add, $00, $00, >score_hundreds_add
	.byte >score_hundreds_add, >score_tens_add, >score_hundreds_add, >score_hundreds_add, >score_tens_add
	.byte $00, >score_hundreds_add,>score_thousands_add, >score_hundreds_add, >score_hundreds_add
	.byte >score_hundreds_add, >score_hundreds_add, >score_hundreds_add,$00,$00
	.byte $00,$00,$00, >score_thousands_add, >score_hundreds_add
	.byte >score_hundreds_add, >score_hundreds_add, $00,$00, >score_thousands_add
	.byte >score_tens_add, >score_tens_add, >score_tens_add, >score_tens_add, >score_thousands_add
	.byte >score_hundreds_add,$00,$00,$00
e_anim_table:
	.addr none-1
	.addr anim_goblin_right-1, anim_leaf_right-1, anim_tornado-1, anim_e_dead-1, anim_goblin_taken-1
	.addr anim_shooterA-1,     anim_balloon-1,     anim_goblin_ball-1, anim_goblin_taken-1, anim_balloon-1
	.addr anim_turret-1,       anim_capeA-1, anim_cloud-1, anim_shooterB-1, anim_bat-1
	.addr anim_gob_climb-1, anim_shooterA-1, anim_shooterA-1, anim_debris_leaf-1, anim_debris_tree-1
	.addr anim_debris_leafB-1, anim_debris_treeB-1, anim_debris_leafC-1, anim_eyeball-1, anim_goblin_ball-1
	.addr anim_goblin_left-1, anim_gob_ghost-1, anim_grave-1, anim_ghost-1, anim_boss3-1
	.addr anim_garb1-1, anim_garb2-1, anim_garb1-1, anim_garb2-1, anim_last-1
	.addr anim_energy-1, anim_nature-1, anim_branch-1, anim_energy-1

beep:
	lda reticle_switch
	bne done_beep
		lda e_slot_offset, x
		sta g_hold
		stx g_hold_offset
		ldx #$01
		jmp return_sfx_routine
return_reticle:
		lda #$01
		sta reticle_switch
done_beep:
	rts
g_test_take:
	asl a
	tay
	lda g_table+1, y
	pha
	lda g_table, y
	pha
	rts

none:
	rts

anim_branch:
	lda #<anim_branch1
	sta temp_16bit_2+0
	lda #>anim_branch1
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_branch1:
	.byte $ef,$02
	.byte $ff,$02

anim_nature:
	lda e_move_count, x
	cmp #$15
	bcc :+
		lda #<anim_nature3
		sta temp_16bit_2+0
		lda #>anim_nature3
		sta temp_16bit_2+1
		jmp @load
:	lda e_move_count, x
	cmp #$0d
	bcc @next
		lda #<anim_nature2
		sta temp_16bit_2+0
		lda #>anim_nature2
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_nature1
	sta temp_16bit_2+0
	lda #>anim_nature1
	sta temp_16bit_2+1
@load:
	jsr e_load
	rts
anim_nature1:
	.byte $c3,$02
	.byte $c5,$02
anim_nature2:
	.byte $87,$02
	.byte $89,$02
anim_nature3:
	.byte $c9,$02
	.byte $cb,$02


anim_energy:
	lda #<anim_energy1
	sta temp_16bit_2+0
	lda #>anim_energy1
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_energy1:
	.byte $cd,$01
	.byte $cf,$01



anim_last:
	lda e_move_count+1
	cmp #$20
	bcc :+
		lda #<anim_last1
		sta temp_16bit_2+0
		lda #>anim_last1
		sta temp_16bit_2+1
		jmp load_last_boss
:	cmp #$01
	bne last_boss_flush
		txa
		pha
		tya
		pha
		ldx #$15
		jmp return_sfx_routine
return_energy:
		pla
		tay
		pla
		tax
last_boss_flush:
	lda #<anim_last2
	sta temp_16bit_2+0
	lda #>anim_last2
	sta temp_16bit_2+1
load_last_boss:
	jsr e_load
	rts
anim_last1:
	.byte $d5,$03
	.byte $d7,$03
anim_last2:
	.byte $d5,$03
	.byte $c7,$03


anim_boss3:
	lda e_left
	cmp p_left
	bcc :+
		lda #<anim_boss32
		sta temp_16bit_2+0
		lda #>anim_boss32
		sta temp_16bit_2+1
		jmp @load
:	lda #<anim_boss31
	sta temp_16bit_2+0
	lda #>anim_boss31
	sta temp_16bit_2+1
@load:
	jsr e_load
	rts
anim_boss31:
	.byte $f1,$03
	.byte $f3,$03
anim_boss32:
	.byte $f3,$43
	.byte $f1,$43

anim_garb1:
	lda #<anim_garb12
	sta temp_16bit_2+0
	lda #>anim_garb12
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_garb12:
	.byte $d3,$41
	.byte $d1,$41

anim_garb2:
	ldx e_type_offset
	lda #<anim_garb22
	sta temp_16bit_2+0
	lda #>anim_garb22
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_garb22:
	.byte $d1,$01
	.byte $d3,$01



anim_goblin_left:
	lda e_dir, x
	beq :+
		lda #<anim_goblin_left3
		sta temp_16bit_2+0
		lda #>anim_goblin_left3
		sta temp_16bit_2+1
		jmp @load
:	lda e_anim_count, x
	cmp #$08
	bcs @next
		lda #<anim_goblin_left1
		sta temp_16bit_2+0
		lda #>anim_goblin_left1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_goblin_left2
	sta temp_16bit_2+0
	lda #>anim_goblin_left2
	sta temp_16bit_2+1
@load:
	jsr e_load
	inc e_anim_count, x
	lda e_anim_count, x
	cmp #$10
	bne :+
		lda #$00
		sta e_anim_count, x
:	rts
anim_goblin_left1:
	.byte $23,$40
	.byte $21,$40
anim_goblin_left2:
	.byte $27,$40
	.byte $25,$40
anim_goblin_left3:
	.byte $23,$40
	.byte $21,$40

anim_gob_ghost:
	lda e_dir, x
	beq :+
		lda #<anim_gob_ghost3
		sta temp_16bit_2+0
		lda #>anim_gob_ghost3
		sta temp_16bit_2+1
		jmp @do_load
:	lda e_anim_count, x
	cmp #$08
	bcs @next
		lda #<anim_gob_ghost1
		sta temp_16bit_2+0
		lda #>anim_gob_ghost1
		sta temp_16bit_2+1
		jmp @do_load
@next:
	lda #<anim_gob_ghost2
	sta temp_16bit_2+0
	lda #>anim_gob_ghost2
	sta temp_16bit_2+1
@do_load:
	jsr e_load
	inc e_anim_count, x
	lda e_anim_count, x
	cmp #$10
	bne :+
		lda #$00
		sta e_anim_count, x
:	rts
anim_gob_ghost1:
	.byte $b5,$02
	.byte $b7,$02
anim_gob_ghost2:
	.byte $b9,$02
	.byte $bb,$02
anim_gob_ghost3:
	.byte $b5,$02
	.byte $b7,$02

anim_goblin_right:
	lda e_dir, x
	beq :+
		lda #<anim_goblin_right3
		sta temp_16bit_2+0
		lda #>anim_goblin_right3
		sta temp_16bit_2+1
		jmp @do_load
:	lda e_anim_count, x
	cmp #$08
	bcs @next
		lda #<anim_goblin_right1
		sta temp_16bit_2+0
		lda #>anim_goblin_right1
		sta temp_16bit_2+1
		jmp @do_load
@next:
	lda #<anim_goblin_right2
	sta temp_16bit_2+0
	lda #>anim_goblin_right2
	sta temp_16bit_2+1
@do_load:
	jsr e_load
	inc e_anim_count, x
	lda e_anim_count, x
	cmp #$10
	bne :+
		lda #$00
		sta e_anim_count, x
:	rts
anim_goblin_right1:
	.byte $21,$00
	.byte $23,$00
anim_goblin_right2:
	.byte $25,$00
	.byte $27,$00
anim_goblin_right3:
	.byte $21,$00
	.byte $23,$00

anim_leaf_right:
	lda #<anim_leaf_right1
	sta temp_16bit_2+0
	lda #>anim_leaf_right1
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_leaf_right1:
	.byte $1d,$00
	.byte $1f,$00

anim_tornado:
	lda e_anim_count, x
	cmp #$08
	bcs @next
		lda #<anim_tornado1
		sta temp_16bit_2+0
		lda #>anim_tornado1
		sta temp_16bit_2+1
		jmp @load
@next:
	cmp #$10
	bcs :+
		lda #<anim_tornado2
		sta temp_16bit_2+0
		lda #>anim_tornado2
		sta temp_16bit_2+1
		jmp @load
:	lda #<anim_tornado3
	sta temp_16bit_2+0
	lda #>anim_tornado3
	sta temp_16bit_2+1
@load:
	jsr e_load
	inc e_anim_count, x
	lda e_anim_count, x
	cmp #$18
	bne :+
		lda #$00
		sta e_anim_count, x
:	rts
anim_tornado1:
	.byte $51,$02
	.byte $53,$02
anim_tornado2:
	.byte $55,$02
	.byte $57,$02
anim_tornado3:
	.byte $59,$02
	.byte $5b,$02


anim_e_dead:
	lda e_anim_count, x
	cmp #$08
	bne :+
		lda #$00
		sta e_type, x
		lda e_slot_offset, x
		tax
		lda #$f0
		sta enemy_spr0_0y, x
		lda #$00
		sta enemy_spr0_0x, x
		rts
:	clc
	adc #$01
	sta e_anim_count, x
	lda #<anim_e_dead1
	sta temp_16bit_2+0
	lda #>anim_e_dead1
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_e_dead1:
	.byte $5d,$01
	.byte $5f,$01


anim_goblin_taken:
	lda #<anim_goblin_taken1
	sta temp_16bit_2+0
	lda #>anim_goblin_taken1
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_goblin_taken1:
	.byte $b1,$00
	.byte $b3,$00

anim_shooterA:
	lda e_anim_count, x
	cmp #$10
	bcs @next
		lda #<anim_shooterA1
		sta temp_16bit_2+0
		lda #>anim_shooterA1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_shooterA2
	sta temp_16bit_2+0
	lda #>anim_shooterA2
	sta temp_16bit_2+1
@load:
	jsr e_load
	inc e_anim_count, x
	lda e_anim_count, x
	cmp #$20
	bne :+
		lda #$00
		sta e_anim_count, x
:	rts
anim_shooterA1:
	.byte $61,$00
	.byte $63,$00
anim_shooterA2:
	.byte $65,$00
	.byte $67,$00





anim_shooterB:
	lda e_anim_count, x
	cmp #$10
	bcs @next
		lda #<anim_shooterB1
		sta temp_16bit_2+0
		lda #>anim_shooterB1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_shooterB2
	sta temp_16bit_2+0
	lda #>anim_shooterB2
	sta temp_16bit_2+1
@load:
	jsr e_load
	inc e_anim_count, x
	lda e_anim_count, x
	cmp #$20
	bne :+
		lda #$00
		sta e_anim_count, x
:	rts
anim_shooterB1:
	.byte $63,$40
	.byte $61,$40
anim_shooterB2:
	.byte $67,$40
	.byte $65,$40

anim_bat:
	lda e_anim_count, x
	cmp #$08
	bcs @next
		lda #<anim_bat1
		sta temp_16bit_2+0
		lda #>anim_bat1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_bat2
	sta temp_16bit_2+0
	lda #>anim_bat2
	sta temp_16bit_2+1
@load:
	jsr e_load
	inc e_anim_count, x
	lda e_anim_count, x
	cmp #$10
	bne :+
		lda #$00
		sta e_anim_count, x
:	rts
anim_bat1:
	.byte $7b,$03
	.byte $7b,$43
anim_bat2:
	.byte $7d,$03
	.byte $7d,$43









anim_balloon:
	lda #<anim_balloon1
	sta temp_16bit_2+0
	lda #>anim_balloon1
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_balloon1:
	.byte $69,$02
	.byte $6b,$02

anim_goblin_ball:
	lda scroll_dir
	cmp #$01
	beq :+
		lda #<anim_goblin_ball2
		sta temp_16bit_2+0
		lda #>anim_goblin_ball2
		sta temp_16bit_2+1
		jmp @load
:	lda #<anim_goblin_ball1
	sta temp_16bit_2+0
	lda #>anim_goblin_ball1
	sta temp_16bit_2+1
@load:
	jsr e_load
	rts
anim_goblin_ball1:
	.byte $71,$00
	.byte $73,$00
anim_goblin_ball2:
	.byte $73,$40
	.byte $71,$40

anim_turret:
	lda #<anim_turret1
	sta temp_16bit_2+0
	lda #>anim_turret1
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_turret1:
	.byte $6f,$42
	.byte $6d,$42

anim_capeA:
	lda e_dir, x
	beq @right
		lda e_anim_count, x
		cmp #$10
		bcs @next1
			lda #<anim_cape3
			sta temp_16bit_2+0
			lda #>anim_cape3
			sta temp_16bit_2+1
			jmp @load
@next1:
	lda #<anim_cape4
	sta temp_16bit_2+0
	lda #>anim_cape4
	sta temp_16bit_2+1
	jmp @load
@right:
	lda e_anim_count, x
	cmp #$10
	bcs @next
		lda #<anim_cape1
		sta temp_16bit_2+0
		lda #>anim_cape1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_cape2
	sta temp_16bit_2+0
	lda #>anim_cape2
	sta temp_16bit_2+1
@load:
	jsr e_load
	inc e_anim_count, x
	lda e_anim_count, x
	cmp #$20
	bne :+
		lda #$00
		sta e_anim_count, x
:	rts
anim_cape1:
	.byte $75,$00
	.byte $77,$00
anim_cape2:
	.byte $79,$00
	.byte $77,$00
anim_cape3:
	.byte $77,$40
	.byte $79,$40
anim_cape4:
	.byte $77,$40
	.byte $75,$40

anim_cloud:
	lda #<anim_cloud1
	sta temp_16bit_2+0
	lda #>anim_cloud1
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_cloud1:
	.byte $91,$03
	.byte $93,$03

anim_gob_climb:
	lda e_anim_count, x
	cmp #$08
	bcs @next
		lda #<anim_gob_climb1
		sta temp_16bit_2+0
		lda #>anim_gob_climb1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_gob_climb2
	sta temp_16bit_2+0
	lda #>anim_gob_climb2
	sta temp_16bit_2+1
@load:
	jsr e_load
	inc e_anim_count, x
	lda e_anim_count, x
	cmp #$10
	bne :+
		lda #$00
		sta e_anim_count, x
:	rts
anim_gob_climb1:
	.byte $29,$00
	.byte $2b,$00
anim_gob_climb2:
	.byte $2d,$00
	.byte $2f,$00

anim_debris_leaf:
	lda e_move_count, x
	cmp #$14
	bcs @next
		lda #<anim_debris_leaf1
		sta temp_16bit_2+0
		lda #>anim_debris_leaf1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_debris_leaf2
	sta temp_16bit_2+0
	lda #>anim_debris_leaf2
	sta temp_16bit_2+1
@load:
	jsr e_load
	rts
anim_debris_leaf1:
	.byte $1d,$00
	.byte $1f,$00
anim_debris_leaf2:
	.byte $8b,$20
	.byte $8d,$20

anim_debris_leafC:
	lda e_move_count, x
	cmp #$0a
	bcs @next
		lda #<anim_debris_leaf1
		sta temp_16bit_2+0
		lda #>anim_debris_leaf1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_debris_leaf2
	sta temp_16bit_2+0
	lda #>anim_debris_leaf2
	sta temp_16bit_2+1
@load:
	jsr e_load
	rts

anim_debris_tree:
	lda e_move_count, x
	cmp #$10
	bcs @next
		lda #<anim_debris_tree1
		sta temp_16bit_2+0
		lda #>anim_debris_tree1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_debris_tree2
	sta temp_16bit_2+0
	lda #>anim_debris_tree2
	sta temp_16bit_2+1
@load:
	jsr e_load
	rts
anim_debris_tree1:
	.byte $87,$00
	.byte $89,$00
anim_debris_tree2:
	.byte $a9,$20
	.byte $ab,$20
anim_debris_treeB:
	lda e_move_count, x
	cmp #$0c
	bcs @next
		lda #<anim_debris_tree1
		sta temp_16bit_2+0
		lda #>anim_debris_tree1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_debris_tree2
	sta temp_16bit_2+0
	lda #>anim_debris_tree2
	sta temp_16bit_2+1
@load:
	jsr e_load
	rts



anim_debris_leafB:
	lda e_move_count, x
	cmp #$0e
	bcs @next
		lda #<anim_debris_leaf1
		sta temp_16bit_2+0
		lda #>anim_debris_leaf1
		sta temp_16bit_2+1
		jmp @load
@next:
	lda #<anim_debris_leaf2
	sta temp_16bit_2+0
	lda #>anim_debris_leaf2
	sta temp_16bit_2+1
@load:
	jsr e_load
	rts

anim_eyeball:
	lda e_left
	cmp p_right
	bcc :+
		lda #<anim_eyeball1
		sta temp_16bit_2+0
		lda #>anim_eyeball1
		sta temp_16bit_2+1
		jmp @load
:	lda #<anim_eyeball2
	sta temp_16bit_2+0
	lda #>anim_eyeball2
	sta temp_16bit_2+1
@load:
	jsr e_load
	rts
anim_eyeball1:
	.byte $ad,$03
	.byte $af,$03
anim_eyeball2:
	.byte $af,$43
	.byte $ad,$43

anim_grave:
	lda #<anim_grave1
	sta temp_16bit_2+0
	lda #>anim_grave1
	sta temp_16bit_2+1
	jsr e_load
	rts
anim_grave1:
	.byte $bd,$23
	.byte $bd,$63


anim_ghost:
	lda e_dir, x
	cmp #$01
	bne :++
		dec e_y_pos, x
		lda e_y_pos, x
		bne :+
			dec e_dir, x
:		lda #<anim_ghost2
		sta temp_16bit_2+0
		lda #>anim_ghost2
		sta temp_16bit_2+1
		jmp @load
:	lda #<anim_ghost1
	sta temp_16bit_2+0
	lda #>anim_ghost1
	sta temp_16bit_2+1
@load:
	jsr e_load
	rts
anim_ghost1:
	.byte $19,$22
	.byte $1b,$22
anim_ghost2:
	.byte $ff,$22
	.byte $ff,$22

e_load:
	ldy #$00
	lda e_slot_offset, x
	tax
	lda (temp_16bit_2), y
	sta enemy_spr0_0tile, x
	iny
	lda (temp_16bit_2), y
	sta enemy_spr0_0attr, x
	iny
	lda (temp_16bit_2), y
	sta enemy_spr0_1tile, x
	iny
	lda (temp_16bit_2), y
	sta enemy_spr0_1attr, x
	ldx e_type_offset
	rts

e_anim_jumper:
	asl a
	tay
	lda e_anim_table+1, y
	pha
	lda e_anim_table, y
	pha
	ldx e_type_offset
	rts

enemy_sprite_associate:
	ldx #$00
:	ldy boss2_slot, x
	lda enemy_spr0_0y, y
	sta enemy_spr0_1y, y
	sta e_top, x
	clc
	adc #$0f
	sta e_bot, x

	lda enemy_spr0_0x, y
	sta e_left, x
	clc
	adc #$08
	sta enemy_spr0_1x, y
	clc
	adc #$07
	sta e_right, x
	lda level
	cmp #$03
	bne :+
		lda boss_switch
		beq :+
			inx
			cpx #$06
			bne :-
			rts
:
	inx
	cpx #$09
	bne :--
	rts

enemy_place_sprites:
	lda e_y_pos, x
	sec
	sbc #$01
	pha
	lda e_slot_offset, x
	tax
	lda scroll_dir
	cmp #$01
	beq :+
		lda #$f8
		sta enemy_spr0_0x, x
		bne :++
:	lda #$00
	sta enemy_spr0_0x, x
:	clc
	adc #$08
	sta enemy_spr0_1x, x
	pla
	sta enemy_spr0_0y, x
	sta enemy_spr0_1y, x
	rts

e_hit_amondus:
	lda p_anim_state
	cmp #$06
	bcs @done_coll
	ldx #$00
:	lda e_left, x
	cmp p_right
		bcs @no_coll
	lda e_right, x
	cmp p_left
		bcc @no_coll
	lda e_top, x
	cmp p_bot
		bcs @no_coll
	lda e_bot, x
	cmp p_top
		bcc @no_coll
			jsr he_die
			jmp @done_coll
@no_coll:
	inx
	cpx #$09
	bne :-
@done_coll:
	rts

e_hit_evil:
	ldy #$00
	ldx #$00
@again:
	tya
	pha
	lda e_slot_offset, y
	tay
	lda scroll_dir
	cmp #$01
	beq :+
		lda enemy_spr0_0x, y
		cmp #$0c
		bcs @pull_it
			cmp #$04
			bcc @pull_it
				jsr finish_guy
			bne @pull_it
:	lda enemy_spr0_0x, y
	cmp #$e9
	bcc @pull_it
		jsr finish_guy
@pull_it:
	pla
	tay
	iny
	inx
	cpx #$09
	bne @again
	rts
;e_hit_evil2:
;	ldy #$00
;	ldx #$00
;:	tya
;	pha
;	lda e_slot_offset, y
;	tay
;	lda enemy_spr0_0x, y
;	cmp #$0c
;	bcs :+
;		cmp #$04
;		bcc :+
;		lda #$00
;		sta e_type, x
;		sta e_anim_count, x
;		sta e_move_count, x
;		sta e_dir, x
;		lda #$f0
;		sta enemy_spr0_0y, y
;:	pla
;	tay
;	iny
;	inx
;	cpx #$09
;	bne :--
;	rts

process_enemies:
	ldy e_type_offset
	lda e_bullet_type, y
	jsr bullet_jumper

	ldy e_type_offset
	lda e_type, y
	jsr e_anim_jumper

	ldy e_type_offset
	lda e_type, y
	jsr e_move_jumper
	rts

test_do_away:
	ldx #$00
:	lda e_type, x
	cmp #$05
	bne :+
		lda #$ff
		sta e_hp, x
		stx hold_y
		lda e_type, x
		jsr e_hit_jumper
:	inx
	cpx #$09
	bne :--
	rts

