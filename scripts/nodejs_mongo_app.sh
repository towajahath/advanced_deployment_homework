#!/usr/bin/env bash

echo "Creating project..."
oc new-project smoke-test
echo "Creating App..."
oc new-app nodejs-mongo-persistent
echo "Waiting for complete..."
sleep 180
test=`oc status | grep http: | awk '{print $1}'`
curl $test