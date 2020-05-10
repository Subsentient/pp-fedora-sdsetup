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

infecho "This DELETES the gnome-shell desktop file so that gdm boots"
infecho "to phosh instead. This means you're wasting space keeping gnome-shell"
infecho "on your sdcard. It's inefficient but it'll do for now."

infecho "Installing autologin (ASSUMING DEFAULT SCRIPT USERNAME = PINE)..."
cat /root/lightdm.conf > /etc/lightdm/lightdm.conf
echo "SELINUX=disabled" > /etc/selinux/config
echo "SELINUXTYPE=targeted" >> /etc/selinux/config
