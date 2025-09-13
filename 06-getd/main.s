.section .text
.globl _start
_start:
.option push
.option norelax
        la gp, __global_pointer$
.option pop
	jal getd
	jal printd

        li a7,93
        li a0,0
        ecall
