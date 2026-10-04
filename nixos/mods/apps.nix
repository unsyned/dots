{ pkgs, upkgs, zen-browser, ... }:

{
  home.packages = (with pkgs; [
    spotify
    zen-browser.packages.${pkgs.system}.default

    # games
    steam
    wineWow64Packages.stable # https://nixos.wiki/wiki/Wine

    # cli
    tree
    nerd-fonts.fira-code
    glow # render markdown in cli
    fzf
    ripgrep
    # zoxide

    # utility
    google-chrome
    libreoffice
    localsend # airdrop alternative

    # TODO move to a kde module
    # kdePackages.sddm-kcm
    # kdePackages.kde-gtk-config
    wayland-utils # Wayland diagnostic tools
    wl-clipboard # Wayland copy/paste support
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum

  ]) ++ (with upkgs; [
    neovim
    discord
  ]);

  programs = {
    #
    keepassxc = {
      enable = true;
      autostart = true;
    };
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

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    bat.enable = true;
    ghostty.enable = true;
    yazi.enable = true;

    # other applications
    obsidian.enable = true;
    vscode.enable = true;
    helium.enable = true;

    # gaming/media applications
    lutris.enable = true;
    vesktop.enable = true;

  };
}
