.data
lista:	.word n01
n01:	.word 8, n02
n02:	.word 8, n03
n03:	.word 8, n04
n04:	.word 8, n05
n05:	.word 8, n06
n06:	.word 8, n07
n07:	.word 8, 0

.text
	lw a0, lista	# metto il puntatore in a0
	jal conta
fine:	mv a0, t0
	li a7, 1
	ecall
	li a7, 10
	ecall
	
conta:	li t0, 0
loop:	beq a0, zero, fine	# lista vuota
	addi t0, t0, 1
	lw a0, 4(a0)	# carico il nodo successivo
	beq zero, zero, loop
	mv a0, t0
	jalr zero, ra, 0
	
	
	
