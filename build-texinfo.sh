#!/bin/bash

# Show what we're doing.
set -x

# Download the desired texinfo tarball for the version we want.
VERSION=7.2
wget https://ftp.gnu.org/gnu/texinfo/texinfo-$VERSION.tar.xz
#curl https://ftp.gnu.org/gnu/texinfo/texinfo-$VERSION.tar.xz > texinfo-$VERSION.tar.xz
tar xf texinfo-$VERSION.tar.xz

# cd to the sources and build.
cd texinfo-$VERSION
./configure --prefix=$PWD/..
make clean
make
make install

