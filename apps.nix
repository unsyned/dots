{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.steam
    pkgs.spotify

    # utility
    pkgs.google-chrome
    pkgs.libreoffice

    # DE stuff - move out if it gets too big or has logic
    pkgs.kdePackages.sddm-kcm
    pkgs.kdePackages.kde-gtk-config
    pkgs.wayland-utils # Wayland diagnostic tools
    pkgs.wl-clipboard # Wayland copy/paste support
  ];

  programs = {
    # cli
    git = {
      enable = true;
      settings = {
        user.name = "sy";
        user.email = "stroudafk@gmail.com";
        push.autoSetupRemote = true;
        core.pager = "less -FRX";
        core.editor = "nvim";
      };
      # extraConfig = {}; # for things that aren't integrated yet
    };

    neovim.enable = true;
    bat.enable = true;
    ghostty.enable = true;
    yazi.enable = true;

    # other applications
    obsidian.enable = true;
    vscode.enable = true;

    # gaming/media applications
    lutris.enable = true;
    vesktop.enable = true;

  };
}
