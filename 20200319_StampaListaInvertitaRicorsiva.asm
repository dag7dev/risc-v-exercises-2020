.data
lista:	.word n01
n01:	.word 4, n02
n02:	.word 5, n03
n03:	.word 6, n04
n04:	.word -17, n05
n05:	.word 7,0

.text
	lw a0, lista
	jal stampa
	lw a0, lista
	jal inverti
	jal stampa
	li a7, 10
	ecall
	
inverti:
	# caso base
	lw t0, 4(a0) 		# puntatore successivo
	bne t0, zero, inverti_ric
	jalr zero, ra, 0	# allora il nodo e' solo

inverti_ric:
	addi sp, sp, -8
	sw ra, 0(sp)
	sw a0, 4(sp)	
	lw a0, 4(a0)
	jal inverti
	lw t0, 4(sp)
	lw t1, 4(t0)	
	sw t0, 4(t1)	
	sw zero, 4(t0)
	lw ra, 0(sp)
	addi sp, sp, 8
	jalr zero, ra, 0
	
stampa:	addi sp, sp, -4	# preparo lo stack
	sw s0, 0(sp)	# salvo s0 nello stack
	mv s0, a0	# metto a0 in s0
st_loop:lw a0, 0(s0)
	li a7, 1
	ecall
	li a0, 0x20
	li a7, 11
	ecall
	
	lw s0, 4(s0)	# contiene l'indirizzo
	bne s0, zero, st_loop
	
	lw s0, 0(sp)
	addi sp, sp, 4
	jalr zero, ra, 0