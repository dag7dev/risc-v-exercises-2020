.data
x:	.word 5
y:	.word 8
	
.text
	lw a0, x
	lw a1, y
	jal f # ra <- pc + 4
	 
	addi a7, zero, 1
	ecall
	
	addi a7, zero, 10 # esco
	ecall
	
f:	sub a0, a0, a1
	jalr zero, ra, 0