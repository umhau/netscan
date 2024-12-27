# Network Interface Subnet Allocation Tool

## Overview

This tool scans network interfaces, identifies groups connected to the same physical network, detects existing DHCP servers, and calculates available subnets. The outputs are designed to be line-oriented for easy integration with shell scripts and automation.

## Features

- Scans network interfaces and identifies groups sharing the same Layer 2 network.
- Detects pre-existing DHCP servers and their offered subnets.
- Calculates available subnets based on user-provided pools and existing allocations.
- Outputs data in a simple, parseable line-oriented format.

## Dependencies

Install required system packages (Void Linux) and install `define-networks` to the system path:
```bash
sudo bash install.sh
```

## Usage

Run the tool with appropriate arguments:
```bash
define-networks -i eth -t 10 -s 10.0.0.0/8 -m eth0 192.168.1.0/24 -d 24
```

### Arguments:
- `-i, --interfaces`: Specify interface types (e.g., `eth`, `wlan`, `tap`).
- `-t, --timeout`: Set the timeout for ARP scanning (in seconds).
- `-s, --subnets`: Define subnet pools in CIDR format (e.g., `10.0.0.0/8`).
- `-m, --manual`: Assign manual interface-subnet pairs (e.g., `eth0 192.168.1.0/24`).
- `-d, --subnetsize`: Set the default subnet size for dynamic allocations (e.g., `/25`).
- `-j, --join`: Specify interfaces assumed to share the same Layer 2 network.

### Example Command:
```bash
define-networks -i eth wlan -t 5 -s 192.168.0.0/16 -m eth0 192.168.1.0/24 -d 24 -j eth0 eth1
```

### Example Output:
The output is line-oriented and looks like this:
```
ifaces: eth0 eth1 status: discovered subnet: 192.168.1.0/24
ifaces: eth2 status: none subnet: 10.0.0.0/24
```

## Notes

- **Permissions**: Root or sudo access is required to interact with network interfaces and run ARP scans.
- **Output-Only**: This tool does not configure DHCP servers or modify network settings. It outputs discovery and allocation data for manual or automated use.
- **Line-Oriented Output**: Designed for easy parsing in shell scripts and automation workflows.
