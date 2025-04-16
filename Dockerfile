FROM alpine:latest
LABEL Name=qBitTOR Version=0.0.1
RUN apk add --no-cache tor
RUN apk add --no-cache qbittorrent-nox
RUN apk add --no-cache su-exec
RUN mkdir -p /TORRENT /var/lib/qbittorrent/.config/qBittorrent
COPY entrypoint.sh /entrypoint.sh
COPY qBittorrent/qBittorrent.conf /var/lib/qbittorrent/.config/qBittorrent/qBittorrent.conf
RUN chown -R qbittorrent:qbittorrent /TORRENT /var/lib/qbittorrent
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
