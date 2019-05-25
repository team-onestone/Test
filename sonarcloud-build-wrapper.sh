#!/bin/bash

echo "UPDATING THE TRAVIS RUNNER"
apt update && apt upgrade -y

echo "INSTALLING SONAR CUBE SANNER & WRAPPER"
mkdir sonarqube && cd sonarqube

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip
wget https://sonarcloud.io/static/cpp/build-wrapper-linux-x86.zip

unzip sonar-scanner-cli-3.3.0.1492-linux.zip
unzip build-wrapper-linux-x86.zip
export PATH=$PATH:/home/travis/team-onestone/Test/sonarqube/sonar-scanner-3.3.0.1492-linux/bin
export PATH=$PATH:/home/travis/team-onestone/Test/sonarqube/unzip build-wrapper-linux-x86
cd ..

echo "RUNNING SONARCLOUD BUILD WRAPPER"
build-wrapper-linux-x86 --out-dir bw-outputs ./build.sh

echo "RUNNING SONARCLOUD SCANNER"
sonar-scanner-3.3.0.1492-linux \
-Dsonar.login=$SONAR_TOKEN
