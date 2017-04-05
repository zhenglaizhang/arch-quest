# the-way-to-arch
all stuff about arch linux as personal workstation OS

## Prepare USB Installer

```
dd bs=4M if=/path/to/archlinux.iso of=/dev/sdb status=progress && sync

# or use Rufus on Windows
```

## Installation Steps
```bash


iw dev //识别无限网卡
wifi-menu wlp3s0 //连接网卡
>>> ip link set wlp3s0 up //上述命令无效使用
>>> ip link show wlp3s0 //同上
>>> dmesg | grep firmware//没有输出，表示没有该网卡fireware
>>> iw dev wlp3s0 scan | grep SSID //
>>> wpa_supplicant -B -i wlp3s0 -c < (wpa_passphrase ssid psk) //连接wifi
>>> dhcpcd wlp3s0

ping www.baidu.com

cgdisk /dev/sda

mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

lsblk
# to check

# mounting
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot


cd /etc/pacman.d
grep -A 1 '##.*China' mirrorlist|grep -v '\-\-'> mirrorlist2
cat mirrorlist>>mirrorlist2
mv mirrorlist2 mirrorlist


# refresh pacman cache
pacman -Syy

# install base system
pacstrap -i /mnt base base-devel


# generate fstab
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

# enter new system
arch-chroot /mnt /bin/bash

# nano /etc/locale.gen
# uncomment en_US.UTF-8、zh_CN.UTF-8、zh_TW.UTF-8
locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf

# set timezone
# tzselect
# ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp true
timedatectl status


# init ramdisk
mkinitcpio -p linux

# set root pwd
passwd

# if multiple os
# pacman -S grub os-prober
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

bootctl install
nano /boot/loader/entries/arch.conf
---
title          Arch Linux
linux          /vmlinuz-linux
initrd         /initramfs-linux.img
options        root=/dev/sda2 rw
---

nano /boot/loader/loader.conf
---add
default  arch
timeout  5
--


echo supers > /etc/hostname

nano /etc/hosts
---add
#<ip-address>   <hostname.domain.org>   <hostname>
127.0.0.1   localhost.localdomain   localhost   myhostname
::1     localhost.localdomain   localhost   myhostname
---

# enable network
systemctl enable dhcpcd.service

# reboot the system
exit
umount -R /mnt
reboot

# unplug the usb installer

pacman -S xorg
pacman -S xfce4 xfce4-goodies
pacman -S sddm
systemctl enable sddm.service

```
