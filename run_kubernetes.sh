#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
#dockerpath=cyberranjith/final-udacity-proj:1.0
dockerpath=493412565407.dkr.ecr.us-east-1.amazonaws.com/final-udacity-proj:1.0

# Step 2
# Pull the docker image from ECR
docker pull 493412565407.dkr.ecr.us-east-1.amazonaws.com/final-udacity-proj:1.0493412565407.dkr.ecr.us-east-1.amazonaws.com/final-udacity-proj:1.0^C

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
