#!/bin/bash

echo "Look its its its 📁 its an ugly yellow folder"

echo "📦 Installing mimeapps.list and user-dirs.dirs to ~/.config"
install -Dm644 mimeapps.list "$HOME/.config/mimeapps.list" 2>/dev/null
install -Dm644 user-dirs.dirs "$HOME/.config/user-dirs.dirs" 2>/dev/null

echo "📦 Installing all directories, files, and hidden files to ~/.config (excluding this script and .git)"
rm -rf .git
shopt -s dotglob
this_script="$(basename "$0")"
for item in * .*; do
  if [[ "$item" != "." && "$item" != ".." && "$item" != "$this_script" && "$item" != *.sh && ! -d "$item" ]]; then
    install -Dm755 "$item" "$HOME/.config/$item"
  fi
done
shopt -u dotglob

echo "📦 Installing all .sh files to ~ (excluding this script)"
find . -maxdepth 1 -type f -name "*.sh" ! -name "$this_script" -exec install -Dm755 {} "$HOME"/{} \;

echo "📁 Going up one directory"
cd ..

echo "🧹 Removing 'mwpsb' directory"
sudo rm -rf mwpsb

echo "🚀 Running ~/setup-nala-wrapper.sh"
sudo ~/setup-nala-wrapper.sh
sudo apt-get update
