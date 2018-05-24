#!/usr/bin/env bash

PYTHON="${PREFIX}/bin/python"
./configure --prefix=${PREFIX} --with-system-readline --without-guile --with-python=${PYTHON}
make
#make -C gdb/doc doxy
make -C gdb install

# Install doxygen documentation for gdb
#install -d ${PREFIX}/share/doc/gdb-8.1 && rm -rf gdb/doc/doxy/xml && cp -Rv gdb/doc/doxy ${PREFIX}/share/doc/gdb-8.1
