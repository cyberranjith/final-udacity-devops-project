# final-udacity-devops-project
Final Udacity Devops Project

# Required EC2 config
Ubuntu 20.04 LTS
m4 large
  2 VCPU
  16GB Memory
8GB storage

# Commands to setup kubectl and minikube in EC2

https://www.radishlogic.com/kubernetes/running-minikube-in-aws-ec2-ubuntu/

#install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#install docker
sudo apt-get update && \
    sudo apt-get install docker.io -y

#install minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

minikube version
sudo -i
sudo apt install conntrack
minikube start --vm-driver=none

# Set up environment and files

apt-get install python3-venv
python3 -m venv final
source ./final/bin/activate
-- checkout the project from github
aws configure to set up credentials like access key and region

