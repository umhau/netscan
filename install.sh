#!/bin/bash

packages=(
    tcpdump
    python3
    arp-scan
    nmap
)

echo "installing dependencies"
sudo xbps-install -y ${packages[@]}

echo "installing netscan"
sudo install ./bin/define-networks /bin/
sudo install ./bin/iface-groups    /bin/

echo "done"
