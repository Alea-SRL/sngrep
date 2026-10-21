#!/bin/bash

set -e

if [ "$EUID" -ne 0 ]
  then echo "This script must be run as root"
  exit
fi

./bootstrap.sh
./configure --with-openssl --with-pcre --with-zlib --enable-unicode --enable-ipv6 --enable-eep

make
make install

setcap cap_net_raw,cap_net_admin+eip /usr/local/bin/sngrep

sngrep
