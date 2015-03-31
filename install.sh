#!/bin/bash

echo "Downloading maintenance software."
cd ~
git clone https://github.com/iilab/ltfhc-maintenance-install.git
cd ltfhc-maintenance-install
git clone https://github.com/iilab/ltfhc-maintenance.git
git clone https://github.com/iilab/ltfhc-config.git
while [ ! [-a ~/Downloads/ltfhc-maintenance.box] ]; do
    echo "File ltfhc-maintenance.box doesn't exist in Downloads folder."
    echo "This file is large (>200MB) and will take a long time to transfer,"
    echo "if you have this file on portable media, please copy it to the"
    echo "Downloads folder and make sure it is named ltfhc-maintenance.box"
    echo "-----"
    echo "Would you like to download this file?"
    read -p "y(es)/n(o)/r(etry)? " -n 1 answer
  fi
  case $answer in
    y)
      curl -o ~/Downloads/ltfhc-maintenance.box https://iilab.org/tmp/ltfhc-maintenance.box
      continue
    n)
      break
    r) 
      continue
done
if [-a ~/Downloads/ltfhc-maintenance.box]; then
  echo "Found ltfhc-maintenance.box!"
else
  echo "Missing ltfhc-maintenance.box, the maintenance software will not work."
fi
echo "Starting virtual machine."
vagrant add box "~/Downloads/ltfhc-maintenance.box"
vagrant up
echo "Installation complete. Press a key to exit."
read -n 1 -s