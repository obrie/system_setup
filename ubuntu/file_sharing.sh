# File sharing
# - SSH
sudo apt-get install -y openssh-server

# - Dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
sudo apt-get update
sudo apt-get install -y nautilus-dropbox
