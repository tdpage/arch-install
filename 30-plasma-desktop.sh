#! /bin/bash

echo 'setting up sddm...'
pacman -Syu sddm
systemctl enable sddm.service
echo 'done setting up sddm!'

echo 'setting up plasma desktop...'
pacman -Syu plasma-desktop

echo 'export DESKTOP_SESSION=plasma' >> ~/.xinitrc
echo 'exec startplasma-x11' >> ~/.xinitrc
echo 'done setting up plasma desktop!'
