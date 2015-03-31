#!bin/bash
cd ~/ltfhc-maintenance-install
vagrant up
vagrant ssh --command "node /vagrant/ltfhc-maintenance/index.js"