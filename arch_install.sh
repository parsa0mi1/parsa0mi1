#!/bin/bash

eval "timedatectl set-ntp true"
eval "cfdisk /dev/sda"

eval "mkfs.ext4 /dev/sda1"
eval "mkfs.ext4 /dev/sda2"

eval "mount /dev/sda2 /mnt"
eval "mkdir /mnt/boot"
eval "mount /dev/sda1 /mnt/boot"

eval "pacstrap /mnt linux linux-firmware base base-devel vim"

eval "genfstab -U /mnt >> /mnt/etc/fstab"

eval "arch-chroot /mnt /bin/bash"

eval "pacman -Syu networkmanager grub"

eval "systemctl enable NetworkManager"

eval "grub-install /dev/sda"
eval "grub-mkconfig -o /boot/grub/grub.cfg"

echo "changing the password for chroot-enviroment ..."
eval "passwd"

eval "vim /etc/locale.gen"
eval "locale-gen"

eval "vim /etc/hostname"
eval "ln -sf /usr/share/zoneinfo/America/New_York /etc/localetime

eval "unmount -R /mnt"
eval "reboot"
