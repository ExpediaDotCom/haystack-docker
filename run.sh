#!/usr/bin/env bash
COUNT=0
URL=$1

[[ -z ${URL} ]] && URL=http://localhost:9090/hello

while true
do
    COUNT=$((COUNT+1))
    curl ${URL}
    echo " ${COUNT}"
    sleep 1
done
