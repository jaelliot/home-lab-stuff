#!/bin/bash

# Update system and install necessary packages
echo "Updating the system and installing necessary packages..."
sudo apt-get update && sudo apt-get upgrade -y

# Install necessary dependencies for VMware Workstation
echo "Installing build-essential, dkms, and linux headers..."
sudo apt-get install -y build-essential dkms linux-headers-$(uname -r)

# Check if Secure Boot is enabled
echo "Checking if Secure Boot is enabled..."
if [ -d "/sys/firmware/efi" ]; then
    echo "Secure Boot may be enabled. Consider disabling it in BIOS if you encounter module signature issues."
else
    echo "Secure Boot is not enabled."
fi

# Clean up
echo "Cleaning up..."
sudo apt-get autoremove -y
sudo apt-get clean

echo "Pre-installation steps are complete. You can now install VMware Workstation."
