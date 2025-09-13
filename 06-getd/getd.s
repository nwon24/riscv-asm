N=100
.section .bss
buf:
.=.+N+1

.section .text
.globl getd
getd:
	li a7,63
	li a0,0
	la a1,buf
	li a2,N
	ecall


	bltz a0,1f
	addi a0,a0,-1
	la a1,buf
	add a1,a1,a0
	sb zero,0(a1)
	la a0,buf

	addi sp,sp,-8
	sd ra,8(sp)
	jal stoi
	ld ra,8(sp)
	addi sp,sp,8
	ret
1:	li a0,-1
	ret
