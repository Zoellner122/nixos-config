{ config, pkgs, ...}:


# Making sure both machines download BSPWM dotfiles
import ./chezmoi.nix

{
  # Setting packages to use with all systems
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    chezmoi
    brave
    bspwm
    skhd
    polybar
    dunst
    discord

  ];

  # Setting some default services
  networking.networkmanager.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.displayManager.gdm.enable = true;
}