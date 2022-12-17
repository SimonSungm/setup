#!/bin/bash

set -e

export CUR_DIR=$(dirname $(realpath -s "$0"))
source ${CUR_DIR}/env.sh

sudo apt-get install -y \
	fd-find \
	tmux \
	tldr


sudo ln -s /usr/bin/fdfind /usr/bin/fd
