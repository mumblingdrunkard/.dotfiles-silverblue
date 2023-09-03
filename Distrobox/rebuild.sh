cd $HOME
distrobox rm --force dev
podman rmi --force dev
podman build Distrobox --tag dev
distrobox assemble create

mkdir  .local/share/distrobox/home/dev/.config -p
cp -r  .config/helix .local/share/distrobox/home/dev/.config
cp     .zshrc        .local/share/distrobox/home/dev
cp     .p10k.zsh     .local/share/distrobox/home/dev
rm -rf .local/share/distrobox/home/dev/powerlevel10k 
cp -r  powerlevel10k .local/share/distrobox/home/dev
