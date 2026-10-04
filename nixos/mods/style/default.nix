# nixos/mods/style
{ pkgs, lib, config, ... }:

{
  options = {
    style.enable = lib.mkEnableOption "enables thunar file explorer";
  };

  config = lib.mkIf config.style.enable {

    environment.systemPackages = with pkgs; [
      # TODO add the phinger cursors to the flake input and this style file
      qt6Packages.qt6ct
      libsForQt5.qt5ct

      nwg-look # theming gtk

      papirus-icon-theme
      kora-icon-theme
    ];

    environment.sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt6ct";
    };
  };
}
