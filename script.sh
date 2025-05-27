#!/bin/bash

# Setup script for MCP Server

echo "Setting up MCP Server for Issue Investigation and C++ Execution..."

# Check Python version
python_version=$(python3 --version 2>&1 | awk '{print $2}')
echo "Python version: $python_version"

# Create virtual environment
echo "Creating virtual environment..."
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install requirements
echo "Installing requirements..."
pip install -r requirements.txt

# Check if g++ is installed
if ! command -v g++ &> /dev/null; then
    echo "WARNING: g++ compiler not found. Please install it for C++ compilation features."
    echo "On Ubuntu/Debian: sudo apt-get install g++"
    echo "On macOS: Install Xcode Command Line Tools"
    echo "On Windows: Install MinGW or use WSL"
fi

echo "Setup complete!"
echo ""
echo "To run the server:"
echo "1. Activate virtual environment: source venv/bin/activate"
echo "2. Run the server: python mcp_server.py"
echo ""
echo "For development with MCP Inspector:"
echo "fastmcp dev mcp_server.py"