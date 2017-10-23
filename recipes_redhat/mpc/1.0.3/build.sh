#!/usr/bin/env bash

chmod +x configure

./configure --prefix=$PREFIX \
    --with-gmp=$PREFIX \
    --with-mpfr=$PREFIX \

make
make check
make install
