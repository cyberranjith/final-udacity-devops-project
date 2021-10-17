## Final Udacity Devops Project

## CloudFront Service Endpoint
https://d2tfbz57sm2vg2.cloudfront.net/

## AWS ECR Repository
493412565407.dkr.ecr.us-east-1.amazonaws.com/final-udacity-proj

## Topology
* EC2 configuration:
    - Ubuntu 20.04 LTS
    - m4 large
    - 2 VCPU
    - 16GB Memory
    - 8GB storage
    - Incoming traffic is allowed in port 31280 as it used to expose kubernetes service
* Minkube is installed in EC2 instance to serve as the Kubernetes cluster
* Docker/Kubectl are installed in the EC2 instance

## Deployment Strategy
* Blue/Green deployment:
    - After smoke testing the green deployment to ensure stability, blue deployment is deleted and CloudFront origin is updated to point to the green deployment.

## Circle CI Steps:
- analyze: Lint the docker and python files
- aws-ecr/build-and-push-image: Utilized the Circle CI Orb to build and publish docker image to ECR.
- deploy-infrastructure: Creates the EC2 instance and sets up the required permissions to pull the docker image from ECR.
- configure-infrastructure: Installs docker, kubernetes and minikube in EC2 instance. Also starts the minikube.
- deploy-to-kubernetes-cluster: Pulls the docker image from ECR, creates a kubernetes deployment and exposes the deployment in port 31280.
- smoke-test-service: Tests the service by accessing the service ec2 domain name in port 31280.
- cloudfront-update: Updates the cloudfront origin with the stable deployment
- cleanup: Cleanup the EC2 instance with the prior deployment

## Guide
* Run minikube in EC2:
  - https://www.radishlogic.com/kubernetes/running-minikube-in-aws-ec2-ubuntu/
* Expose Kubernetes workload from EC2 instance:
  - https://www.devopsschool.com/blog/minikube-exposing-kubernetes-workload-from-ec2-instance/