# restituire 1 se e' presente un 1

.data
tree:	.word radice
radice:	.word 0, n01, n02
n01:	.word 0, n03, 0
n02:	.word 0, n04, n05
n03:	.word 0, 0, n06
n04:	.word 0, 0, 0
n05:	.word 1, 0, 0
n06:	.word 0, 0, 0

.text
    lw a0, tree
    jal covid
    
    li a7, 1	# chiamo la stampa
    ecall
    
    li a7, 10	# esco
    ecall

# restituisce 1 se infetto
# param: a0 = ind albero

# se e' 0 ho finito -> non puo essere infetto

covid:	bne a0, zero, ric	# caso base
		jalr zero, ra, 0	# albero vuoto non puo' essere infetto

# se e' 1 ho finito
ric:	lw t0, 0(a0)
		beq t0, zero, ric2
		jalr zero, ra, 0
		
# il vero caso ricorsivo
# radice sana: devo vedere se c'e' un infetto nei SA
ric2:	addi sp, sp, -8 	# creo due spazi
		sw ra, 0(sp)
		sw a0, 4(sp)
	
		lw a0, 4(a0)	# carico ind. nodo sx
		jal covid
		
		# arrivo qui: c'e' 1 o 0 in a0 a seconda se c'e' un malato o no
		beq a0, zero, skip
		
		# se c'e' un malato allora posso andare via
		lw ra, 0(sp)
		addi sp, sp, 8
		jalr zero, ra, 0

# controllo sa destra se sano
skip:	lw a0, 4(sp)
		lw a0, 8(a0)
		jal covid
		
		lw ra, 0(sp)
		addi sp, sp, 8	
		jalr zero, ra, 0	
	















