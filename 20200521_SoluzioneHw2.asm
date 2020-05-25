###################################################
###                   HOMEWORK 2				###
###################################################
# E’ dato un albero binario di interi in memoria.		###
# L’etichetta del nodo è 0 se il nodo è sano,			###
# 1 se il nodo è malato. Scrivere una funzione che calcoli	###
# la distanza del più vicino nodo malato alla radice.		###

# La distanza è 0 se la radice è malata,			###
# 1 se la radice è sana e un figlio è malato, 		###
# 2 se radice e figli sono sani e uno dei figli dei figli è malato. 
# E così via. -1 se nessuno è malato.				###

# Si scriva anche il main del programma che chiama la 	###
# funzione su un albero in memoria e stampa a video il risultato.
###################################################################

# soluzione hw2 facoltativo - dato un albero restituire l'altezza quando si trova il valore "1"
.data
tree:	.word n01
n01:	.word 0, n02, n03
n02:	.word 0, n04, n05
n03:	.word 0, n06, n07
n04:	.word 1, 0, 0
n05:	.word 0, 0, 0
n06:	.word 0, 0, 0
n07:	.word 0, 0, 0

.text
		lw a0, tree
		jal covid
		li a7, 1
		ecall
		li a7, 10
		ecall
		
covid:	bne a0, zero, ric
		li a0, -1
		jalr zero, ra, 0
		
ric:	lw t0, 0(a0)
		beq t0, zero, skip
		li a0, 0
		jalr zero, ra, 0

skip:	addi sp, sp, -12
		sw ra, 0(sp)
		sw a0, 4(sp)
		lw a0, 4(a0)
		jal covid
		
		sw a0, 8(sp)
		lw a0, 4(sp)
		lw a0, 8(a0)
		jal covid
		
		lw t0, 8(sp)	# radice sana
						# t0 sa sx
						# a0 dist sa dx
		bleu a0, t0, skip2
		mv a0, t0
skip2:	blt a0, zero, skip3
		addi a0, a0, 1
		
skip3:	lw ra, 0(sp)
		addi sp, sp, 12
		jalr zero, ra, 0
