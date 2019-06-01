#!/bin/bash

# If the bin directory exists, assume we have everything we need and
# don't try to download and build texinfo.

if [ ! -d bin]; then
    if [ ! -d texinfo ]; then
      git clone https://git.savannah.gnu.org/git/texinfo.git
      cd texinfo
   else
      cd texinfo
      git stash; git stadh drop
   fi
   # Check out the desired version
   git checkout 63d8c9102dcb454842330f7477f5c7e38b938aba
   ./autogen.sh
   ./configure --prefix=$PWD/..
   make; make install
fi
