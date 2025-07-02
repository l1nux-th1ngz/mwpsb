#!/bin/bash

# Identify the first non-system user (excluding nologin/sync users)
username=$(getent passwd {1000..1100} | grep -vE 'nologin|false' | cut -d: -f1 | head -n1)
userhome=$(eval echo "~$username")

usenala="$userhome/.use-nala"
rusenala="/root/.use-nala"
ubashrc="$userhome/.bashrc"
rbashrc="/root/.bashrc"

# User-level nala wrapper
if [ ! -f "$usenala" ]; then
    cat << 'EOF' > "$usenala"
apt() {
  command nala "$@"
}

apt-get() {
  command nala "$@"
}

dpkg() {
  command nala dpkg "$@"
}

sudo() {
  if [ "$1" = "apt" ] || [ "$1" = "apt-get" ]; then
    shift
    command sudo nala "$@"
  elif [ "$1" = "dpkg" ]; then
    shift
    command sudo nala dpkg "$@"
  else
    command sudo "$@"
  fi
}
EOF
    echo "[ -f \"$usenala\" ] && . \"$usenala\"" >> "$ubashrc"
    chmod +x "$usenala"
    sudo -u "$username" bash -c "source \"$ubashrc\""
fi

# Root-level nala wrapper
if [ ! -f "$rusenala" ]; then
    cat << 'EOF' > "$rusenala"
apt() {
  command nala "$@"
}

apt-get() {
  command nala "$@"
}

dpkg() {
  command nala dpkg "$@"
}
EOF
    echo "[ -f \"$rusenala\" ] && . \"$rusenala\"" >> "$rbashrc"
    chmod +x "$rusenala"
    source "$rbashrc"
fi

echo "✅ Nala wrapper installed and configured for user and root environments."
echo "Supported commands include: apt, apt-get, dpkg, with options for install, remove, purge, update, upgrade, and more."
