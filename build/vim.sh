#!/bin/bash

set -e

git clone https://github.com/SimonSungm/vimrc.git ~/.vimrc.d
cd ~/.vimrc.d
sed -i '$d' ./install.sh
./install.sh
