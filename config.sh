sudo su -

# Apply latest security updates.
sudo yum update -y

# Install GIT
sudo yum install git -y

# Install NGINX and Samba
sudo yum install nginx -y

# Install Node and NPM
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
sudo yum install nodejs -y

exit

# ---------------------------------------------------------
# Install samba
# sudo yum install samba -y

# ---------------------------------------------------------
# Install mongo DB
# TBD

# ---------------------------------------------------------
# # Install Postgres 9.5
# sudo yum install postgresql95 postgresql95-server postgresql95-devel postgresql95-contrib postgresql95-docs -y
# sudo service postgresql95 initdb
# 
# # Update config files
# sesu su -
# vim /var/lib.pgsql95/data/pg_hba.conf
# Change to...
# - # IPv4 local connections:
# - host    all             all             0.0.0.0/0        md5
# 
# vim /var/lib/pgsql95/data/postgresql.conf
# - Line 59 uncomment and change to listen_addresses='*'
# - Line 63 uncomment port number
# sudo service postgresql95 start (or restart if already running)
# exit
# 
# # Set the postgres password
# sudo su -
# su postgres
# psql
# alter user postgres with password 'SET_PASSWORD_HERE';
# \q
# 
# Note: Ensure EC2 instance has security group with inbound rule that allows TCP
# on port 5432.
# Note: Install PGAdmin III locally
# # 
