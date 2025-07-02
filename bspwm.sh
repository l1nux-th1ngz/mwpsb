#!/bin/bash

# =========================
# Display
# =========================
sudo apt-get -y install xorg xorg-dev xserver-xorg xserver-common xserver-xorg-core gdebi
sudo apt-get -y install xserver-xorg-input-all xserver-xorg-input-libinput xserver-xorg-legacy
sudo apt-get -y install xserver-xorg-video-all xserver-xorg-video-fbdev xserver-xorg-video-intel
sudo apt-get -y install xserver-xorg-video-nouveau xserver-xorg-video-qxl xserver-xorg-video-vesa
sudo apt-get -y install xserver-xorg-video-vmware xtrans-dev xserver-xephyr xauth x11proto-core-dev
sudo apt-get -y install xserver-xorg-video-siliconmotion xrdp x11-xserver-utils dbus-x11
sudo apt-get -y install x11proto-dev x11-apps x11-common x11-session-utils x11-utils x11-xkb-utils

# =========================
# Build Tools and Libraries
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
# Enable and Start Services
# =========================
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
sudo systemctl enable acpid
sudo systemctl start acpid

# =========================
#  Window Manager
# =========================
sudo apt-get -y install bspwm sxhkd nemo xdg-user-dirs

# =========================
# Set BSPWM as default
# =========================
sudo update-alternatives --install /usr/bin/x-window-manager x-window-manager /usr/bin/bspwm 50
sudo update-alternatives --auto x-window-manager

# =========================
# Install xdg-user-dirs-gtk
# =========================
git clone https://github.com/GNOME/xdg-user-dirs-gtk.git /tmp/xdg-user-dirs-gtk
cd /tmp/xdg-user-dirs-gtk
meson setup build && ninja -C build && sudo ninja -C build install
cd ~
rm -rf /tmp/xdg-user-dirs-gtk

# =========================
# Build Directories
# =========================
xdg-user-dirs-update
sleep 2
xdg-user-dirs--gtk-update

# =========================
# Set locale for user directories
# =========================
echo "en_US.UTF-8" > ~/.config/user-dirs.locale


# =========================
# Install additional utilities
# =========================
sudo apt-get -y install unzip zip xvkbd xinput lxappearance dialog mtools dosfstools
sudo apt-get -y install wmctrl xbacklight xbindkeys xdotool libnotify-bin 
sudo apt-get -y install rofi polybar kitty alacritty xautomation


# =========================
# Bluetooth, Network, and Utilities
# =========================
sudo apt-get -y install mtools smbclient cifs-utils ripgrep fd-find autoconf xbacklight
sudo apt-get -y install bluez blueman maim scrot slop terminator autoconf-archive shared-mime-info
sudo apt-get -y install bluefish bluefish-data bluefish-plugins dhmake suckless-tools libtext-template-perl
sudo apt-get -y install geany geany-plugins rxvt-unicode cdbs debhelper gettext libgtk-3-dev
sudo apt-get -y install network-manager gnome-power-manager ghostscript ghostscript-x lintian binutils-multiarch
sudo apt-get -y install glib2.0  libglib2.0-bin  libglib2.0-data  libglib2.0-dev  libglib2.0-dev-bin  libglib2.0-tests
sudo apt-get -y install libghc-gio-dev glib2.0 libgio-2.0-dev libgdk-pixbuf2.0-bin gdk-pixbuf ruby-gdk-pixbuf2

#########################################
## GTK and Glib
################################################
sudo apt-get -y install libwebkit2gtk-4.0-dev auto-tools intltoolize libgspell-1 libwebkit2gtk-4.0-dev libgtk-3-dev libglib2.0-0
sudo apt-get -y install automake build-essential intltool libglib2.0-dev libgtk-3-dev libglib2.0-dev libgtk-3-dev libglib2.0-dev-bin intltool
sudo apt-get -y install autoconf intltool libgtk-3 libgspell-1 libgtksourceview-3.0-1 libwebkit2gtk-4.1-0 libgspell-1-2 libglib2.0-dev libgtk-3-dev gettext
sudo apt-get -y install autoconf-archive gstreamer1.0-libav gstreamer1.0-plugins-good autoconf autotools-dev gspell-1-tests libglib2.0-bin libxapp-gtk3-module
sudo apt-get -y install libwebkit2gtk-4.0 libwebkit2gtk-4.0-dev gstreamer1.0-alsa gstreamer1.0-pulseaudio libgspell-1-common libglib2.0-cil-dev
sudo apt-get -y install libgtksourceview-3.0-1 libgtksourceview-3.0-common libgtksourceview-3.0-dev libgl1-mesa-dri gcc libglib2.0-data gsettings-desktop-schemas-dev
sudo apt-get -y install libgl1-mesa-dri gstreamer1.0-pulseaudio gstreamer1.0-libav gstreamer1.0-alsa intltool libwebkit2gtk-4.1-dev libdbus-glib2.0-cil
sudo apt-get -y install libwebkit2gtk-4.0 libwebkit2gtk-4.0-dev libxapp-gtk3-module gstreamer1.0-libav gir1.2-gspell-1 libglib2.0-cil inxi webkit2gtk-driver
sudo apt-get -y install xapp-sn-watcher libxapp-gtk3-module libgspell-1-dev libgspell-1-dev auto-tools intltoolize clang libdbus-glib2.0-cil-dev
 
# =========================
# Fonts
# =========================
sudo apt-get -y install fonts-dejavu fonts-dejavu-extra fonts-droid-fallback fonts-recommended
sudo apt-get -y install fonts-freefont-ttf fonts-liberation fonts-noto-mono fonts-font-awesome
sudo apt-get -y install fonts-opensymbol ttf-bitstream-vera ttf-mscorefonts-installer fonts-terminus

# =========================
# Brave Browser
# =========================
BRAVE_KEY_URL="https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"
BRAVE_KEYRING_PATH="/usr/share/keyrings/brave-browser-archive-keyring.gpg"
BRAVE_REPO_DEFINITION="deb [arch=amd64 signed-by=${BRAVE_KEYRING_PATH}] https://brave-browser-apt-release.s3.brave.com/ stable main"
BRAVE_REPO_FILE="/etc/apt/sources.list.d/brave-browser-release.list"

if [ ! -f "$BRAVE_KEYRING_PATH" ]; then
  sudo curl -fsSL "$BRAVE_KEY_URL" -o "$BRAVE_KEYRING_PATH"
fi

if [ ! -f "$BRAVE_REPO_FILE" ] || ! grep -q "$BRAVE_REPO_DEFINITION" "$BRAVE_REPO_FILE"; then
  echo "$BRAVE_REPO_DEFINITION" | sudo tee "$BRAVE_REPO_FILE" > /dev/null
fi

sudo apt-get update
dpkg -s brave-browser &>/dev/null || sudo apt-get -y install brave-browser

# =========================
# LightDM Session
# =========================
sudo apt-get -y install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings

sudo tee /usr/bin/bspwm-session > /dev/null << 'EOF'
#!/bin/bash
exec bspwm
EOF
sudo chmod +x /usr/bin/bspwm-session

sudo tee /usr/share/xsessions/bspwm.desktop > /dev/null << 'EOF'
[Desktop Entry]
Name=BSPWM
Comment=BSP window manager session
Exec=/usr/bin/bspwm-session
Type=Application
Icon=
EOF

sudo mkdir -p /etc/lightdm/lightdm.conf.d
sudo tee /etc/lightdm/lightdm.conf.d/50-bspwm.conf > /dev/null << 'EOF'
[Seat:*]
user-session=bspwm
greeter-hide-users=false
greeter-allow-guest=true
autologin-guest=true
allow-user-switching=true
EOF

# =========================
# Ownership and Restart
# =========================
username=$(logname)
sudo chown "$username":"$username" /usr/bin/bspwm-session /usr/share/xsessions/bspwm.desktop

echo "🔄 Restarting LightDM to apply changes..."
sudo systemctl enable lightdm
sudo systemctl restart lightdm
