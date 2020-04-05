.data
	.word 5
	.word 8
	
.text
	lui s0, 0x10010
	lw t0, 0(s0) 	# metto in t0 la prima delle due parole
	lw t1, 4(s0) 	# metto in t0 la prima delle due parole
	add t2, t0, t1 	#eseguo la somma in t2

	li a7, 10	# esco
	ecall