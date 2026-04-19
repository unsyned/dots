{ config, pkgs, ... }:

let
  aliases = {
      nv = "nvim";
      hm = "home-manager";
  };
in

{
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "emacsclient -c -a emacs";
  };

  programs = {
    # shell things :P
    zsh = {
      enable = true;
      shellAliases = aliases;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ]; # todo: consider whether we want to bundle this with the git configs so that it is not enabled without git
      };
    };

    bash = {
      enable = true;
      shellAliases = aliases;
    };

    oh-my-posh = {
      enable = true;
      useTheme = "material";
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}
