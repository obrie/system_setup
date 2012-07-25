# Database
# - Memcached
# - MySQL
# - PHPMyAdmin
# - Sqlline
# - Sqlite
# - Postgresql
# - RabbitMQ
sudo apt-get install -y libmemcached-dev memcached
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y libmysqlclient-dev mytop mysql-server
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y phpmyadmin
sudo ln -sv /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf
sed '/^.*AllowNoPassword.*/ s/\/\/ //' /etc/phpmyadmin/config.inc.php > /tmp/conf.tmp && sudo mv /tmp/conf.tmp /etc/phpmyadmin/config.inc.php
sudo apt-get install -y redis-server
sudo apt-get install -y sqlline
sudo apt-get install -y libsqlite3-dev sqlite3
sudo apt-get install -y postgresql
sudo -u postgres createuser -s -d -r $USER
sudo apt-get install -y rabbitmq-server