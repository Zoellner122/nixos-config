# Flake file for Tempest (Main Desktop)
{
  description = "NixOS Configuration for Tempest";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpgks";
    }; 
  };

  outputs = { nixpkgs, home-manager, ... }:
  {
    nixosConfigurations.tempest = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          nix.settings.experimental-features = [ "nix-command" "flakes" ];

          # Tempest's Network Config
          networking.hostName = "tempest";
          networking.networkmanager.enable = true;

          # User definition
          users.users.zoellner122 = {
            isNormalUser = true;
            description = "Rick";
            extraGroups = [ "networkmanager" "wheel" "audio" "video"];
          };

          user.defaultUserShell = pkgs.fish;
          programs.fish.enable = true;
          environment.shells = with pkgs; [ fish ];

          time.timeZone = "Europe/Amsterdam";
          i18n.defaultLocale = "en_US.UTF-8";

          i18n.extraLocaleSettings = {
            LC_ADDRESS = "nl_NL.UTF-8";
            LC_IDENTIFICATION = "nl_NL.UTF-8";
            LC_MEASUREMENT = "nl_NL.UTF-8";
            LC_MONETARY = "nl_NL.UTF-8";
            LC_NAME = "nl_NL.UTF-8";
            LC_NUMERIC = "nl_NL.UTF-8";
            LC_PAPER = "nl_NL.UTF-8";
            LC_TELEPHONE = "nl_NL.UTF-8";
            LC_TIME = "nl_NL.UTF-8";
          };
        }
      ];
    };
  };
}