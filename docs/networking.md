# Network Topology & Configuration

This document outlines the network architecture, port allocations, and security measures implemented in this media server deployment.

## Network Architecture

```mermaid
graph TD
    Client[User/Client Device] -->|UDP 51820 / Wireguard| FW[Firewall / Router]
    FW -->|Port Forward / Internal Routing| WG[Wireguard Server: node_1]
    
    subgraph Internal Network (192.168.81.0/24)
        WG -->|HTTP 8096| JF[Jellyfin Server]
        WG -->|HTTP 8267| TD[Tdarr]
        
        
        
        MC[Media Converter: Tdarr] -->|Watch Folder| NAS[(node_2 / NAS)]
        JF -->|Read Only| NAS
    end
```

## Port Matrix


| Service | Internal Port | Host Port | Protocol | Access Level | Description |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Jellyfin** | 8096 | 8096 | TCP | LAN Only| Media streaming web interface |
| **Wireguard**| 51820 | 51820 | UDP | WAN | VPN server / exit node for remote clients |
| **Tdarr Node** | 8267 | 8267 | TCP | LAN Only | Media transcoding node |

## Traffic Isolation & Security

### 1. Network Segregation
* **Frontend Network:** Only the Wireguard server is exposed via PORT# 51820 UDP protocol.
* **Backend Network:** The NAS and FFmpeg encoders that run Tdarr communicate on an isolated backend network with no access to WAN network.

### 2. External Access & Edge Security

* **VPN Option:** Remote access outside is locked down and only accessible via a **WireGuard** split tunnel VPN. 
* **DDNS:** Current ISP does not offer static IP addresses for residential, to overcome constantly updating VPN endpoint ip-address a DDNS was implemented via [Dynu.com](https://www.dynu.com/) .

## Storage Protocols

* **Network Shares:** Mass storage pooled via `SMB3` with explicit read/write vs read-only permissions per service use.

