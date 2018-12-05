#!/usr/bin/env bash

#Create Project for Common and select the Node
#oc adm new-project common-project --node-selector='client=common' --display-name='Common' --description='Dedicated Node for Common'
oc new-project common-project --display-name='Common' --description='Dedicated Node for Common'

#Create the Label for the Project
oc label namespace common-project client=common

#Create the Annotation for the Node of the Project
oc annotate namespace common-project openshift.io/node-selector='client=common'

#Add Common Group to be Edit Role of common-project
oc adm policy add-role-to-group edit common-group -n common-project

#Smoke Test Application for Common Project
oc new-app nodejs-mongo-persistent -n common-project