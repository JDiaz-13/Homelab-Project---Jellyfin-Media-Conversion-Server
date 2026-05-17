# Homelab Project - Jellyfin / Media Conversion Server
## Overview

This project is a 4 node homelab media infrastructure centered around Jellyfin for media playback and automated scripting for media conversion via FFmpeg.

## Architecture

<img width="781" height="695" alt="image" src="https://github.com/user-attachments/assets/92b3f457-3820-467c-9266-bc4feed6ef85" />


## Hardware

 ### Host / Purpose
-------------------
- node-1 = Jellyfin / Wireguard Server<br/> 
- node-2 = TrueNAS SCALE Storage / Monitoring<br/>
- node-3 = Media Converter ( FFmpeg ) #1<br/>
- node-4 = Media Converter ( FFmpeg ) #2<br/>

## Services

- Jellyfin
- FFmpeg
- Wireguard

## Documentation 
- [Click here](/docs/)


## Screenshots
### TrueNAS SCALE Dashboard
<img width="2527" height="1275" alt="image" src="https://github.com/user-attachments/assets/efc4ce1b-dab6-4917-ba0a-f5a872c0c6de" />

---

### Jellyfin Admin Dashboard

<img width="1976" height="1033" alt="image" src="https://github.com/user-attachments/assets/2d045611-52ee-4475-9c87-b2f8c0623e05" />





## Lessons Learned

- Backup important databases often utilizing the 3-2-1 backup rule.

- Be extra careful when using `sudo rm -r \PATH` or `sudo rmdir -r \PATH`. I accidentally whiped a linux install with this.

- Disable UPnP immediately when beginning network hardening process. Although it is convenient it is susceptible to accidental port forwards, ultimately compromising the entire LAN if an outdated app or any type of attack is received by that endpoint.

- After disabling UPnP take note of which services or app's stop working and research what ports are required for each service/app and configure firewall accordingly. 

- After a service passes the initial testing immediately start conducting backups and reading documentation on how to restore in case of a disaster. I lost my entire Jellyfin database once and did not have a backup, this caused me to start from scratch which is unacceptable in a professional environment.

- Run [Nmap](https://nmap.org/) scans routinely, a router update somehow enabled **UPnP** and exposed a port on my firewall. Routine not only provides peace of mind but also ensures your network is secured from external threat actors.

- RJ-45 termination, I purchased a kit to make custom legnth cables and wired everything using the T-568B standard.

- The importance of correct cable termination. I node_4 was suffering from very slow network connection speeds (100mbps). After going down the rabbit hole of checking ethernet drivers, router and firewall settings, and adapter settings I finally tried a different patch cable. Problem solved, 1000/mbps connection instantly. After further inspection of the cable connector I noticed two colors were in the wrong position. This most likely happened when placing the connector on to the cables before crimping. 

- Some linux distributions are easier to work with out of the box. I tried an **Ubuntu** distro very early on in my IT degree / homelab experience. For some reason I was unable to configure my network adapter to run FULL-Duplex which caused significantly lower than anticipated network speeds. Knowing what I know now I would simply find the correct adapter drivers for my hardware and update my kernel.

- The importance of a parity drive, I once had a drive failure when I was running a RAID 0 with zero fault tolerance. This caused me lose the entire array / pool. I have since upgraded my NAS and run a RAID 5 - ZFS configuration with 1 parity drive which provides fault tolerance of 1 drive failure.

- When updating firewall rules remotely ensure you have a backup failsafe script or VPN tunnel to regain access to your LAN. I once accidentally blocked all external connections on my firewall including my **Wireguard** server HOST. This locked me out of my server along with everyone else until I was able edit firewall rules at home.

- Some file formats are incompatible with **Windows**. I spent hours looking into why my linux machine was able to read and wirte just fine into a file on a usb drive but windows was not. Turned out the issue was the drive was formatted using EXT4 file system instead of something more compatible like FAT32. This was before I obtained my CompTIA A+ certification so it was a great learning experience. 

- How to manually roll back bad driver updates in **Windows**. One of my encoder machines had a driver update once that cause the iGPU to stop working as expected. Intel Quick sync just stopped working completely. I rolled the driver back via device manager and everything worked perfectly. 