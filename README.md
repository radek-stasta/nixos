# nixos
My NixOS system

# installation
- boot ISO, create nixos, boot, swap partitions
- sudo su
- nix-env -iA nixos.git
- git clone https://github.com/radek-stasta/nixos /mnt/install
- cd /mnt/install
- nixos-install --flake .#nixos

wait for installation to finish, set root password and reboot

- clone nixos repository to user profile with gh-cli:)
  nix-shell -p gitAndTools.gh
  gh auth login
  gh repo clone nixos
- sudo rm -rf /install

# upgrade system
- nix flake update
- sudo nixos-rebuild switch --flake .
