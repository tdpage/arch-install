#! /bin/bash

export EDITOR='emacs -nw'

echo 'setting up NetworkManager...'
pacman -S networkmanager
systemctl enable NetworkManager
echo 'done setting up NetworkManager!'

echo 'setting up GRUB...'
pacman -S grub efibootmgr
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo 'done setting up grub!'

passwd

echo 'please enter a new hostname:'
read
sudoedit /etc/hostname
echo 'hostname has been changed to ${cat /etc/hostname}'

echo 'setting up language...'
sed -i 's/#en_US.UTF-8/en_US.UTF-8' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo 'done setting up language!'

echo 'setting up timezone...'
ln -sf /usr/share/zoneinfo/America/Detroit /etc/localtime
echo 'done setting up timezone!'

echo 'done with all setup! press any key to continue'
read
exit
