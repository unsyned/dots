{

  description = "My NixOS systems";

  # to resolve noctalia cache issues, recommended by noctalia on nix
  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # or
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      # url = "github:noctalia-dev/noctalia";
      # pin to this branch which always points to the latest cached commit
      url = "github:noctalia-dev/noctalia/cachix";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    helium-flake = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs =  {self, nixpkgs, nixpkgs-unstable, home-manager, zen-browser, noctalia, helium-flake, ... } @ inputs :
  # outputs =  {self, nixpkgs, nixpkgs-unstable, home-manager, zen-browser, ... } @ inputs :
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      # this version cannot be congfigured?
      # pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          helium-flake.overlays.default
        ];
      };

      upkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {

    nixosConfigurations = {
      iris = lib.nixosSystem {
        inherit system;
        inherit pkgs;
        modules = [
          ./configuration.nix
          ./hosts/iris/configuration.nix
          ./hosts/iris/hardware-configuration.nix

          {
            environment.systemPackages = with pkgs; [
              helium
            ];
          }
        ];
      };

      # nic = lib.nixosSystem {
      #   inherit system;
      #   modules = [
      #     ./configuration.nix
      #       ./hosts/iris/configuration.nix
      #       ./hosts/iris/hardware-configuration.nix
      #   ];
      # }
    };

    homeConfigurations = {
      unsyned = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit upkgs;
          inherit inputs;
          inherit zen-browser;
          inherit noctalia;
        };
      };
    };
  };
}
