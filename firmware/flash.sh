#!/bin/sh
DISK=/dev/disk/by-label/KLINK-BOOT

echo 'Hold ESC then insert USBC cable'
echo
echo "Warning!! Do not forget to switch bluetooth OFF (left shift switch)"
echo
echo -n 'Waiting for AGAR to apear'
while ! test -b $DISK; do
    echo -n .
    sleep .1
done
echo DONE

set -ex
mount $DISK /mnt/x/
cp $1 /mnt/x/CURRENT.UF2
umount $DISK
