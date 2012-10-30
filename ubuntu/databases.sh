# Database
# - Memcached
sudo apt-get install -y libmemcached-dev memcached

# - MySQL
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y libmysqlclient-dev mytop mysql-server
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y phpmyadmin
sudo ln -sv /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf
sed '/^.*AllowNoPassword.*/ s/\/\/ //' /etc/phpmyadmin/config.inc.php > /tmp/conf.tmp && sudo mv /tmp/conf.tmp /etc/phpmyadmin/config.inc.php

# - Redis
sudo apt-get install -y redis-server

# - Sqlline
sudo apt-get install -y sqlline

# - Sqlite
sudo apt-get install -y libsqlite3-dev sqlite3

# - Postgresql
sudo apt-get install -y postgresql
sudo -u postgres createuser -s -d -r $USER

# - RabbitMQ
sudo add-apt-repository -y "deb http://www.rabbitmq.com/debian/ testing main"
wget -O - http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y rabbitmq-server
