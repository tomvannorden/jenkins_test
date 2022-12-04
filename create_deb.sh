#!/bin/bash

#Variables
declare version="3.4-1"

#Commands
mkdir "helloworld_${version}_arm64"

mkdir -p "helloworld_${version}_arm64/hello"

echo hello > ~/hello.txt

cp ~/hello.txt "helloworld_${version}_arm64/hello"

rm ~/hello.txt

mkdir "helloworld_${version}_arm64/DEBIAN"

touch "helloworld_${version}_arm64/DEBIAN/control"

cat <<EOT >> "helloworld_${version}_arm64/DEBIAN/control"
Package: hello
Version: $version
Architecture: amd64
Maintainer: tnor_test
Description: A program that greets you.
EOT

dpkg-deb --build --root-owner-group "helloworld_${version}_arm64"

rm -rf "helloworld_${version}_arm64"
