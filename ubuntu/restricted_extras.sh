# Restricted extras
# - Fonts
echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | sudo debconf-set-selections

# - Media / Drivers / etc.
sudo apt-get install -y ubuntu-restricted-extras --quiet
