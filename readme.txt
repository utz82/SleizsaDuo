SLEIZSA DUO v0.2
================
by utz 03'2015 * irrlichtproject.de * github.com/utz82


About
=====

Sleizsa Duo is a two-channel music routine for the Fairchild Channel F video
game console.


Requirements
============

To use Sleizsa Duo, you will need to following:

- dasm macro assembler (http://dasm-dillon.sourceforge.net)
- Perl (http://www.perl.org/get.html)
- an XM tracker (must support XM version 1.04 - try http://milkytracker.org)
- Mess (http://www.mess.org - not required, but will come in handy)


Setup
=====

Install Perl, Milkytracker, dasm, and Mess, if you haven't already done so.
(If you do not wish to add these utilities to your search path, you can
specify the paths in compile.bat/compile.sh instead. Windows users can also
copy the relevent dasm, Perl and Mess files to /SleizsaDuo).

Get the Channel F ROM files and put them in SleizsaDuo/roms/channelf. These
files are not distributed with Sleizsa Duo, but you can get them in various
places, such as the original Sleizsa package for example.


How to Use
==========

Step 1: Make some music using the included music.xm template.
Step 2: Execute compile.bat (Win) resp. compile.sh (*nix).
Step 3: Profit!

You can use the included music.xm template to compose your tunes. It gives
only a rough approximation of how the music will sound on the actual console,
though. Especially lower notes will sound much worse.

Tones must be entered into tracks 1 and 2, using instrument 01. Valid notes
are C-0 - B-5.

There are two interrupting drum sounds (instrument 02 and 03), they should
be placed in channel 3 or 4. Only one drum sound can be active at a given time.

You can change the tempo with the Fxx command, or globally with the tempo
setting. You cannot change the BPM. So, only values F01..F1F are allowed.
Beware that after each pattern, the speed will be reset to the global value.

Other than Fxx, all effects will be ignored. Changes made to the instruments
as well as volume settings are also ignored.

If you are running out of space in the binary, try increasing the value in
line 34 of main.asm. In theory, up to 62 KB are possible, but MESS will break
when trying to use more than 8 KB.

I tried my best to correct the drum speed shift. If you do however find it
insufficient, you can try to experiment with the values in line 227 resp. 267
of main.asm.


Note to Programmers
===================

You are free to use Sleizsa Duo in your programs, as long as you credit me.
Beware that Sleizsa Duo is not guaranteed to work on all Channel F versions.

Sleizsa Duo is optimized for use with MESS. In order to use it on real hardware,
you need to change line 59 of main.asm to "li $40".

The routine can be relocated, but make sure the .noteTab label aligns to a $ff
byte page boundary. The musicData section can reside anywhere in memory. There
is also some free mem between the drum code and the note table ($8c4-$8ee), 
which you can use for your own subroutines/data.

Scratchpad registers r0-r16 including the K register are used, so you'll have
to work around that.

In case you are using external interrupts in your homebrew, you must disable
interrupts prior to calling Sleizsa Duo.

Sleizsa Duo takes all the CPU time, so you can't do much else while music is
playing. However, the section from line 154-155 could be used to update
graphics, as long as the gfx code takes approximately 8 cycles and doesn't
destroy the r0-r16.


Music Data Layout
=================

The first section is contains the order in which patterns will be played. It
consists of word-length pointers to the patterns and is terminated with an $ff
byte.

The following sections are the actual patterns, containing the music data.
Patterns can be of arbitrary length, and must be terminated with a $00 byte.

Each row in the pattern data consists of 3 bytes. The first byte contains
information about the speed of the row. A higher value corresponds to a higher
speed. The speed value may not be 0. You probably want to use values of $F0
and up.

Bytes 2-3 of a row are pointers to note values for channel 1 and 2, 
respectively. A value of 0 signifies silence, available notes are 1-64.

To trigger the hihat, add $80 to the note value of channel 1.
To trigger the kick drum, add $80 to the note value of channel 2.


Thanks...
=========

... to B00daW for the original Sleizsa routine.
... to e5frog for veswiki.com, and for helping to get Sleizsa Duo to work on
    real hardware
... to SeanRiddle, Blackbird, Urchlay, MESSdev, and others for documenting 
    the Fairchild Channel F and the F8 chip.
