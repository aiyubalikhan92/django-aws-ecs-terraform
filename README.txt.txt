sudo apt-get update

sudo apt install docker.io -y

sudo usermod -aG docker ubuntu 

newgrp docker

sudo chmod 777 /var/run/docker.sock

cat <<EOF> docker.sh
#!/bin/bash
set +xv
sudo apt-get -y update
echo " sudo apt-get -y update ------------------------------------>>>>>>>>>>>>>>>>	"
sudo apt install docker.io -y
echo "	sudo apt install docker.io -y  ------------------------------------>>>>>>>>>>>>>>>>"
sudo usermod -aG docker ubuntu 
echo " sudo usermod -aG docker ubuntu ------------------------------------>>>>>>>>>>>>>>>> 	"
newgrp docker
echo " newgrp docker ------------------------------------>>>>>>>>>>>>>>>>	"
sudo chmod 777 /var/run/docker.sock
echo " sudo chmod 777 /var/run/docker.sock ------------------------------------>>>>>>>>>>>>>>>>	"
docker --version
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip -y
unzip awscliv2.zip
sudo ./aws/install
/usr/local/bin/aws --version
echo "successfully done"
EOF