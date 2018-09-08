#!/bin/bash

BASEDIR=$(dirname "$0")
apikey=$(cat $BASEDIR/apikey.txt)
[ -f /proc/cpuinfo ] && sn=$(cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2) || sn="none"
snr="${sn: -5}"
wifiip=$(ip addr | grep inet | grep wlan0 | awk -F" " '{print $2}'| sed -e 's/\/.*$//')
[ -f $BASEDIR/wifiip.txt ] && previousip=$(cat $BASEDIR/wifiip.txt) || previousip=""

date

if [ "$wifiip" != "$previousip" ]
  then
    echo "New wifi IP addr detected: $wifiip"
    curl -X PUT -H "X-API-Key: $apikey" "https://jn7b4963df.execute-api.us-east-1.amazonaws.com/prod/upsert?ip=$wifiip&name=$snr"
    echo $wifiip > $BASEDIR/wifiip.txt
  else
    echo "IP addr not modified"
fi
