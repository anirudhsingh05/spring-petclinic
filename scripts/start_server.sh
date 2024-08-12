#!/bin/bash

# Change to the application directory
echo "Changing directory to /home/ubuntu/target..."
cd /home/ubuntu/

# Start the application server
echo "Starting the server..."
java -jar /target/*.jar > /dev/null 2>&1 &

echo "Server started successfully."
