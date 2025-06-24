.globl _start
_start:
.option push
.option norelax
	la gp, __global_pointer$
.option pop
	li a0,-429
	jal printd

	li a0,7328
	jal printd

	li a0,0
	jal printd

	li a7,93
	li a0,0
	ecall
