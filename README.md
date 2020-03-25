# gke-kubectl-action
A Github Action which can be used to authenticate with Google Cloud Kubernetes Engine with the updated kube-config set up for you to `kubectl` actions on the `GKE` cluster.

To use this action, make sure you have created a GCP service account having the proper permissions given to it.

## Usage

## Example pipeline

```yaml
name: Deploy App on GKE cluster.
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: actions-hub/gke-kubectl-action@v1.01
        env:
            PROJECT_ID: test
            APPLICATION_CREDENTIALS: ${{ secrets.GOOGLE_APPLICATION_CREDENTIALS }}
            CLUSTER_NAME: ${{ secrets.GKE_CLUSTER_NAME }}
            ZONE_NAME: us-central1-a
        with:
            args: ["apply", "-f", "packaging/k8s/manifests/app.yaml"]
```
