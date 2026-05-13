# node_2 TrueNAS SCALE setup

### Operating System
- Download .iso for TrueNAS Scale 25.04.2.6 (Community) [Download](https://forums.truenas.com/t/truenas-25-04-2-6-is-now-available/57705)
- Format a USB drive using Rufus imaging tool [Download](https://rufus.ie/downloads/)
- Follow Truenas [Documentation](https://www.truenas.com/docs/scale/gettingstarted/install/installingscale/) for a fresh install
- If you are recovering from corupted configuration follow [Documenttation](https://www.truenas.com/docs/core/13.0/coretutorials/systemconfiguration/usingconfigurationbackups/)

---
### Network settings
- My setup has a DHCP IP Reservation via router for this node for IP: 192.168.81.120
- All external connections are blocked via router firewall
---
### Storage
- Note: the boot drive used for TrueNAS SCALE OS can not be used for NAS storage pool. Small 120GB or 240GB are perfect for this.
---
### Cooling
- HDD's get pretty hot when running a striped ZFS setup with a parity drive, recommend multiple intake fans blowing directly at HDD drives. 
- Recommend new thermal paste if setting up a new setup, since its a 24/7 device.