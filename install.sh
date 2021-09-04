#!/bin/sh

# config files
cp .inputrc ~/.inputrc
cp init.vim ~/.config/nvim/init.vim

# Language Servers
sudo apt-get install clangd-9
cargo install svls
sudo npm install -g pyright
