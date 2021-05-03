# wipedisk
A simple bash script to wipe a disk at it's native physical blocksize.

Basically, I work from termal a lot and can never remember the blockdev command to get the physical blocksize to optimize wipe time on a disk. I want a script that simply allows me to say, "wipedisk urandom /dev/sdX" or something like that.
