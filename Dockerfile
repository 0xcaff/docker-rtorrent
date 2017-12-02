FROM alpine:3.6

# Build rTorrent from Source
ADD build-rtorrent.sh /tmp/build-rtorrent.sh
RUN /tmp/build-rtorrent.sh

# Create Privileged User
# -D disables password
# -g '' specifies empty user information
RUN adduser -D -g '' -h /rtorrent rtorrent

# Switch to user context.
USER rtorrent
WORKDIR /rtorrent

ENTRYPOINT [ "rtorrent" ]
