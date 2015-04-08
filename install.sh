#!/bin/bash
clear
echo ""
echo "--------------------------------------------------------------------"
echo ""
echo " Installing maintenance software."
echo ""
echo "--------------------------------------------------------------------"
echo ""
cd ~
[ ! -e ~/ltfhc-maintenance-install ] && git clone https://github.com/iilab/ltfhc-maintenance-install.git
cd ltfhc-maintenance-install
if [ ! -e ltfhc-maintenance ]; then
   git clone https://github.com/iilab/ltfhc-maintenance.git
else
   cd ~/ltfhc-maintenance-install/ltfhc-maintenance;
   git pull;
fi
if [ ! -e ltfhc-config ]; then
   git clone https://github.com/iilab/ltfhc-config.git
else
   cd ~/ltfhc-maintenance-install/ltfhc-config
   git pull;
fi
while [[ ! -n $(find ~/Downloads/ltfhc-maintenance -size 400000k) ]]; do
  echo ""
  echo "--------------------------------------------------------------------"
  echo "File ltfhc-maintenance.box doesn't exist in Downloads folder."
  echo "This file is large (>400MB) and will take a long time to transfer,"
  echo "if you have this file on portable media, please copy it to the"
  echo "Downloads folder and make sure it is named ltfhc-maintenance.box"
  echo "----------------------------------"
  echo ""
  echo "Would you like to download this file?"
  echo ""
  read -p "y(es)/n(o)/r(etry)? " -n 1 answer
  case $answer in
    y)
      curl -o ~/Downloads/ltfhc-maintenance.box https://iilab.org/tmp/ltfhc-maintenance.box
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
if [[ -n $(find ~/Downloads/ltfhc-maintenance -size 400000k) ]]; then
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
/C/Program \Files/Oracle/VirtualBox/VBoxManage.exe list bridgedifs
echo ""
echo "--------------------------------------------------------------------"
echo "Starting virtual machine."
echo "--------------------------------------------------------------------"
echo ""
vagrant box add "~/Downloads/ltfhc-maintenance.box"
vagrant up
echo ""
echo ""
echo "--------------------------------------------------------------------"
echo "Testing installation."
echo "--------------------------------------------------------------------"
echo ""

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