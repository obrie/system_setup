# Docs
# - LibreOffice menubar integration
sudo apt-get install -y lo-menubar

# - PDF Reader
echo "acroread-common acroread-common/default-viewer boolean true" | sudo debconf-set-selections
sudo apt-get install -y acroread

# - GNote
sudo apt-get install -y gnote
mkdir -p $HOME/.config/autostart
cat > $HOME/.config/autostart/gnote.desktop <<EOF
[Desktop Entry]
Type=Application
Exec=gnote
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=gnote
Name=gnote
Comment[en_US]=Gnote
Comment=Gnote
EOF
