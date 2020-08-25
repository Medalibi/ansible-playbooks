#!/bin/sh

DIR=nagioslogserver
DLDIR=nagios-log-server
FILE=nagioslogserver-latest.tar.gz

# Check whether we have sufficient privileges
if [ $(id -u) -ne 0 ]; then
    echo "This script needs to be run as root/superuser." >&2
    exit 1
fi
    
if ! which wget &>/dev/null; then
    yum install wget -y
fi

cd /tmp
echo "check if /tmp/nagioslogserver exists"
rm -rf /tmp/$DIR /tmp/$FILE
if [ ! -d /tmp/$DIR ]; then
    wget https://assets.nagios.com/downloads/$DLDIR/$FILE -O /tmp/$FILE
    tar xzf /tmp/$FILE
fi
cd /tmp/$DIR
chmod +x ./upgrade
echo "Running upgrade"

./upgrade -n
