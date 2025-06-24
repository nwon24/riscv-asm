BUFSIZ=100

.section .data
.balign 4
buf: .skip BUFSIZ

.section .text
.globl printd
printd:
	addi sp,sp,8	# local variable - size of buf
	sd zero,8(sp)	
	mv t0,zero	# length of number, excluding possible minus sign
	la a1,buf	# a1 will hold where digits start in buf
	li a4,10	# base 10
	bgt zero,a0,1f	# Negative?
	mv a6,a1	# moving pointer in buf
2:	rem a5,a0,a4	# num % 10
	div a0,a0,a4	# num /= 10
	addi a5,a5,'0'	# get char
	sb a5,0(a6)	# save it
	addi a6,a6,1	# increment pointer and length
	addi t0,t0,1
	beqz a0,3f	# done? No, loop
	j 2b
1:	li a2,'-'	# put minus sign in buffer, increment size of buf
	ld t0,8(sp)
	addi t0,t0,1
	sd t0,8(sp)
	sb a2,0(a1)
	addi a1,a1,1
	neg a0,a0	# make num positive 
	mv a6,a1	# again a6 will be roving pointer
	j 2b
3:	
	mv a0,a1	# reverse string starting at a1 with length t0
	mv a1,t0
	mv s0,t0
	addi sp,sp,-16	# save return address
	sd ra,8(sp)
	jal revstr
	ld ra,8(sp)
	addi sp,sp,16
	ld t0,8(sp)	# get len of buffer
	add t0,t0,s0
	la a6,buf
	add a6,a6,t0
	li a0,'\n'	# put new line
	sb a0,0(a6)
	addi t0,t0,1	# increase length by 1
	li a7,64	# write syscall
	li a0,1		# stdout
	la a1,buf
	mv a2,t0
	ecall
	addi sp,sp,8
	ret

revstr:
	mv t1,a0	# start of string
	mv t2,t1	# end of string
	add a1,a1,-1
	add t2,t2,a1	
1:	bgeu t1,t2,2f	# done?
	lb t3,0(t1)	# swap bytes
	lb t4,0(t2)
	sb t3,0(t2)
	sb t4,0(t1)
	addi t1,t1,1	# update pointers
	addi t2,t2,-1
	j 1b
2:	ret
