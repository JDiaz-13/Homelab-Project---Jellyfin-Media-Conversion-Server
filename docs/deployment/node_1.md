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
- Make directories for scripts and network drive
```bash
sudo mkdir /mnt/media /scripts
cd /scripts
```
## Make "jellyfin" user the owner of the media directory
  ---
  ```bash
  sudo chown -r /mnt/media
  ```
  ---
- node_2 TrueNAS server permissions for the network drive has -rx permissions only for jellyfin login credentials so no need to worry about accidental media deletes from the Jellyfin user
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
- While you're there also make the jellyfin backup script using the "jellyfin_backup_script.sh" script
- Don't forget to give it execute permissions!

## Check Jellyfin status 

```bash
sudo systemctl status jellyfin
```

- The terminal should indicate the jellyfin.service is active

## Install required drivers for hardware accelerated transcoding
---
```bash
 sudo apt install intel-media-va-driver-non-free vainfo
```
---
- Verify driver install with the following:
---
```bash
vainfo
```
---

- Add jellyfin user to the render or video groups, either one works
---
```bash
sudo usermod -aG render jellyfin
```
```bash
sudo usermod -aG video jellyfin
```
---
- Restart jellyfin service to ensure it will work properly
---
```bash
sudo systemctl restart jellyfin
```
---

- Jellyfin should now be fully operational, accessible via HOST_IP:8096
- Map the media folders in the Jellyfin initial setup
- Double check hardware accelerated transcoding is enabled in transcoding settings
- Check FFmpeg logs in jellyfin, you should see h264QSV as thee media transcoder
- If restoring from a backup database follow: [Jellyfin Documentation](https://jellyfin.org/docs/general/administration/backup-and-restore/)
- For hardware accelerated transcoding debugging follow: [Jellyfin Documentation](https://jellyfin.org/docs/general/post-install/transcoding/hardware-acceleration/intel)
- Dont forget to stop jellyfin.service before transfering the backup database files!

