# Google Chrome
# - Autoscroll
wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb -O /tmp/chrome.deb
sudo dpkg -i /tmp/chrome.deb
rm /tmp/chrome.deb
google-chrome "https://chrome.google.com/webstore/detail/occjjkgifpmdgodlplnacmkejpdionan?hl=en-US&hc=search&hcp=main"

# Opera
wget http://ftp.ussg.iu.edu/opera/linux/1151/opera_11.51.1087_i386.deb -O /tmp/opera.deb
sudo dpkg -i /tmp/opera.deb
rm /tmp/opera.deb
wget -O - http://deb.opera.com/archive.key | sudo apt-key add -

# Firefox
# - Firebug
# - Scrolling defaults
# - about:config warnings
firefox https://addons.mozilla.org/firefox/downloads/latest/1843/addon-1843-latest.xpi
echo "user_pref(\"general.autoScroll\", true);" >> $HOME/.mozilla/firefox/*.default/prefs.js
echo "user_pref(\"general.warnOnAboutConfig\", false);" >> $HOME/.mozilla/firefox/*.default/prefs.js
