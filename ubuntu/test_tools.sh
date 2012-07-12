# Test tools

# PhantomJS
sudo apt-get install libqt4-dev libqtwebkit-dev qt4-qmake
git clone git://github.com/ariya/phantomjs.git /tmp/phantomjs && cd /tmp/phantomjs
git checkout 1.3.0
qmake && make
sudo mv bin/phantomjs /usr/local/bin/
rm -rf /tmp/phantomjs
