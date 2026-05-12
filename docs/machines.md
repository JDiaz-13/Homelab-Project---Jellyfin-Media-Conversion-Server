## Machine / node-1
- Hostname: x-pc
- OS: Linux Mint 22 "Wilma"
- CPU: Intel(R) Core(TM) i5-8500T CPU @ 2.10GHz
- RAM: 8 GB
- Storage:250GB SSD
- IP: 192.168.81.23 / 10.8.0.1 (Wireguard)
- Purpose: Jellyfin server with hardware accelarated transcoding and the Wireguard host for secure remote access. 
- Services running: Jellyfin, Wireguard, FFmpeg (only for Jellyfin transcodes)

## Machine / node-2
- Hostname: truenas 
- OS: TrueNAS Scale 25.04.2.6 (Community)
- CPU: Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz
- RAM: 32 GB
- Storage: 34 TB HDD
- IP: 192.168.81.120
- Purpose: Serves as the NAS.
- Services running: Network shared drives.

## Machine / node-3
- Hostname: x
- OS: Windows 11 Pro 24H2
- CPU: Intel(R) N100 (800 MHz)
- RAM: 16 GB
- Storage: 500 GB SSD
- IP: 192.168.81.130
- Purpose: Encodes 720p video files and audio files.
- Services running: FFmpeg media converter 

## Machine / node-4
- Hostname: x-2
- OS: Windows 11 Home 24H2
- CPU: Intel(R) Core(TM) i3-N300 (800 MHz)
- RAM: 8 GB
- Storage: 250GB SSD
- IP: 192.168.81.66
- Purpose:Encodes 2160p and 1080p video files.
- Services running: FFmpeg media converter
