# nixos/mods/audio
{ pkgs, lib, config, ... }:

{
  options = {
    audio.enable = lib.mkEnableOption "enables audio support software";
  };

  config = lib.mkIf config.audio.enable {

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
      wireplumber.enable = true;
    };

    environment.systemPackages = with pkgs; [
      playerctl
    ];
  };
}
