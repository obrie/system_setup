# Networking
# - Static IP address
# - Internal / OpenDNS dns servers
# - Wicd network manager
source ./ubuntu/config.sh
sudo sh -c "cat > /etc/network/interfaces <<EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
address $IP_ADDRESS
netmask 255.255.255.0
gateway 192.168.1.1
EOF
"
sudo rm /etc/resolv.conf
sudo sh -c "echo \"nameserver $NAMESERVER1\nnameserver $NAMESERVER2\" > /etc/resolv.conf"
sudo apt-get remove -y network-manager
sudo apt-get install -y wicd # TODO: This adds a prompt
