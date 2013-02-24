#!/bin/sh
echo "Make ramdisk file...!";
echo "";
cd ramdisk;
find . -print0 | cpio -o0 -H newc > ../F100S-Recovery-ramdisk.cpio;
cd ..;
gzip ./F100S-Recovery-ramdisk.cpio;

echo "Make Recovery Image file...!";
echo "";
./tools/mkbootimg --kernel ./F100S-Recovery-zImage --ramdisk ./F100S-Recovery-ramdisk.cpio.gz --cmdline "console=ttyDCC0,115200,n8 androidboot.hardware=batman_skt loglevel=1" --base 0x40200000 --pagesize 2048 --ramdiskaddr 0x41a00000 -o ./recovery.img

echo "Done!";
echo "";
