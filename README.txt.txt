sudo apt-get update

sudo apt install docker.io -y

sudo usermod -aG docker ubuntu 

newgrp docker

sudo chmod 777 /var/run/docker.sock

sudo nano /etc/systemd/system/run-script.service

cat <<EOF> docker.sh
#!/bin/bash
set +xv
echo "## System update"
sudo apt-get -y update
echo "## Docket Setup"
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu 
newgrp docker
sudo chmod 777 /var/run/docker.sock
docker --version
echo "## AWS Cli install"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip -y
unzip awscliv2.zip
sudo ./aws/install
/usr/local/bin/aws --version
echo "## AWS Cli COnfigure"
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
AWS_DEFAULT_REGION="us-east-1"
AWS_OUTPUT_FORMAT="json"
# Configure AWS CLI
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set default.region $AWS_DEFAULT_REGION
aws configure set default.output $AWS_OUTPUT_FORMAT
cat ~/.aws/config
cat ~/.aws/credentials

echo "## Github_Actions"

mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.328.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.328.0/actions-runner-linux-x64-2.328.0.tar.gz
tar xzf ./actions-runner-linux-x64-2.328.0.tar.gz
yes "" | ./config.sh --url https://github.com/aiyubalikhan92/django-aws-ecs-terraform --token ADUBDECYA5N6MU7OUHMCQFDIWPREQ

echo "successfully done"
EOF