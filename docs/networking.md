# 🌐 Network Topology & Configuration

This document outlines the network architecture, port allocations, and security measures implemented in this media server deployment.

## 🗺️ Network Architecture

```mermaid
graph TD
    Client[User/Client Device] -->|HTTPS 443 / Tailscale| FW[Firewall / Router]
    FW -->|Port Forward / Internal Routing| RP[Reverse Proxy: Caddy/Nginx]
    
    subgraph Docker Internal Network (172.20.0.0/16)
        RP -->|HTTP 8096| JF[Jellyfin Server]
        RP -->|HTTP 8989| SR[Sonarr]
        RP -->|HTTP 7878| RD[Radarr]
        
        SR -->|API / HTTP| DL[Download Client]
        RD -->|API / HTTP| DL
        
        MC[Media Converter: Tdarr/Unmanic] -->|Watch Folder| NAS[(Storage / NAS)]
        JF -->|Read Only| NAS
    end
```

## 🚪 Port Matrix


| Service | Internal Port | Host Port | Protocol | Access Level | Description |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Jellyfin** | 8096 | 8096 | TCP | LAN / WAN | Media streaming web interface |
| **Reverse Proxy**| 80 / 443 | 80 / 443 | TCP | WAN | Inbound SSL termination |
| **Sonarr** | 8989 | None (Internal)| TCP | Internal | TV Show automation engine |
| **Radarr** | 7878 | None (Internal)| TCP | Internal | Movie automation engine |
| **qBittorrent** | 8080 | 8080 | TCP | LAN Only | Download client Web UI |
| **Tdarr Node** | 8267 | 8267 | TCP | LAN Only | Media transcoding node |

## 🔒 Traffic Isolation & Security

### 1. Docker Network Segregation
* **Frontend Network:** Only the Reverse Proxy and Jellyfin are exposed to this bridge network.
* **Backend Network:** The Arr stack (`Sonarr`, `Radarr`, `Download Client`) communicates on an isolated backend network with no direct host port exposure.

### 2. External Access & Edge Security
* **SSL/TLS:** Automated certificate renewal managed via ACME / Let's Encrypt.
* **VPN Option:** Remote access outside the reverse proxy is locked down via a **Tailscale Mesh VPN** / **WireGuard** tunnel. 
* **Local DNS:** Split-horizon DNS maps `yourdomain.com` to the local LAN IP when at home, bypassing the WAN.

## 📂 Storage Protocols
* **Local Mounts:** High-speed NVMe scratch disks mounted via Docker bind-mounts for active downloads and transcoding cache.
* **Network Shares:** Mass storage pooled via `NFSv4` or `SMB3` with explicit read/write vs read-only permissions per container.

