#!/bin/sh

rpm-ostree install distrobox zsh gnome-tweaks syncthing

rpm-ostree override remove firefox-langpacks firefox toolbox

flatpak install com.github.geigi.cozy                \
                com.mattjakeman.ExtensionManager     \
                dev.alextren.Spot                    \
                me.kozec.syncthingtk                 \
                org.videolan.VLC

echo 1 | flatpak install flathub org.freedesktop.Platform.ffmpeg-full

[ ! -d "powerlevel10k" ] && echo p10k dir does not exist && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

[ ! -f ".ssh/id_ed25519.pub" ] && echo ssh key does not exist, creating... && ssh-keygen -t ed25519

[ ! -d "WhiteSur-gtk-theme" ] && echo WhiteSur theme not installed, installing... && git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1 && echo y | distrobox create tmp && distrobox enter tmp -e "./WhiteSur-gtk-theme/install.sh && exit"
