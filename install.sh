#!/bin/bash

echo ""
echo "--------------------------------------------------------------------"
echo " Installing maintenance software."
echo "--------------------------------------------------------------------"
echo ""
cd ~
[ ! -a ~/ltfhc-maintenance-install ] && git clone https://github.com/iilab/ltfhc-maintenance-install.git
cd ltfhc-maintenance-install
[ ! -a ltfhc-maintenance ] && git clone https://github.com/iilab/ltfhc-maintenance.git
[ ! -a ltfhc-config ] && git clone https://github.com/iilab/ltfhc-config.git

while [ ! -a ~/Downloads/ltfhc-maintenance.box ]; do
  echo ""
  echo "--------------------------------------------------------------------"
  echo "File ltfhc-maintenance.box doesn't exist in Downloads folder."
  echo "This file is large (>200MB) and will take a long time to transfer,"
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
if [ -a ~/Downloads/ltfhc-maintenance.box ]; then
  echo ""
  echo "--------------------------------------------------------------------"
  echo "Found ltfhc-maintenance.box!"
  echo "--------------------------------------------------------------------"
  echo ""
else
  echo ""
  echo "--------------------------------------------------------------------"
  echo "Missing ltfhc-maintenance.box, the maintenance software will not work."
  echo "--------------------------------------------------------------------"
  echo ""
fi
echo ""
echo "--------------------------------------------------------------------"
echo "Starting virtual machine."
echo "--------------------------------------------------------------------"
echo ""
vagrant add box "~/Downloads/ltfhc-maintenance.box"
vagrant up
echo ""
echo ""
echo ""
echo "----------------------------------"
echo "Installation complete. Press a key to exit."
echo "----------------------------------"
echo ""
read -n 1 -s