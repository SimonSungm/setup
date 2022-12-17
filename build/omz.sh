#!/bin/bash

set -e

export CUR_DIR=$(dirname $(realpath -s "$0"))
source ${CUR_DIR}/env.sh

echo "Y" | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo 'export CUR_DIR=$(dirname $(realpath -s "$0"))' >> ${HOME}/.zshrc
git config --global --add oh-my-zsh.hide-status 1
git config --global --add oh-my-zsh.hide-dirty 1
