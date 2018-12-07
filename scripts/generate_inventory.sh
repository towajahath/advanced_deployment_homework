#!/usr/bin/env bash

echo "Copy a new hosts file to /etc/ansible/hosts"
cp /root/advanced_deployment_homework/hosts /etc/ansible/hosts

# exports GUID line to .bashrc only once even if run multiple times
if ! grep --quiet GUID $HOME/.bashrc; then 
   export GUID=`hostname | cut -d"." -f2`; echo "export GUID=$GUID" >> $HOME/.bashrc
fi

source $HOME/.bashrc

echo "Set the current GUID to generate the inventory"
sed -i "s/GUID/$GUID/g" /etc/ansible/hosts
ansible all -m shell -a 'export GUID=`hostname | cut -d"." -f2`; echo "export GUID=$GUID" >> $HOME/.bashrc'