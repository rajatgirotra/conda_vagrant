#!/bin/bash

chmod +x configure

./configure --prefix=$PREFIX --with-libssh2

make
make check
make install
