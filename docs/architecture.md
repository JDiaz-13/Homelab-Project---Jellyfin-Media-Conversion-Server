# System Architecture

## Overview

This is a remote access to internal LAN self hosted services that is secured by a dedicated Wireguard gateway host setup. External users receive preconfigured split tunnel configuration files and are then able to access the LAN self hosted services securely. Decided on split tunnel to reduce overall workload on the Wireguard gateway host and network traffic.

## Infrastructure Diagram

<img width="781" height="695" alt="image" src="https://github.com/user-attachments/assets/1b00a5e8-5ebb-43b2-9ba8-74d63034a8c0" />


## Service Communication

<img width="575" height="649" alt="image" src="https://github.com/user-attachments/assets/04d941b2-ab6b-4068-bb22-fa763eaf1c6a" />


## Storage Architecture

<img width="604" height="599" alt="image" src="https://github.com/user-attachments/assets/a0b96b34-45ee-4402-9764-35b5214ef110" />


## Security Design
