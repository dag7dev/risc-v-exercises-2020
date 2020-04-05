.data
str1:	.asciz "Hello world!"

.text
	la a0, str1
	li a7, 4		# stampo
	ecall	
	li a7, 10		# esco
	ecall
