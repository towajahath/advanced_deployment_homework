#!/usr/bin/env bash

#Create Jenkins Project - cicd-dev
oc new-project cicd-dev --display-name='CICD-DEV' --description='Jenkins Project for CICD Workflow'

#Label the CICD-DEV Project
oc label namespace cicd-dev name=jenkins

#Remove the Default Network Policies
oc delete networkpolicy allow-from-default-namespace allow-from-same-namespace default-deny-all

#Remove the Default Limit Range
oc delete limitrange limits

#Create the Jenkins Persistent Application
#oc create -f yaml/project-limit-range.yaml
#oc new-app jenkins-persistent
oc new-app jenkins-persistent --param ENABLE_OAUTH=true --param MEMORY_LIMIT=2Gi --param VOLUME_CAPACITY=4Gi --param DISABLE_ADMINISTRATIVE_MONITORS=true

#Create the Tasks-Build Project
oc new-project tasks-build --display-name='Tasks Build' --description='Tasks Build Project'

#Remove the Default Network Policies
oc delete networkpolicy allow-from-default-namespace allow-from-same-namespace default-deny-all -n tasks-build

#Remove the Default Limit Range
oc delete limitrange limits -n tasks-build

#Create the Tasks-DEV Project
oc new-project tasks-dev --display-name='Tasks DEV' --description='Tasks DEV Project'

#Remove the Default Network Policies
oc delete networkpolicy allow-from-default-namespace allow-from-same-namespace default-deny-all -n tasks-dev

#Remove the Default Limit Range
oc delete limitrange limits -n tasks-dev

#Create the Tasks-TEST Project
oc new-project tasks-test --display-name='Tasks TEST' --description='Tasks TEST Project'

#Remove the Default Network Policies
oc delete networkpolicy allow-from-default-namespace allow-from-same-namespace default-deny-all -n tasks-test

#Remove the Default Limit Range
oc delete limitrange limits -n tasks-test

#Create the Tasks-PROD Project
oc new-project tasks-prod --display-name='Tasks PROD' --description='Tasks PROD Project'

#Remove the Default Network Policies
oc delete networkpolicy allow-from-default-namespace allow-from-same-namespace default-deny-all -n tasks-prod

#Remove the Default Limit Range
oc delete limitrange limits -n tasks-prod

#Add the Policy for the Jenkings Service Account
oc policy add-role-to-user edit system:serviceaccount:cicd-dev:jenkins -n tasks-build
oc policy add-role-to-user edit system:serviceaccount:cicd-dev:jenkins -n tasks-dev
oc policy add-role-to-user edit system:serviceaccount:cicd-dev:jenkins -n tasks-test
oc policy add-role-to-user edit system:serviceaccount:cicd-dev:jenkins -n tasks-prod









