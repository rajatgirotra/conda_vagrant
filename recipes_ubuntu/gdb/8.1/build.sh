#!/usr/bin/env bash

PYTHON="${PREFIX}/bin/python"
export CFLAGS="-I${PREFIX}/include"
export CXXFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"

SRC_DIR=$(basename $PWD)
echo "SRC_DIR is ${SRC_DIR}"
cd ../
mkdir -vp gdb_objdir
cd gdb_objdir

../${SRC_DIR}/configure --prefix=${PREFIX} --with-python=${PYTHON}
make
make install

# Install doxygen documentation for gdb
#install -d ${PREFIX}/share/doc/gdb-8.1 && rm -rf gdb/doc/doxy/xml && cp -Rv gdb/doc/doxy ${PREFIX}/share/doc/gdb-8.1
