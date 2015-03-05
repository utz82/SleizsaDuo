SLEIZSA DUO v0.1
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
- an XM tracker (how about http://milkytracker.org)
- Mess (http://www.mess.org - not required, but will come in handy)


Setup
=====

Install Perl, Milkytracker, dasm, and Mess, if you haven't already done so.
(If you do not wish to add these utilities to your search path, you can
specify the paths in compile.bat/compile.sh instead).

Get the Channel F ROM files and put them in sleizsaduo/roms/channelf. These
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

Tones must be entered into tracks 1 and 2, using instrument 00. Valid notes
are C-0 - B-5.

There are two interrupting drum sounds (instrument 01 and 02), they should
be placed in channel 3 or 4. Only one drum sound can be active at a given time.

You can change the tempo with the Fxx command, or globally with the tempo
setting. Minimum tempo is 2. You cannot change the BPM. So, only values F02-F1F
are allowed.

If you are running out of space in the binary, try increasing the value in
line 34 of main.asm.

I tried my best to correct the drum speed shift. If you do however find it
insufficient, you can try to experiment with the value in line 224 of main.asm.


Note to Programmers
===================

You are free to use Sleizsa Duo in your programs, as long as you credit me.

The routine can be relocated, but make sure the frequency table (.noteTab) is
aligned to a $ff byte page boundary. The musicData section can reside anywhere
in memory. There is also some free mem between the drum code and the note
table ($8b9-$8ff), which you can use for your own subroutines/data.

Scratchpad registers r0-r16 including the K register are used, so you'll have
to work around that.

Sleizsa Duo takes all the CPU time, so you can't do much else while music is
playing. However, the section from line 154-161 could be used to update
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
information about the speed of the row, and the drum triggers. Drum triggers
are encoded into bits 0-1 (0 - no drum, 1 - hihat, 2 - kick). The speed is
encoded into bits 2-7. A higher value corresponds to a higher speed. The speed
value may not be 0.

Bytes 2-3 of a row are pointers to note values for channel 1 and 2, 
respectively. A value of 0 signifies silence, available notes are 1-64.


Thanks...
=========

... to B00daW for the original Sleizsa routine.
... to SeanRiddle, e5frog (veswiki.com), Blackbird, Urchlay, MESSdev, and others for documenting the Fairchild Channel F and the F8 chip.
