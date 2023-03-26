#!/bin/bash

set -e

export CUR_DIR=$(dirname $(realpath -s "$0"))
source ${CUR_DIR}/env.sh

sudo apt-get install -y \
	fd-find \
	tmux \
	tldr


sudo ln -s /usr/bin/fdfind /usr/bin/fd

UCTAGS="uctags-2023.03.21-linux-`arch`"
wget https://github.com/universal-ctags/ctags-nightly-build/releases/download/2023.03.21%2B8c18dabfa03da55b56b332f5c284fb7a236b6144/$UCTAGS.tar.xz -O /tmp/ctags.tar.xz
tar -xvf /tmp/ctags.tar.xz -C /tmp/
sudo cp /tmp/$UCTAGS/bin/* /usr/bin/

