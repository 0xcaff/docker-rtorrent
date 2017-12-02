#!/bin/sh

set -e

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
./configure
make
make install
