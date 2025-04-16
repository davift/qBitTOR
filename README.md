# qBitTOR = qBitTorrent Web-UI + Tor Network

This project provides a lightweight, ephemeral environment for securely downloading files via qBitTorrent over the Tor network. The downloaded files are stored in `/tmp` and the container is designed to self-destruct after use, leaving only the configuration.

## Requirements

Install Docker and Docker Compose:

```
sudo apt install docker.io docker-compose -y
```

## Deployment

Start the container:

```
docker-compose up -d
```

Stop the container:

```
docker-compose down
```

# Use Cases

- Checking if your data is part of a breach.
- Analyzing password dumps for security research.
- Downloading and studying malware for educational purposes.
- Circumventing censorship.
