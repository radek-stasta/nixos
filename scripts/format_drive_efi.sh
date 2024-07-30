#!/bin/bash

# Check if a disk identifier is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <disk>"
  exit 1
fi

# Disk to be partitioned
DISK=$1

sudo mkfs.fat -F 32 -n EFI /dev/${DISK}1
sudo mkswap -L swap /dev/${DISK}2
sudo mkfs.ext4 -L nixos /dev/${DISK}3
