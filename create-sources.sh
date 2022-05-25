#!/bin/bash

WDIR=$(pwd)

# Clean old sources
mkdir -p sources/
rm -rf sources/*
mkdir -p sources/tela-icon-theme

# Upstream sync
mkdir -p upstream
cd upstream || exit 1

if [ -d Tela-icon-theme ]; then
  rm -rf Tela-icon-theme
fi

git clone https://github.com/vinceliuice/Tela-icon-theme.git

# Install to sources
cd Tela-icon-theme || exit 1
# git checkout fix_broken_links
./install.sh -a -d "${WDIR}/sources/tela-icon-theme"

cd ../../sources || exit 1

# Create source tarball
mkdir -p ../rpmbuild/
rm -rf ../rpmbuild/*.*
tar cfz tela-icon-theme.tar.gz tela-icon-theme
mv tela-icon-theme.tar.gz ../rpmbuild/

# Back to buildroot
cd ../ || exit 1
