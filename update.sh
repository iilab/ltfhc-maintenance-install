#!/bin/bash
#
# This script is meant to be ran under the Git for Windows bash shell command line
#
clear
git config --system core.autocrlf false
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
   read -n 1 -s
   exit 1;
else
   cd ~/ltfhc-maintenance-install;
   git fetch
   if [[ `git diff-index --name-only origin/master` == *"update.sh"* ]]; then
     git pull;
     echo "The update script has been updated and will be restarted. Press any key to restart.";
     read -n 1 -s
     exec ~/ltfhc-maintenance-install/update.sh;
   fi
   git pull;
fi
if [ ! -e ltfhc-maintenance ]; then
   echo "Error please run the installation script before attempting to update.";
   read -n 1 -s
   exit 1;
else
   cd ~/ltfhc-maintenance-install/ltfhc-maintenance;
   git pull;
fi
cd ~/ltfhc-maintenance-install;
if [ ! -e ltfhc-config ]; then
   echo "Error please run the installation script before attempting to update.";
   read -n 1 -s
   exit 1;
else
   cd ~/ltfhc-maintenance-install/ltfhc-config
   git pull;
fi
cd ~/ltfhc-maintenance-install;   
if [ ! -e ltfhc-next ]; then
   echo "Error please run the installation script before attempting to update.";
   read -n 1 -s
   exit 1;
else
   cd ~/ltfhc-maintenance-install/ltfhc-next
   git pull;
fi
cp ~/Documents/kansorc.txt ~/ltfhc-maintenance-install/ltfhc-next/.kansorc
while [[ `md5sum.exe ~/Documents/ltfhc-maintenance.box | awk '{split($0,array," ")} END{print array[1]}'` != b3b85b61b23733940b7abd9fa52593b0 ]]; do
  echo ""
  echo "--------------------------------------------------------------------"
  echo "Out of date or missing ltfhc-maintenance.box in Documents folder."
  echo ""
  echo "This file is large (>400MB) and will take a long time to transfer,"
  echo "if you have this file on portable media, please copy it to the"
  echo "Documents folder and make sure it is named ltfhc-maintenance.box"
  echo "----------------------------------"
  echo ""
  echo "Would you like to download this file?"
  echo ""
  read -p "y(es)/n(o)/r(etry)? " -n 1 answer
  echo ""
  case $answer in
    y)
      curl --progress-bar -o ~/Documents/ltfhc-maintenance.box https://iilab.org/tmp/ltfhc-maintenance.box
      box_updated=true 
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
if [[ `md5sum.exe ~/Documents/ltfhc-maintenance.box | awk '{split($0,array," ")} END{print array[1]}'` == b3b85b61b23733940b7abd9fa52593b0 ]]; then
  echo ""
  echo "--------------------------------------------------------------------"
  echo "Found up to date ltfhc-maintenance.box!"
  echo "--------------------------------------------------------------------"
  echo ""
  cd ~/ltfhc-maintenance-install
  if [ "$box_updated" = true ] ; then
    echo ""
    echo "--------------------------------------------------------------------"
    echo "Updated, reloading virtual machine."
    echo "--------------------------------------------------------------------"
    echo ""
    vagrant box add "~/Documents/ltfhc-maintenance.box" --force --name ltfhc-maintenance
    vagrant destroy --force
    vagrant up
  fi
else
  echo ""
  echo "--------------------------------------------------------------------"
  echo "Missing or incomplete ltfhc-maintenance.box, please download again."
  echo "--------------------------------------------------------------------"
  echo ""
  read -n 1 -s
  exit 1
fi
echo ""
echo "--------------------------------------------------------------------"
echo "Updating desktop shortcut and configuration files."
echo "--------------------------------------------------------------------"
echo ""
rm ~/Desktop/ltfhc-maintenance.sh;
ln -s ~/ltfhc-maintenance-install/ltfhc-maintenance.sh ~/Desktop/ltfhc-maintenance.sh;
cp ~/ltfhc-maintenance-install/update.sh ~/Desktop/ltfhc-update.sh
cp ~/ltfhc-maintenance-install/install.sh ~/Desktop/install.sh
cp ~/Documents/kansorc.txt ~/ltfhc-maintenance-install/ltfhc-next/.kansorc
cp ~/Documents/hosts_wifi.txt ~/ltfhc-maintenance-install/hosts_wifi
cp ~/Documents/hosts_lan.txt ~/ltfhc-maintenance-install/hosts_lan
echo ""
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