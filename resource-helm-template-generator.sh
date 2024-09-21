#!/bin/bash

# Check if chart name is provided
if [ -z "$1" ]; then
  echo "Please provide the chart directory name!"
  exit 1
fi

CHART_NAME=$1

# Run the Helm template command with the dynamic chart name
helm template argocd/helm/${CHART_NAME} -f argocd/helm/global-values.yaml -f argocd/helm/${CHART_NAME}/values.yaml > rendered-resources/${CHART_NAME}.yaml
