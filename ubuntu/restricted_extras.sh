# Restricted extras
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
sudo apt-get install -y ubuntu-restricted-extras --quiet
