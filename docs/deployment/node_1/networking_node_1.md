#Network adapter configuration
- IP:192.168.81.197
- DNS: 8.8.8.8 , 8.8.4.4
- Gateway:192.168.81.1
- Subnet Mask: 255.255.255.0

##Ufw 
- Open port 51820 for UDP traffic only
---
```bash
sudo ufw allow 51820/udp
```
---

- Uncomment the ipv4 forwarding option in the kernel conf file
- ---
```bash
sudo nano /etc/sysctl.conf
```
---
