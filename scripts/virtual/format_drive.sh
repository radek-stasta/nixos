#!/bin/bash

# Check if a disk identifier is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <disk>"
  exit 1
fi

# Disk to be partitioned
DISK=$1

sudo mkfs.ext4 -L nixos /dev/${DISK}1
