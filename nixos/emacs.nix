
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # required doom emacs dependencies
    git
    # emacs # 27.2 suggested for doom emacs
    emacs-gtk
    ripgrep
    # optional dependencies
    coreutils # basic GNU utilities
    fd
    clang

    emacs-all-the-icons-fonts
    # nerd-fonts.fira-code
    fontconfig
    nerd-fonts.symbols-only
    symbola # fallback font

    nixfmt # nix formatter
    shellcheck # shell script analysis tool
    pandoc # convert document formats & markdown compiler for emacs

    # for syntax highlighting in .nix
    emacsPackages.nix-mode
    emacsPackages.magit
    emacsPackages.elpaca
    emacsPackages.auto-yasnippet
    emacsPackages.vterm
    # emacsPackages.olivetti
    # emacsPackages.org-modern

    # auto yasnippet requires cmake
    cmake
  ];
  
  fonts.fontconfig.enable = true;

  # add doom to path to call doom from anywhere
  home.sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];
}
