#!/bin/bash

set -e

export CUR_DIR=$(dirname $(realpath -s "$0"))
source ${CUR_DIR}/env.sh

### Build NeoVim ###
echo "Build NeoVim Start"

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
rm -rf ${BUILD_DIR}

popd

## For Uninstall
# sudo cmake --build build/ --target uninstall
# Alternatively, just delete the CMAKE_INSTALL_PREFIX artifacts:

# sudo rm /usr/local/bin/nvim
# sudo rm -r /usr/local/share/nvim/
echo "Build NeoVim Done"
### Done ###


### Install LunarVim ###
echo "Install LunarVim Start"

sudo apt-get update && \
	sudo apt-get install -y curl git make pip npm nodejs cargo python3
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
# bash ~/.local/share/lunarvim/lvim/utils/installer/uninstall.sh

echo "Install LunarVim Done"
### DONE ###


### Configuration
echo "XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="${HOME}/.config"}"

echo 'export PATH=${HOME}/.local/bin:$PATH' >> ${HOME}/.bashrc
echo 'export PATH=${HOME}/.local/bin:$PATH' >> ${HOME}/.zshrc
echo 'alias vim=${HOME}/.local/bin/lvim' >> ${HOME}/.bashrc
echo 'alias vim=${HOME}/.local/bin/lvim' >> ${HOME}/.zshrc

mkdir -p ${XDG_CONFIG_HOME}

#git clone https://github.com/SimonSungm/neovim.git ${XDG_CONFIG_HOME}/nvim

#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
