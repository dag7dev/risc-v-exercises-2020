.data
x:	.word 5
y:	.word 8
	
.text
	lw a0, x
	lw a1, y
	jal ra, f
	
	li a7, 1
	ecall
	
	li a7, 10	# esco
	ecall
	
f:	sub a0, a0, a1
	jalr ra
	#ciao damiano!
	
