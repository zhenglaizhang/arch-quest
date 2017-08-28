```bash
pac zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# use Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch

pac tlp gnome gdm xorg-xinit xf86-input-synaptics xf86-video-intel nvidia
pac gnome-tweak-tool
sudo systemctl enable gdm 
alias pac="sudo pacman -S --needed "

echo "[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = http://repo.archlinuxcn.org/$arch" >>  /etc/pacman.conf 
pacman -Syu archlinuxcn-keyring
pac gnome zsh xorg i3 vim alsa-utils python python-pip git tmux hub yaourt 
pac ttf-dejavu wqy-zenhei wqy-microhei

yaourt -S google-chrome

# gui zip/rar
# sudo pacman -S p7zip file-roller unrar
pacman -S ntfs-3g dosfstools create_ap

yaourt -S google-chrome numix-circle-icon-theme-git gtk-theme-arc-git

yaourt archlinuxcn/jdk archlinuxcn/fcitx-sogoupinyin google-chrome
yaourt nvme-cli

yaourt android-file-transfer 
yaourt android-sdk-platform-tools
yaourt android-sdk
yaourt android-sdk-build-tools
yaourt android-platform
# open android-studio and instlall NDK
yaourt ncurses5-compat-libs

pac acpi_call
sudo modprobe acpi_call
pac docker wget 
cd /tmp
wget https://github.com/tonsky/FiraCode/releases/download/1.204/FiraCode_1.204.zip
unzip FiraCode_1.204.zip
sudo cp otf/Fira*.otf /usr/share/fonts/OTF
fc-cache -rfv

yaourt powerpill proxychains shadowsocks


sudo pacman --needed -S bumblebee mesa xf86-video-intel nvidia bbswitch
sudo gpasswd -a zhenglai bumblebee
sudo systemctl enable bumblebeed.service
```
