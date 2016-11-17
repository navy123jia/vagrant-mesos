#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Make sure dpkg / debconf does NOT try to ask questions...
export DEBIAN_FRONTEND=noninteractive

# Create a Mesos app directory.
sudo mkdir -p /opt/mesos
sudo chown vagrant:vagrant /opt/mesos
cd /opt/mesos

# Update the packages cache.
sudo apt-get update

# Upgrade the system packages.
sudo apt-get dist-upgrade -fy

# Install a few utility tools.
sudo apt-get install -y tar wget git

# Fetch the latest release of Mesos.
wget http://www.apache.org/dist/mesos/1.1.0/mesos-1.1.0.tar.gz
tar -zxf mesos-1.1.0.tar.gz

# Install the latest OpenJDK.
sudo apt-get install -y openjdk-7-jdk

# Install autotools (Only necessary if building from git repository).
sudo apt-get install -y autoconf libtool

# Install other Mesos dependencies.
sudo apt-get -y install build-essential python-dev libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev

# Build Mesos.
cd mesos-1.1.0

# Configure and build.
mkdir build
cd build
../configure
make
