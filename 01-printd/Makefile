TGT=riscv64-elf
AS=$(TGT)-as
LD=$(TGT)-ld
QEMU=qemu-riscv64-static

LIB=../libasm.a

main: main.o $(LIB)
	$(LD) -o $@ $< $(LIB)
run: main
	$(QEMU) $<
$(LIB): printd.o
	(cd ..; make)
