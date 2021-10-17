#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Constants
accountid=493412565407
region=us-east-1
tag=1.0
dockerpath=$accountid.dkr.ecr.$region.amazonaws.com/final-udacity-proj:$tag

# Step 1:
# Authenticate docker client
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $accountid.dkr.ecr.$region.amazonaws.com

# Step 2
# Pull the docker image from ECR
docker pull $dockerpath

# Step 3 
# Create Deployment
kubectl create deployment final-udacity-proj --image=$dockerpath

# Step 4
# Get Deployments
kubectl get deployments

# Step 5:
# Expose deployment to outside the cluster
kubectl expose deployment final-udacity-proj --type=LoadBalancer --port=80

# Step 6:
# Get Service to view the exposed port
kubectl get service
