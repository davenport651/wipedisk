# wipedisk
A simple bash script to wipe a disk at it's native physical blocksize.

Basically, I frequently work with disks from terminal and can never remember the blockdev command to get the physical blocksize to optimize wipe time on a disk. I want a script makes it easy to execute "wipedisk urandom /dev/sdX" (or something like that).
