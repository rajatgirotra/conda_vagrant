#!/usr/bin/env bash

chmod +x configure

./configure --prefix=$PREFIX --with-gmp-prefix=$PREFIX
make
make install
