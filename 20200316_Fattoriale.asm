.data
x:	.word 6

.text
	lw a0, x	# carico x
	jal fatt
	li a7, 1
	ecall
	li a7, 10
	ecall
	
fatt:	bne a0, zero, ric
	li a0, 1	# caso base: n=0
	jalr zero, ra, 0
	
ric:	addi sp, sp, -8
	sw ra, 0(sp)	# salvo nello stack
	sw a0, 4(sp)	# salvo nello stack
	addi a0, a0, -1	# a0 contiene n
	jal fatt
	# in a0 ho fatt(n-1) per ipotesi
	lw t0, 4(sp)
	mul a0, a0, t0
	lw ra, 0(sp)
	addi sp, sp, 8
	jalr zero, ra, 0