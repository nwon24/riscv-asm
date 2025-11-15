N=100
.bss
buf:
.=.+N

.text
.globl bsort
bsort:
	addi sp,sp,4
	sw zero,0(sp)

	mv t0,a0
	mv t2,a1
	addi t2,t2,-2
5:	mv t3,zero
	mv t1,t0
1:	bgt t3,t2,2f
	lw t4,0(t1)
	lw t5,4(t1)
	ble t4,t5,3f
	sw t5,0(t1)
	sw t4,4(t1)
	lw t4,0(sp)
	addi t4,t4,1
	sw t4,0(sp)
3:	addi t3,t3,1
	addi t1,t1,4
	j 1b
2:	lw t6,0(sp)
	beqz t6,4f
	sw zero,0(sp)
	j 5b
4:	addi sp,sp,-4
	ret
	

