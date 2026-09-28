# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, inputs, ... }:

{

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # # Use latest kernel.
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_7_2;
  # solve early init problems
  boot.initrd.systemd.enable = true;
  # boot.initrd.availableKernelModules = [ "hid_generic" "usbhid" "i8042" ];

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # services.displayManager = {
  #   autoLogin = {
  #     enable = true;
  #     user = "unsyned";
  #   };
  # };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  nix.settings.trusted-users = [ "root" "@wheel" ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."unsyned" = {
    isNormalUser = true;
    description = "sy";
    extraGroups = [ "networkmanager" "wheel" "greetd" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    vim
    git
    curl
  #   wget
  ];

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # set default shell
  environment.shells = with pkgs; [ zsh bash];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;


  nix.settings.experimental-features = [ "nix-command" "flakes"];
  # increase download buffer size for large packages
  # nix.settings.download-buffer-size = 134217728; # 128MiB
  nix.settings.download-buffer-size = 1073741824; # GiB

}
