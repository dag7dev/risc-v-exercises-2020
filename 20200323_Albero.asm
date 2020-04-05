.data
tree:	.word n01
n01:	.word 8, n02, n03
n02:	.word 5, n04, n05
n03:	.word 13, n06, 0
n04:	.word 3, 0, 0
n05:	.word 2, 0, 0
n06:	.word -7, 0, 0

.text
	lw a0, tree	# carichiamo l'albero
	jal somma
	li a7, 1
	ecall
	li a7, 10
	ecall
	
somma:	bne a0, zero, somma_ric
	jalr zero, ra, 0
somma_ric:
	addi sp, sp, -12
	sw ra, 0(sp)
	sw a0, 4(sp)
	lw a0, 4(a0)	# indirizzo della radice -> stack
	jal somma
			# in a0 la somma del sottoalbero sx
	sw a0, 8(sp) 	# somma del sottoalbero sx -> stack
	lw a0, 4(sp)	# puntatore radice
	lw a0, 8(a0)	# indirizzo sottoalbero destro
	jal somma	
			# in a0 la somma del sottoalbero dx	
	lw t0, 8(sp)
	add a0, a0, t0	# in a0 la somma di SA dx e sx
	lw t0, 4(sp)
	lw t0, 0(t0)
	add a0, a0, t0
	lw ra, 0(sp)
	addi sp, sp, 12
	jalr zero, ra, 0