.data
r:	.word 3
c:	.word 3
m:	.word 4, 7, -2
	.word 0, 1, 0
	.word 1, 5, 8
	
.text
	# facciamolo come due cicli annidati
	la t0, m
	lw t1, r
	lw t2, c
	li s0, 0

l1:	lw t3, 0(t0)
	add s0, s0, t3
	addi t0, t0, 4
	addi t2, t2, -1	# dec cont colonne
	bne t2, zero, l1
	addi t1, t1, -1	# dec cont righe
	lw t2, c	# ricarico il cont colonne
	bne t1, zero, l1
	
	mv a0, s0
	li a7, 1
	ecall
	li a7, 10
	ecall