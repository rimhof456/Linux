#!/bin/bash

echo "Updating package list..."
sudo apt update

echo "Installing IPERF..."
sudo apt install -y iperf3
