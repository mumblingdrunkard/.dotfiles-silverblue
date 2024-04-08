FROM fedora-toolbox:39

# Ensure updated base
RUN dnf -y upgrade
RUN dnf -y install kitty-terminfo
RUN dnf clean all

# Install nix and auxiliary programs
RUN sh <(curl -L https://nixos.org/nix/install) --daemon --yes
ENV PATH $PATH:/nix/var/nix/profiles/default/bin
