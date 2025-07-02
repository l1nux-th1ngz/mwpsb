#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get -y install libreadline-dev

# Download and extract Lua 5.4.8
curl -L -R -O https://www.lua.org/ftp/lua-5.4.8.tar.gz
tar zxf lua-5.4.8.tar.gz
cd lua-5.4.8

# Build and test
make all test

# Install
sudo make install

# Remove unneeded files
sudo rm -rf lua-5.4.8 lua-5.4.8.tar.gz

echo "Done"
