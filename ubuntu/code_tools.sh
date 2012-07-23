# Code search
# - Ack
sudo apt-get install -y ack-grep
sudo ln -s /usr/bin/ack-grep /usr/bin/ack

# Text Editing
# - sublime2
# - gnote
wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.1.tar.bz2 -O /tmp/sublime.tar.bz2
bunzip2 /tmp/sublime.tar.bz2
tar -xvf /tmp/sublime.tar
rm /tmp/sublime.tar
sudo mv Sublime\ Text\ 2 /var/local/sublime
sudo ln -s /var/local/sublime/sublime_text /usr/bin/sublime
sudo sh -c "cat >> /usr/share/applications/sublime.desktop <<EOF
[Desktop Entry]
Version=1.0
Name=Sublime Text 2
GenericName=Text Editor

Exec=sublime
Terminal=false
Icon=/var/local/sublime/Icon/48x48/sublime_text.png
Type=Application
Categories=TextEditor;IDE;Development
X-Ayatana-Desktop-Shortcuts=NewWindow

[NewWindow Shortcut Group]
Name=New Window
Exec=sublime -n
TargetEnvironment=Unity
"
sudo apt-get install -y gnote

# Mime database
wget https://github.com/janlelis/rubybuntu-mime/zipball/master -O /tmp/rubybuntu-mime.zip
unzip /tmp/rubybuntu-mime.zip -d /tmp/rubybuntu-mime
rm /tmp/rubybuntu-mime.zip
sudo cp /tmp/rubybuntu-mime/*/*.xml /usr/share/mime/packages
rm -rf /tmp/rubybuntu-mime
sudo update-mime-database /usr/share/mime

# Eclipse
sudo apt-get install -y eclipse
sudo sh -c "cat >> /etc/eclipse.ini <<EOF
-XX:PermSize=128m
-XX:MaxPermSize=128m
-XX:MaxGCPauseMillis=10
-XX:MaxHeapFreeRatio=70
-XX:+UseParallelGC
-Xverify:none
EOF
"
