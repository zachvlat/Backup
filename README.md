# Arch + Pantheon

This is a guide for installing a (relatively) stable Pantheon DE on top of Archlinux. The reason behind it is that, in my opinion I believe the elementary OS and the especially their desktop environment Pantheon to be one, if not the most, beautiful desktop environment Linux can offer. There are two problems, though: first of all Elementary OS itself, it's based on an old version of Ubuntu with all the baggages that comes with it, and second, the problem with Pantheon is, that is so close tide up with Elementary OS, that it's not something that you can plug and play like Gnome or KDE. It requires several different packages, that may or may not break your system. I 'm using this setup for about 2 months though, but no problem so far, so i consider it stable enough for me. Fair warning though, try to use Timeswift just to be safe.

### Step 1: Install Archlinux.

I 'm not gonna go into this, two pieces of advice, first of all try to install it with Ethernet and not WIFI to avoid the early headache and second of all use archinstall TUI installer. It takes a lot of pain away and (at the time I 'm writing this guide, it's very stable and "mistake proof", so highly suggested. Just type archinstall press enter and follow from there. Use the "minimal" profile, pulse audio (if you want you can change it to pipewire now or later down the line) and continue with the rest.

### Step 2: Install basic packages.

First of update packages: ``sudo pacman -Syy``

Then install xorg nano (you can also install vim if you want) and git: 
``sudo pacman -S xorg nano git``

Then we are gonna install pantheon basic stuff (choose the default options when you are prompt to choose):
``sudo pacman -S pantheon pantheon-session``

Then we install the greeters: 
``sudo pacman -S lightdm lightdm-gtk-greeter lightdm-pantheon-greeter``

Now we are gonna put it inside the lightdm greeter: 
``sudo nano /etc/lightdm/lightdm.conf``

Above Seat Configuration type: greeter-session = io.elementary-greeter

Save and exit.

Now we are kinda ready, we have to enable some things: 
``sudo systemctl enable lightdm.service``
``sudo systemctl enable NetworkManager`` and then to start, 
``sudo systemctl start lightdm.service``

### Step 3: Fixing broken stuff.

First things first, click on the Gnome icon and choose the Pantheon option. Log in. One of the first things you 'll notice is that there is no dock in your desktop (those broken stuff I was saying...). If you open the terminal the fonts are all over the place! If you open the Plank it has the wrong theme (not the Elementary one) and it doesn't comes up at startup (you should go to settings > applications > startup). But first of all we have to install yay. 
``git clone https://aur.archlinux.org/yay.git``
``sudo chown "your username":users yay``
``cd yay``
``makepkg -si``

Now that yay is enabled we will start to implement our fixes: 
``yay -S pantheon-unstable gala-git switchboard-plug-pantheon-tweaks-git pantheon-print file-roller``
You should remove conflicting dependencies (if you asked!).

Then you can log out and log in to implement the changes. As far as it goes for the dock, you can download this https://www.gnome-look.org/p/1492550 and then unpack it at ~./local/share/plank/themes/. Then you can right-click on the dock (without touching any icon) and press preferences to choose the new theme (this is for the dark theme but you can use whatever you want!).

From this point on you can start using your bare bones elementary OS arch Linux system. As a bonus content I want you to point out some QoL improvement you can make, because pantheon DE is very opinionated and some stuff maybe missing for some of you: Wingpanel app indicators (Telegram, Discord, whatever app uses them): 
``yay -S wingpanel-standalone-git`` and then
``yay -S wingpanel-indicator-ayatana-git``

If you have sound issues you should install sof-firmware and alsa-ucm-conf (at least I had!).
