.section .rodata
str: .asciz "test string"

.section .text
.globl _start
_start:
.option push
.option norelax
	la gp, __global_pointer$
.option pop
	la a0,str
	jal strlen
	jal printd

	li a7,93
	li a0,0
	ecall
