#!/bin/bash

# Update package list
apt update

# Install curl
apt install curl -y

# Install jq (used for parsing JSON)
apt install jq -y
