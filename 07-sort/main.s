N=100
.bss
nums:
.=.+N*4

.section .text
.globl _start
_start:
.option push
.option norelax
        la gp, __global_pointer$
.option pop
	jal getd
	mv s0,a0
	mv s1,zero
	la s2,nums
1:	bge s1,s0,1f
	jal getd
	sw a0,0(s2)
	addi s1,s1,1
	addi s2,s2,4
	j 1b

1:	
	la a0,nums
	mv a1,s0
	jal bsort

	mv s1,s0
	mv s0,zero
	la s3,nums
1:	bge s0,s1,1f
	lw a0,0(s3)
	jal printd
	addi s0,s0,1
	addi s3,s3,4
	j 1b
1:	
        li a7,93
        li a0,0
        ecall
