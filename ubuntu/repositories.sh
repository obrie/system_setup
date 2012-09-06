# Repository setup
# - Add partner sources
# - Update new sources
# - Run upgrades
sudo add-apt-repository -y "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get -y upgrade
