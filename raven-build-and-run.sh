#!/bin/sh

rm tools/magiskboot/kernel
rm boot-raven.img
rm -r logs

./build.sh -f -d raven||return "$?"
rm boot-raven.img

cp workspace/Build/raven/RELEASE_CLANG38/FV/TENSOR_UEFI.fd-bootshim tools/magiskboot/kernel

cd tools/magiskboot
./magiskboot_x86 repack boot_a
cd ../..
mv tools/magiskboot/new-boot.img boot-raven.img 

fastboot oem ramdump wipe_file kernel.log

fastboot boot boot-raven.img

mkdir logs
sleep 5

fastboot oem ramdump stage_mem 0xfd3ff000 0x00100000
fastboot get_staged logs/ramdump1.txt
echo Ramdump1:
cat logs/ramdump1.txt
echo " "

fastboot oem ramdump stage_mem 0xFD4FF000 0x00100000
fastboot get_staged logs/ramdump2.txt
echo Ramdump2:
cat logs/ramdump2.txt
echo " "

