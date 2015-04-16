#!bin/bash
echo "--------------------------------------------------------------------"
echo ""
echo "LTFHC EMR Maintenance program starting."
echo ""
echo "--------------------------------------------------------------------"
cd ~/ltfhc-maintenance-install
vagrant up
vagrant ssh -- -t node /vagrant/ltfhc-maintenance/index.js
echo "--------------------------------------------------------------------"
echo ""
echo "LTFHC EMR Maintenance program exited."
echo ""
echo "Press a key to exit."
echo ""
echo "--------------------------------------------------------------------"
echo ""
read -n 1 -s