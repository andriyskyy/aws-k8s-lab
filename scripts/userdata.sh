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
sudo yum install git docker -y
sudo systemctl enable --now docker
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install
git clone https://gitlab.com/DmyMi/kops-demo.git /home/ec2-user/kops-demo
sudo chown ec2-user:ec2-user /home/ec2-user/kops-demo -R
git clone https://gitlab.com/DmyMi/aws-k8s-lab.git /home/ec2-user/aws-k8s-lab
sudo chown ec2-user:ec2-user /home/ec2-user/aws-k8s-lab -R