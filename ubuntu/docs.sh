# Docs
# - LibreOffice menubar integration
# - PDF Reader
sudo apt-get install -y lo-menubar
echo "acroread-common acroread-common/default-viewer boolean true" | sudo debconf-set-selections
sudo apt-get install -y acroread
