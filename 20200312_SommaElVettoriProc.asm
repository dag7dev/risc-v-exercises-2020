.data
n:	.word 5, 7, 7, -2, 0, 1, 1
v:	.word 7
	
.text
	lui a0, 0x10010		# mette in a0 l'inizio del data segment
	lw a1, n		# carico il primo elemento
	jal f			# salto alla funzione

	li a7, 1		# stampo
	ecall
	
	li a7, 10		# esco
	ecall

f:	addi t0, zero, 1	# f(v,n) somma interi dell'array v
loop:	lw t1, 0(a0)		# carichiamo l'elemento
	add t0, t0, t1		# sommiamo
	addi a0, a0, 4		# punta all'elemento dopo
	addi a1, a1, -1		# decrementa la lunghezza
	bne a1, zero, loop	# se non ho finito torna su
	mv a0, t0		# ritorna la somma
	jalr zero, ra, 0