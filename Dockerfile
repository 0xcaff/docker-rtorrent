FROM alpine:3.6

RUN apk add --update \
    -t build-dependencies \
    build-base \
    git \
    libtool \
    automake \
    autoconf \
    curl-dev \
    zlib-dev \
    cppunit-dev \
    ncurses-dev \
    libressl-dev \
    binutils \
    linux-headers

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
