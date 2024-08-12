#!/bin/bash

check = $(ps aux | grep spring-petclinic-3.3.0-SNAPSHOT.jar)

if [[$check -eq 0]]; then
    echo "Application is running"
    pkill -f spring-petclinic-3.3.0-SNAPSHOT.jar
    exit 0
else
    echo "failed to stop"
    exit 1
fi
