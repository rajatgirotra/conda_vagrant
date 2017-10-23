#!/usr/bin/env bash

chmod +x configure
SRC_DIR=$(basename ${PWD})
cd ..
mkdir objdir
cd objdir
../${SRC_DIR}/configure --enable-shared --enable-ipv6 --prefix=$PREFIX --enable-unicode=ucs4 --with-ensurepip=yes
make
make install

cd ${PREFIX}/bin

PIP="${PREFIX}"/bin/pip

echo "PIP is $PIP"

#${PIP} install --upgrade pip

# patchelf.
for file in $(ls python*);
do
  if `file $file | grep -q LSB`;
  then
    patchelf --force-rpath --set-rpath '$ORIGIN/../lib' $file
  fi
done
