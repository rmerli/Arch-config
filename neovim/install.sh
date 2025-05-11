#!/bin/bash 

if command -v nvim > /dev/null; then
    echo "Neovim already installed, nothing to do..."
	exit 0
fi

ROOT_DIR="$(pwd)"
echo $ROOT_DIR

cd neovim
rm -rf neovim
git clone https://github.com/neovim/neovim.git && cd neovim

touch .gitignore

echo "-> checkout tag v0.11.1"
git checkout v0.11.1

PWD="$(pwd)"

make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$PWD/install"
make install

BIN_PATH=~/.local/bin/nvim
echo "-> removing existing sym link"
rm $BIN_PATH 

echo "-> creating new symlink to binary"
ln -s "$PWD/install/bin/nvim" $BIN_PATH 

cd $ROOT_DIR
