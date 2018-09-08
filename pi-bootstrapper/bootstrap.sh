#!/bin/sh
# Author: Rafael Lopes
# About: For a factory-like experience, this prepares the OS...

/home/pi/SysprePi/pi-bootstrapper/sethostname.sh
> /home/pi/.bash_history
[ -f /home/pi/SysprePi/ip-reporter/wifiip.txt ] && rm /home/pi/SysprePi/ip-reporter/wifiip.txt
su - pi -c "/home/pi/SysprePi/ip-reporter/ipupdater.sh"
