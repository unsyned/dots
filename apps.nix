{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    spotify

    # games
    steam
    wineWowPackages.stable # https://nixos.wiki/wiki/Wine

    # cli
    tree
    nerd-fonts.fira-code

    # utility
    google-chrome
    libreoffice

    # DE stuff - move out if it gets too big or has logic
    kdePackages.sddm-kcm
    kdePackages.kde-gtk-config
    wayland-utils # Wayland diagnostic tools
    wl-clipboard # Wayland copy/paste support
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
