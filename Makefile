TGT=riscv64-elf
AS=$(TGT)-as
LD=$(TGT)-ld
AR=$(TGT)-ar
QEMU=qemu-riscv64-static

libasm.a: 01-printd/printd.o 02-strlen/strlen.o 03-lcg/lcg.o
	$(AR) rcs $@ $^
