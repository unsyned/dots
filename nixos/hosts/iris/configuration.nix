# hosts/iris/configuration.nix

{ pkgs, ... }:

{

  audio.enable = true;
  keyb.enable = true;

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_7_2;

  networking.hostName = "iris";

  # recommended conf for modern intel systems
  services.xserver.videoDrivers = [ "modesetting" ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
  # Required for modern Intel GPUs (Xe iGPU and ARC)
      intel-media-driver     # VA-API (iHD) userspace
      intel-vaapi-driver
      vpl-gpu-rt             # oneVPL (QSV) runtime

  # Optional (compute / tooling):
        intel-compute-runtime  # OpenCL (NEO) + Level Zero for Arc/Xe
  # NOTE: 'intel-ocl' also exists as a legacy package; not recommended for Arc/Xe.
  # libvdpau-va-gl       # Only if you must run VDPAU-only apps
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";     # Prefer the modern iHD backend
  # VDPAU_DRIVER = "va_gl";      # Only if using libvdpau-va-gl
  };
# turns off dock controller deep sleep to reduce time for monitor initialization on docking stations
  boot.kernelParams = [ "pcie_aspm=off" ];

  system.stateVersion = "26.05"; # Did you read the comment?
}

