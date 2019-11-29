#!/bin/bash
cd /etc/udev/rules.d/
sudo touch can_usb.rules
sudo echo 'ACTION=="add",SUBSYSTEM=="usb",ATTRS{idVendor}=="1a86",ATTRS{idProduct}=="7523",MODE:="0777",SYMLINK+="usb"' >> can_usb.rules
sudo chmod 777 /dev/ttyUSB0
