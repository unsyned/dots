{ inputs, config, pkgs, oniri, ... }:

# for initialization on a new system, must use nix run first: nix run github:nix-community/home-manager/release-26.05 -- switch --flake .#unsyned
# where the version should be the version of your system

{
  imports = [
    inputs.noctalia.homeModules.default
    inputs.helium-flake.homeModules.default
    # inputs.plasma-manager.homeManagerModules.plasma-manager
    ./sh.nix
    ./apps.nix
    ./emacs.nix
    # ./plasma.nix
  ];

  programs.noctalia.enable = true;
  programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
  programs.waybar.enable = true; # launch on startup in the default setting (bar)
  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "unsyned";
  home.homeDirectory = "/home/unsyned";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.localsend # airdrop alternative
    pkgs.xwayland-satellite # xwayland support for niri
    pkgs.swaybg # wallpaper for niri
    pkgs.ddcutil # brightness control
    pkgs.brightnessctl # brightness control
    oniri
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  # services.displayManager.noctalia-greeter.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file."${config.xdg.configHome}/nvim" = {
  # home.file.".config/nvim" = { # equivalent to the above
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dots/nvim";
    recursive = true;
  };
  home.file."${config.xdg.configHome}/doom" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dots/doom";
    recursive = true;
  };

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD"; # force intel media driver

    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
  };
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/unsyned/etc/profile.d/hm-session-vars.sh
  #

  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
