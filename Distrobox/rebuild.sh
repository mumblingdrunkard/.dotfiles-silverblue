cd $HOME

# Delete old images/containers
distrobox rm --force dev
podman rmi --force dev

# Rebuild
podman build Distrobox --tag dev
distrobox assemble create

# Create container home in case it does not already exist
mkdir  .local/share/distrobox/home/dev/.config -p

# Copy configs into container home, overwrites current config
cp -r  .config/helix .local/share/distrobox/home/dev/.config
cp     .zshrc        .local/share/distrobox/home/dev
cp     .p10k.zsh     .local/share/distrobox/home/dev
rm -rf .local/share/distrobox/home/dev/powerlevel10k 
cp -r  powerlevel10k .local/share/distrobox/home/dev
cp     .tmux.conf    .local/share/distrobox/home/dev

# Append direnv hook to .zshrc as direnv is not in host system, but should be in dev container
echo ''                           >> .local/share/distrobox/home/dev/.zshrc
echo '# Set up direnv'            >> .local/share/distrobox/home/dev/.zshrc
echo 'eval "$(direnv hook zsh)"' >> .local/share/distrobox/home/dev/.zshrc
