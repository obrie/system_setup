# Docs
# - LibreOffice menubar integration
sudo apt-get install -y lo-menubar

# - PDF Reader
echo "acroread-common acroread-common/default-viewer boolean true" | sudo debconf-set-selections
sudo apt-get install -y acroread
