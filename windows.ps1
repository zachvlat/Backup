# Open terminal emulator with admin access
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Open terminal emulator with normal access
irm get.scoop.sh | iex

#git config
scoop install git
git config --global user.name "zachvlat"
git config --global user.email "zachariasvlatakis@gmail.com"

#add buckets
scoop bucket add extras;
scoop bucket add versions;
scoop bucket add java;
scoop bucket add games;
scoop bucket add nonportable;

#install scoop packages
scoop install vcredist2022 windowsdesktop-runtime vcredist2013 aria2 obsidian scrcpy openrgb chatterino legendary thunderbird nilesoft-shell context-menu-manager flameshot firefox brave winget nodejs-lts android-studio obs-studio vlc discord steam vscode signal temurin-lts-jdk krita 7zip qbittorrent notepadplusplus stremio streamlink python libreoffice kdeconnect eartrumpet bulk-crap-uninstaller putty heroic-games-launcher playnite fastfetch rustdesk nano sudo ani-cli mpv fzf adb;

#brave fix
New-Item -ItemType Junction -Path "$env:AppData/../Local/BraveSoftware/Brave-Browser/User Data" -Target "$env:USERPROFILE\scoop\persist\brave\User Data"

#install np scoops
sudo scoop install open-shell-np parsec-np wireguard-np virtualbox-np;

#wget
wget https://github.com/cangzhang/champ-r/releases/download/v2.0.2-b7/champr-v2.0.2-b7.zip -o champr.zip
https://proton.me/download/drive/windows/Proton%20Drive%20Setup%201.3.6.exe -o drive.exe
./drive.exe

#open with admin for this
irm christitus.com/win | iex


