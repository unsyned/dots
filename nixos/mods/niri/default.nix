# nixos/mods/niri

{ pkgs, inputs, noctalia, oniri, ... }:

{

  programs.xwayland.enable = true;
  programs.niri.enable = true;

  services.xserver.enable = true;

  security.polkit.enable = true;
  # the following enables reboot and poweroff perms to unpriviledged users
  security.polkit.extraConfig = ''
    polkit.addRule(function (action, subject) {
        if (
            subject.isInGroup("users") &&
            [
            "org.freedesktop.login1.reboot",
            "org.freedesktop.login1.reboot-multiple-sessions",
            "org.freedesktop.login1.power-off",
            "org.freedesktop.login1.power-off-multiple-sessions",
            ].indexOf(action.id) !== -1
           ) {
        return polkit.Result.YES;
        }
        });
  '';

  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.noctalia-greeter

    pkgs.waybar
    pkgs.mako
    pkgs.swayidle
    pkgs.swaylock
    pkgs.xwayland-satellite # xwayland support for niri
    pkgs.swaybg # wallpaper for niri
    pkgs.ddcutil # brightness control
    pkgs.brightnessctl # brightness control
    pkgs.playerctl # media controls
    oniri
  ];
  # noctalia recommended services
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  # this is an alternative but idk why to choose between them: 
  #services.tuned.enable = true;
  services.upower.enable = true;

  services.greetd = {
    enable = true;
    settings = {

      # initial_session = {
      #   command = "${pkgs.niri}/bin/niri-session";
      #   user = "unsyned";
      # };

      default_session = {
        command = "${pkgs.noctalia-greeter}/bin/noctalia-greeter-session";
        user = "greeter";
      };
    };
  };

  # services.displayManager.dms-greeter = {
  #   enable = true;
  #   compositor.name = "niri";
  # };

}
