# Network adapter configuration
- IP:192.168.81.197
- DNS: 8.8.8.8 , 8.8.4.4
- Gateway:192.168.81.1
- Subnet Mask: 255.255.255.0
- Wireguard: 10.8.0.1/24

### Ufw 
- Open port 51820 for UDP traffic only
---
```bash
sudo ufw allow 51820/udp
```
---
- Allow ipv4 traffic forwarding in ufw
---
```bash
sudo nano /etc/default/ufw
```
---
- Change DEFAULT_FORWARD_POLICY="DROP" to:DEFAULT_FORWARD_POLICY="ACCEPT"
- Save and restart the ufw service
### Uncomment the ipv4 forwarding option in the kernel conf file
---
```bash
sudo nano /etc/sysctl.conf
```
---
<img width="932" height="205" alt="image" src="https://github.com/user-attachments/assets/9406ed99-f0f2-49d5-81e1-671e7d78b5c5" /><br/>

<img width="855" height="185" alt="image" src="https://github.com/user-attachments/assets/a17ff3b3-1e01-485e-968f-e4fc7b19295f" /><br/>

### Apply the changes to the kernel & restart Ufw
---
```bash
sudo sysctl -p
sudo systemctl restart ufw
```
---

### All done! Networking settings are now complete, you can now start the wireguard tunnel and test connectivity to peers :+1:

---
```bash
sudo wg-quick up wg0
```
---
