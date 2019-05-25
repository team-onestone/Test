#!/bin/bash

echo "INSTALLING SONAR CUBE SANNER & WRAPPER"
mkdir sonarqube && cd sonarqube

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip
wget https://sonarcloud.io/static/cpp/build-wrapper-linux-x86.zip

unzip sonar-scanner-cli-3.3.0.1492-linux.zip
unzip build-wrapper-linux-x86.zip
ls -la

cd sonar-scanner-3.3.0.1492-linux
ls -la
cd bin
ls -la
pwd
cd ../..

cd build-wrapper-linux-x86
ls -la
pwd
cd ..

cd ..

echo "RUNNING SONARCLOUD BUILD WRAPPER"
./sonarqube/build-wrapper-linux-x86/build-wrapper-linux-x86 --out-dir bw-outputs ./build.sh

echo "RUNNING SONARCLOUD SCANNER"
./sonarqube/sonar-scanner-3.3.0.1492-linux/bin/sonar-scanner-3.3.0.1492-linux \
-Dsonar.login=$SONAR_TOKEN
