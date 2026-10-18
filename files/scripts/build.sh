#!/usr/bin/env bash

set -oue pipefail

shopt -s nullglob

dnf5 -y install dnf-plugins-core
dnf5 -y config-manager addrepo --from-repofile=https://github.com/terrapkg/subatomic-repos/raw/main/terra.repo
dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf5 -y copr enable cubewhy/jetbrains
dnf5 -y copr enable bieszczaders/kernel-cachyos-lto
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons

dnf5 -y install fuse
dnf5 -y install python3-uv
dnf5 -y install nodejs npm
dnf5 -y install rust cargo
dnf5 -y install ruby
dnf5 -y install golang
dnf5 -y install gcc clang

dnf5 -y install wine wine-dxvk gstreamer1-plugins-good dosbox-staging winetricks

dnf5 -y install brave-origin torbrowser-launcher

dnf5 -y install tealdeer fastfetch micro zed gh git desktop-plus-bin gnome-boxes lact obs-studio mediawriter
dnf5 -y install jetbrains-pycharm jetbrains-clion jetbrains-rustrover

# dnf5 -y install steam faugus-launcher heroic-games-launcher protonplus mangohud
# dnf5 -y install "https://github.com/hydralauncher/hydra/releases/download/v4.1.6/hydralauncher-4.1.6.x86_64.rpm"
dnf5 -y install discord-openasar

wget https://github.com/amnezia-vpn/amnezia-client/releases/download/5.0.3.0/AmneziaVPN_5.0.3.0_linux_x64.run
chmod +x AmneziaVPN_5.0.3.0_linux_x64.run
export HOME=/tmp/amneziavpn
mkdir -p "$HOME"
QT_QPA_PLATFORM=offscreen ./AmneziaVPN_5.0.3.0_linux_x64.run --accept-licenses --default-answer --confirm-command install
rm -rf AmneziaVPN_5.0.3.0_linux_x64.run "$HOME"
ln -sf /opt/AmneziaVPN/bin/AmneziaVPN /usr/bin/AmneziaVPN
ln -sf /opt/AmneziaVPN/bin/AmneziaVPN /usr/sbin/AmneziaVPN

dnf5 -y install v2ray-geoip v2ray-domain-list-community xray
dnf5 -y install v2raya
wget -O /usr/bin/v2raya_core https://github.com/v2rayA/v2rayA/releases/download/v2.5.10/v2raya_core_linux_x64_2.5.10
chmod +x /usr/bin/v2raya_core
mkdir -p /usr/share
# mkdir -p /usr/local/share/manitosik # /usr/local is actually /var/usrlocal
ln -sf /usr/share/v2ray /usr/share/v2raya
# ln -sf /usr/share/v2ray /usr/local/share/v2raya # /usr/local is actually /var/usrlocal

dnf5 -y swap zram-generator-defaults cachyos-settings

dnf5 -y remove firefox
dnf5 -y autoremove
dnf5 -y clean all

systemctl enable lactd
systemctl enable AmneziaVPN
systemctl enable v2raya

# add zapret2, add proper comments to everything
