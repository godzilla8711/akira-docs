sudo su -

sudo yum update -y
sudo yum install git -y
sudo yum install nginx -y

curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
sudo yum install nodejs -y

exit

cd ~/akira-server
node .


