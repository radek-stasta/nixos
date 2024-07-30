#!/bin/bash

# Check if a disk identifier is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <disk>"
  exit 1
fi

# Disk to be partitioned
DISK=$1

sudo parted -s /dev/${DISK} mklabel msdos mkpart primary ext4 1MiB 100%
sudo parted /dev/${DISK} set 1 boot on