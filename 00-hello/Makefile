TGT=riscv64-elf
AS=$(TGT)-as
LD=$(TGT)-ld
QEMU=qemu-riscv64-static

hello: hello.o
	$(LD) -o $@ $<
run: hello
	$(QEMU) $<
