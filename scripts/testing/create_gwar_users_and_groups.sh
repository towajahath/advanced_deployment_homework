#!/usr/bin/env bash

#Create GWAR Users
oc create user Andrew
oc create user Amy

#Create GWAR Group for the Users
oc adm groups new gwar-group Andrew Amy

