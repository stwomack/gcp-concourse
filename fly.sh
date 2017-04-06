#!/usr/bin/env bash

fly -t lite login -u concourse -p changeme -c http://104.154.86.251:8080
fly -t lite set-pipeline -p deploy-pcf -c pipeline.yml -l .params.yml
fly -t lite unpause-pipeline --pipeline deploy-pcf