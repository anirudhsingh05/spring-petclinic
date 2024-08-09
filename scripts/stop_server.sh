#!/bin/bash

# Echo a message for logging
echo "Stopping Apache server"

# Stop the Apache service
sudo systemctl stop httpd

# Check if the Apache service stopped successfully
if ! systemctl is-active --quiet httpd; then
    echo "Apache has stopped successfully"
    exit 0
else
    echo "Apache failed to stop"
    exit 1
fi

