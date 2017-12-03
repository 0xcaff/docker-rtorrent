#!/bin/sh

# Exit on error.
set -e

# Install Dependencies
apk add --update \
  -t build-dependencies \
  build-base \
  git \
  libtool \
  automake \
  autoconf \
  cppunit-dev \
  curl-dev \
  zlib-dev \
  ncurses-dev \
  libressl-dev \
  binutils \
  linux-headers \
  xmlrpc-c-dev

cd /tmp/

# Build libtorrent
printf "\n\n-------- Building libtorrent\n\n"
git clone https://github.com/rakshasa/libtorrent.git
cd /tmp/libtorrent
./autogen.sh
./configure
make
make install

cd /tmp/

# Build rTorrent
printf "\n\n-------- Building rTorrent\n\n"
git clone https://github.com/rakshasa/rtorrent.git
cd /tmp/rtorrent
./autogen.sh
./configure --with-xmlrpc-c
make
make install

# Cleanup Build Output
rm -rf /tmp/
