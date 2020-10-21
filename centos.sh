#!/bin/bash

# Disable tsflags=nodocs to enable man pages
# https://unix.stackexchange.com/a/525250
sed -i -e '/tsflags=nodocs/s/^/#/' /etc/yum.conf /etc/dnf/dnf.conf || true

# Setup updated epel-release package for additional repository
yum -y updateinfo
yum -y install epel-release
yum -y updateinfo
yum -y install epel-release
yum -y updateinfo

# Enable man pages
yum -y install man-pages man-db man
# Update man pages db
mandb

# Install useful tools
yum -y install tmux htop vim glances

# Reinstall packages to enable its man-pages
yum -y reisntall git

# Setup SSH Server
#yum -y reinstall openssh-server openssh-clients

