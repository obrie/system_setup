# Repository setup
# - Add partner sources
# - Update new sources
# - Run upgrades
sudo sh -c "echo 'deb http://archive.canonical.com/ubuntu precise partner\ndeb-src http://archive.canonical.com/ubuntu precise partner' > /etc/apt/sources.list.d/partners.sources.list"
sudo apt-get update
sudo apt-get -y upgrade
