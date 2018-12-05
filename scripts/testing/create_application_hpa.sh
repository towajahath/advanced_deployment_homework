#!/usr/bin/env bash

#Create Application Limit Range
oc create -f yaml/app-limit-range.yaml -n tasks-prod

#Create Autoscaler for Tasks-PROD Application
oc autoscale dc/tasks --min 1 --max 5 --cpu-percent=80 -n tasks-prod