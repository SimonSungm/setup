#!/bin/bash

set -e
echo "Generate ssh-key for repo $1"

if [ $1X == "X" ]; then
  echo "usage: github-keygen <key_name> [password]"
  exit
fi

KEY_FILE="$HOME/.ssh/id_rsa_$1"
KEY_PASSWD="$2"

if [ -f $KEY_FILE ]; then
  echo "$KEY_FILE exists"
  exit
fi

echo "KEY_GEN_FILE: $KEY_FILE"
echo "KEY_PASSWD: $KEY_PASSWD"

ssh-keygen -t rsa -b 4096 -f $KEY_FILE -q -N "$KEY_PASSWD"
cat "$KEY_FILE.pub"

echo "
Host $1-repo
        Hostname github.com
        IdentityFile=$KEY_FILE" >> $HOME/.ssh/config
