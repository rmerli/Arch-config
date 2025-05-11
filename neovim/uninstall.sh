#!/bin/bash 

ROOT_DIR="$(pwd)"

cd neovim
echo "Removing $ROOT_DIR/neovim"
rm -rf neovim
cd $ROOT_DIR
