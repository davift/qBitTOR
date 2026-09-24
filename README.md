# qBitTOR = qBitTorrent Web-UI + Tor Network

![Static Badge](https://img.shields.io/badge/Docker-blue?style=social&logo=Docker)

This project provides a lightweight, ephemeral environment for securely downloading files via qBitTorrent over the Tor network. The downloaded files are stored outside the container, and it is designed to self-destruct after use, leaving only its configuration.

![qBitTorrent Web-UI](https://github.com/davift/qBitTOR/blob/main/image-01.png)

Also available for ARM / Android via Terminal.

![qBitTorrent Web-UI Mobile](https://github.com/davift/qBitTOR/blob/main/image-02.png)

## Requirements

Install Docker and Docker Compose:

```
sudo apt install docker.io docker-compose -y
```

## Usage

**Security notes before exposing the Web-UI:**
- The Web-UI ships with qBittorrent's default credentials (`admin` / `adminadmin`) on port 8080. Change the password immediately under **Tools → Options → Web UI**, and don't expose port 8080 beyond localhost/your LAN.
- The Tor Project discourages BitTorrent over Tor (performance impact on the network, and residual deanonymization risk). This image proxies peer/tracker traffic and enables anonymous mode, but use it with that caveat in mind.

Easy way - Single command (x86/ARM).

```
sudo docker run --rm -d -p 8080:8080 -v /tmp:/TORRENT --name qBitTOR davift/qbittor:latest
```
**Note:** the flag `--rm` makes it self-destructible when stopped with the following command.

**OR** mount the qBittorrent directory for configuration persistence.

```
sudo docker run --rm -d -p 8080:8080 -v /tmp:/TORRENT -v ./qBittorrent:/var/lib/qbittorrent/.config/qBittorrent/ --name qBitTOR davift/qbittor:latest
```

After using...

```
sudo docker stop qBitTOR
```

Using Docker-Compose.

Pull and Start

```
git clone https://github.com/davift/qBitTOR.git
cd qBitTOR
sudo docker-compose up -d
```

Navigate to http://127.0.0.1:8080

Enter the username `qbittor` and password `qbittor`.

Look for the downloaded files in the `/tmp` directory.

Stop the container.

```
sudo docker-compose down
```

# Use Cases

- Checking if your data is part of a breach.
- Analyzing password dumps for security research.
- Downloading and studying malware for educational purposes.
- Circumventing censorship.
