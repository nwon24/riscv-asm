.section .text
.globl strlen
strlen:
	mv t0,a0
	mv a1,zero
1:	lb t1,0(t0)
	beqz t1,2f
	addi a1,a1,1
	addi t0,t0,1
	j 1b
2:	mv a0,a1
	ret
