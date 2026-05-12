#!/bin/bash

TIMESTAMP=$(date +%Y%m%d%H%M%S)
VERSION=10.10.7       #Update the version number as necessary
sudo mkdir -p /home/x/jellyfinbackup/jellyfin.${TIMESTAMP}_${VERSION}  # Or change the path wherever in your system makes sense to you
sudo cp -a /var/lib/jellyfin /home/x/jellyfinbackup/jellyfin.${TIMESTAMP}_${VERSION}/data
sudo cp -a /etc/jellyfin /home/x/jellyfinbackup/jellyfin.${TIMESTAMP}_${VERSION}/config

