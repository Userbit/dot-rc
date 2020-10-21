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
yum -y install tmux vim
yum -y install htop glances
yum -y install traceroute

# Reinstall packages to enable its man-pages
yum -y reinstall git
git config --global user.email "34487074+Userbit@users.noreply.github.com"
git config --global user.name "Userbit"

# Setup SSH Server
#yum -y reinstall openssh-server openssh-clients

# Setup .rc files
cp ./.vimrc $HOME/
