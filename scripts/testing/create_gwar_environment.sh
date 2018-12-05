#!/usr/bin/env bash

#Create Project for GWAR and select the Node
#oc adm new-project gwar-project --node-selector='client=gwar' --display-name='GWAR' --description='Dedicated Node for GWAR'
oc new-project gwar-project --display-name='GWAR' --description='Dedicated Node for GWAR'

#Create the Label for the Project
oc label namespace gwar-project 'client=gwar'

#Create the Annotation for the Node of the Project
oc annotate namespace gwar-project openshift.io/node-selector='client=gwar'

#Add GWAR Group to be Edit Role of gwar-project
oc adm policy add-role-to-group edit gwar-group -n gwar-project

#Smoke Test Application for GWAR Project
oc new-app nodejs-mongo-persistent -n gwar-project

