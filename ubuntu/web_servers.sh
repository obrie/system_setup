source $HOME/.rvm/scripts/rvm

# Web server
# - Apache
# -- Modules (ssl, rewrite, proxy)
# -- SSL certs
# - Thin
sudo apt-get install -y apache2-prefork-dev
sudo a2enmod ssl rewrite proxy proxy_balancer proxy_connect proxy_http
sudo mkdir /etc/apache2/ssl
sudo apt-get install -y thin

# Passenger
rvm ree
rvm gemset create passenger
rvm ree@passenger
gem install passenger -v 3.0.14
passenger-install-apache2-module --auto
sudo sh -c "cat >> /etc/apache2/conf.d/passenger <<EOF
LoadModule passenger_module $HOME/.rvm/gems/ree-1.8.7-2012.02@passenger/gems/passenger-3.0.14/ext/apache2/mod_passenger.so
PassengerRoot $HOME/.rvm/gems/ree-1.8.7-2012.02@passenger/gems/passenger-3.0.14
PassengerRuby $HOME/.rvm/wrappers/ree-1.8.7-2012.02@passenger/ruby
RailsEnv development
EOF
"

# Restart Apache
sudo /etc/init.d/apache2 restart
