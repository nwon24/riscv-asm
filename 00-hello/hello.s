.section .rodata
str:
	.asciz "Hello, world!\n"
str_end:

.section .data
len:
	.dword str_end-str

.section .text
.globl _start
_start:

.option push
.option norelax
	la gp, __global_pointer$
.option pop
	li a7,64
	li a0,1
	la a1,str
	ld a2,len
	ecall
	li a7,93
	li a0,0
	ecall
