#! /bin/bash

echo 'creating partitions...'
mkfs.vfat /dev/sda1
mkfs.ext4 /dev/sda2
echo 'done creating partitions!'

echo 'mounting partitions...'
mount /dev/sda2 /mnt
mount /dev/sda1 /mnt/boot/efi
echo 'done mounting paritions!'

echo 'installing base operating system...'
pacstrap /mnt base base-devel linux linux-firmware emacs
echo 'done installing base operating system!'

echo 'generating fstab...'
genfstab -U /mnt >> /mnt/etc/fstab
echo 'done generating fstab!'

echo 'chroot into install and continue installation? (y/N)'
read continue
if [ ${continue} = 'y' ]; then
    echo 'chrooting into partitions and installing...'
    arch-chroot /mnt ./arch-install-chroot.sh
    echo 'done chrooting!'
else
    echo 'not chrooting'
    echo 'installation will need to be finalized later'
fi

umount -R /mnt

echo 'Reboot now? (y,N)'
read reboot
if [ ${reboot} == 'y']
then
    echo 'rebooting! see you later'
    reboot
else
    echo 'not rebooting'
    echo 'system will need to be rebooted later'
fi
