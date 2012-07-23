source ./ubuntu/config.sh
source $HOME/.rvm/scripts/rvm

# Project binaries
cat >> $HOME/.profile <<EOF

if [ -d "$PROJECTS/bin" ] ; then
    PATH="$PROJECTS/bin:\$PATH"
fi
EOF

rm -rf $PROJECTS/bin/*

# xtail - Tail all application logs
# - Apache by default
cat > $PROJECTS/bin/xtail <<EOF
if which adb >/dev/null; then
  trap "kill 0" SIGINT SIGTERM EXIT
  adb logcat > /tmp/logcat &
fi
tail -f $PROJECTS/*/log/development.log /var/log/apache2/access.log /var/log/apache2/error.log /tmp/logcat
EOF
chmod 755 $PROJECTS/bin/xtail

# xthin - Runs a thin server
echo 'bundle exec thin start -p $1 -s $2' > $PROJECTS/bin/xthin
chmod 755 $PROJECTS/bin/xthin

# xandroid - Android helpers
cat > $PROJECTS/bin/xandroid <<EOF
if [ "\$1" = "launch" ]; then
  if test -z "\$2"; then
    AVD="default"
  else
    AVD="\$2"
  fi
  
  emulator -avd \$AVD &
elif [ "\$1" = "install" ]; then
  if test -z "\$2"; then
    APK="$PROJECTS/AndroidTestAppHere/target/*.apk"
  else
    APK="\$2"
  fi

  cd $PROJECTS/AndroidLibHere && git pull && mvn clean && mvn install &&\
  cd $PROJECTS/AndroidTestAppHere && git pull && mvn clean && mvn package &&\
  adb install -r \$APK
fi
EOF
