.data
	
.text
	li a7, 5		# input numero
	ecall

	addi a0, a0, 1		# aggiungo 1 al numero

	li a7, 1		# stampo
	ecall
	
	li a7, 10		# esco
	ecall
