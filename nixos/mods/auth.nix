{ pkgs, ... }:

{
## would love to enable fingerprint reader but it's not seamless atm. requires fingerprint to unlock and disables password until timeout and failed attempt at finger unlock
  # security.pam.services.greetd.allowNullPassword = true; # required for initial session (autologin on first boot) to work
  # security.pam.services.sudo.fprintAuth = true;
  # services.fprintd.enable = true;
  # security.pam.services.greetd = {
  #   fprintAuth = true; # fingerprint auth (pam_fprintd)
  #   u2fAuth = true; # U2F keys
  # };
}
