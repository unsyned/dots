
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # required doom emacs dependencies
    git
    emacs # 27.2 suggested for doom emacs
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
  ];
  
  fonts.fontconfig.enable = true;

  # add doom to path to call doom from anywhere
  home.sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];
}
