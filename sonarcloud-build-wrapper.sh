#!/bin/bash
echo "RUNNING SONARCLOUD BUILD WRAPPER"

mkdir build-wrapper
cd build-wrapper
wget https://sonarcloud.io/static/cpp/build-wrapper-linux-x86.zip
unzip build-wrapper-linux-x86.zip
cd ..

./build-wrapper/build-wrapper-linux-x86/build-wrapper-linux-x86-64 --out-dir bw-outputs ./build.sh
