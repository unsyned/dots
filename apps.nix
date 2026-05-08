{ pkgs, upkgs, zen-browser, ... }:

# let

#   pkgsUnstable = import <nixpkgs-unstable> {};

# in

{
  # home.packages = with pkgs; [
  home.packages = (with pkgs; [
    spotify
    zen-browser.packages.${pkgs.system}.default

    # games
    steam
    wineWowPackages.stable # https://nixos.wiki/wiki/Wine

    # cli
    tree
    nerd-fonts.fira-code
    glow # render markdown in cli

    # keyboard // qmk, vial, via
    qmk
    via
    vial
    # required for qmk
    dos2unix

    # utility
    google-chrome
    libreoffice

    # DE stuff - move out if it gets too big or has logic
    kdePackages.sddm-kcm
    kdePackages.kde-gtk-config
    wayland-utils # Wayland diagnostic tools
    wl-clipboard # Wayland copy/paste support
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum

    # theming... required for all DEs and WMs I think?
    # qt6ct
    qt6Packages.qt6ct
    libsForQt5.qt5ct
  ]) ++ (with upkgs; [
    neovim
    discord
  ]);

  # qt = {
  #   enable = true;
  #   platformTheme = "qtct";
  #
  #   kvantum = {
  #     enable = true;
  #   };
  # };

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
        # core.editor = "emacsclient -c -a emacs";
        # core.editor = "emacs -nw";
        # core.editor = "emacsclient -nw -a """;
      };
      # extraConfig = {}; # for things that aren't integrated yet
    };

    # neovim = {
    #   enable = true;
    #   package = upkgs.neovim;
    # };

    # emacs.enable = true;
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
