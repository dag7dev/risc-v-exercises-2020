# somma della diagonale di una matrice quadrata
# traccia della matrice in termini matematici

.data
m:	.word 1,2,3,4
	.word 5,6,7,8
	.word -1,20,3,-4
	.word 9,2,8,5
	
n:	.word 4

.text	# programma per calcolare la traccia di una matrice quadrata
	li a0, 0	# a0 contiene la somma degli elementi della diagonale
	la s0, m
	lw s1, n
	
	# volevamo fare 4*n
	slli s2, s1, 2	# vai alla riga successiva
	addi s2, s2, 4	# vai all'elemento successivo
	
	
loop:	lw t0, 0(s0)	# carichiamo in t0 l'elemento
	add a0, a0, t0	# lo sommiamo
	add s0, s0, s2	# vado all'elemento successivo
	addi s1, s1, -1	# cont cicli
	bne s1, zero, loop
	li a7, 1
	ecall
	li a7, 10
	ecall
	
