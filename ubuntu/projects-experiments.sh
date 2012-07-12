source ./ubuntu/config.sh
source $HOME/.rvm/scripts/rvm

#
# App - Experiment App
#
cd $PROJECTS
mkdir experiment
echo 'rvm use ree@experiment' > experiment/.rvmrc
rvm ree
rvm gemset create experiment
rvm rvmrc trust experiment
cd experiment
gem install rails
sudo apt-get install -y nodejs
rails new .
sudo sh -c "cat >> /etc/hosts <<EOF
192.168.1.228   experiment.local experiment.$DOMAIN
EOF
"
sudo sh -c "cat >> /etc/network/interfaces <<EOF

auto eth0:8
iface eth0:8 inet static
address 192.168.1.228
netmask 255.255.255.0
broadcast 192.168.1.255
network 192.168.1.0
EOF
"
sudo sh -c "cat > /etc/apache2/sites-available/experiment <<EOF
<VirtualHost *:80>
  ServerName experiment.local
  ServerAlias experiment.$DOMAIN 192.168.1.228
  DocumentRoot $PROJECTS/experiment/public
  SetEnv VIX_APACHE 1
  
  <Directory $PROJECTS/experiment/public>
    Options FollowSymLinks
    AllowOverride None
    Order allow,deny
    Allow from all
  </Directory>

  <Directory />
    Options FollowSymLinks
  </Directory>

  LogLevel info

  RewriteEngine On
  RewriteLogLevel 0
</VirtualHost>

<VirtualHost 192.168.1.228:443>
  ServerName experiment.local
  ServerAlias experiment.$DOMAIN 192.168.1.228
  DocumentRoot $PROJECTS/experiment/public
  SetEnv VIX_APACHE 1
  
  <Directory $PROJECTS/experiment/public>
    Options FollowSymLinks
    AllowOverride None
    Order allow,deny
    Allow from all
  </Directory>

  <Directory />
    Options FollowSymLinks
  </Directory>

  LogLevel info

  RewriteEngine On
  RewriteLogLevel 0

  SSLEngine on
  SSLCertificateFile /etc/apache2/ssl/experiment.local.pem
</VirtualHost>
EOF
"
echo "set make-ssl-cert/hostname experiment.local" | sudo debconf-communicate
sudo DEBIAN_FRONTEND=noninteractive make-ssl-cert /usr/share/ssl-cert/ssleay.cnf /etc/apache2/ssl/experiment.local.pem
sudo a2ensite experiment
sudo /etc/init.d/apache2 reload
