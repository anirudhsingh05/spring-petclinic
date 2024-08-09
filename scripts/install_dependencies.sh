#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update

# Install Ruby and other packages
echo "Installing Ruby, wget, and unzip..."
sudo apt install -y ruby-full wget unzip

# Install default JRE
echo "Installing default JRE..."
sudo apt install -y default-jre

# Install OpenJDK 17
echo "Installing OpenJDK 17..."
sudo apt install -y openjdk-17-jdk

# Install AWS CLI
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install unzip utility
echo "Installing unzip utility..."
sudo apt install -y unzip

echo "Dependencies installed successfully."
