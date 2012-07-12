mkdir -p $HOME/.config/autostart

# Campfire
cat > $HOME/.config/autostart/vcampfire.desktop <<EOF
[Desktop Entry]
Type=Application
Exec=vcampfire
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=vcampfire
Name=butane
Comment[en_US]=Monitors campfire
Comment=Monitors campfire
EOF

# System monitor startup
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

# Tomboy
cat > $HOME/.config/autostart/tomboy.desktop <<EOF
[Desktop Entry]
Type=Application
Exec=tomboy
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=tomboy
Name=tomboy
Comment[en_US]=Tomboy
Comment=Tomboy
EOF
