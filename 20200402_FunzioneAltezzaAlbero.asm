# funzione ricorsiva per calcolo dell'altezza
.data
tree:	.word n01
n01:	.word 8, n02, n03
n02:	.word 5, n04, n05
n03:	.word 13, n06, 0
n04:	.word 3, 0, 0
n05:	.word 4, 0, 0
n06:	.word -7, 0, 0

.text
	lw a0, tree
	jal altezza
	li a7, 1
	ecall
	li a7, 10
	ecall
	
altezza:
	bne a0, zero, altezza_ric	# caso base: albero vuoto
	jalr zero, ra, 0
	
altezza_ric:
	# spezzo la funzione in due parti, destro e sinistro
	addi sp, sp, -12
	sw ra, 0(sp)
	sw a0, 4(sp)	# ind. radice albero
	lw a0, 4(a0)
	jal altezza	# calcolo altezza sottoalbero sx
	
	sw a0, 8(sp)	# altezza sottoalbero sx
	
	lw a0, 4(sp)	# calcolo altezza sa dx
	lw a0, 8(a0)	# prendo puntatore sa dx
	jal altezza	# adesso in a0 ho altezza del sa dx
			
	
	lw t0, 8(sp)	# t0 altezza sa sx
	bge a0, t0, skip
	mv a0, t0
skip:	addi a0, a0, 1	# sommo 1 ad a0, che e' l'altezza dell'albero
	lw ra, 0(sp)
	addi sp, sp, 12
	jalr zero, ra, 0
