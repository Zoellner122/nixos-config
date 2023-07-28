# Main Flake file
{
  description = "NixOS Configuration Zoellner122";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    normandy = {
      url = "github:user/nixos-config/system/normandy";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tempest = {
      url = "github:user/nixos-config/system/tempest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, normandy, tempest, ... }:
    let
      # Import the individual flakes
      normandyOutput = import (normandy.path + "/flake.nix");
      tempestOutput = import (tempest.path + "/flake.nix");
    in
    {
      # Combine the outputs of the individual flakes with the main outputs
      nixosConfigurations = {
        normandy = normandyOutput.outputs.nixosConfigurations.normandy;
        tempest = tempestOutput.outputs.nixosConfigurations.tempest;
      };

      homeManagerConfigurations = {
        normandy = normandyOutput.outputs.homeConfigurations.normandy;
        tempest = tempestOutput.outputs.homeConfigurations.tempest;
      };

      # Include other outputs as needed
      nixpkgs = import nixpkgs {};
      home-manager = import home-manager {};
      nixos-generators = import nixos-generators {};
    };
}