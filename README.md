# ltfhc-maintenance

Builds a maintenance virtual machine for LTFHC in order to:
 - Download data
 - Run diagnostics
 - Upgrade sotfware and configuration

## Prerequisite
  * Virtual Box 4.3.26
  * Vagrant 1.7.2+
  * Putty 0.64
  * Git 1.9.5 http://git-scm.com/downloads

## Instructions

### Preparing the maintenance environment

 - Prerequisite: Download and install Virtual Box, Vagrant, Putty and Git.
 - Install: Run install.sh file, which will:
     * Download vagrant box (which includes ansible, ltfhc-maintenance and ltfhc-config)
     * Download (Git pull) the latest versions of ```ltfhc-maintenance``` and ```ltfhc-config```.

## Update

 - Run ```./update.bat``` which will:
    * Git pull the latest version of ```ltfhc-maintenance``` and ```ltfhc-config```.

## Operation

 - Run: Double click icon on ```run.bat```.
 - Operate: Use arrows and enter key.
 - Report: Drag and drop log file in email.
