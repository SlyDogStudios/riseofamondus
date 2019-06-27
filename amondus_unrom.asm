.include "includes\constants.asm"
.include "includes\amondus_music_declarations.asm"

.segment "ZEROPAGE"
.include "includes\zp.asm"

.include "includes\bank00\bank00.asm"		; enemies, maps, metatiles, bullets, bosses, player2
.include "includes\bank01\bank01.asm"		; music and sound
.include "includes\bank02\bank02.asm"		; graphics, title screen
.include "includes\bank03\bank03.asm"		; manual pages 1
.include "includes\bank04\bank04.asm"		; manual pages 2, manual graphics 1
.include "includes\bank05\bank05.asm"		; manual graphics 2
.include "includes\bank06\bank06.asm"		; the invasion bonus
.include "includes\bankFixed\bankFixed.asm"	; levels, player1, bankswitching, vectors
