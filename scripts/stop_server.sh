#!/bin/bash

# Check if the application is running
check=$(ps aux | grep '[s]pring-petclinic-3.3.0-SNAPSHOT.jar')

# If check is not empty, the application is running
if [ -n "$check" ]; then
    echo "Application is running"
    pkill -f spring-petclinic-3.3.0-SNAPSHOT.jar
    exit 0
else
    echo "Application failed to stop or is not running"
    exit 1
fi
