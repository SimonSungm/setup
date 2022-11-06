#!/bin/bash

set -e

echo "Y" | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo 'export PWD=$(dirname $(realpath -s "$0"))' >> ${HOME}/.zshrc
git config --global --add oh-my-zsh.hide-status 1
git config --global --add oh-my-zsh.hide-dirty 1
