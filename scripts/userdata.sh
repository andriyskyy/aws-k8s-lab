#!/usr/bin/env bash
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x ./kops
sudo mv ./kops /usr/local/bin/
curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
wget https://get.helm.sh/helm-v3.2.3-linux-amd64.tar.gz
tar -zxvf helm-v3.2.3-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
sudo yum install git -y
git clone https://gitlab.com/DmyMi/kops-demo.git
git clone https://gitlab.com/DmyMi/aws-k8s-lab.git