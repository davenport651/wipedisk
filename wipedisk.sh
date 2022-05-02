#!/bin/bash

#accepts "zero" or "random" as line arguments; will be used with /dev/ later...
type=$1

#default to zero if no input
if [ -z $type ]
	then type=zero
	else break
fi

apt install dcfldd -y

clear

echo Here are the block devices:
echo $(ls /dev/sd* | sed 's/[0-9]*$//' | sort -u )
echo 
echo Your system disk is: 
echo $(lsblk -oMOUNTPOINT,PKNAME -P | grep 'MOUNTPOINT="/"' | sed 's/[0-9]*$//')
echo 
#wait for input $disk
echo Enter device to wipe: 
read disk

blocksize=$(blockdev --getpbsz $disk)

if [ -z $blocksize ]
then 
	echo No blocksize. Try to run as root.
	exit
fi

#echo $type $disk $blocksize

echo !!!SANITY CHECK!!!
echo You are about to $type fill $disk with $blocksize bytes per block.
read -p "Are you sure? " yn
case $yn in
	[nN] ) echo Nothing Happened. && exit;;
	[yY] ) echo DESTROY ;
		dcfldd if=/dev/$type of=$disk bs=$blocksize status=on statusinterval=1024;
    sync;
    echo It is done.;
    exit;;
	* ) echo Something went wrong;;
esac 

echo It is done.
