#!/bin/bash
#
# Installing Neovim support for Code-Server
#
echo "Installing build dependencies"
apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
echo ""
echo "Cloning Neovim repository"
git clone https://github.com/neovim/neovim
cd neovim
echo ""
echo "Building Neovim"
make CMAKE_BUILD_TYPE=Release
echo ""
echo "Installing Neovim"
make install

echo ""
echo "Adding VSCode Neovim"
code-server --install-extension "asvetliakov.vscode-neovim"

echo "Don't forget to add"
echo '"vscode-neovim.neovimExecutablePaths.linux": "/usr/local/bin/nvim"'
echo "to .vscode/settings.json so that Code-Server can find it, then restart Code-Server"