source ./ubuntu/config.sh

# Vendor
mkdir -p $VENDOR
cd $VENDOR
rm -rf *
git clone https://github.com/rails/rails.git
git clone https://github.com/jquery/jquery.git
