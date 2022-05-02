# wipedisk
A bash script to wipe a disk at it's native physical blocksize.

Context: A modern disk with a 4K physical blocksize requires eight write commands per block at the traditional logical blocksize of 512. On SSDs, this wouldn't matter (you should be using Secure Erase anyway), but on a spinning disks this can greatly increase the time required to fill or wipe the complete disk.

I frequently work with spinning disks from terminal and needed an easy way to optimize wipe time without having to remember the awkward blockdev --getpbsz $device command. So here's a script that makes it easy to wipe a disk as quickly as possible.

<b>USAGE</b>

./wipedisk.sh [urandom|random|zero]

