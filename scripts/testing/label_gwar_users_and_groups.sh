#!/usr/bin/env bash

#Create Label for GWAR Users
oc label user/andrew client=gwar
oc label user/amy client=gwar

#Create Label for GWAR Group
oc label group/gwar-group client=gwar