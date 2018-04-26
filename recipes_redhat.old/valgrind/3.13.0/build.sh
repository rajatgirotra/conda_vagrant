#!/usr/bin/env bash

sed -i 's|/doc/valgrind||' docs/Makefile.in

./configure --prefix=${PREFIX} --datadir=${PREFIX}/share/doc/valgrind-${PKG_VERSION}
make
make install
