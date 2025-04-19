# qBitTOR = qBitTorrent Web-UI + Tor Network

This project provides a lightweight, ephemeral environment for securely downloading files via qBitTorrent over the Tor network. The downloaded files are stored outside the container and it is designed to self-destruct after use, leaving only its configuration.

![qBitTorrent Web-UI](https://github.com/davift/qBitTOR/blob/main/image-01.png)

## Requirements

Install Docker and Docker Compose:

```
sudo apt install docker.io docker-compose -y
```

## Usage

Easy way - Single command.

```
sudo docker run --rm -d -p 8080:8080 -v /tmp:/TORRENT -v ./qBittorrent:/var/lib/qbittorrent/.config/qBittorrent/ --name qBitTOR davift/qbittor:latest
```
**Note:** the flag `--rm` make it self-destructible when stoped with the following command.

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

Navigate to http://120.0.0.1:8080

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
