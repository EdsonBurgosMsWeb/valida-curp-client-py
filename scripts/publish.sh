#!/bin/bash

# Script to build and publish the package to PyPI

set -e

echo "Building the package..."

# Clean previous builds
rm -rf build/
rm -rf dist/
rm -rf *.egg-info/

# Build the package
python -m build

echo "Package built successfully!"

# Check the package
echo "Checking the package..."
twine check dist/*

# Upload to Test PyPI first (optional)
read -p "Upload to Test PyPI first? (y/n): " test_upload
if [ "$test_upload" = "y" ]; then
    echo "Uploading to Test PyPI..."
    twine upload --repository testpypi dist/*
    echo "Uploaded to Test PyPI!"
    echo "You can install with: pip install --index-url https://test.pypi.org/simple/ valida-curp"
    read -p "Continue with PyPI upload? (y/n): " continue_upload
    if [ "$continue_upload" != "y" ]; then
        echo "Stopping here."
        exit 0
    fi
fi

# Upload to PyPI
echo "Uploading to PyPI..."
twine upload dist/*

echo "Package published successfully to PyPI!"
echo "You can now install with: pip install valida-curp"