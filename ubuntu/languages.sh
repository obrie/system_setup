source ./ubuntu/config.sh

# Languages
# - Java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer
sudo update-java-alternatives -s java-7-oracle

# - PHP
sudo apt-get install -y php5

# Node JS
sudo apt-get install -y nodejs

# - Ruby
sudo apt-get install -y libreadline6-dev
sudo apt-get install -y libapr1-dev libaprutil1-dev libsasl2-dev libssl-dev libxslt1-dev rake ruby ruby-dev rubygems

# - Ruby - RVM (TODO: creates popup)
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
cat >> ~/.bashrc <<EOF

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
EOF
source $HOME/.rvm/scripts/rvm
rvm pkg install readline iconv openssl

# - Ruby - RVM - Gems
rvm install ree
rvm install jruby
rvm install jruby-1.7.0.preview2
rvm alias create jruby-1.7 jruby-1.7.0.preview2
rvm install 1.8.7
rvm install 1.9.2
rvm install 1.9.3
rvm --default use ree

# - Ruby - Bundler
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

# - Ruby - RSpec
cat > ~/.rspec <<EOF
--color
--drb
EOF
