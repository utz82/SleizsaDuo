;**********************************************************************************************
; Sleizsa Duo v0.2 - Fairchild Channel F Music routine
; by utz 2015 * irrlichtproject.de
;**********************************************************************************************
; Copyright (c) 2015, irrlicht project
; All rights reserved.
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
;     * Redistributions of source code must retain the above copyright
;       notice, this list of conditions and the following disclaimer.
;     * Redistributions in binary form must reproduce the above copyright
;       notice, this list of conditions and the following disclaimer in the
;       documentation and/or other materials provided with the distribution.
;     * Neither the name of irrlicht project nor the
;       names of its contributors may be used to endorse or promote products
;       derived from this software without specific prior written permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
; DISCLAIMED. IN NO EVENT SHALL IRRLICHT PROJECT BE LIABLE FOR ANY
; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
; ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;**********************************************************************************************

	processor f8
	include	"ves.h"			;standard ChannelF header

prog_size	=	2		;program size in kilobytes (minimum 2, increase if necessary)

	org $800

cartridge.init:				;init bla
	CARTRIDGE_START
	CARTRIDGE_INIT
	
;**********************************************************************************************
;scratchpad register use
;r0-1 - base note counter ch1
;r2-3 - temp note counter ch1
;r4-5 - base note counter ch2
;r6-7 - temp note counter ch2
;r8 - output state ch1
;r9 - xor mask
;r10-11 (H) - ptn pointer
;r12-13 (K) - speed counter
;r14-15 (Q) - temp backup for ptn pointer
;r16 (ISAR) - output state ch2

main:
	;di				;disable interrupts: ACTIVATE THIS IF YOUR HOMEBREW RUNS TIMER INTERRUPTS
	clr				;initialize lo byte of speed counter
	lr Kl,a
	li $c0				;set up xor mask - CHANGE THIS TO "li $40" WHEN RUNNING ON ACTUAL HARDWARE
	lr 9,a
	lisu 2				;set up ISAR to reference r16 (output state ch2)
	lisl 0

.init
	dci musicData			;load data pointer
	xdc
	
.selectPtn
	xdc				;swap in DC1
	lm				;load hi byte of sequence pointer and increment DC
	ci $ff				;check for end marker - it's unlikely an address hi-byte of $ff is ever reached so 8bit end marker suffices
	bz .init			;loop if end of sequence reached
	lr 10,a				;store hi byte of pointer in r10 (Hu)
	lm				;load lo byte of seq pointer and increment DC
	lr 11,a				;store lo byte of pointer in r11 (Hl)
	xdc				;switch back to DC0
	lr dc,h				;initialize pattern pointer

.rdnotes
	clr				;A=0
	lr 2,a				;initalize temp counters
	lr 3,a
	lr 6,a
	lr 7,a
	
	lr 8,a				;initialize output states
	lr s,a
	outs 5

	lm				;load speed/drum byte
	xs 2				;ci 0, check for end marker
	bz .selectPtn			;loop if end marker found
	
	lr Ku,a				;set hi byte of speed counter

	lm				;load note byte ch1
	lr 0,a				;preserve it
	xi 0
	bm .drum			;if note byte >$80, play drum 1	
.drret	
	lr a,0				;restore note byte
	lr h,dc				;backup ptn pointer
	dci .noteTab
	sl 1				;A=A*2
	bp .adskip1			;correct signed offset
	inc
	com
	ai $80
.adskip1
	adc				;point DC to note counter value
	lm	
	lr 0,a				;note counter ch1 -> r0-1
	lm
	lr 1,a
			
	lr dc,h				;restore ptn pointer
	lm				;load note byte ch2
	lr 4,a
	xi 0				;if note byte <$80, play drum 2
	bm .drum2
	
.drret2	
	lr a,4		
	lr h,dc				;backup ptn pointer
	dci .noteTab
	sl 1				;A=A*2
	bp .adskip2			;correct signed offset
	inc
	com
	ai $80
.adskip2
	adc				;point DC to note counter value
	lm
	lr 4,a				;note counter ch2 -> r4-5
	lm
	lr 5,a
	lr dc,h				;restore ptn pointer
	
;**********************************************************************************************	
.playnote
	lr a,8			;1	;fetch output state ch1
				;28
				;___
	outs 5			;4	;send it to sound port -> can replace with outs, 1 byte less
	
	clr			;1	;clear carry
	lr a,1			;1	;load lo byte of counter ch1
	as 3			;1	;add temp counter lo
	lr 3,a			;1	;save temp counter lo
	
	lr a,0			;1	;load hi byte of counter ch1
	lnk			;1	;add carry
	as 2			;1	;add temp counter hi
	lr 2,a			;1	;save temp counter hi
	
	bnc .wait1		;3.5/3	;if there was carry
	
	lr a,8			;1	;swap output state
	xs 9			;1
	lr 8,a			;1
	nop			;1	;tempo correction
	
.skip1
	lr q,dc			;4	;waste some time for volume correction, also gives (somewhat) better sound
	lr q,dc			;4
	lr a,s			;1	;and now, same as above but for ch2
				;29
				;___
	outs 5			;4
	
	lr a,5			;1
	as 7			;1
	lr 7,a			;1
	
	lr a,4			;1
	lnk			;1
	as 6			;1
	lr 6,a			;1

	bnc .wait2		;3.5/3
	
	lr a,s			;1
	xs 9			;1
	lr s,a			;1
	nop			;1

.skip2
	lr a,Kl			;1	;load lo byte of speed counter
	inc			;1	;increment it
	lr Kl,a			;1	;and write back to scratchpad
	lr a,Ku			;1	;load hi byte of speed counter
	lnk			;1	;add carry if any
	lr Ku,a			;1	;and write back to scratchpad
	bnz .playnote		;3.5/3	;continue outputting sound if !0

	br .rdnotes			;else, read in next note

.wait1
	br .skip1		;3.5
	
.wait2
	br .skip2		;3.5
	
.endplay				;debug
;**********************************************************************************************

.drum
	lr h,dc				;backup data pointer
	dci 0				;point to beginning of ram
	
.drumlp1
	li $c0				;load output mask to A
	nm				;& with memory and increment data pointer
	outs 5
	
	lr q,dc				;save data pointer in Q
	lr a,qu				;read hi byte of Q
	ci 2				;compare against 3 (stop reading at $200)
	bnz .drumlp1			;otherwise loop

.drumexit
	lr dc,h				;restore data pointer

	clr				;stop sound
	outs 5

	li $d0				;adjust speed counter
	lr Kl,a
	
	br .drret			;return to main routine
	
.drum2
	li $ff				;set up drum timer
	lr 5,a
	li $40				;set output state to 1000Hz
	outs 5

.drumlp2
	clr				;zero A
	lr q,dc				;waste some time
	ds 5				;decrement drum timer
	bnz .drumlp2
	
	sl 1				;set output state to 500Hz
	outs 5
	
.drumlp3
	lr q,dc				;waste some time
	ds 5				;decrement drum timer
	bnz .drumlp3

	lr a,9				;set output state to 120Hz
	outs 5
	
.drumlp4
	lr q,dc				;waste some more time
	lr q,dc
	lr q,dc
	lr q,dc
	lr q,dc
	ds 5				;decrement drum timer
	bnz .drumlp4
	
	clr				;stop sound
	outs 5

	li $d0				;adjust speed counter
	lr Kl,a
	
	br .drret2			;return to main routine

.enddrum				;debug

;**********************************************************************************************
	org $900-18

	.word $78C8, $7201, $6B9B, $6591, $5FDE, $5A7C, $5568, $509D, $4C17
.noteTab
	.word $0
	.word $200, $21E, $23F, $261, $285, $2AB, $2D4, $2FF, $32D, $35D, $390, $3C6
	.word $400, $43D, $47D, $4C2, $50A, $557, $5A8, $5FE, $659, $6BA, $720, $78D
	.word $800, $879, $8FA, $983, $A14, $AAD, $B50, $BFC, $CB2, $D74, $E41, $F19
	.word $FFF, $10F3, $11F5, $1306, $1428, $155A, $16A0, $17F8, $1965, $1AE7, $1C81, $1E33
	.word $1FFE, $21E5, $23E9, $260C, $284F, $2AB5, $2D3F, $2FEF, $32C9, $35CE, $3901, $3C65
	.word $3FFC, $43CA, $47D2

musicData
	include	"music.asm"		;song data
