# Networking
# - Static IP address
# - Internal / OpenDNS dns servers
# - Wicd network manager
source ./ubuntu/config.sh
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y wicd
sudo adduser $USER netdev
sudo apt-get remove -y network-manager
sudo /etc/init.d/networking restart
sudo sh -c "cat > /etc/network/interfaces <<EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
address $IP_ADDRESS
netmask 255.255.255.0
gateway 192.168.1.1
dns-nameservers $NAMESERVER1 $NAMESERVER2
EOF
"
