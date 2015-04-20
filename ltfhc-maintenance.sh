#!/bin/bash
clear
echo "--------------------------------------------------------------------"
echo ""
echo "LTFHC EMR Maintenance program starting."
echo ""
echo "--------------------------------------------------------------------"
if [ "$MAINTENANCE_HOME" = "" ]; then
  MAINTENANCE_HOME=~/ltfhc-maintenance-install;
fi
cd $MAINTENANCE_HOME
if [ ! -e ~/Documents/kansorc ]; then
  echo "--------------------------------------------------------------------"
  echo ""
  echo "ERROR: kansorc file missing in the Documents folder."
  echo ""
  echo "Copy the file and restart this script. Press a key to exit."
  echo ""
  echo "--------------------------------------------------------------------"
  echo ""
  read -n 1 -s
  exit 1
fi
cp ~/Documents/kansorc.txt ~/ltfhc-maintenance-install/ltfhc-next/.kansorc
if [ ! -e ~/Documents/hosts_lan.txt ] && [ ! -e ~/Documents/hosts_wifi.txt ]; then
  echo "--------------------------------------------------------------------"
  echo ""
  echo "ERROR: hosts_lan.txt and hosts_wifi.txt files missing in the Documents folder."
  echo ""
  echo "Copy the files and restart this script. Press a key to exit."
  echo ""
  echo "--------------------------------------------------------------------"
  echo ""
  read -n 1 -s
  exit 1
fi
cp ~/Documents/hosts_wifi.txt ~/ltfhc-maintenance-install/hosts_wifi
cp ~/Documents/hosts_lan.txt ~/ltfhc-maintenance-install/hosts_lan
vagrant up
vagrant ssh --command "node '/vagrant/ltfhc-maintenance/index.js'" 
echo "--------------------------------------------------------------------"
echo ""
echo "LTFHC EMR Maintenance program exited."
echo ""
echo "Press a key to exit."
echo ""
echo "--------------------------------------------------------------------"
echo ""
read -n 1 -s
