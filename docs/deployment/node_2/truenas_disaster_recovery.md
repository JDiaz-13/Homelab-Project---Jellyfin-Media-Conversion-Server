# node-2 TrueNAS Disaster Recovery Plan

### Recovery time objective (RTO):
- 24 Hours

### Recovery point objective (RPO):
- 12-24 Hours

### Infurstructure failure:
1. Hardware failure
    
    - SAS HBA Controller card
        - Shut down machine
        - Take note of drive connection #
        - Replace SAS HBA Controller card
        - Turn on machine and verify storage pools
    ---    
    - HDD failure
        - Immediately stop SMB shares and communicate outage to users
        - Check and see which storage pool and HDD failed
        - Shut down machine
        - Replace HDD experiencing the failure
        - Turn on machine and varify new drive is revognized
        - Verify "Pool resilver" is triggered on dashboard
        - Monitor for completion EST. 5-24 Hrs depending on data usage %
        - After parity drive is rebuilt restart SMB shares and restart nodes 1,3, and 4. 
        - Supporting Official [Documentation](https://www.truenas.com/docs/scale/storage/disks/replacingdisks/)
    ---
 
2. Network outage
    - ISP Outtage
        - Unfected since the machine has no external connectivity
        ---
    - No LAN connectivity
        - Check router admin panel to verify single node outage
        - Verify RJ-45 cable and NIC for failure
        - Swap patch cable and retest gateway connection
        - If both NIC and patch cable are working and connection is not reistablished check patch cable between the unmanaged switch and the router
        - If the connection not re-established after the above, possible port failure on router or switch. Try different ports on both network devices.
        - Connection should now be reistablished, verify adapter settings for correct IP adrress. Router DHCP should assign reserved IP of 192.168.81.120.
        - Perform normal network test to verify connectivity, restart all services the utilized this node. (nodes 1, 3, &4).
            - On the off chance non of the above worked its possible the NIC may be the issue. Use a backup NIC via PCIe or USB and retest. If you do this the DHCP will not assign the correct reserved IP for this node of 192.168.81.120 due to now having a different MAC address from using a different NIC. Verify connectivity to other network devices.
---
3. Power Outtage
    - Wait 10-15 minutes and verify modem and router are on fully operational
    - Turn on the machine, all settings and configurations should boot normally.
    - Boot time: 5-10 min for web ui to be accessible
    - If the configuration file is corrupted follow [trueNAS_setup.md](truenas_setup.md) and restore from backup