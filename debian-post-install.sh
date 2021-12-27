#!/bin/sh

#update first
sudo apt-get update;
sudo apt-get upgrade -y;

#fast apt
sudo add-apt-repository ppa:apt-fast/stable;
sudo apt-get update;
sudo apt-get -y install apt-fast;

#native packages
sudo apt-fast install heroic qbittorrent virtualbox android-tools-adb android-tools-fastboot krita discord steam obs-studio code vlc lutris streamlink python3 git gnome-tweaks ubuntu-restricted-extras neofetch barrier refind thunderbird -y;

#flatpaks
flatpak install flathub com.spotify.Client -y;
flatpak install flathub org.signal.Signal -y;
flatpak install flathub com.parsecgaming.parsec -y;
flatpak install flathub com.google.AndroidStudio -y;
flatpak install flathub com.stremio.Stremio -y;
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Ultimate -y;
flatpak install flathub org.telegram.desktop -y;

#java
sudo apt install openjdk-11-jdk;
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64;
echo $JAVA_HOME;
export PATH=$PATH:$JAVA_HOME/bin;
echo $PATH;

#ms fonts
sudo add-apt-repository multiverse;
sudo apt update && sudo apt install ttf-mscorefonts-installer -y;
sudo fc-cache -f -v;

wget http://ftp.de.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.8_all.deb;
sudo dpkg -i ttf-mscorefonts-installer_3.8_all.deb;
sudo fc-cache -f -v;

#onlyoffice
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb;
sudo dpkg -i onlyoffice-desktopeditors_amd64.deb;

#remove libre office
sudo apt-get remove --purge libreoffice* -y;
sudo apt autoremove && sudo apt autoclean -y;

#brave browser
sudo apt install apt-transport-https curl -y;
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg;
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list;
sudo apt update && sudo apt install brave-browser -y;

#latest wine
sudo dpkg --add-architecture i386;
wget -nc https://dl.winehq.org/wine-builds/winehq.key;
sudo apt-key add winehq.key;
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ impish main'sudo apt update;
sudo apt install --install-recommends winehq-stable -y;

#protonvpn
wget https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb;
sudo dpkg -i protonvpn-stable-release_1.0.1-1_all.deb;
sudo apt-get update;
sudo apt install protonvpn;
sudo apt install gnome-shell-extension-appindicator gir1.2-appindicator3-0.1;

#usefull appimages
wget https://github.com/SevenTV/chatterino7/releases/download/v7.3.4/Chatterino-x86_64.AppImage;
chmod +x Chatterino-x86_64.AppImage;
wget https://apprepo.de/appimage/download/google-chrome;
chmod +x ./Google-Chrome.AppImage;

#papirus icon-pack
sudo add-apt-repository ppa:papirus/papirus;
sudo apt-get update;
sudo apt-get install papirus-icon-theme -y;

#pipewire over pulseaudio
sudo apt update && sudo apt upgrade;
sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream;
sudo apt install pipewire;
sudo apt install gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules} libspa-0.2-{bluetooth,dev,jack,modules} pipewire{,-{audio-client-libraries,pulse,media-session,bin,locales,tests}};

#final
sudo apt autoremove && sudo apt autoclean;
