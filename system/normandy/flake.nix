# Flake file for Normandy (Ent. Laptop)
{
  description = "NixOS Configuration for Normandy";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpgks";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  {
    nixosConfigurations.normandy = nixpkgs.lib.nixosSystem {
      nixosConfigurations.normandy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            nix.settings.experimental-features = [ "nix-command" "flakes" ];

            # Normandy's Network Config
            networking.hostName = "normandy";
            networking.networkmanager.enable = true;

            # User Definition
            users.users.rick = {
              isNormalUser = true;
              description = "Rick van Helvert";
              extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
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
  };
}
