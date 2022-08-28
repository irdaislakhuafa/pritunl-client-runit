#!/bin/sh
source ./base.sh
if [ "$(whoami)" != "root" ]; then
    echo "$appName: please run as root!"
    exit 1
fi

if [ -d $runitDir/$appName ]; then
    echo "$appName: already installed!"
else
    mkdir -v $runitDir/$appName
    service="$(command -v $appService)"
    if [ "$service" == "" ]; then
        echo "$appName: please install pritunl-client first!"
        exit 1
    else
        mkdir -v $runitDir/$appName/supervise
        chmod 700 -v $runitDir/$appName/supervise
        echo "#!/bin/bash" > $runitDir/$appName/run
        echo "$service" >> $runitDir/$appName/run
        
        chmod 755 -v $runitDir/$appName/run
    fi
fi