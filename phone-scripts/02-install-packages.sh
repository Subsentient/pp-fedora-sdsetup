#!/bin/bash
set -e

echo "==================="
echo "02-install-packages.sh"
echo "==================="

# Functions
infecho () {
    echo "[Info] $1"
}
errecho () {
    echo "[Error] $1" 1>&2
    exit 1
}

infecho "Installing XFCE and other recommended packages..."
dnf install -y @xfce onboard tilix screen nano lightdm firefox mousepad hexchat geany ModemManager \
    f2fs-tools NetworkManager-wwan avahi fuse-sshfs fuse-encfs squashfs-tools gcc gcc-c++ make cmake \
    --repo=fedora --repo=updates

infecho "Enabling graphical boot and LightDM..."
systemctl disable initial-setup.service
systemctl enable lightdm
systemctl set-default graphical.target

infecho "Upgrading packages..."
dnf update --exclude="kernel kernel-core kernel-modules" -y --refresh
