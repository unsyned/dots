# nixos/mods

{ pkgs, ... }:

{
  imports = [ 
    ./audio.nix
    ./keyb.nix
    ./niri
  ];

}
