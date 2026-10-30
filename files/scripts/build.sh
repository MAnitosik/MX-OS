#!/usr/bin/env bash

set -oue pipefail

dnf5 -y install dnf-plugins-core
dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-gpg-keys terra-release terra-release-extras terra-release-mesa # terra-release-nvidia # terra-release-multimedia
dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf5 -y copr enable bieszczaders/kernel-cachyos-lto
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y autoremove
dnf5 -y clean all
dnf5 -y --best --refresh --allow-vendor-change makecache
dnf5 -y --best --refresh --allow-vendor-change distro-sync --allowerasing

dnf5 -y install fuse
dnf5 -y install python3-uv
dnf5 -y install nodejs npm
dnf5 -y install rust cargo
dnf5 -y install ruby
dnf5 -y install golang
dnf5 -y install gcc clang

dnf5 -y install brave-origin

dnf5 -y install tealdeer fastfetch micro zed gh git desktop-plus-bin gnome-boxes lact obs-studio mediawriter

# dnf5 -y install ... # some steam deps
# dnf5 -y install steam faugus-launcher protonplus
# dnf5 -y install "https://github.com/hydralauncher/hydra/releases/download/v4.2.0/hydralauncher-4.2.0.x86_64.rpm" # piracy
dnf5 -y install discord-openasar

export OLD_HOME=$HOME
export HOME=/tmp/amneziavpn
mkdir -p "$HOME"
wget -O /tmp/amneziavpn/AmneziaVPN_5.0.3.0_linux_x64.run https://github.com/amnezia-vpn/amnezia-client/releases/download/5.0.3.0/AmneziaVPN_5.0.3.0_linux_x64.run
chmod +x /tmp/amneziavpn/AmneziaVPN_5.0.3.0_linux_x64.run
QT_QPA_PLATFORM=offscreen /tmp/amneziavpn/AmneziaVPN_5.0.3.0_linux_x64.run --accept-licenses --default-answer --confirm-command install
rm -rf /tmp/amneziavpn/AmneziaVPN_5.0.3.0_linux_x64.run "$HOME"
ln -sf /opt/AmneziaVPN/bin/AmneziaVPN /usr/bin/AmneziaVPN
ln -sf /opt/AmneziaVPN/bin/AmneziaVPN /usr/sbin/AmneziaVPN
export HOME=$OLD_HOME
export -n OLD_HOME
unset OLD_HOME

dnf5 -y install v2ray-geoip v2ray-domain-list-community xray
dnf5 -y install v2raya
wget -O /usr/bin/v2raya_core https://github.com/v2rayA/v2rayA/releases/download/v2.5.10/v2raya_core_linux_x64_2.5.10
chmod +x /usr/bin/v2raya_core
ln -sf /usr/share/v2ray /usr/share/v2raya

dnf5 -y remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra
dnf5 -y install --from-repo=copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-lto kernel-cachyos-lto kernel-cachyos-lto-devel-matched

dnf5 -y swap --from-repo=copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-addons zram-generator-defaults cachyos-settings
dracut -f
dnf5 -y install --from-repo=copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-addons scx-scheds scx-tools
dnf5 -y install --from-repo=copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-addons ananicy-cpp

dnf5 -y remove firefox
dnf5 -y autoremove
dnf5 -y clean all

mkdir -p /usr/share/rescue-nerd
wget -O /usr/share/rescue-nerd/ventoy.tar.gz https://github.com/ventoy/Ventoy/releases/download/v1.1.18/ventoy-1.1.18-linux.tar.gz
wget -O /usr/share/rescue-nerd/main.zip https://github.com/igareck/vpn-configs-for-russia/archive/refs/heads/main.zip

systemctl enable lactd
systemctl enable AmneziaVPN
systemctl enable v2raya
systemctl enable scx_loader
systemctl enable ananicy-cpp

# add zapret2, add proper comments to everything, add nvidia image, consider configuring hybrid graphics
