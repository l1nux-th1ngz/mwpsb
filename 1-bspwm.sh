#!/bin/bash

# =========================
# 1. Display Servers and Xorg Components
# =========================

sudo apt-get -y install xorg xorg-dev xserver-xorg xserver-common xserver-xorg-core gdebi
sudo apt-get -y install xserver-xorg-input-all xserver-xorg-input-libinput xserver-xorg-legacy
sudo apt-get -y install xserver-xorg-video-all xserver-xorg-video-fbdev xserver-xorg-video-intel
sudo apt-get -y install xserver-xorg-video-nouveau xserver-xorg-video-qxl xserver-xorg-video-vesa
sudo apt-get -y install xserver-xorg-video-vmware xtrans-dev xserver-xephyr xauth x11proto-core-dev
sudo apt-get -y install xserver-xorg-video-siliconmotion xrdp synaptic x11-xserver-utils dbus-x11
sudo apt-get -y install x11proto-dev x11-apps x11-common x11-session-utils x11-utils x11-xkb-utils

# =========================
# 2. Build Tools and Development Libraries
# =========================

sudo apt-get -y install make cmake ninja-build arandr autorandr autotools-dev meson automake libavahi-core7
sudo apt-get -y install libxrandr-dev libxinerama-dev mesa-common-dev libgl1-mesa-dev libxcb-randr0 libavahi-glib1
sudo apt-get -y install libglu1-mesa-dev xcb libxcb-util0-dev libxcb-ewmh-dev autotools-dev flex dh-autoreconf
sudo apt-get -y install libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev texi2html
sudo apt-get -y install libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev build-essential libxcb-randr0-dev
sudo apt-get -y install libxrandr-dev avahi-daemon acpi acpid acpica-tools avahi-autoipd avahi-utils autotools
sudo apt-get -y install libavahi-client-dev libavahi-client3 libavahi-common-data libavahi-common3 flex
sudo apt-get -y install util-linux pciutils lm-sensors lsb-release uptimed coreutils gawk mawk

# =========================
# 3. Bluetooth, Network, and Utilities
# =========================

sudo apt-get -y install mtools smbclient cifs-utils ripgrep fd-find autoconf xbacklight
sudo apt-get -y install bluez blueman maim scrot slop terminator autoconf-archive
sudo apt-get -y install bluefish bluefish-data bluefish-plugins dhmake suckless-tools
sudo apt-get -y install geany geany-plugins rxvt-unicode cdbs debhelper gettext libgtk-3-dev
sudo apt-get -y install network-manager gnome-power-manager xdg-user-dirs


# Update user directories
xdg-user-dirs-update


# =========================
# 4. Enable and Start Services
# =========================

sudo systemctl enable bluetooth
sudo systemctl start bluetooth
sleep 1

sudo systemctl enable avahi-daemon
sudo systemctl start avahi-daemon
sleep 1

sudo systemctl enable acpid
sudo systemctl start acpid
sleep 1

# =========================
# 5. Window Manager & Utilities
# =========================

# The Star of the show
echo "Installing BSPWM and SXHKD..."
sudo apt-get -y install bspwm sxhkd

# Set BSPWM as the default window manager
echo "Setting BSPWM as the default window manager..."
sudo update-alternatives --install /usr/bin/x-window-manager x-window-manager /usr/bin/bspwm 50
sudo update-alternatives --auto x-window-manager


# Install additional utilities
echo "Installing additional utilities..."
sudo apt-get -y install unzip zip xvkbd xinput lxappearance dialog mtools dosfstools
sudo apt-get -y install wmctrl xbacklight xbindkeys xdotool libnotify-bin nemo xdg-user-dirs
sudo apt-get -y install rofi polybar kitty alacritty xautomation

# Build Directories
xdg-user-dirs-update
 

# Starter fonts
sudo apt-get -y install fonts-dejavu fonts-dejavu-extra fonts-droid-fallback fonts-recommended \
sudo apt-get -y install fonts-freefont-ttf fonts-liberation fonts-noto-mono fonts-font-awesome \
sudo apt-get -y install fonts-opensymbol ttf-bitstream-vera ttf-mscorefonts-installer fonts-terminus

# Define the Brave browser GPG key URL and destination
BRAVE_KEY_URL="https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"
BRAVE_KEYRING_PATH="/usr/share/keyrings/brave-browser-archive-keyring.gpg"

# Define the Brave browser repository definition
BRAVE_REPO_DEFINITION="deb [arch=amd64 signed-by=${BRAVE_KEYRING_PATH}] https://brave-browser-apt-release.s3.brave.com/ stable main"
BRAVE_REPO_FILE="/etc/apt/sources.list.d/brave-browser-release.list"

echo "--- Brave Browser Installation Script ---"

# Check if the GPG key already exists
if [ -f "$BRAVE_KEYRING_PATH" ]; then
  echo "Brave browser GPG key already exists at $BRAVE_KEYRING_PATH."
else
  echo "Downloading the Brave browser GPG key..."
  # Download the Brave browser GPG key
  sudo curl -fsSL "${BRAVE_KEY_URL}" -o "${BRAVE_KEYRING_PATH}"
  echo "Brave browser GPG key downloaded successfully."
fi

# Check if the repository file already exists and contains the correct entry
if [ -f "$BRAVE_REPO_FILE" ] && grep -q "${BRAVE_REPO_DEFINITION}" "$BRAVE_REPO_FILE"; then
  echo "Brave browser repository entry already exists in $BRAVE_REPO_FILE."
else
  echo "Adding the Brave browser repository to sources.list.d..."
  # Add the Brave browser repository to sources.list.d
  echo "${BRAVE_REPO_DEFINITION}" | sudo tee "${BRAVE_REPO_FILE}" > /dev/null
  echo "Brave browser repository added successfully."
fi

echo "Updating package lists..."
# Update package lists
sudo apt-get update

# Check if Brave browser is already installed
if dpkg -s brave-browser &> /dev/null; then
  echo "Brave browser is already installed."
else
  echo "Installing Brave browser..."
  # Install Brave browser
  sudo apt-get -y install brave-browser
  echo "Brave browser installed successfully."
fi 

# =========================
# 6. User Directories & Localization
# =========================

# Set locale for user directories
echo "en_US.UTF-8" > ~/.config/user-dirs.locale

# =========================
# 7. Clone and Install xdg-user-dirs-gtk from Source
# =========================
git clone https://github.com/GNOME/xdg-user-dirs-gtk.git /tmp/xdg-user-dirs-gtk
cd /tmp/xdg-user-dirs-gtk
meson setup build
ninja -C build
sudo ninja -C build install
cd ~
rm -rf /tmp/xdg-user-dirs-gtk


# =========================
# 8. Fonts Installation
# =========================

sudo apt-get -y install fonts-dejavu fonts-dejavu-extra fonts-droid-fallback fonts-recommended
sudo apt-get -y install fonts-freefont-ttf fonts-liberation fonts-noto-mono fonts-font-awesome
sudo apt-get -y install fonts-opensymbol ttf-bitstream-vera ttf-mscorefonts-installer fonts-terminus

# =========================
# 9. Install and Configure LightDM
# =========================

echo "Installing LightDM and configuring..."
sudo apt-get -y install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

# Create bspwm session script
sudo tee /usr/bin/bspwm-session > /dev/null << 'EOF'
#!/bin/bash
exec bspwm
EOF
sudo chmod +x /usr/bin/bspwm-session

# Register bspwm session with LightDM
sudo tee /usr/share/xsessions/bspwm.desktop > /dev/null << 'EOF'
[Desktop Entry]
Name=BSPWM
Comment=BSP window manager session
Exec=/usr/bin/bspwm-session
Type=Application
Icon=
EOF

# LightDM configuration override
sudo mkdir -p /etc/lightdm/lightdm.conf.d
sudo tee /etc/lightdm/lightdm.conf.d/50-bspwm.conf > /dev/null << 'EOF'
[Seat:*]
user-session=bspwm
greeter-hide-users=false
greeter-allow-guest=true
autologin-guest=true
allow-user-switching=true
EOF

# Set ownership for session files
echo "Setting ownership of bspwm session files to $username..."
username=$(logname)
sudo chown "$username":"$username" /usr/bin/bspwm-session /usr/share/xsessions/bspwm.desktop



# Restart LightDM to apply changes
echo "🔄 Restarting LightDM to apply changes..."
sudo systemctl enable lightdm
sudo systemctl restart lightdm
