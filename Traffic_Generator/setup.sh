#!/bin/bash

# Setup script for FIT.py

set -e

echo "Installing Python"
sudo apt update
sudo apt install python3.12-venv
sudo apt install python3-requests-toolbelt
sudo apt install python3-click python3-requests python3-requests-toolbelt python3-selenium

echo "Creating FIT directory and switching to it"
sudo mkdir FIT/
sudo cd FIT/

echo "Creating requirements.txt file"
sudo cat <<EOF > requirements.txt
click>=8.0
requests>=2.28
selenium>=4.10
requests-toolbelt>=0.10
EOF

echo "Cleaning up old virtual environment (if any)..."
sudo rm -rf venv

echo "Fixing permissions on ~/FIT..."
sudo chown -R "$USER:$USER" "$(pwd)"

echo "Creating new virtual environment..."
python3 -m venv venv

echo "Activating virtual environment and upgrading pip..."
source venv/bin/activate
pip install --upgrade pip

echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

echo ""
echo "✅ Setup complete!"
echo "To activate your environment manually, run:"
echo "    source venv/bin/activate"
echo ""
echo "To run the tool:"
echo "    python FIT.py all --srcip <your-ip>"

