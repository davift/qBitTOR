#!/bin/sh

echo "Starting qBitTOR container..."

# Connecting to Tor
/usr/bin/tor &

echo "Waiting for Tor to bootstrap..."
i=0
while ! nc -z 127.0.0.1 9050 2>/dev/null; do
    i=$((i + 1))
    if [ "$i" -ge 60 ]; then
        echo "Tor did not come up within 60s, starting anyway."
        break
    fi
    sleep 1
done

# Starting qBittorrent daemon
su-exec qbittorrent /usr/bin/qbittorrent-nox --webui-port=8080

echo "Stopping qBitTOR container..."
exit
