# Indicators / notifications
# - System monitor
sudo add-apt-repository -y ppa:alexeftimie/ppa
sudo apt-get update
sudo apt-get install -y indicator-sysmonitor
mkdir -p $HOME/.config/autostart
cat > $HOME/.config/autostart/sysmonitor.desktop <<EOF
[Desktop Entry]
Type=Application
Exec=indicator-sysmonitor
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=sysmonitor
Name=sysmonitor
Comment[en_US]=System Monitor
Comment=System Monitor
EOF

# - Gmail
sudo apt-get install -y gm-notify

# - Weather indicator
sudo apt-get install -y indicator-weather
