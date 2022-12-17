#!/bin/bash

set -e

export CUR_DIR=$(dirname $(realpath -s "$0"))
source ${CUR_DIR}/env.sh

BINARY_INSTALL_DIR="/usr/local/bin"

sudo cp $CUR_DIR/utils/github-keygen.sh $BINARY_INSTALL_DIR/github-keygen


sudo chmod a+x $BINARY_INSTALL_DIR/*

