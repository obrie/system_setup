# Database
# - Memcached
# - MySQL
# - Sqlline
# - Sqlite
sudo apt-get install -y libmemcached-dev memcached
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y libmysqlclient16-dev mytop mysql-server phpmyadmin
sudo apt-get install -y redis-server
sudo apt-get install -y sqlline
sudo apt-get install -y libsqlite3-dev sqlite3

# Vertica
#scp -o stricthostkeychecking=no engineering@monitor.viximo.com:~/vertica_4.0.16_jdk_5.jar /tmp
#sudo cp /tmp/vertica_4.0.16_jdk_5.jar /usr/share/java
#rm /tmp/vertica_4.0.16_jdk_5.jar
