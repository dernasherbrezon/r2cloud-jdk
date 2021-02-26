#!/bin/bash

wget https://download.bell-sw.com/java/11.0.10+9/bellsoft-jdk11.0.10+9-linux-amd64.tar.gz
tar xzf bellsoft-jdk11.0.10+9-linux-amd64.tar.gz
./jdk-11.0.10/bin/jlink --add-modules java.base,java.desktop,java.logging,java.net.http,jdk.crypto.cryptoki --compress=2 --no-header-files --no-man-pages --output ./src/main/deb/jdk
#mvn clean deploy
