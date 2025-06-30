N=10
m=1<<31
a=1103515245
c=12345

.section .data
randn:
.=.+4*N

.section .text
.globl _start
_start:
.option push
.option norelax
	la gp, __global_pointer$
.option pop
	li a0,m
	li a1,a
	li a2,c
	li a3,N
	la a4,randn
	jal lcg

	mv s0,zero
	li s1,N
	la s3,randn
1:	bge s0,s1,2f
	lw a0,0(s3)
	jal printd
	addi s3,s3,4
	addi s0,s0,1
	j 1b
	
2:	li a7,93
	li a0,0
	ecall
