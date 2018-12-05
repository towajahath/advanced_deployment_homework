#!/usr/bin/env bash

#Create Smoke Test Project
oc new-project smoke-test
#Add the NodeJS Mongo Application
oc new-app nodejs-mongo-persistent
#Check the status of the pods
oc get pods
#Wait for the Pods to be ready for testing
echo Waiting for pods to complete...
while [ ! `oc get pods | grep 'nodejs.*build.*Completed'` ]
do
	sleep 30
	echo Still Waiting...
done

#Check the status of the pods again
echo ############Pods################
oc get pods
echo ################################
#Check the Persistent Volume Claim for the Application
echo ############PVC#################
oc get pvc
echo ################################
#Check the Service Routes for the Application
echo ############Route###############
oc get route
echo ################################
#Get the URL for the Application with the Project's oc status command
URL=`oc status | grep http: | awk '{print $1}'`
echo Smoke Test of the URL: $URL
#Open URL to verify
curl $URL > /root/ocp_advanced_deployment_homework/logs/curl-smoke-test.log 2>&1

#Delete the Smoke Test Project
#oc delete project smoke-test
