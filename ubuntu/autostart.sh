mkdir -p $HOME/.config/autostart

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

# Gnote
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
