#!/bin/bash
# Author: Rafael Lopes

installdir="/home/pi/SysprePi"
if [ -d "$installdir" ]; then
  rm /etc/rc.local
  sudo ln -s $installdir/linux-files/rc.local /etc/rc.local
else
  echo "Directory $installdir does not exist. Aborting..."
  exit 1
fi
