source ./ubuntu/config.sh

# Source management
# - Git
sudo apt-get install -y git-core gitk

# - Git - configuration
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global github.user "$GITHUB_USER"
git config --global branch.autosetuprebase always
git config --global push.default tracking
git config --global color.ui auto

# - Subversion
sudo apt-get install -y subversion
