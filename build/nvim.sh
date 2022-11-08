#!/bin/bash

set -e

## Build NeoVim
VERSION=0.8
BUILD_DIR=/tmp/build
INSTALL_DIR=/usr

mkdir -p ${BUILD_DIR}
pushd ${BUILD_DIR}

sudo apt-get update && \
  sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

git clone -b release-${VERSION} https://github.com/neovim/neovim

cd neovim && make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}"
sudo make -j$(nproc) install

popd

#sudo cmake --build build/ --target uninstall
#Alternatively, just delete the CMAKE_INSTALL_PREFIX artifacts:

#sudo rm /usr/local/bin/nvim
#sudo rm -r /usr/local/share/nvim/


echo "XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="${HOME}/.config"}"
export XDG_CONFIG_HOME

echo "alias vim=${INSTALL_DIR}/bin/nvim" >> ${HOME}/.profile
echo "alias vim=${INSTALL_DIR}/bin/nvim" >> ${HOME}/.zprofile

mkdir -p ${XDG_CONFIG_HOME}

git clone https://github.com/SimonSungm/neovim.git ${XDG_CONFIG_HOME}/nvim

#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
