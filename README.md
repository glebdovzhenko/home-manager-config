# A starting point
For my basic devstuff to work on a non-NixOS VM.

## From a clean Ubuntu VM
```bash
sudo apt update && sudo apt upgrade -y
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

## Notes
1. To upd the env
```bash
nix run nixpkgs#home-manager -- switch --flake .#glebdovzhenko
```
