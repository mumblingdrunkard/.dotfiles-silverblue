# Delete old images/containers
distrobox rm --force dev
podman rmi --force dev

# Rebuild
podman build . --tag dev
distrobox assemble create
