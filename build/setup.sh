#!/bin/bash

set -e

useradd -u 1000 -d /home/cliff -m -s /bin/bash cliff
mkdir -p /home/cliff
chown -R cliff:cliff /home/cliff
usermod -g root cliff
echo "cliff ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
passwd -d cliff
