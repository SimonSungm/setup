#!/bin/bash
export PWD=$(dirname $(realpath -s "$0"))

set -e

# Make sure sshd config DO NOT have "PermitEmptyPasswords yes"
useradd -u 1000 -d /home/cliff -m -s /bin/bash cliff
mkdir -p /home/cliff
chown -R cliff:cliff /home/cliff
usermod -g root cliff
echo "cliff ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
passwd -d cliff

apt-get update && \
	apt-get install -y \
	git \
	zsh \
	wget \
	curl

sudo -u cliff ${PWD}/omz.sh
sudo -u cliff ${PWD}/nvim.sh

apt-get clean && \
	rm -rf /var/lib/apt/lists/*



