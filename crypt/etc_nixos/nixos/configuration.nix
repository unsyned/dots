# heads up to self, you will probably need to run the following to specify where the config is
# sudo nixos-rebuild switch -I nixos-config=/mnt/etc/nixos/configuration.nix

# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;

    # if space is held on bootup, it will enter generation menu
    timeout = 0; # change timeout to 0 so I don't have to select a generation on bootup. 
  };

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # filesystems
  #fileSystems = {
  #  "/".device = "/dev/nvme0n1p3";
  #};

  # auto login
  services.getty.autologinUser = "sy";
  
  # add sleep functionality with systemd sleep
#  systemd.sleep.extraConfig =  ''
#    AllowSuspend=no
#    AllowHibernation=no
#    AllowHybridSleep=no
#    AllowSuspendThenHibernate=no
#  '';

  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    zsh			# shell
    git 		# git gud
    gh			# github cli
    kitty		# terminal emulator
    vim			# editor
    neovim		# editor I use lol
    wget		# ... it's wget you silly
    curl		# client url :P
    tmux 		# terminal multiplexer
    fzf			# fuzzy finder
    # wm stuffs
    #hyprland		# wm
    rofi-wayland	# application launcher
    waybar		# status bar
    hyprpaper		# wallpaper manager
    # system control
    pamixer
    pavucontrol
    # brightnessctl	# for brightness on laptop
    wl-clipboard	# clipboard
    hyprshot		# screen shotting. wrapper around grim and slurp.
    mako 		# notification daemon
    # browsers
    firefox		# browser
    floorp		# experimental browser
    # other applications
    btop 		# resource monitor / task manager
    yazi		# tui file manager
    superfile		# tui file manager
    nautilus		# file manager
    dolphin		# file manager
    xfce.thunar		# file manager
    xfce.thunar-archive-plugin
    xfce.thunar-volman	# enables automatic management of removables drives/media
    xfce.tumbler	# thunar thumbnails
    ffmpegthumbnailer	# video thumbnails
    gvfs		# trash support and mounts
    spotify		# spotify
    obsidian 		# notes yo
    vesktop 		# bc discord sucks on linux
    discord
    discord-ptb		# discord public test build
    discord-canary	# discord canary. less stable than above
    ffmpeg 		# convert files
    swww		# pretty moving wallpapers :D
    nwg-look 		# to change cursor
    catppuccin-gtk	# catppuccin themes
    catppuccin-cursors
    catppuccin-kvantum	
    phinger-cursors	# cursors
    comixcursors
    font-awesome 	# icons in waybar
    hyprlock		# lock screen
    nitch		# neofetch basically
    # keeb stuffs
    vial
    via
    qmk
    qmk_hid
    #keymapviz		# qmk keymap.c visualizer
    # utility apps?
    calibre		# ebook library manager
    #gimp		# image editor I think?
    geeqie		# image viewer
    zathura		# pdf viewer
    tdf			# terminal pdf viewer
    zip
    unzip

    ### DEV LANGUAGES
    # C/C++
    #libgcc
    #clang-tools
    #cmake
    #codespell
    #conan
    #cppcheck
    #doxygen
    #gtest
    #lcov
    #vcpkg
    #vcpkg-tool
    # Java
    #jdk23
    #jdk21
    #jdk17
    #jdk11
    #jdk8
    #zulu23
    #zulu21
    #zulu17
    #zulu11
    #zulu8


  ];

  # keeb stuffs
  services.udev = {
  	packages = with pkgs; [
	  qmk			# qmk duh
	  qmk-udev-rules	# official qmk udev rules list. the only one that has to be here I think...
	  qmk_hid		# configure qmk hid devices on commandline
	  via			# via
	  vial			# vial
	]; # packages
  }; # udev

  
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    fira-code # my goto default nerd font
    #droid-sans-mono # supposedly good for small screens and font sizes
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sy = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  # set zsh as default user shell for all users
  users.defaultUserShell = pkgs.zsh;

  # to specify if a user should use default shell or not
  # users.users.{myuser}.useDefaultShell = true

  # programs
  # programs.firefox.enable = true;
  
  # enable zsh
  programs.zsh.enable = true;

  # enable noisetorch and setcap wrapper. virtual mic device with noise suppression
  programs.noisetorch.enable = true;
  
  # enable hyprland
  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true;
    xwayland.enable = true;
  };
  environment.sessionVariables = {
    # If cursor is invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };
  hardware = {
    # Opengl
    opengl.enable = true;
    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
    # enable bluetooth, and enable on startup
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
    # run `systemctrl restart bluetooth` after making changes and restarting
  };

  # Spotify stuff
  networking.firewall.allowedTCPPorts = [ 57621 ]; # sync local tracks from my filesystem with mobile devices in same network
  networking.firewall.allowedUDPPorts = [ 5353 ]; # enable discovery of Google Cast devices and other Spotify Connect devices

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable blueman bluetooth manager
  services.blueman.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

