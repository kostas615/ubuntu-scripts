#!/bin/bash

# Update Software
apt update
apt upgrade

# Install GUI
apt install xorg 
apt install lightdm-gtk-greeter
apt install lightdm
apt install lxde-core
apt install lxpolkit #pkexec can't run without it
apt install lxsession-logout #logout button doesn't work without it

# ~ Snapshot: MAIN-SNAPSHOT ~

# Print End Dialog
echo " "
echo "***********************"
echo "* ~ GUI Installed ~   *"
echo "*   Please restart!   *"
echo "***********************"
