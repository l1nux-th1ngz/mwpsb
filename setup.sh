#!/bin/bash


echo "📁 Creating ~/.config if it doesn't exist..."
mkdir -p ~/.config

echo "📦 Moving mimeapps.list and user-dirs.dirs to ~/.config"
[ -f mimeapps.list ] && mv -v mimeapps.list ~/.config/
[ -f user-dirs.dirs ] && mv -v user-dirs.dirs ~/.config/

echo "📦 Moving all directories, files, and hidden files to ~/.config"
shopt -s dotglob  # Include hidden files
for item in * .*; do
  if [[ "$item" != "." && "$item" != ".." && "$item" != "$(basename "$0")" && "$item" != *.sh ]]; then
    mv -v "$item" ~/.config/
  fi
done
shopt -u dotglob

echo "🔐 Making all moved items in ~/.config executable (if applicable)"
find ~/.config -type f -exec chmod +x {} \;

echo "📦 Moving all .sh files to ~ (excluding this script)"
this_script="$(basename "$0")"
find . -maxdepth 1 -type f -name "*.sh" ! -name "$this_script" -exec mv -v {} ~ \;

echo "🔐 Making all .sh files in ~ executable"
chmod +x ~/*.sh

echo "📁 Going up one directory"
cd ..

echo "🧹 Removing 'mwpsb' directory"
sudo rm -rf mwpsb

echo "🚀 Running ~/setup-nala-wrapper.sh"
sudo ./setup-nala-wrapper.sh
