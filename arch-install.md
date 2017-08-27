```
setfont sun12x22

# check efi: files should exist under the dir
ls /sys/firmware/efi/efivars


wifi-menu
systemctl enable sshd.service
systemctl start sshd.service
passwd

# remote ssh
cd /etc/pacman.d
grep -A 1 '##.*China' mirrorlist|grep -v '\-\-'> mirrorlist2
cat mirrorlist>>mirrorlist2
mv mirrorlist2 mirrorlist

pacman -Syy

cfdisk /dev/nvme0n1
cfdisk /dev/nvme1n1

mkfs.fat -F32 /dev/nvme0n1p1

mdadm --create --verbose --level=0 --metadata=1.2 --raid-devices=2 --chunk=32 /dev/md0 /dev/nvme0n1p2 /dev/nvme1n1p2
mdadm --detail /dev/md0 | grep 'Chunk Size'
cat /proc/mdstat # check progress
echo 'DEVICE partitions' > /etc/mdadm.conf
mdadm --detail --scan >> /etc/mdadm.conf
mkfs.ext4 -v -L a0 -m 0.5 -b 4096 -E stride=8,stripe-width=16 /dev/md0

mount /dev/md0 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot

pacstrap /mnt base base-devel

genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
mdadm --detail --scan >> /mnt/etc/mdadm.conf
cat /mnt/etc/mdadm.conf

arch-chroot /mnt
# nano /etc/locale.gen
# uncomment en_US.UTF-8、zh_CN.UTF-8、zh_TW.UTF-8
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf


ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc


passwd

echo zhenglai-p50 > /etc/hostname
# add `127.0.1.1	myhostname.localdomain	myhostname` to /etc/hosts

# add `mdadm_udev` to HOOKS section of vi /etc/mkinitcpio.conf
mkinitcpio -p linux

bootctl install 
vi /boot/loader/entries/arch.conf
title          Arch Linux
linux          /vmlinuz-linux
initrd         /initramfs-linux.img
options        root=/dev/md0 rw


vi /boot/loader/loader.conf
default  arch
timeout  5

pacman -S zsh wpa_supplicant dialog vim
useradd -m -G wheel -s /bin/zsh zhenglai
passwd zhenglai
visudo
echo "tmpfs     /mnt/fast     tmpfs     rw,size=5000M,x-gvfs-show     0 0" >> /etc/fstab


exit
umount -R /mnt
reboot

```
