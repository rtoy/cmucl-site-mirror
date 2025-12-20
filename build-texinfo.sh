#!/bin/bash

echo PATH = $PATH
type -all makeinfo
makeinfo --version



# Show what we're doing.
set -x

echo $LANG

# Download the desired texinfo tarball for the version we want.
VERSION=dev
if [ "$VERSION" = "dev" ]; then
    git clone https://git.savannah.gnu.org/git/texinfo.git
    (cd texinfo; git checkout 69799f7f6d8740; ./autogen.sh)
else
    # Not a development version so just download the sources.  These
    # untar to the directory texinfo-$VERSION.
    wget --quiet https://ftp.gnu.org/gnu/texinfo/texinfo-$VERSION.tar.xz
    #curl https://ftp.gnu.org/gnu/texinfo/texinfo-$VERSION.tar.xz > texinfo-$VERSION.tar.xz
    tar xf texinfo-$VERSION.tar.xz
    mv texinfo-$VERSION texinfo
fi

# cd to the sources and build.
cd texinfo
./configure --prefix=$PWD/..
make clean
make
make install


