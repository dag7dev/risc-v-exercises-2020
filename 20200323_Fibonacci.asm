.data
x:	.word 6

.text
	lw a0, x
	jal fib
	li a7, 1
	ecall
	li a7, 10
	ecall
	
fib:
	li t0, 3	# a0 contiene n
	bge a0, t0, fib_ric
	li a0, 1
	jalr zero, ra, 0
	
fib_ric:
	addi sp, sp, -12
	sw ra, 0(sp)
	sw a0, 4(sp)	# n -> stack
	addi a0, a0, -1
	jal fib
	sw a0, 8(sp)	# fib(n-1) -> stack
	lw a0, 4(sp)
	addi a0, a0, -2
	jal fib
	lw t0, 8(sp)	# fib(n2) in a0
	add a0, a0, t0	# fib(n-2)+fib(n-1) in a0
	lw ra, 0(sp)
	addi sp, sp, 12
	jalr zero, ra, 0