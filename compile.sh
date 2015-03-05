#!/bin/bash

./xm2slduo.pl -v
dasm main.asm -f3 -v1 -otest.bin #-slbls.sym
mess channelf -rompath roms/ -cart test.bin -wavwrite song.wav