#!/bin/bash
echo “Validating Apache service”
if systemctl is-active –quiet apache2; then
    echo “Apache is running”
    exit 0
else
    echo “Apache is not running”
    exit 1
fi

