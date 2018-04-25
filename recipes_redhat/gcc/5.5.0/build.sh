#!/bin/bash

# Install gcc to its very own prefix.
# GCC must not be installed to the same prefix as the environment,
# because $GCC_PREFIX/include is automatically considered to be a
# "system" header path.
# That could cause -I$PREFIX/include to be essentially ignored in users' recipes
# (It would still be on the search path, but it would be in the wrong position in the search order.)
GCC_PREFIX="$PREFIX/gcc"
mkdir "$GCC_PREFIX"

PKG_VERSION="rajat_internal_GCC_build_on_$(date '+%d-%m-%Y')"
ln -s "$PREFIX/lib" "$PREFIX/lib64"

# For reference during post-link.sh, record some
# details about the OS this binary was produced with.
mkdir -p "${PREFIX}/share"
cat /etc/*-release > "${PREFIX}/share/conda-gcc-build-machine-os-details"
chmod +x contrib/download_prerequisites
chmod +x configure
./contrib/download_prerequisites
SRC_DIR=$(basename ${PWD})
cd ..
mkdir objdir
cd objdir
$PWD/../${SRC_DIR}/configure \
    --prefix="$GCC_PREFIX" \
    --with-pkgversion="$PKG_VERSION" \
    --with-gxx-include-dir="$GCC_PREFIX/include/c++" \
    --bindir="$PREFIX/bin" \
    --datarootdir="$PREFIX/share" \
    --libdir="$PREFIX/lib" \
    --enable-checking=release \
    --with-tune=generic \
    --disable-multilib \
    --enable-lto \
    --enable-languages=c,c++,fortran,lto
make bootstrap-lean
#make check-gcc
#make check-c
#make check-c++	
make install
rm "$PREFIX/lib64"

# Link cc to gcc if cc doesn't exist
[ -e "$PREFIX/bin/cc" ] || ln -s "gcc" "$PREFIX/bin/cc"
