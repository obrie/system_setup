# Code tools
# - Ack
sudo apt-get install -y ack-grep
sudo ln -s /usr/bin/ack-grep /usr/bin/ack

# - Sublime Text 2
wget "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.1$(if [ "$(dpkg --print-architecture)" == "amd64" ]; then echo "%20x64"; fi).tar.bz2" -O /tmp/sublime.tar.bz2
bunzip2 /tmp/sublime.tar.bz2
tar -xvf /tmp/sublime.tar
rm /tmp/sublime.tar
sudo mv Sublime\ Text\ 2 /var/local/sublime
sudo ln -s /var/local/sublime/sublime_text /usr/bin/e
sudo sh -c "cat > /usr/share/applications/sublime.desktop <<EOF
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
mkdir -p $HOME/.local/share/applications
sh -c "cat > $HOME/.local/share/applications/defaults.list <<EOF
[Default Applications]
application/x-perl=sublime.desktop
text/plain=sublime.desktop
text/x-chdr=sublime.desktop
text/x-csrc=sublime.desktop
text/x-dtd=sublime.desktop
text/x-java=sublime.desktop
text/mathml=sublime.desktop
text/x-python=sublime.desktop
text/x-sql=sublime.desktop
"

# - Mime database
wget https://github.com/janlelis/rubybuntu-mime/zipball/master -O /tmp/rubybuntu-mime.zip
unzip /tmp/rubybuntu-mime.zip -d /tmp/rubybuntu-mime
rm /tmp/rubybuntu-mime.zip
sudo cp /tmp/rubybuntu-mime/*/*.xml /usr/share/mime/packages
rm -rf /tmp/rubybuntu-mime
sudo update-mime-database /usr/share/mime

# - Eclipse
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
