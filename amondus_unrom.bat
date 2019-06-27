ca65 amondus_unrom.asm -o amondus_unrom.o

ld65 -C amondus_unrom.cfg amondus_unrom.o -o ""
copy /b amondus_unrom.hdr+_prg\bank00.prg+_prg\bank01.prg+_prg\bank02.prg+_prg\bank03.prg+_prg\bank04.prg+_prg\bank05.prg+_prg\bank06.prg+_prg\bankFixed.prg "The Rise of Amondus.nes"
pause
