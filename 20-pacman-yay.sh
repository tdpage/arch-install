#! /bin/bash

echo 'setting up pacman...'
pacconf='./config/pacman.conf'

if [ -f ${pacconf} ]; then
    # back up pacman
    mv /etc/pacman.conf /etc/pacman.conf.bak
    cp ${pacconf} /etc/pacman.conf
else
    echo "no pacman config file found"
fi

echo 'done setting up pacman!'


echo 'setting up yay...'

# install yay
cd /opt/
sudo git clone https://aur.archlinux.org/yay.git
sudo chown ${USER}:users -R ./yay
cd yay
sudo makepkg -si

# configure yay
yay --nodiffmenu --noeditmenu --nocleanmenu --save

echo 'done setting up yay!'
