#!/bin/bash

sudo mount /dev/disk/by-label/nixos /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/EFI /mnt/boot
sudo swapon /dev/disk/by-label/swap
