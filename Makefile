TGT=riscv64-elf
AS=$(TGT)-as
LD=$(TGT)-ld
AR=$(TGT)-ar
QEMU=qemu-riscv64-static

libasm.o: 01-printd/printd.o
	$(AR) rcs libasm.a 01-printd/printd.o
