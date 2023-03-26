#!/bin/bash

set -e

VERSION=v18.15.0
get_arch=`arch`
if [[ $get_arch =~ "x86_64" ]];then
	DISTRO=linux-x64
elif [[ $get_arch =~ aarch64 ]];then
	DISTRO=linux-arm64
else
	echo "unknown arch: $get_arch"
	exit 0
fi
ZIPNAME=node-$VERSION-$DISTRO.tar.xz

pushd /tmp/
wget https://nodejs.org/dist/$VERSION/node-$VERSION-$DISTRO.tar.xz 
sudo mkdir -p /usr/local/lib/nodejs
sudo tar -xJvf $ZIPNAME -C /usr/local/lib/nodejs
rm $ZIPNAME
echo "PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:\$PATH" >> ~/.profile
popd
