#!/bin/bash

wget https://github.com/bell-sw/Liberica/releases/download/11.0.5/bellsoft-jdk11.0.5-linux-arm32-vfp-hflt.tar.gz
tar xzf bellsoft-jdk11.0.5-linux-arm32-vfp-hflt.tar.gz
./jdk-11.0.5/bin/jlink --add-modules java.base,java.desktop,java.logging,java.net.http,jdk.crypto.cryptoki --compress=2 --no-header-files --no-man-pages --output ./src/main/deb/jdk
#mvn clean deploy
