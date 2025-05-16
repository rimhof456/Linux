#!/bin/bash

# Setup script for FIT.py

set -e

echo "[1/5] Cleaning up old virtual environment (if any)..."
sudo rm -rf venv

echo "[2/5] Fixing permissions on ~/FIT..."
sudo chown -R "$USER:$USER" "$(pwd)"

echo "[3/5] Creating new virtual environment..."
python3 -m venv venv

echo "[4/5] Activating virtual environment and upgrading pip..."
source venv/bin/activate
pip install --upgrade pip

echo "[5/5] Installing dependencies from requirements.txt..."
pip install -r requirements.txt

echo ""
echo "✅ Setup complete!"
echo "To activate your environment manually, run:"
echo "    source venv/bin/activate"
echo ""
echo "To run the tool:"
echo "    python FIT.py all --srcip <your-ip>"
