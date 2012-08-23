# Media
# - PulseAudio control
# - Sound conversion
# - Video conversion
# - Screenshots
# - Spotify
sudo apt-get install -y paprefs pavucontrol pulseaudio-module-raop
sudo apt-get install -y soundconverter winff
sudo apt-get install -y ffmpeg vlc
sudo apt-get install -y shutter

sudo sh -c "echo 'deb http://repository.spotify.com stable non-free' > /etc/apt/sources.list.d/spotify.sources.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-get update
sudo apt-get install -y spotify-client