#!/usr/bin/env bash

chmod +x autogen.sh
./autogen.sh
chmod +x configure
./configure --prefix=${PREFIX}
make
make check
make install
