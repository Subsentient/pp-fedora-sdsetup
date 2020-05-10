# <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Fedora_logo.svg/200px-Fedora_logo.svg.png" width="25" height="25"> PinePhone Fedora Setup

## **Look out**
This is a butchered version of the repo it is forked from. It assumes /dev/loop0 and /dev/loop1 are unused!!!
Make absolutely sure this is the case with lsblk before you use this!
You are expected to copy and unxz a Fedora minimal image to ~/fedora-pinephone.img right now.

This is designed for personal use, but it's probably more than usable for you too, if you examine it carefully.

## Differences
* Uses Fedora 32 instead of Rawhide, doesn't enable a copr repo
* Uses ext4 for the root filesystem instead of f2fs
* Disables SELinux
* Uses XFCE4 and LightDM for the GUI (Xorg based)
* Installs firefox, avahi, hexchat, and a few other minimal things I use.
* Deletes the password for root.

## Dependencies

- wget
- xz
- e2fsprogs (for mkfs.ext4)
- dosfstools (for mkfs.vfat)
- uboot-tools (for mkimage)
- qemu-user-static (for qemu-aarch64-static)

## Usage

1. Edit `.env` with your own variables.
2. Run `bash download-files.sh` then `sudo bash all.sh`. Verify the information presented whenever it asks you to confirm.

## Tips

- Run all scripts other than download-files.sh as root, and from this (README.md) directory! Do not directly run anything in the phone-scripts folder! Those scripts are, as the name suggests, executed on the phone.
- If a script fails midway through, some things may still be mounted. `sudo ./cleanup.sh` will attempt to unmount everything.
