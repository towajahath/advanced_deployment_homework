#!/usr/bin/env bash

echo #########################################################
echo #              Install OpenShift v3.11                  #
echo #########################################################

#Run the installation
ansible-playbook homework.yaml | tee logs/ocp_install.log 2>&1

echo Installation has been completed.