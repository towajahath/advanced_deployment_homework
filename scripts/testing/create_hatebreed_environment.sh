#!/usr/bin/env bash

#Create Project for Hatebreed and select the Node
#oc adm new-project hatebreed-project --node-selector='client=hatebreed' --display-name='Hatebreed' --description='Dedicated Node for Hatebreed'
oc new-project hatebreed-project --display-name='Hatebreed' --description='Dedicated Node for Hatebreed'

#Create the Label for the Project
oc label namespace hatebreed-project client=hatebreed

#Create the Annotation for the Node of the Project
oc annotate namespace hatebreed-project openshift.io/node-selector='client=hatebreed'

#Add Hatebreed Group to be Edit Role of hatebreed-project
oc adm policy add-role-to-group edit hatebreed-group -n hatebreed-project

#Smoke Test Application for Hatebreed Project
oc new-app nodejs-mongo-persistent -n hatebreed-project