# Scrivere un programma che somma i valori di una lista con una funzione ricorsiva

.data
fst: 		.word 1, snd
snd:		.word 2, trd
trd:		.word 3, fth  
fth:		.word 4, 0
list: 	.word fst

.text
		lw a0, list   
		jal count 
		li a7, 1 
		ecall
		li a7, 10
		ecall
		
count:	bne a0, zero, ric	# se a0 è divero da 0, salta alla parte ricorsiva
			jalr zero, ra, 0	# altrimenti ritorna all'indirizzo precedente (alla riga 25)
ric:		addi sp, sp, -8	# fai spazio nello stack per due valori
			sw ra, 0(sp)		# mettici l'indirizzo di ritorno
			sw a0, 4(sp)		# mettici l'indirizzo corrente
			lw a0, 4(a0)		# salta all'indirizzo del nodo successivo
			jal count			# riavvia la funzione ricorsiva
			lw t0, 4(sp)		# mi riprende l'indirizzo del nodo precedente
			lw t0, 0(t0) 		# riscrive il registro con il valore del nodo precedente
			add a0, a0, t0		# somma il valore alla variabile della somma
			lw ra, 0(sp)		# mi riprende l'indirizzo di ritorno
			addi sp, sp, 8		# rimette in ordine lo stack
			jalr zero, ra, 0	# ritorna all'indirizzo precedente (alla sriga 25 o alla riga 12)