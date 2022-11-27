#!/bin/bash

set -e

BINARY_INSTALL_DIR="/usr/local/bin"
export CUR_DIR=$(dirname $(realpath -s "$0"))

sudo cp $CUR_DIR/utils/github-keygen.sh $BINARY_INSTALL_DIR/github-keygen


sudo chmod a+x $BINARY_INSTALL_DIR/*

