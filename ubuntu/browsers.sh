# Google Chrome
# - Autoscroll
wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb -O /tmp/chrome.deb
sudo dpkg -i /tmp/chrome.deb
rm /tmp/chrome.deb
google-chrome "https://chrome.google.com/webstore/detail/occjjkgifpmdgodlplnacmkejpdionan?hl=en-US&hc=search&hcp=main"

# Opera
sudo sh -c "echo 'deb http://deb.opera.com/opera stable non-free' > /etc/apt/sources.list.d/opera.sources.list"
wget -O - http://deb.opera.com/archive.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y opera

# Firefox
# - Firebug
# - Scrolling defaults
# - about:config warnings
firefox https://addons.mozilla.org/firefox/downloads/latest/1843/addon-1843-latest.xpi
echo "user_pref(\"general.autoScroll\", true);" >> $HOME/.mozilla/firefox/*.default/prefs.js
echo "user_pref(\"general.warnOnAboutConfig\", false);" >> $HOME/.mozilla/firefox/*.default/prefs.js
