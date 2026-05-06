{

  description = "my system";


  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # or
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
  };


  outputs =  {self, nixpkgs, nixpkgs-unstable, home-manager, zen-browser, ... } @ inputs :
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      # this version cannot be congfigured?
      # pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      upkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };

    homeConfigurations = {
      unsyned = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit upkgs;
          inherit inputs;
          inherit zen-browser;
        };
      };
    };
  };

}
