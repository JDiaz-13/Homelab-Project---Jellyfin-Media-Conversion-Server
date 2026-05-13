# Installation

### Install Wireguard via Linux Mint APT
---
```bash
sudo apt install wireguard
```
---

### Add an interface for Wireguard to use
---
```bash
sudo ip link add dev wg0 type wireguard
```
---

### Create a conf. file for your wireguard tunnel
---
```bash
sudo nano /etc/wg0.conf
```
---
 - Paste the contents from the backup **wg0.conf** file on server backup folder and save (Ctrl+X)
### Set the backup conf file for wg0
---
```bash
sudo wg setconf /etc/wg0.conf
```
---
### Start the wireguard tunel utilizing the wg0 interface
---
```bash
sudo wg-quick up wg0
```
---
- The tunnel should launch without issues however the firewall will need adjustments to allow incoming traffic and to forward traffic into the network.
- The tunnel must be restarted anytime changes are made to the firewall or wg0.conf file
- Use the following to shut down the wireguard tunnel:
```bash
sudo wg-quick down wg0
```
- Use the following the start the wireguard tunnel:
```bash
sudo wg-quick up wg0
```
---
### At this point wireguard is installed and configured :+1:
- Shut the tunnel down and refer to the networking_node_1.md documentation for firewall setup
- After completing firewall configuration start the wireguard tunnel back up
- If deploying on a new machine you may need to edit wg0.conf and replace the network interface device with the correct one

