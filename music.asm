
.seq
	.word .ptn0
	.word .ptn1
	.word .ptn2
	.word .ptn6
	.word .ptn3
	.word .ptn7
	.word .ptn12
	.word .ptn5
	.word .ptn4
	.word .ptn5
	.word .ptn8
	.word .ptn9
	.word .ptn8
	.word .ptn10
	.word .ptn16
	.word .ptn17
	.byte $ff

.ptn0
	.byte $fc,$12,$0
	.byte $fc,$12,$0
	.byte $fc,$2d,$31
	.byte $fc,$0,$0
	.byte $fc,$12,$0
	.byte $fc,$12,$0
	.byte $fc,$2d,$31
	.byte $fc,$0,$0
	.byte $fc,$12,$0
	.byte $fc,$12,$0
	.byte $fc,$2d,$31
	.byte $fc,$0,$0
	.byte $fc,$d,$0
	.byte $fc,$d,$0
	.byte $fc,$10,$0
	.byte $fc,$10,$0
	.byte $fc,$12,$0
	.byte $fc,$12,$0
	.byte $fc,$2d,$31
	.byte $fc,$0,$0
	.byte $fc,$12,$0
	.byte $fc,$12,$0
	.byte $fc,$2d,$31
	.byte $fc,$0,$0
	.byte $fc,$12,$0
	.byte $fc,$12,$0
	.byte $fc,$2d,$31
	.byte $fc,$0,$0
	.byte $fc,$d,$0
	.byte $fc,$d,$0
	.byte $fc,$10,$0
	.byte $fc,$10,$0
	.byte $0

.ptn1
	.byte $fc,$12,$0
	.byte $fc,$12,$0
	.byte $fc,$2d,$31
	.byte $fc,$0,$0
	.byte $fc,$12,$0
	.byte $fc,$12,$0
	.byte $fc,$2d,$31
	.byte $fc,$0,$0
	.byte $fc,$12,$0
	.byte $fc,$12,$0
	.byte $fc,$2d,$31
	.byte $fc,$0,$0
	.byte $fc,$d,$0
	.byte $fc,$d,$0
	.byte $fc,$10,$0
	.byte $fc,$10,$0
	.byte $fc,$12,$0
	.byte $fc,$12,$0
	.byte $fc,$0,$0
	.byte $fc,$0,$0
	.byte $fc,$d,$0
	.byte $fc,$d,$0
	.byte $fc,$0,$0
	.byte $fc,$0,$0
	.byte $fc,$f,$0
	.byte $fc,$f,$0
	.byte $fc,$0,$0
	.byte $fc,$0,$0
	.byte $fc,$11,$0
	.byte $fc,$11,$0
	.byte $fc,$0,$0
	.byte $fd,$0,$0
	.byte $0

.ptn2
	.byte $fe,$12,$0
	.byte $fc,$12,$0
	.byte $fd,$2d,$36
	.byte $fd,$0,$34
	.byte $fd,$12,$36
	.byte $fc,$12,$34
	.byte $fd,$2d,$31
	.byte $fd,$0,$31
	.byte $fe,$12,$31
	.byte $fc,$12,$31
	.byte $fd,$2d,$31
	.byte $fd,$0,$0
	.byte $fd,$d,$2f
	.byte $fc,$d,$2f
	.byte $fd,$10,$31
	.byte $fd,$10,$31
	.byte $fe,$12,$32
	.byte $fc,$12,$31
	.byte $fd,$2d,$32
	.byte $fd,$0,$31
	.byte $fd,$12,$32
	.byte $fc,$12,$31
	.byte $fd,$2d,$2f
	.byte $fd,$0,$2d
	.byte $fe,$12,$32
	.byte $fc,$12,$31
	.byte $fd,$2d,$32
	.byte $fd,$0,$31
	.byte $fd,$d,$32
	.byte $fc,$d,$31
	.byte $fd,$10,$2f
	.byte $fd,$10,$2d
	.byte $0

.ptn3
	.byte $fe,$12,$0
	.byte $fc,$12,$0
	.byte $fd,$2d,$36
	.byte $fd,$0,$34
	.byte $fd,$12,$36
	.byte $fc,$12,$34
	.byte $fd,$2d,$31
	.byte $fd,$0,$31
	.byte $fe,$12,$0
	.byte $fc,$12,$0
	.byte $fd,$2d,$31
	.byte $fd,$0,$0
	.byte $fd,$d,$2f
	.byte $fc,$d,$2f
	.byte $fd,$10,$31
	.byte $fd,$10,$31
	.byte $fe,$12,$32
	.byte $fc,$12,$31
	.byte $fd,$0,$32
	.byte $fd,$0,$31
	.byte $fd,$d,$32
	.byte $fc,$d,$31
	.byte $fd,$0,$2f
	.byte $fd,$0,$2d
	.byte $fe,$f,$32
	.byte $fc,$f,$31
	.byte $fd,$0,$32
	.byte $fd,$0,$31
	.byte $fe,$10,$32
	.byte $fc,$10,$31
	.byte $fc,$0,$2f
	.byte $fc,$0,$2d
	.byte $0

.ptn4
	.byte $fe,$14,$33
	.byte $fc,$14,$33
	.byte $fd,$2f,$33
	.byte $fd,$0,$33
	.byte $fd,$14,$33
	.byte $fc,$14,$33
	.byte $fd,$2f,$33
	.byte $fd,$0,$33
	.byte $fe,$14,$33
	.byte $fc,$14,$33
	.byte $fd,$2f,$33
	.byte $fd,$0,$33
	.byte $fd,$14,$33
	.byte $fc,$14,$33
	.byte $fd,$2f,$33
	.byte $fd,$0,$0
	.byte $fe,$14,$33
	.byte $fc,$14,$0
	.byte $fd,$2f,$33
	.byte $fd,$0,$33
	.byte $fd,$14,$38
	.byte $fc,$14,$38
	.byte $fd,$2f,$33
	.byte $fd,$0,$0
	.byte $fe,$14,$36
	.byte $fc,$14,$36
	.byte $fd,$2f,$33
	.byte $fd,$0,$0
	.byte $fe,$14,$34
	.byte $fc,$14,$34
	.byte $fe,$2f,$34
	.byte $fc,$0,$33
	.byte $0

.ptn5
	.byte $fe,$13,$32
	.byte $fc,$13,$32
	.byte $fd,$2e,$32
	.byte $fd,$0,$32
	.byte $fd,$13,$32
	.byte $fc,$13,$32
	.byte $fd,$2e,$32
	.byte $fd,$0,$32
	.byte $fe,$13,$32
	.byte $fc,$13,$32
	.byte $fd,$2e,$32
	.byte $fd,$0,$32
	.byte $fd,$13,$32
	.byte $fc,$13,$32
	.byte $fd,$2e,$32
	.byte $fd,$0,$0
	.byte $fe,$13,$32
	.byte $fc,$13,$0
	.byte $fc,$2e,$32
	.byte $fd,$0,$32
	.byte $fd,$13,$37
	.byte $fc,$13,$37
	.byte $fd,$2e,$32
	.byte $fd,$0,$0
	.byte $fe,$13,$35
	.byte $fc,$13,$35
	.byte $fd,$2e,$32
	.byte $fd,$0,$0
	.byte $fd,$13,$33
	.byte $fd,$11,$33
	.byte $fd,$10,$32
	.byte $fd,$f,$32
	.byte $0

.ptn6
	.byte $fe,$12,$0
	.byte $fc,$12,$0
	.byte $fd,$2d,$36
	.byte $fd,$0,$34
	.byte $fd,$12,$36
	.byte $fc,$12,$34
	.byte $fd,$2d,$31
	.byte $fd,$0,$31
	.byte $fe,$12,$31
	.byte $fc,$12,$31
	.byte $fd,$2d,$31
	.byte $fd,$0,$0
	.byte $fd,$d,$2f
	.byte $fc,$d,$2f
	.byte $fd,$10,$31
	.byte $fd,$10,$31
	.byte $fe,$12,$32
	.byte $fc,$12,$34
	.byte $fd,$2d,$32
	.byte $fd,$0,$34
	.byte $fd,$12,$32
	.byte $fc,$12,$31
	.byte $fd,$2d,$2f
	.byte $fd,$0,$2d
	.byte $fe,$12,$32
	.byte $fc,$12,$31
	.byte $fd,$2d,$32
	.byte $fd,$0,$34
	.byte $fe,$d,$36
	.byte $fc,$d,$34
	.byte $fe,$10,$32
	.byte $fc,$10,$31
	.byte $0

.ptn7
	.byte $fe,$12,$0
	.byte $fc,$12,$0
	.byte $fd,$2d,$36
	.byte $fd,$0,$34
	.byte $fd,$12,$36
	.byte $fc,$12,$34
	.byte $fd,$2d,$31
	.byte $fd,$0,$31
	.byte $fe,$12,$0
	.byte $fc,$12,$0
	.byte $fd,$2d,$31
	.byte $fd,$0,$0
	.byte $fd,$d,$2f
	.byte $fc,$d,$2f
	.byte $fd,$10,$31
	.byte $fd,$10,$31
	.byte $fe,$12,$32
	.byte $fc,$12,$31
	.byte $fd,$0,$32
	.byte $fd,$0,$34
	.byte $fd,$0,$32
	.byte $fc,$0,$31
	.byte $fd,$0,$2f
	.byte $fd,$0,$2d
	.byte $fe,$31,$36
	.byte $fc,$2f,$34
	.byte $fd,$31,$36
	.byte $fd,$2f,$34
	.byte $fe,$31,$36
	.byte $fc,$2f,$34
	.byte $fc,$2d,$32
	.byte $fc,$2c,$31
	.byte $0

.ptn8
	.byte $fe,$12,$31
	.byte $fc,$12,$36
	.byte $fd,$2d,$34
	.byte $fd,$36,$32
	.byte $fd,$12,$31
	.byte $fc,$12,$36
	.byte $fd,$2d,$34
	.byte $fd,$0,$32
	.byte $fe,$12,$31
	.byte $fc,$12,$36
	.byte $fd,$2d,$34
	.byte $fd,$0,$32
	.byte $fd,$12,$31
	.byte $fc,$12,$36
	.byte $fd,$2d,$34
	.byte $fd,$0,$32
	.byte $fe,$12,$31
	.byte $fc,$12,$36
	.byte $fd,$2d,$34
	.byte $fd,$0,$32
	.byte $fd,$12,$31
	.byte $fc,$12,$36
	.byte $fd,$2d,$34
	.byte $fd,$0,$32
	.byte $fe,$12,$31
	.byte $fc,$12,$36
	.byte $fd,$2d,$34
	.byte $fd,$0,$32
	.byte $fd,$12,$31
	.byte $fd,$10,$36
	.byte $fd,$f,$34
	.byte $fd,$e,$32
	.byte $0

.ptn9
	.byte $fe,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fc,$37,$33
	.byte $fd,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fe,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fd,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fe,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fd,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fe,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fe,$13,$32
	.byte $fc,$11,$37
	.byte $fe,$10,$35
	.byte $fc,$f,$33
	.byte $0

.ptn10
	.byte $fe,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fc,$37,$33
	.byte $fd,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fe,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fd,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fe,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fd,$13,$32
	.byte $fc,$13,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fe,$1f,$32
	.byte $fc,$1f,$37
	.byte $fd,$2e,$35
	.byte $fd,$0,$33
	.byte $fd,$0,$0
	.byte $fc,$0,$0
	.byte $fc,$1a,$0
	.byte $fc,$18,$0
	.byte $0

.ptn12
	.byte $fe,$14,$33
	.byte $fc,$14,$33
	.byte $fd,$2f,$33
	.byte $fd,$0,$33
	.byte $fd,$14,$33
	.byte $fc,$14,$33
	.byte $fd,$2f,$33
	.byte $fd,$0,$33
	.byte $fe,$14,$33
	.byte $fc,$14,$33
	.byte $fd,$2f,$33
	.byte $fd,$0,$33
	.byte $fd,$14,$33
	.byte $fc,$14,$33
	.byte $fd,$2f,$33
	.byte $fd,$0,$0
	.byte $fe,$14,$33
	.byte $fc,$14,$0
	.byte $fd,$2f,$33
	.byte $fd,$0,$33
	.byte $fd,$14,$38
	.byte $fc,$14,$38
	.byte $fd,$2f,$33
	.byte $fd,$0,$0
	.byte $fe,$14,$36
	.byte $fc,$14,$36
	.byte $fd,$2f,$33
	.byte $fd,$0,$0
	.byte $fe,$14,$34
	.byte $fc,$14,$34
	.byte $fe,$2f,$33
	.byte $fc,$0,$33
	.byte $0

.ptn16
	.byte $fe,$12,$0
	.byte $fc,$12,$0
	.byte $fd,$2d,$31
	.byte $fd,$0,$0
	.byte $fd,$12,$0
	.byte $fc,$12,$0
	.byte $fd,$2d,$31
	.byte $fd,$0,$0
	.byte $fe,$12,$0
	.byte $fc,$12,$0
	.byte $fd,$2d,$31
	.byte $fd,$0,$0
	.byte $fd,$d,$0
	.byte $fc,$d,$0
	.byte $fd,$10,$0
	.byte $fd,$10,$0
	.byte $fa,$12,$0
	.byte $f8,$12,$0
	.byte $f9,$2d,$31
	.byte $f8,$0,$0
	.byte $f9,$12,$0
	.byte $f8,$12,$0
	.byte $f9,$2d,$31
	.byte $f8,$0,$0
	.byte $f6,$12,$0
	.byte $f4,$12,$0
	.byte $f5,$2d,$31
	.byte $f4,$0,$0
	.byte $f5,$d,$0
	.byte $f4,$d,$0
	.byte $f5,$10,$0
	.byte $f5,$10,$0
	.byte $0

.ptn17
	.byte $f2,$12,$0
	.byte $f0,$12,$0
	.byte $f0,$2d,$31
	.byte $f0,$0,$0
	.byte $f1,$12,$0
	.byte $f0,$12,$0
	.byte $f0,$2d,$31
	.byte $f0,$0,$0
	.byte $f2,$12,$0
	.byte $f0,$12,$0
	.byte $f0,$2d,$31
	.byte $f0,$0,$0
	.byte $f1,$d,$25
	.byte $f0,$d,$25
	.byte $f1,$10,$28
	.byte $f1,$10,$28
	.byte $f2,$12,$2a
	.byte $f0,$12,$2a
	.byte $f0,$12,$2a
	.byte $f0,$12,$2a
	.byte $f0,$12,$2a
	.byte $f0,$12,$2a
	.byte $f0,$12,$2a
	.byte $f0,$12,$21
	.byte $f0,$0,$0
	.byte $f0,$0,$0
	.byte $f0,$0,$0
	.byte $f0,$0,$0
	.byte $f0,$0,$0
	.byte $f0,$0,$0
	.byte $f0,$0,$0
	.byte $f0,$0,$0
	.byte $0

endprog

	org [$800 + [prog_size * $400] -$1]
	nop