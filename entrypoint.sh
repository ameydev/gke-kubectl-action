#!/bin/sh

set -e

if [ ! -d "$HOME/.config/gcloud" ]; then
   if [ -z "${APPLICATION_CREDENTIALS-}" ]; then
      echo "APPLICATION_CREDENTIALS not found. Exiting...."
      exit 1
   fi

   if [ -z "${PROJECT_ID-}" ]; then
      echo "PROJECT_ID not found. Exiting...."
      exit 1
   fi

   echo "$APPLICATION_CREDENTIALS" | base64 -d > /tmp/account.json

   gcloud auth activate-service-account --key-file=/tmp/account.json --project "$PROJECT_ID"

fi

echo ::add-path::/google-cloud-sdk/bin/gcloud
echo ::add-path::/google-cloud-sdk/bin/gsutil

# Update kubeConfig.
gcloud container clusters get-credentials "$CLUSTER_NAME" --zone "$CLUSTER_ZONE" --project "$PROJECT_ID"

# verify kube-context
kubectl config current-context

command="kubectl"

if [[ ! $# -eq 0 ]] ; then
    sh -c "$command $*"
fi