N=17
M=323
.section .text
.globl _start
_start:
.option push
.option norelax
	la gp, __global_pointer$
.option pop
	li a0,N
	jal factor
	jal printd
	li a0,M
	jal factor
	jal printd

	li a7,93
	li a0,0
	ecall
