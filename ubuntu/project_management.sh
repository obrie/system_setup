# Project Management
# - Maven
wget http://download.nextag.com/apache//maven/binaries/apache-maven-3.0.4-bin.tar.gz -O /tmp/maven.tar.gz
tar -xzvf /tmp/maven.tar.gz
sudo mv apache-maven-3.0.4 /var/local/apache-maven
sudo sh -c "cat > /etc/environment <<EOF
PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/var/local/apache-maven/bin\"
JAVA_HOME=\"/usr/lib/jvm/java-7-oracle\"
M2_HOME=\"/var/local/apache-maven\"
MAVEN_HOME=\"/var/local/apache-maven\"
M2=\"/var/local/apache-maven/bin\"
EOF
"
source /etc/environment
