# the-way-to-arch
all stuff about arch linux as personal workstation O


## Create Media

```bash
dd if=arch-install.iso of=/dev/sdb
```

## SSH Somebox

```bash
wifi-menu

cd /etc/pacman.d
grep -A 1 '##.*China' mirrorlist|grep -v '\-\-'> mirrorlist2
cat mirrorlist>>mirrorlist2
mv mirrorlist2 mirrorlist

pacman -Syy
pacman -S openssh
systemctl enable sshd.service
systemctl start sshd.service
passwd
```

## Prepare RAID

```bash
lspci -l # check raid types if any
lsblk

setfont sun12x22

# It is highly recommended to pre-partition the disks to be used in the array.
mdadm --create --verbose --level=0 --metadata=1.2 --raid-devices=2 --chunk=32 /dev/md0 /dev/nvme0n1p1 /dev/nvme1n1p1
mdadm --detail /dev/md0 | grep 'Chunk Size'
cat /proc/mdstat # check progress
echo 'DEVICE partitions' > /etc/mdadm.conf
mdadm --detail --scan >> /etc/mdadm.conf
# assemble the array
mdadm --assemble --scan
mkfs.ext4 -v -L a0 -m 0.5 -b 4096 -E stride=8,stripe-width=16 /dev/md0


# install the base system

# then update the mdadm.conf
mdadm --detail --scan >> /mnt/etc/mdadm.conf
# check mdadm.conf file
```


## Prepare USB Installer

```
dd bs=4M if=/path/to/archlinux.iso of=/dev/sdb status=progress && sync

# or use Rufus on Windows
```

## Installation Steps
```bash

# verify boot mode is uefi: 
#   1. UEFI: following dir has files inside
#   2. BIOS/CSM: empty dir
ls /sys/firmware/efi/efivars

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
# or 
fdisk -l
# to check

# mounting
mount /dev/sda2 /mnt
mount /dev/md0 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
mount /dev/nvme0n1p2 /mnt/boot





# refresh pacman cache
pacman -Syy

# install base system & dev utils
pacstrap -i /mnt base base-devel


# generate fstab
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

# change root into new system
arch-chroot /mnt

# nano /etc/locale.gen
# uncomment en_US.UTF-8、zh_CN.UTF-8、zh_TW.UTF-8
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# set timezone
# tzselect
# ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# hwclock --systohc
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp true
timedatectl status


# init ramdisk, usually not needed
# mkinitcpio -p linux

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
127.0.0.1   localhost.localdomain   localhost
::1     localhost.localdomain   localhost   myhostname
127.0.1.1	myhostname.localdomain	myhostname
---
speaker-test -c2 

# enable network
systemctl enable dhcpcd.service

alias pac="pacman -S --needed "
pac zsh zsh-completions

# add new user
useradd -m -G wheel -s /bin/zsh zhenglai

# reboot the system
exit
umount -R /mnt
reboot

# unplug the usb installer

pacman -S net-tools，dnsutils，inetutils，iproute2
pacman -S xorg


# add tmpfs mounts
echo "tmpfs     /mnt/fast     tmpfs     rw,size=5000M,x-gvfs-show     0 0" >> /etc/fstab

# audio
pacman -S alsa-utils
alsamixer 
speaker-test -c2 
```

## Graphics Drivers



### Save Power

```bash
pac acpi_call
# load the kernel module
modprobe acpi_call

# turn off dGPU
/usr/share/acpi_call/examples/turn_off_gpu.sh

# turn on the dGPU
# reboot

```

https://wiki.archlinux.org/index.php/Hybrid_graphics#Fully_Power_Down_Discrete_GPU

```shell
pac python-pip
pip install --user numpy pgcli mycli scipy
```

### Terminal & Shell
https://wiki.archlinux.org/index.php/Zsh#Making_Zsh_your_default_shell

## Cookies

```shell	
sudo pacman -S --needed sakura vlc tmuxinator tmux pgcli mycli hub
yaourt foxitreader

wget https://download.jetbrains.com/idea/ideaIU-2017.1.tar.gz /tmp/idea.tar.gz
```

ch

## Opt

```shell	
systemctl disable httpd.service
systemctl disable docker.service
sudo usermod -aG docker $USER


# vim setup
proxychains git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
proxychains vim +PluginInstall +qall
```



### Fonts

```shell	
cp Fira*.otf /usr/share/fonts/OTF
fc-cache -rfv
```



### Big Data Stacks

```shell	
mkdir -p ~/.data/zookeeper
mkdir -p ~/.data/kafka/log

cd /tmp/
proxychains wget http://ftp.jaist.ac.jp/pub/apache/kafka/0.10.2.0/kafka_2.12-0.10.2.0.tgz -O kafka.tgz
proxychains wget http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz -O spark.tgz
proxychains wget http://ftp.riken.jp/net/apache/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz -O zookeeper.tgz

# or keep the version use `ln -s kafka_2.12_0.10.2.- kafka to create symbolic links
tar xf kafka.tgz
tar xf zookeeper.tgz
tar xf spark.tgz

mv kafka ~/.bin/
mv zookeeper ~/.bin/
mv spark ~/.bin/
```



### Common Utils

```shell	
# set screen brightness
# cat /sys/class/backlight/intel_backlight/max_brightness
sudo tee /sys/class/backlight/intel_backlight/brightness <<< 150



# TODO: replace it with tlp
yaourt tpacpi-bat
systemctl enable tpacpi-bat.service
systemctl start tpacpi-bat.service
sudo tpacpi-bat -g SP 1 # 80
sudo tpacpi-bat -g ST 1 # 40


yaourt nvme-cli

pac ruby
gem install tmuxinator
tmuxinator doctor
```


```
sudo systemctl enable netctl-auto@wlp4s0.service
```

## References



http://zuyunfei.com/2013/08/09/tmuxinator-best-mate-of-tmux/

https://github.com/tmuxinator/tmuxinator


## 

```shell
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
