.segment "BANK00"
.include "includes\bank00\amondus_bosses.asm"
.include "includes\bank00\amondus_e_bullets.asm"
.include "includes\bank00\amondus_enemies.asm"
.include "includes\bank00\amondus_enemy_move.asm"
.include "includes\bank00\amondus_map.asm"
.include "includes\bank00\amondus_metatiles.asm"
.include "includes\bank00\amondus_player2.asm"
.include "includes\bank00\amondus_end.asm"

MAP_WIDTH  = 64
MAP_HEIGHT = 16
MAP_BASE   = $0000
 
.macro makeLUT op
  .repeat MAP_HEIGHT, y_
    .byte op ( y_ * MAP_WIDTH + MAP_BASE )
  .endrepeat
.endmacro
 
multiply_lo:            makeLUT <
multiply_hi:             makeLUT >
