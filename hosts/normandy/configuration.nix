{ config, pkgs, ...}:

{
  imports = [
    ../common.nix
  ];

  environment.systemPackages = with pkgs; [
    pkgs._1password-gui

  ];

  services.printing.enable = true;
}