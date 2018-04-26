#!/bin/bash

# Install gcc  and binutils to its very own prefix.
# GCC must not be installed to the same prefix as the environment,
# because $GCC_PREFIX/include is automatically considered to be a
# "system" header path.
# That could cause -I$PREFIX/include to be essentially ignored in users' recipes
# (It would still be on the search path, but it would be in the wrong position in the search order.)
GCC_PREFIX="$PREFIX/gcc"
mkdir -p "$GCC_PREFIX"

PKG_VERSION="rajat_internal_GCC_build_on_$(date '+%d-%m-%Y')"
ln -s "$PREFIX/lib" "$PREFIX/lib64"

# For reference during post-link.sh, record some
# details about the OS this binary was produced with.
mkdir -p "${PREFIX}/share"
cat /etc/*-release > "${PREFIX}/share/conda-gcc-build-machine-os-details"

mkdir binutils_objdir
cd binutils_objdir

$PWD/../binutils/configure \
    --prefix="$GCC_PREFIX" \
    --bindir="$PREFIX/bin" \
    --datarootdir="$PREFIX/share" \
    --libdir="$PREFIX/lib" \
    --enable-gold=yes \
    --enable-ld=yes \
    --with-gmp=${PREFIX} \
    --with-mpfr=${PREFIX} \
    --with-mpc=${PREFIX} \
    --with-isl=${PREFIX} \
    --enable-lto

make
make install
cd ..

# gcc 
cd gcc
#chmod +x contrib/download_prerequisites
chmod +x configure
#./contrib/download_prerequisites

cd ..
mkdir gcc_objdir
cd gcc_objdir
$PWD/../gcc/configure \
    --prefix="$GCC_PREFIX" \
    --with-pkgversion="$PKG_VERSION" \
    --with-gxx-include-dir="$GCC_PREFIX/include/c++" \
    --bindir="$PREFIX/bin" \
    --datarootdir="$PREFIX/share" \
    --libdir="$PREFIX/lib" \
    --enable-checking=release \
    --enable-threads=posix \
    --with-tune=generic \
    --with-gmp=${PREFIX} \
    --with-mpfr=${PREFIX} \
    --with-mpc=${PREFIX} \
    --with-isl=${PREFIX} \
    --disable-multilib \
    --enable-lto \
    --enable-default-pie \
    --enable-__cxa_atexit \
    --with-as=${PREFIX}/bin/as \
    --with-gnu-as \
    --with-ld=${PREFIX}/bin/ld \
    --with-gnu-ld \
    --enable-languages=c,c++,fortran,lto
make bootstrap-lean
#make check-gcc
#make check-c
#make check-c++	
make install
rm "$PREFIX/lib64"

# Link cc to gcc if cc doesn't exist
[ -e "$PREFIX/bin/cc" ] || ln -s "gcc" "$PREFIX/bin/cc"
