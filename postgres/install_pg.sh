# Install Postgres
sudo su

# Install Postgres 9.5
sudo yum install postgresql96 postgresql96-server postgresql96-devel postgresql96-contrib postgresql96-docs -y
sudo service postgresql96 initdb
 
# Update config files in 2 places
vim /var/lib/pgsql96/data/pg_hba.conf
# Change to...
local   all             all                                     md5
# and 2 lines below...
# IPv4 local connections:
host    all             all             0.0.0.0/0        md5
 
vim /var/lib/pgsql96/data/postgresql.conf
# Line 59 uncomment and change to listen_addresses='*'
# Line 63 uncomment port number
sudo service postgresql96 restart
 
# Set the postgres password
su postgres
psql
alter user postgres with password 'SET_PASSWORD_HERE';
\q
# 
# Note: Ensure EC2 instance has security group with inbound rule that allows TCP
# on port 5432.
# Note: Install PGAdmin III locally
# # 
