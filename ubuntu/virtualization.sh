source ./ubuntu/config.sh

# Virtualization
# - Virtualbox
sudo add-apt-repository -y "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib"
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y $(grep -hioRE "virtualbox-[0-9.]+" /var/lib/apt/lists/download.virtualbox.org_virtualbox* | tail -1)
sudo adduser $USER vboxusers
