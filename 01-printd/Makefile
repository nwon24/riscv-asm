TGT=riscv64-elf
AS=$(TGT)-as
LD=$(TGT)-ld
QEMU=qemu-riscv64-static

printd: printd.o
	$(LD) -o $@ $<
run: printd
	$(QEMU) $<
