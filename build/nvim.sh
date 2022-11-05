#!/bin/bash

set -e

echo "XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="${HOME}/.config"}"
export XDG_CONFIG_HOME

echo "alias vim=nvim" >> ${HOME}/.profile
echo "alias vim=nvim" >> ${HOME}/.zprofile

mkdir -p ${XDG_CONFIG_HOME}

git clone https://github.com/SimonSungm/neovim.git ${XDG_CONFIG_HOME}/nvim

#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
