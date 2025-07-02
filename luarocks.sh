#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get -y install build-essential libreadline-dev unzip wget

# Download and extract LuaRocks
wget https://luarocks.org/releases/luarocks-3.12.2.tar.gz
tar zxpf luarocks-3.12.2.tar.gz
cd luarocks-3.12.2

# Configure, build, and install LuaRocks
./configure --with-lua-include=/usr/local/include && make && sudo make install

# Install LuaSocket using LuaRocks
sudo luarocks install luasocket

# Launch Lua (optional step to verify)
lua

# Cleanup
cd ..
sudo rm -rf luarocks-3.12.2.tar.gz luarocks-3.12.2

echo "✅ Done installing LuaRocks and LuaSocket!"
