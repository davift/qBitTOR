#!/bin/sh

echo "Starting qBitTOR container..."

# Connecting to Tor
/usr/bin/tor &

# Starting qBittorrent daemon
su-exec qbittorrent /usr/bin/qbittorrent-nox --webui-port=8080

echo "Stopping qBitTOR container..."
exit
