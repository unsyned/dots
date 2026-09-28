{ pkgs, lib, config, ... }:

{
  options = {
    keyb.enable = lib.mkEnableOption "enables keyboard software";
  };

  config = lib.mkIf config.keyb.enable {

    # keyboard // qmk, vial, via
    # Enables QMK udev rules
    hardware.keyboard.qmk.enable = true;
    # Vial, via udev rules
    services.udev.packages = [
      pkgs.vial
      pkgs.via
      pkgs.dos2unix
      # pkgs.kanata-with-cmd
    ];
    
    environment.systemPackages = with pkgs; [
      # keyboard // qmk, vial, via
      qmk
      via
      vial
      # required for qmk
      dos2unix
    ];

    hardware.uinput.enable = true;
    boot.kernelModules = [ "uinput" ];
    services.kanata = {
      enable = true;
      package = pkgs.kanata-with-cmd;
      # keyboards.internalKeyboard.extraDefCfg = "process-unmapped-keys yes";
    };
    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput" 
      '';
  };
}
