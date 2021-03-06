scroll_start:
	.byte $01, $02, $01, $02
nt_start:
	.byte $24, $20, $24, $20
ppu_start:
	.byte $0f, $00, $0f, $00
level_start:
	.byte $1f, $00, $1f, $00	;$08;boss1&3;	$17;boss2&4;	
cam_start:
	.byte $30, $10, $30, $10	;$02;boss1&3;	$3e;boss2&4;	
x_fine_start:
	.byte $00, $01, $00, $01
pspr_y_start:
	.byte $4f, $4f, $4f, $4f
pspr_x_start:
	.byte $c0, $30, $c0, $30
p_y_pos_start:
	.byte $05, $05, $05, $05
p_x_pos_start:
	.byte $3c, $03, $3c, $03	;$0e;boss1&3;	$31;boss2&4;	
e1_y_start:
	.byte $00, $00, $00, $00
e2_y_start:
	.byte $e0, $e0, $e0, $e0
e_x_start:
	.byte $f0, $08, $f0, $08
e_att_start:
	.byte $01, $41, $01, $41
g_tens:
	.byte $01, $01, $00, $03	;	$00;bosses; 
g_ones:
	.byte $05, $02, $05, $00	;	$00;bosses; 

boss_level_start:
	.byte $08,$17,$08,$17
boss_cam_start:
	.byte $02,$3e,$02,$3e
boss_p_x_pos_start:
	.byte $0e,$31,$0e,$31

level_lo:
	.byte <level0, <level1, <level2, <level3
level_hi:
	.byte >level0, >level1, >level2, >level3

coll_lo:
	.byte <level0_col, <level1_col, <level2_col, <level3_col
coll_hi:
	.byte >level0_col, >level1_col, >level2_col, >level3_col

level0:
	.byte $34,$00,$00,$00,$00,$00,$00,$00,									$00,$00,$00,$00,$34,$00,$00,$00,									$35,$00,$00,$00,$00,$00,$34,$00,								$00,$00,$34,$00,$00,$00,$00,$34
	.byte $34,$00,$00,$35,$00,$00,$34,$00,									$00,$35,$00,$34,$00,$00,$00,$00,									$00,$00,$00,$00,$34,$00,$00,$00,								$00,$00,$00,$00,$00,$34,$00,$00
	.byte $00,$35,$00,$00,$34,$00,$00,$00,									$00,$34,$00,$00,$00,$35,$00,$00,									$00,$34,$00,$00,$00,$00,$35,$00,								$00,$34,$00,$34,$00,$00,$00,$00
	.byte $00,$34,$47,$02,$36,$00,$00,$35,									$00,$00,$34,$00,$00,$00,$00,$00,									$00,$00,$00,$34,$00,$00,$00,$00,								$00,$00,$00,$00,$00,$00,$34,$00
	.byte $47,$3b,$01,$01,$01,$39,$36,$00,									$34,$00,$00,$00,$00,$00,$34,$00,									$00,$00,$00,$00,$00,$00,$34,$00,								$00,$00,$35,$00,$34,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$39,									$02,$36,$00,$00,$00,$00,$00,$00,									$47,$3b,$01,$3a,$01,$39,$38,$02,								$02,$36,$00,$00,$00,$00,$47,$02
	.byte $01,$01,$01,$01,$01,$01,$01,$01,									$01,$01,$3d,$00,$4a,$3b,$01,$01,									$01,$01,$01,$01,$01,$01,$01,$01,								$01,$01,$06,$00,$00,$48,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,									$01,$01,$3d,$00,$49,$01,$01,$01,									$01,$01,$01,$01,$01,$01,$01,$01,								$01,$01,$05,$00,$00,$49,$01,$01
level0_col:
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$01,$01,  $01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01


level1:
	.byte $00,$00,$00,$00,$00,$0c,$00,$00,									$00,$09,$00,$00,$08,$00,$09,$3e,									$01,$01,$01,$01,$01,$01,$01,$3d,								$08,$00,$3e,$01,$01,$01,$01,$01
	.byte $00,$00,$00,$00,$00,$0c,$00,$00,									$14,$11,$00,$00,$08,$14,$11,$10,									$46,$01,$01,$01,$01,$01,$0a,$3f,								$08,$00,$00,$41,$42,$01,$43,$01
	.byte $00,$00,$00,$00,$00,$0c,$00,$00,									$00,$09,$00,$00,$08,$00,$09,$10,									$03,$01,$01,$01,$01,$01,$0a,$3f,								$08,$00,$00,$00,$00,$08,$00,$00
	.byte $00,$00,$00,$00,$00,$0c,$12,$10,									$00,$11,$10,$00,$08,$13,$09,$00,									$41,$0a,$09,$0b,$40,$08,$00,$00,								$08,$37,$01,$44,$00,$08,$00,$00
	.byte $00,$00,$00,$00,$00,$0c,$00,$00,									$00,$09,$00,$00,$08,$00,$09,$00,									$00,$00,$09,$00,$00,$08,$00,$00,								$08,$45,$01,$0a,$00,$08,$00,$00
	.byte $00,$00,$00,$00,$00,$0c,$00,$00,									$00,$09,$00,$00,$08,$00,$09,$00,									$00,$00,$09,$00,$00,$08,$00,$00,								$08,$00,$09,$00,$00,$08,$00,$00
	.byte $00,$00,$00,$00,$00,$0e,$0d,$0d,									$0d,$0e,$0d,$0d,$0f,$0d,$0e,$0d,									$0d,$0d,$0e,$0d,$0d,$0c,$00,$00,								$08,$00,$09,$00,$00,$08,$00,$00
	.byte $00,$00,$00,$00,$00,$09,$00,$00,									$00,$09,$00,$00,$08,$00,$09,$00,									$00,$00,$09,$00,$00,$0c,$00,$00,								$08,$00,$09,$00,$00,$08,$00,$00
level1_col:
	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$02,$02,  $02,$02,$02,$02,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,  $00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$00,$01,$00,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,  $00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$00,  $00,$00,$01,$00,$01,$00,$00,$00,$00,$00,$01,$01,$00,$00,$00,$00,  $00,$00,$01,$01,$00,$00,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02


level2:
	.byte $23,$33,$33,$33,$33,$33,$33,$33,									$33,$33,$09,$33,$33,$33,$33,$33,									$33,$33,$33,$33,$33,$33,$33,$33,								$33,$33,$33,$33,$33,$33,$33,$33
	.byte $23,$33,$33,$33,$33,$33,$33,$33,									$33,$33,$09,$13,$33,$33,$33,$33,									$33,$33,$33,$33,$33,$33,$33,$33,								$33,$33,$33,$33,$33,$33,$33,$33
	.byte $23,$33,$33,$33,$33,$33,$33,$33,									$33,$33,$09,$33,$33,$33,$33,$33,									$33,$33,$33,$33,$33,$33,$33,$33,								$33,$33,$33,$33,$33,$33,$33,$33
	.byte $23,$33,$33,$33,$33,$33,$33,$33,									$33,$33,$11,$33,$33,$33,$33,$33,									$33,$33,$33,$33,$33,$33,$33,$33,								$33,$33,$33,$33,$33,$33,$33,$33
	.byte $24,$15,$15,$1d,$33,$33,$33,$18,									$1f,$33,$09,$10,$33,$33,$33,$33,									$33,$33,$1a,$33,$1a,$33,$33,$33,								$33,$33,$33,$33,$33,$33,$33,$33
	.byte $24,$00,$16,$1c,$15,$15,$15,$15,									$1f,$1a,$21,$22,$1a,$33,$1a,$33,									$33,$1e,$15,$15,$15,$15,$1d,$1a,								$1b,$33,$33,$1a,$33,$18,$17,$33
	.byte $25,$27,$16,$16,$16,$16,$16,$16,									$15,$15,$15,$15,$15,$15,$15,$15,									$15,$16,$16,$16,$16,$16,$1c,$15,								$15,$15,$15,$15,$15,$15,$15,$15
	.byte $26,$27,$16,$16,$16,$16,$16,$16,									$16,$16,$16,$16,$16,$16,$16,$16,									$16,$16,$16,$16,$16,$16,$16,$16,								$16,$16,$16,$16,$16,$16,$16,$16
level2_col:
	.byte $01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	.byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
	.byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
	.byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
	.byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
	.byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
	.byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
	.byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
	.byte $01,$00,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $01,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
	.byte $01,$00,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$01,  $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$01,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02
	.byte $01,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$02
	.byte $01,$00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$00,$00,$01,$00,$00,$00,$00,$00,$01,$00,$00,$00,$01,$00,$00,  $00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$01,  $01,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$01,$01,$01,$00,$02
	.byte $01,$01,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$02,$02,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01


level3:
	.byte $05,$09,$08,$00,$00,$09,$00,$09,									$00,$00,$09,$08,$00,$00,$00,$00,									$00,$00,$00,$09,$08,$00,$00,$00,								$49,$01,$01,$01,$05,$00,$00,$08
	.byte $00,$09,$08,$00,$00,$09,$00,$09,									$00,$00,$09,$08,$00,$00,$00,$00,									$00,$00,$00,$09,$08,$00,$00,$00,								$4b,$07,$09,$07,$4c,$00,$00,$08
	.byte $00,$09,$08,$00,$00,$09,$00,$09,									$00,$00,$09,$08,$00,$00,$00,$00,									$00,$00,$00,$09,$08,$00,$00,$00,								$00,$00,$09,$00,$00,$00,$00,$08
	.byte $00,$09,$08,$00,$00,$11,$00,$09,									$00,$00,$09,$08,$00,$00,$00,$00,									$00,$00,$00,$09,$08,$00,$00,$00,								$00,$00,$09,$13,$00,$00,$00,$08
	.byte $00,$09,$08,$00,$00,$09,$00,$09,									$00,$2c,$0e,$0f,$0d,$0d,$0d,$0d,									$0d,$0d,$0d,$0e,$0f,$0d,$2b,$00,								$00,$00,$11,$00,$00,$00,$00,$08
	.byte $00,$21,$2a,$22,$1b,$21,$22,$2d,									$2e,$15,$31,$32,$00,$00,$00,$00,									$00,$00,$00,$31,$32,$00,$15,$1e,								$1e,$00,$21,$22,$00,$1b,$29,$2a
	.byte $15,$15,$15,$15,$15,$15,$15,$16,									$16,$16,$4d,$4e,$2f,$2f,$2f,$2f,									$2f,$2f,$2f,$2f,$2f,$2f,$16,$16,								$16,$15,$15,$15,$15,$15,$15,$15
	.byte $16,$16,$16,$16,$16,$16,$16,$16,									$16,$16,$30,$30,$30,$30,$30,$30,									$30,$30,$30,$30,$30,$30,$16,$16,								$16,$16,$16,$16,$16,$16,$16,$16
level3_col:
	.byte $01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,  $02,$01,$01,$01,$01,$01,$01,$01,$01,$02,$02,$02,$02,$02,$01,$01
	.byte $01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00,$00,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01
	.byte $02,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$01,$01,  $01,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,  $01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,  $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,  $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,  $01,$01,$01,$01,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,  $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$01,$01,$01,$01,  $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01



