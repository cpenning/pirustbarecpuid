ARMGNU ?= arm-none-eabi

CC = $(ARMGNU)-gcc
AS = $(ARMGNU)-as
LD = $(ARMGNU)-ld
OD = $(ARMGNU)-objdump
OC = $(ARMGNU)-objcopy

all : kernel.img


boot.o: boot.S
	$(AS) boot.S -o boot.o

target/arm-none-eabihf/debug/libpirustbarecpuid.a: src/lib.rs arm-none-eabihf.json
	xargo build --target arm-none-eabihf

clean:
	rm -vf target/arm-none-eabihf/debug/libpirustbarecpuid.a boot.o kernel.elf kernel.img kernel.hex kernel.list

kernel.img : loader boot.o target/arm-none-eabihf/debug/libpirustbarecpuid.a
	$(LD) --gc-sections boot.o target/arm-none-eabihf/debug/libpirustbarecpuid.a -T loader -o kernel.elf
	$(OD) -D kernel.elf > kernel.list
	$(OC) kernel.elf -O ihex kernel.hex
	$(OC) kernel.elf -O binary kernel.img
