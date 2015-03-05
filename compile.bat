
perl xm2slduo.pl
dasm main.asm -f3 -v1 -otest.bin
mess channelf -rompath roms/ -cart test.bin -wavwrite song.wav