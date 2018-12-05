#!/usr/bin/env bash

#Create Hatebreed Users
oc create user Brian
oc create user Betty

#Create Hatebreed Group for the Users
oc adm groups new hatebreed-group Brian Betty
