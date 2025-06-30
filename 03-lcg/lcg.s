.section .data
.balign 8
timeval: .skip 16
.section .text
.globl lcg
lcg:
	mv t0,a0	# m
	mv t1,a1	# a
	mv t2,a2	# c
	mv t3,a3	# n
	mv t6,a4	# &arr
	li a7,169	# seed
	la a0,timeval
	li a1,0
	ecall
	la a0,timeval
	lw t5,0(a0)
	mv t4,zero
1:	bge t4,t3,2f
	addi t4,t4,1	
	mul t5,t5,t1
	add t5,t5,t2
	rem t5,t5,t0
	sw t5,0(t6)
	addi t6,t6,4
	j 1b
2:	ret

