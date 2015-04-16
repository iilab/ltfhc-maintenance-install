#!/bin/bash
#
# This script is meant to be ran under the Git for Windows bash shell command line.
#
clear
echo ""
echo "--------------------------------------------------------------------"
echo ""
echo " Updating LTFHC EMR maintenance software."
echo ""
echo "--------------------------------------------------------------------"
echo ""
cd ~
if [ ! -e ltfhc-maintenance-install ]; then
   echo "Error please run the installation script before attempting to update.";
   exit 1;
else
   cd ~/ltfhc-maintenance-install;
   git pull;
fi
if [ ! -e ltfhc-maintenance ]; then
   echo "Error please run the installation script before attempting to update.";
   exit 1;
else
   cd ~/ltfhc-maintenance-install/ltfhc-maintenance;
   git pull;
fi
if [ ! -e ltfhc-config ]; then
   echo "Error please run the installation script before attempting to update.";
   exit 1;
else
   cd ~/ltfhc-maintenance-install/ltfhc-config
   git pull;
fi
echo ""
echo "--------------------------------------------------------------------"
echo ""
echo "Update complete."
echo ""
echo "To run the program, double-click on the ltfhc-maintenance shortcut"
echo "on the Desktop."
echo ""
echo "Press a key to exit."
echo ""
echo "--------------------------------------------------------------------"
echo ""
read -n 1 -s
exit 0