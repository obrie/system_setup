# Code search
# - Ack
sudo apt-get install -y ack-grep
sudo ln -s /usr/bin/ack-grep /usr/bin/ack

# Text Editing
# - gEdit
# - sublime2
sudo apt-get install -y gedit-plugins
wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.tar.bz2 -O /tmp/sublime.tar.bz2
bunzip2 /tmp/sublime.tar.bz2
tar -xvf /tmp/sublime.tar
sudo mv Sublime\ Text\ 2 /var/local/sublime

# Mime database
wget https://github.com/janlelis/rubybuntu-mime/zipball/master -O /tmp/rubybuntu-mime.zip
unzip /tmp/rubybuntu-mime.zip -d /tmp/rubybuntu-mime
sudo cp /tmp/rubybuntu-mime/*/*.xml /usr/share/mime/packages
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
