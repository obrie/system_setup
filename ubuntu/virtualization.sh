source ./ubuntu/config.sh

# Virtualization
# - Virtualbox
sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian natty contrib' > /etc/apt/sources.list.d/virtualbox.sources.list"
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y virtualbox-4.1
sudo adduser $USER vboxusers
