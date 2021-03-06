#!/bin/bash

echo "INSTALLING SONAR CUBE SANNER & WRAPPER"
mkdir sonarqube && cd sonarqube

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip
wget https://sonarcloud.io/static/cpp/build-wrapper-linux-x86.zip

unzip sonar-scanner-cli-3.3.0.1492-linux.zip
unzip build-wrapper-linux-x86.zip

cd sonar-scanner-3.3.0.1492-linux
cd bin
chmod +x sonar-scanner
cd ../..

cd build-wrapper-linux-x86
chmod +x build-wrapper-linux-x86-64
cd ..

cd ..

echo "RUNNING SONARCLOUD BUILD WRAPPER"
ls -la
chmod +x build.sh
./sonarqube/build-wrapper-linux-x86/build-wrapper-linux-x86-64 --out-dir bw-outputs ./build.sh

echo "RUNNING SONARCLOUD SCANNER"
./sonarqube/sonar-scanner-3.3.0.1492-linux/bin/sonar-scanner \
-Dsonar.login=$SONAR_TOKEN -X
