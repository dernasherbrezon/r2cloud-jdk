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
elif [ "$CURRENT_ARCH" = "arm64" ]
then
	SUFFIX="aarch64"
else
	echo "unknown arch: ${CURRENT_ARCH}"
	exit 1
fi

if [ ! -f ./target/bellsoft-jdk${PACKAGE_VERSION}-linux-${SUFFIX}-lite.tar.gz ]; then
	wget --directory-prefix ./target/ https://download.bell-sw.com/java/${PACKAGE_VERSION}/bellsoft-jdk${PACKAGE_VERSION}-linux-${SUFFIX}-lite.tar.gz
fi
target_directory="./target/usr/lib/jvm/r2cloud-jdk"
rm -r ${target_directory}
mkdir -p ${target_directory}
echo "extracting..."
tar xzf ./target/bellsoft-jdk${PACKAGE_VERSION}-linux-${SUFFIX}-lite.tar.gz --directory ${target_directory} --strip-components=1
