.data
albero:	.word nodo00
nodo00:	.word 6, nodo01, nodo02
nodo01:	.word 6, 0, nodo03
nodo02:	.word 6, 0, nodo04
nodo03:	.word 6, 0, 0
nodo04:	.word 6, nodo05, nodo06
nodo05:	.word 6, nodo07, 0
nodo06:	.word 6, 0, 0
nodo07:	.word 6, 0, 0

.text
	lw a0, albero
	jal conta
	li a7, 1
	ecall
	li a7, 10
	ecall
	
conta:	bne a0, zero, conta_ric	# caso base
	jalr zero, ra, 0
conta_ric:
	addi sp, sp, -12
	sw ra, 0(sp)	# ra nello stack
	sw a0, 4(sp)	# a0 nello stack
	lw a0, 4(a0)	# loado a0 SA sinistro
	jal conta
	sw a0, 8(sp)	# stack <- nr nodo sottoalbero dx
	lw a0, 4(sp)	# vado a riprendermi il valore dallo stack
	lw a0, 8(a0)	
	jal conta
			# a0 contiene nr nodi sa dx
	lw t0, 8(sp)	# riprendo dallo stack nr Sa sinistro
	add a0, a0, t0	# sommiamo sinistro e destro
	addi a0, a0, 1	# aggiungo 1 al conteggio
	lw ra, 0(sp)
	addi sp, sp, 12
	jalr zero, ra, 0
	