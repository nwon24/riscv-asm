.section .rodata
str:	.asciz "25"

.section .text
.globl _start
_start:
.option push
.option norelax
	la gp, __global_pointer$
.option pop
	la a0,str
	jal stoi
	addi a0,a0,50
	jal printd

	li a7,93
	li a0,0
	ecall
