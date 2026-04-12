{

  description = "first flake";


  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    # or
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };


  outputs =  {self, nixpkgs, ... }:
    let lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
    };
  };

}
