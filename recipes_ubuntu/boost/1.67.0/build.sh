#!/bin/bash

# Hints:
# http://boost.2283326.n4.nabble.com/how-to-build-boost-with-bzip2-in-non-standard-location-td2661155.html
# http://www.gentoo.org/proj/en/base/amd64/howtos/?part=1&chap=3
# http://www.boost.org/doc/libs/1_55_0/doc/html/bbv2/reference.html

set -x -e

#INCLUDE_PATH="${PREFIX}/include"
#LIBRARY_PATH="${PREFIX}/lib"
PYTHON="${PREFIX}/bin/python"
ICU_PATH=/usr/include/x86_64-linux-gnu
./bootstrap.sh \
    --prefix="${PREFIX}" \
    --with-python="${PYTHON}" \
    --with-icu="${ICU_PATH}" \
    | tee bootstrap.log 2>&1

./b2 -q \
    variant=release \
    address-model="${ARCH}" \
    architecture=x86 \
    debug-symbols=off \
    threading=multi \
    runtime-link=shared \
    link=shared \
    toolset=gcc \
    --layout=system \
    -j"${CPU_COUNT}" \
    install | tee b2.log 2>&1
