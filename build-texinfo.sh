#!/bin/bash

# Show what we're doing.
set -x

# Download the desired texinfo tarball for the version we want.
VERSION=master

if [ "$VERSION" = "master" ]; then
    if [ -d "texinfo-$VERSION" ]; then
        (cd texinfo-$VERSION; git checkout master)
    else
        git clone https://git.savannah.gnu.org/git/texinfo.git texinfo-$VERSION
    fi
else
    wget https://ftp.gnu.org/gnu/texinfo/texinfo-$VERSION.tar.xz
    tar xf texinfo-$VERSION.tar.xz
fi
# cd to the sources and build.
cd texinfo-$VERSION
./configure --prefix=$PWD/..
make clean
make
make install

