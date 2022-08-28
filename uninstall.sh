#!/bin/sh
source ./base.sh
if [ "$(whoami)" != "root" ]; then
    echo "$appName: please run as root!"
    exit 1
fi


if ! [ -d $runitDir/$appName ]; then
    echo "$appName: not installed!"
    exit 1
else
    rm -rfv $runitDir/$appName
    echo "$appName: success uninstalled!"
fi