#!/bin/sh

rpm-ostree install distrobox zsh gnome-tweaks syncthing

rpm-ostree override remove firefox-langpacks firefox

flatpak install com.github.geigi.cozy                \
                com.mattjakeman.ExtensionManager     \
                dev.alextren.Spot                    \
                me.kozec.syncthingtk                 \
                org.mozilla.Firefox                  \
                org.freedesktop.Platform.ffmpeg-full \
                org.videolan.VLC

[ -d "~/powerlevel10k" ] && echo p10k dir does not exist && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

[ -f "~/.ssh/id_ed25519.pub" ] && echo ssh key does not exist && ssh-keygen -t ed25519
