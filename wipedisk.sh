#!/bin/bash

#accepts "zero" or "random" as line arguments
type=$1

apt install dcfldd -y

clear

echo Here are the block devices:
echo $(ls /dev/sd? )
echo.
echo Your system disk is: $(lsblk -oMOUNTPOINT,PKNAME -P | grep 'MOUNTPOINT="/"' | sed 's/[0-9]*$//')
echo.
#wait for input $disk
blocksize=$(blockdev --getpbsz $disk)

echo You're about to $type fill $disk with $blocksize bytes per block. Are you sure?
#choice y/n

dcfldd if=/dev/$type of=$disk bs=$blocksize status=on statusinterval=1024
sync

echo It is done.
