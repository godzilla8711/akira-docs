# Establish the required settings
export USER_NAME="Last, First"
export USER_EMAIL="Email"

if [ "$USER_NAME" == "Last, First" ] || [ "$USER_EMAIL" == "Email" ]; then
  echo
  echo "Error -- Both USER_NAME and USER_EMAIL must be specified"
  echo
  exit
fi

# Clone the Akira repos
rm -rf akira-docs
git clone https://github.com/godzilla8711/akira-docs.git
rm -rf akira-client
git clone https://github.com/godzilla8711/akira-client.git
rm -rf akira-server
git clone https://github.com/godzilla8711/akira-server.git

# Enable the Akira web app by building the boot.js and starting NGINX 
# NINGX will act as a proxy server to forward requests to the node processes.
cd ~/akira-client
npm install
npm run build
cd ~/akira-client/nginx
./restart.sh

# Start the server node process that has all REST endpoints.
cd ~/akira-server
npm install
ps -eaf | grep node | grep Dakira | tr -s ' ' | cut -d ' ' -f2 | xargs kill
node . -Dakira &

# Configure GIT and NPM settings.
git config --global user.name "$USER_NAME"
git config --global user.email $USER_EMAIL
git config --global color.ui true
npm config set package-lock false
cd ~

git config --list --global

