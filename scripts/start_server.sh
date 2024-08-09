#!/bin/bash

# Change to the application directory
echo "Changing directory to /home/ubuntu/target..."
cd /home/ubuntu/target/

# Start the application server
echo "Starting the server..."
java -jar spring-petclinic-3.3.0-SNAPSHOT.jar &

# Optional: Check if the server started successfully
echo "Checking server status..."
curl -I localhost:8080

echo "Server started successfully."
