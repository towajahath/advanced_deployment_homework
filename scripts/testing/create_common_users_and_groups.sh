#!/usr/bin/env bash

#Create Common Users
oc create user Chuck
oc create user Carl

#Create Common Group for the Users
oc adm groups new common-group Chuck Carl
