.section .text
.globl stoi
stoi:
	mv t0,a0
	mv t1,zero
1:	lb t2,0(t0)
	beqz t2,1f
	addi t2,t2,-'0'
	li t3,10
	mul t1,t1,t3
	add t1,t1,t2
	addi t0,t0,1
	j 1b
1:	mv a0,t1
	ret
