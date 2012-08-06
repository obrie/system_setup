source ./ubuntu/config.sh

# Languages
# - Java
# - Ruby
# - PHP
# - NodeJS
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer
sudo update-java-alternatives -s java-7-oracle
sudo apt-get install -y php5
sudo apt-get install -y libreadline6-dev
sudo apt-get install -y libapr1-dev libaprutil1-dev libsasl2-dev libssl-dev libxslt1-dev rake ruby ruby-dev rubygems
sudo apt-get install -y nodejs

# RVM (TODO: creates popup)
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
cat >> ~/.bashrc <<EOF

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
EOF
source $HOME/.rvm/scripts/rvm
rvm pkg install readline iconv openssl

# RVM - Gems
rvm install ree
rvm install jruby
rvm install 1.8.7
rvm install 1.9.2
rvm install 1.9.3
rvm --default use ree

# Bundler
rvm ree@global
gem install bundler
rvm jruby@global
gem uninstall jruby-openssl bouncy-castle-java
gem install bundler
rvm 1.8.7@global
gem install bundler
rvm 1.9.2@global
gem install bundler
rvm 1.9.3@global
gem install bundler

# RSpec
cat > ~/.rspec <<EOF
--color
--drb
EOF
