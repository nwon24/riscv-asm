TGT=riscv64-elf
AS=$(TGT)-as
LD=$(TGT)-ld
QEMU=qemu-riscv64-static

LIB=../libasm.a

main: main.o $(LIB)
	$(LD) -o $@ $< $(LIB)
$(LIB): getd.o
	(cd ..; make)
run: main
	$(QEMU) $<

