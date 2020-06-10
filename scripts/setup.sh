#!/usr/bin/env bash

# Update AWS CLI to latest version first
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
# Install docker git
sudo yum install -y docker git
sudo systemctl enable --now docker
sudo usermod -aG docker "${USER}"
# Install java
curl -s "https://get.sdkman.io" | bash
source "/home/ec2-user/.sdkman/bin/sdkman-init.sh"
sdk install java 8.0.252.j9-adpt