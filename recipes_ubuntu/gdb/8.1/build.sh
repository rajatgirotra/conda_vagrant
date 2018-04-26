#!/usr/bin/env bash

./configure --prefix=${PREFIX} --with-system-readline --without-guile 
make
#make -C gdb/doc doxy
make -C gdb install

# Install doxygen documentation for gdb
#install -d ${PREFIX}/share/doc/gdb-8.1 && rm -rf gdb/doc/doxy/xml && cp -Rv gdb/doc/doxy ${PREFIX}/share/doc/gdb-8.1
