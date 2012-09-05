# Media
# - PulseAudio control
sudo apt-get install -y paprefs pavucontrol pulseaudio-module-raop

# - Sound conversion
sudo apt-get install -y soundconverter winff

# - Video conversion
sudo apt-get install -y ffmpeg vlc

# - Screenshots
sudo apt-get install -y shutter

# - Spotify
sudo sh -c "echo 'deb http://repository.spotify.com stable non-free' > /etc/apt/sources.list.d/spotify.sources.list"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-get update
sudo apt-get install -y spotify-client

# - Google CL
sudo apt-get install -y googlecl
