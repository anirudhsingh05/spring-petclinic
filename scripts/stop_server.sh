#!/bin/bash

# Find and kill the Java process
echo "Stopping the server..."
pkill -f "java -jar spring-petclinic-3.3.0-SNAPSHOT.jar"

# Optional: Confirm server has stopped
echo "Checking server status..."
curl -I localhost:8080 || echo "Server stopped."

echo "Server stopped successfully."
