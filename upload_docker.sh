#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Constants
accountid=493412565407
region=us-east-1
tag=1.0
dockerpath=$accountid.dkr.ecr.$region.amazonaws.com/final-udacity-proj:$tag

# # Step 2:  
# # Authenticate & tag
# docker tag final-udacity-proj:1.0 cyberranjith/final-udacity-proj:1.0
# echo "Docker ID and Image: $dockerpath"

# # Step 3:
# # Push image to a docker repository
# docker push cyberranjith/final-udacity-proj:1.0

# Step 1:
# Authenticate docker client
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $accountid.dkr.ecr.$region.amazonaws.com

# Step 2:
# Get the docker image id
docker_imageid=$(docker images --filter="reference=final-udacity-proj" --quiet)
echo "Docker Image ID : " $docker_imageid

# Step 3:
# Tag your image with the Amazon ECR
docker tag $docker_imageid $dockerpath

# Step 4:
# Push the docker image
docker push $dockerpath