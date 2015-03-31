# ltfhc-maintenance

Builds a maintenance virtual machine for LTFHC in order to:
 - Download data
 - Run diagnostics
 - Upgrade sotfware and configuration

## Prerequisite
  * Virtual Box
  * Vagrant 1.6.3+
  * Putty
  * Git

## Instructions

### Preparing the maintenance environment

 - Prerequisite: Download and install Virtual Box, Vagrant, Putty and Git.
 - Install: Run install.bat file, which will:
     * Download vagrant box (which includes ansible, ltfhc-maintenance and ltfhc-config)
     * Download (Git pull) the latest versions of ```ltfhc-maintenance``` and ```ltfhc-config```.

## Update

 - Run ```./update.bat``` which will:
    * Git pull the latest version of ```ltfhc-maintenance``` and ```ltfhc-config```.

## Operation

 - Run: Double click icon on ```run.bat```.
 - Operate: Use arrows and enter key.
 - Report: Drag and drop log file in email.
