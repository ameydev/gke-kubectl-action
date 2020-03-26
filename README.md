# gke-kubectl-action
A Github Action which can be used to deploy your application by performing `kubectl` actions on the `GKE` cluster.

To use this action, make sure you have created a GCP service account having the necessary permissions given to it.

## Usage

## Deploy your app when a release is created

```yaml
name: Deploy App on GKE cluster.
on:
  release:
    types: [created]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: kubectl - Google Cloud GKE cluster.
      uses: ameydev/gke-kubectl-action@master
      env:
        PROJECT_ID: ${{ secrets.PROJECT_ID }}
        APPLICATION_CREDENTIALS: ${{ secrets.GOOGLE_APPLICATION_CREDENTIALS }}
        CLUSTER_NAME: ${{ secrets.GKE_CLUSTER_NAME }}
        ZONE_NAME: us-central1-c
      with:
        args: apply -f packaging/k8s/manifests/ -n prod
```

## Deploy your app when a feature is merged to master

```yaml
name: Deploy App on GKE cluster.
on:
  push:
    branches:
      - master
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: kubectl - Google Cloud GKE cluster.
      uses: ameydev/gke-kubectl-action@master
      env:
        PROJECT_ID: ${{ secrets.PROJECT_ID }}
        APPLICATION_CREDENTIALS: ${{ secrets.GOOGLE_APPLICATION_CREDENTIALS }}
        CLUSTER_NAME: ${{ secrets.GKE_CLUSTER_NAME }}
        ZONE_NAME: us-central1-c
      with:
        args: apply -f packaging/k8s/manifests/ -n staging
```
