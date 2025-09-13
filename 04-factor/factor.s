# Brute force factorisation
.section .text
.globl factor
factor:
	li t1,2
	mv t2,a0
1:	beq t1,t2,2f
	rem t3,t2,t1
	beqz t3,2f
	addi t1,t1,1
	j 1b
2:	mv a0,t1
	ret
