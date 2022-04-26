#!/bin/bash

#compile kernel file
i686-elf-g++ -c kernel.cpp -o kernel.o -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti

#link kernel file and boot file
i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc

#Start OS on virtual hardware
qemu-system-i386 -kernel myos.bin

