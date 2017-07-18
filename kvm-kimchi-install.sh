#!/bin/bash

apt update
apt upgrade

# KVM
apt install qemu qemu-kvm libvirt-bin

# Nginx
apt install nginx

# KIMCHI
apt install python-cherrypy3 python-jsonschema python-m2crypto nginx python-ldap python-psutil fonts-font-awesome texlive-fonts-extra python-configobj python-parted sosreport python-imaging websockify novnc nfs-common python-ethtool open-iscsi python-guestfs libguestfs-tools spice-html5 python-paramiko
wget http://kimchi-project.github.io/wok/downloads/latest/wok.noarch.deb
wget http://kimchi-project.github.io/gingerbase/downloads/latest/ginger-base.noarch.deb
wget http://kimchi-project.github.io/kimchi/downloads/latest/kimchi.noarch.deb 

# INSTALL
dpkg -i wok.noarch.deb 
apt install -f
dpkg -i wok.noarch.deb 
dpkg -i ginger-base.noarch.deb
apt install -f
dpkg -i ginger-base.noarch.deb
dpkg -i kimchi.noarch.deb
apt install -f
dpkg -i kimchi.noarch.deb

# Reload WOK
systemctl daemon-reload
systemctl restart wokd

# End dialog
echo " "
echo "*************************************"
echo " Kimchi is on https://localhost:8001 "
echo "*************************************"