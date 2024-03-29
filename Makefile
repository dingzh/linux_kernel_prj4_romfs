#
# Makefile for the linux RomFS filesystem routines.
#

obj-$(CONFIG_ROMFS_FS) += romfs.o

romfs-y := storage.o super.o

ifneq ($(CONFIG_MMU),y)
romfs-$(CONFIG_ROMFS_ON_MTD) += mmap-nommu.o
endif

default:
	make -C /lib/modules/`uname -r`/build SUBDIRS=$(PWD) modules
clean:
	rm *.o .?*.* *.ko *.order
