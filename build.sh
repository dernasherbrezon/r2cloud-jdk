#!/bin/bash

PACKAGE_VERSION=$1
MAJOR_VERSION=$(echo ${PACKAGE_VERSION} | cut -d'+' -f 1)
CURRENT_ARCH=$2

if [ "$CURRENT_ARCH" = "armhf" ]
then
	SUFFIX="arm32-vfp-hflt"
elif [ "$CURRENT_ARCH" = "amd64" ]
then
	SUFFIX="amd64"
else
	echo "unknown arch: ${CURRENT_ARCH}"
	exit 1
fi

wget https://download.bell-sw.com/java/${PACKAGE_VERSION}/bellsoft-jdk${PACKAGE_VERSION}-linux-${SUFFIX}.tar.gz
echo "extracting..."
tar xzf bellsoft-jdk${PACKAGE_VERSION}-linux-${SUFFIX}.tar.gz
echo "building..."
./jdk-${MAJOR_VERSION}/bin/jlink --add-modules java.base,java.desktop,java.logging,java.net.http,jdk.crypto.cryptoki,java.management --compress=2 --no-header-files --no-man-pages --output ./src/main/deb/jdk
