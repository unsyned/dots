# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, inputs, ... }:

{

  #included in the flake.nix
  # imports =
    # [ # Include the results of the hardware scan.
      # ./hosts/iris/hardware-configuration.nix
    # ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # solve early init problems
  boot.initrd.systemd.enable = true;
  # boot.initrd.availableKernelModules = [ "hid_generic" "usbhid" "i8042" ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  ##################################################################################
  ############################## REQUIRED BY NOCTALIA ##############################
  ##################################################################################
  # Enable networking
  networking.networkmanager.enable = true;
  # Enable bluetooth
  hardware.bluetooth.enable = true;
  # for power profiles
  services.power-profiles-daemon.enable = true;
  # this is an alternative but idk why to choose between them: 
  #services.tuned.enable = true;
  # battery feature for noctalia
  services.upower.enable = true;
  # imports = [
  #   inputs.noctalia.nixosModules.default
  # ];
  # programs.noctalia = {
  #   enable = true;
  #   recommendedServices.enable = true;
  # };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
        intel-vaapi-driver
    ];
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    # LC_IDENTIFICATION = "en_US.UTF-9";
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

  # Enable the XFCE Desktop Environment.
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;
  programs.xwayland.enable = true;
  programs.niri.enable = true;
  # services.displayManager.ly.enable = false;
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "unsyned";
      };
      default_session = {
        command = "${pkgs.noctalia-greeter}/bin/noctalia-greeter-session";
        user = "greeter";
      };
      # default_session = initial_session;
    };
  };

## would love to enable fingerprint reader but it's not seamless atm. requires fingerprint to unlock and disables password until timeout and failed attempt at finger unlock
  # security.pam.services.greetd.allowNullPassword = true; # required for initial session (autologin on first boot) to work
  # security.pam.services.sudo.fprintAuth = true;
  # services.fprintd.enable = true;
  # security.pam.services.greetd = {
  #   fprintAuth = true; # fingerprint auth (pam_fprintd)
  #   u2fAuth = true; # U2F keys
  # };

#TODO uncomment later
  # services.displayManager = {
  #   autoLogin = {
  #     enable = true;
  #     user = "unsyned";
  #   };
  # };

  # services.displayManager.dms-greeter = {
  #   enable = true;
  #   compositor.name = "niri";
  # };
  # services.displayManager.noctalia-greeter = {
  #   enable = true;
  # };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # Use the WirePlumber session manager
    # wireplumber.enable = true;
  };

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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

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

  # keyboard // qmk, vial, via
  # Enables QMK udev rules
  hardware.keyboard.qmk.enable = true;
  # Vial, via udev rules
  services.udev.packages = [
    pkgs.vial
    pkgs.via
  ];
  services.kanata = {
    enable = true;
    package = pkgs.kanata-with-cmd;
  };


  nix.settings.experimental-features = [ "nix-command" "flakes"];
  # increase download buffer size for large packages
  # nix.settings.download-buffer-size = 134217728; # 128MiB
  nix.settings.download-buffer-size = 1073741824; # GiB

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
