#!/usr/bin/env bash

#echo "Copy the updated htpassword.openshift file to /root/htpasswd.openshift"
#cp -f /root/ocp_advanced_deployment_homework/htpasswd.openshift /root/htpasswd.openshift

echo "Copy a new hosts file to /etc/ansible/hosts"
cp -f ../hosts /etc/ansible/hosts

echo "Set the current GUID to generate the inventory"
GUID=`hostname|awk -F. '{print $2}'`
sed -i "s/GUID/$GUID/g" /etc/ansible/hosts
