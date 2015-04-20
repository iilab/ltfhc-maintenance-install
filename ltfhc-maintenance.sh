#!bin/bash
clear
echo "--------------------------------------------------------------------"
echo ""
echo "LTFHC EMR Maintenance program starting."
echo ""
echo "--------------------------------------------------------------------"
MAINTENANCE_HOME="."
#MAINTENANCE_HOME=~/ltfhc-maintenance-install
cd $MAINTENANCE_HOME
if [ ! -e $MAINTENANCE_HOME/kansorc ]; then
  echo "--------------------------------------------------------------------"
  echo ""
  echo "ERROR: kansorc file missing in the ltfhc-maintenance-install directory."
  echo ""
  echo "Copy the file and restart this script. Press a key to exit."
  echo ""
  echo "--------------------------------------------------------------------"
  echo ""
  read -n 1 -s
  exit 1
fi
if [ ! -e $MAINTENANCE_HOME/hosts_lan ] && [ ! -e $MAINTENANCE_HOME/hosts_wifi ]; then
  echo "--------------------------------------------------------------------"
  echo ""
  echo "ERROR: hosts_lan and hosts_wifi files missing in the ltfhc-maintenance-install directory."
  echo ""
  echo "Copy the files and restart this script. Press a key to exit."
  echo ""
  echo "--------------------------------------------------------------------"
  echo ""
  read -n 1 -s
  exit 1
fi
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