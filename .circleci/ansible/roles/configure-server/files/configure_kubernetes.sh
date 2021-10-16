#!/usr/bin/env bash                                                                                                                                                     
                                                                                                                                                                        
# This script helps in configuring kubernetes                                                                                                                           
# This approach uses minkube as the cluster                                                                                                                             
# Credits: https://www.radishlogic.com/kubernetes/running-minikube-in-aws-ec2-ubuntu/                                                                                   
                                                                                                                                                                        
# Step 1                                                                                                                                                                
# Install Kubectl                                                                                                                                                       
echo "Starting Install Kubectl"                                                                                                                                         
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl           
chmod +x ./kubectl                                                                                                                                                      
sudo mv ./kubectl /usr/local/bin/kubectl                                                                                                                                
echo "Install Kubectl Complete"                                                                                                                                         
                                                                                                                                                                        
# Step 2                                                                                                                                                                
# Install Docker                                                                                                                                                        
echo "Starting Install Docker"                                                                                                                                          
sudo apt-get update && \                                                                                                                                                
            sudo apt-get install docker.io -y                                                                                                                           
echo "Install Docker Complete"                                                                                                                                          
                                                                                                                                                                        
# Step 3                                                                                                                                                                
# Install Minikube                                                                                                                                                      
echo "Starting Install Minikube"                                                                                                                                        
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64                                                                          
chmod +x minikube                                                                                                                                                       
sudo mv minikube /usr/local/bin/                                                                                                                                        
echo "Install Minikube Complete"                                                                                                                                        
                                                                                                                                                                        
# Step 4                                                                                                                                                                
# Check minikube version                                                                                                                                                
echo "Minikube version installed is :: " + minikube version

# Step 5
# Install minikube dependencies
echo "Start installing minikube dependencies"
sudo apt install conntrack
sudo apt-get -y install socat
echo "Install minikube dependencies complete"
                                                                                                                                                                        
# Step 6                                                                                                                                                          
# Starting minikube                                                                                                                                                     
echo "Starting minikube"                                                                                                                                                
sudo -i                                                                                                                                                                 
minikube start --vm-driver=none
echo "Minikube Started Successfully"
