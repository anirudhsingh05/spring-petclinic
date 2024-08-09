#!/bin/bash

# Echo a message for logging
echo "Starting Apache server"

# Start the Apache service
sudo systemctl start apache2

# Check if the Apache service started successfully
if systemctl is-active --quiet apache2; then
    echo "Apache is running"
    exit 0
else
    echo "Apache failed to start"
    exit 1
fi

