#!/usr/bin/env bash

# download gcp json credential file
gsutil cp gs://my-gcp-keys/devops.json ./consul-config-loader-svc

# activate servoice account
gcloud auth activate-service-account --key-file ./consul-config-loader-svc/devops.json

# download gke credentials 
gcloud container clusters get-credentials devops --zone us-east1-b --project devops-12232018

# install jenkins chart
helm install --name consul-config-loader ./consul-config-loader-svc/consul-config-loader