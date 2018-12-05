#!/usr/bin/env bash

#Create Label for Hatebreed Users
oc label user/brian client=hatebreed
oc label user/betty client=hatebreed

#Create Label for Hatebreed Group
oc label group/hatebreed-group client=hatebreed