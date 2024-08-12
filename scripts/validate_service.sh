#!/bin/bash

# Check if the server is running
echo "Validating the service..."
curl -I 13.232.91.250:8080 | grep "200 OK"

# Optionally check if the process is running
echo "Checking if the Java process is running..."
ps -ef | grep java 

echo "Service validation complete."
