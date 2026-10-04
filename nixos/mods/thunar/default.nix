# nixos/mods/thunar
{ pkgs, lib, config, ... }:

{
  options = {
    thunar.enable = lib.mkEnableOption "enables thunar file explorer";
  };

  config = lib.mkIf config.thunar.enable {

    programs.thunar.enable = true;
    programs.xfconf.enable = true; # to enable saving preferences

    programs.thunar.plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];

    services.gvfs.enable = true; # enable automount, trash, etc
    services.tumbler.enable = true; # image thumbnails
  };
}
