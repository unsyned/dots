# hosts/desktop/configuration.nix

{ ... }:

{
  # handling imports in flake.nix for now
  # imports = [
  #   ../../modules/common.nix
  #   ../../modules/desktop.nix
  #   ./hardware-configuration.nix
  # ];

  networking.hostName = "iris";
}

