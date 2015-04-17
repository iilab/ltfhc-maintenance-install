#!/bin/bash
#
# This script is meant to be ran under the Git for Windows bash shell command line.
#
clear
echo ""
echo "--------------------------------------------------------------------"
echo ""
echo " Installing LTFHC EMR maintenance software."
echo ""
echo "--------------------------------------------------------------------"
echo ""
cd ~
[ ! -e ~/ltfhc-maintenance-install ] && git clone https://github.com/iilab/ltfhc-maintenance-install.git
cd ~/ltfhc-maintenance-install
if [ ! -e ltfhc-maintenance ]; then
   cd ltfhc-maintenance-install
   git clone https://github.com/iilab/ltfhc-maintenance.git
else
   cd ~/ltfhc-maintenance-install/ltfhc-maintenance;
   git pull;
fi
cd ~/ltfhc-maintenance-install
if [ ! -e ltfhc-config ]; then
   git clone https://github.com/iilab/ltfhc-config.git
else
   cd ~/ltfhc-maintenance-install/ltfhc-config
   git pull;
fi
cd ~/ltfhc-maintenance-install
if [ ! -e ltfhc-next ]; then
   git clone --single-branch -b v0.5.0-alpha https://github.com/iilab/ltfhc-next.git
else
   cd ~/ltfhc-maintenance-install/ltfhc-next
   git pull;
fi
while [[ `md5sum.exe ~/ltfhc-maintenance-install/ltfhc-maintenance.box | awk '{split($0,array," ")} END{print array[1]}'` != 8d646c80eb3800a679805a53e301751d ]]; do
  echo ""
  echo "--------------------------------------------------------------------"
  echo "Problem with ltfhc-maintenance.box in ltfhc-maintenance-install folder."
  echo ""
  echo "This file is large (>400MB) and will take a long time to transfer,"
  echo "if you have this file on portable media, please copy it to the"
  echo "ltfhc-maintenance-install folder and make sure it is named ltfhc-maintenance.box"
  echo "----------------------------------"
  echo ""
  echo "Would you like to download this file?"
  echo ""
  read -p "y(es)/n(o)/r(etry)? " -n 1 answer
  echo ""
  case $answer in
    y)
      curl --progress-bar -o ~/ltfhc-maintenance-install/ltfhc-maintenance.box https://iilab.org/tmp/ltfhc-maintenance.box
      continue
      ;;
    n)
      break
      ;;
    r) 
      continue
      ;;
  esac
done
if [[ `md5sum.exe ~/ltfhc-maintenance-install/ltfhc-maintenance.box | awk '{split($0,array," ")} END{print array[1]}'` == 8d646c80eb3800a679805a53e301751d ]]; then
  echo ""
  echo "--------------------------------------------------------------------"
  echo "Found ltfhc-maintenance.box!"
  echo "--------------------------------------------------------------------"
  echo ""
else
  echo ""
  echo "--------------------------------------------------------------------"
  echo "Missing or incomplete ltfhc-maintenance.box, please download again. "
  echo "--------------------------------------------------------------------"
  echo ""
  read -n 1 -s
  exit 1
fi
echo ""
echo "--------------------------------------------------------------------"
echo "Looking up host machine network configuration."
echo "--------------------------------------------------------------------"
echo ""
bridges=`/C/Program \Files/Oracle/VirtualBox/VBoxManage.exe list bridgedifs`
echo $bridges
echo ""
echo "--------------------------------------------------------------------"
echo "Starting virtual machine."
echo "--------------------------------------------------------------------"
echo ""
cd ~/ltfhc-maintenance-install
vagrant box add "~/ltfhc-maintenance-install/ltfhc-maintenance.box" --name ltfhc-maintenance
vagrant up
echo ""
echo ""
echo "--------------------------------------------------------------------"
echo "Installing desktop shortcut."
echo "--------------------------------------------------------------------"
echo ""
ln -s ~/ltfhc-maintenance-install/ltfhc-maintenance.sh ~/Desktop/ltfhc-maintenance.sh
echo ""
echo "--------------------------------------------------------------------"
echo ""
echo "Installation complete."
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