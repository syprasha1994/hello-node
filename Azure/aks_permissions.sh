#!/bin/bash

AKS_RESOURCE_GROUP=testrg
AKS_CLUSTER_NAME=testkube
ACR_RESOURCE_GROUP=testrg
ACR_NAME=sateco2

# Get the id of the service principal configured for AKS
CLIENT_ID=$(az aks show --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --query "servicePrincipalProfile.clientId" --output tsv)

# Get the ACR registry resource id
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $ACR_RESOURCE_GROUP --query "id" --output tsv)

# Create role assignment
az role assignment create --assignee $CLIENT_ID --role Owner --scope $ACR_ID
