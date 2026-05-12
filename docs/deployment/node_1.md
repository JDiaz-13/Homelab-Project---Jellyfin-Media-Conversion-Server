# node-1 Jellyfin/Wireguard Deployment

## Overview

Native Jellyfin installation running on Linux Mint 22 "Wilma".

---

# Environment

## Operating System
- Linux Mint 22 "Wilma"

## Hardware
- Intel(R) Core(TM) i5-8500T CPU @ 2.10GHz
- 8 GB RAM
- Intel QuickSync enabled

---

# Installation

## Install Jellyfin via Linux Mint APT

```bash
sudo apt install jellyfin
```
---

## Add Jellyfin user 
- Jellyfin runs under the username "jellyfin" by default, I recommend keeping it that way to make updating easier.
- If you manually build jellyfin from the official repository and run it using a different user updating it with a the pkg manager will break jellyfin. This happens because the pkg manager updates jellyfin then resets it to run under the user "jellyfin" which will cause problems with file permissions.

```bash
sudo useradd -m jellyfin
```

## Mount network drive with Jellyfin media
- <--Script is available on the scripts folder
```bash
mkdir /scripts
cd /scripts
```
- Open a text editor and paste the code from linux_mint_mount.sh
```bash
sudo nano linux_mint_mount.sh
```
- Ctrl + X to exit, dont forget to save!
---
- Give the script permission to execute
```bash
sudo chmod +x linux_mint_mount.sh
```



