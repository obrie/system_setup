source ./ubuntu/config.sh

# Languages
# - Java
# - Ruby
# - PHP
sudo add-apt-repository ppa:ferramroberto/java -y
sudo apt-get update
echo sun-java6-jre shared/accepted-sun-dlj-v1-1 select true | sudo /usr/bin/debconf-set-selections
echo sun-java6-jdk shared/accepted-sun-dlj-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install -y sun-java6-jre sun-java6-jdk
sudo update-java-alternatives -s java-6-sun
sudo apt-get install -y php5
sudo apt-get install -y libreadline6-dev
sudo apt-get install -y libapr1-dev libaprutil1-dev libsasl2-dev libssl-dev libxslt1-dev rake ruby ruby1.8-dev rubygems rubygems1.8

# RVM
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
cat >> ~/.bashrc <<EOF

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
EOF
source $HOME/.rvm/scripts/rvm
rvm pkg install readline iconv openssl

# RVM - Gems
rvm install ree-1.8.7-2012.01
rvm install jruby-1.6.6
rvm alias create jruby jruby-1.6.6
rvm install 1.9.2-p290
rvm --default use ree

# RVM - Default Rubygems versions
rvm ree
rvm rubygems 1.5.3
rvm 1.9.2
rvm rubygems 1.5.3

# Bundler
rvm ree@global
gem install bundler -v 1.0.15
rvm jruby@global
gem uninstall jruby-openssl bouncy-castle-java
gem install bundler -v 1.0.15
rvm 1.9.2@global
gem install bundler -v 1.0.15
