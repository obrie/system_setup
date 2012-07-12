source ./ubuntu/config.sh
source $HOME/.rvm/scripts/rvm

# Viximo binaries
cat >> $HOME/.profile <<EOF

if [ -d "$PROJECTS/bin" ] ; then
    PATH="$PROJECTS/bin:\$PATH"
fi
EOF

rm -rf $PROJECTS/bin/*

# vreload - Reloads the app in the current directory
echo -en 'touch tmp/restart.txt' > $PROJECTS/bin/vreload
chmod 755 $PROJECTS/bin/vreload

# vtail - Tail all application logs
# - Apache by default
cat > $PROJECTS/bin/vtail <<EOF
if which adb >/dev/null; then
  trap "kill 0" SIGINT SIGTERM EXIT
  adb logcat > /tmp/logcat &
fi
tail -f $PROJECTS/*/log/development.log /var/log/apache2/access.log /var/log/apache2/error.log /tmp/logcat
EOF
chmod 755 $PROJECTS/bin/vtail

# vthin - Runs a thin server
echo 'bundle exec thin start -p $1 -s $2' > $PROJECTS/bin/vthin
chmod 755 $PROJECTS/bin/vthin

# vandroid - Android helpers
cat > $PROJECTS/bin/vandroid <<EOF
if [ "\$1" = "launch" ]; then
  if test -z "\$2"; then
    AVD="default"
  else
    AVD="\$2"
  fi
  
  emulator -avd \$AVD &
elif [ "\$1" = "install" ]; then
  if test -z "\$2"; then
    APK="$PROJECTS/android-test/android-app/target/*.apk"
  else
    APK="\$2"
  fi

  cd $PROJECTS/libraries/ViximoAndroid && git pull && mvn clean && mvn install &&\
  cd $PROJECTS/android-test/android-app && git pull && mvn clean && mvn package &&\
  adb install -r \$APK
fi
EOF
