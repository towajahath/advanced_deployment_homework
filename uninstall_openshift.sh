#!/usr/bin/env bash

echo #########################################################
echo #              Uninstall OpenShift v3.11                #
echo #########################################################

#Run the uninstallation
ansible-playbook playbooks/uninstall_openshift.yaml | tee logs/ocp_uninstall.log 2>&1

echo Uninstall has been completed.