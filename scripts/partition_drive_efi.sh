#!/bin/bash

# Check if a disk identifier is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <disk>"
  exit 1
fi

# Disk to be partitioned
DISK=$1

sudo parted -s /dev/${DISK} -- mklabel gpt
sudo parted -s /dev/${DISK} -- mkpart primary 1MiB 512MiB
sudo parted -s /dev/${DISK} -- set 1 esp on
sudo parted -s /dev/${DISK} -- mkpart primary 512MiB 16GiB
sudo parted -s /dev/${DISK} -- mkpart primary 16GiB 100%