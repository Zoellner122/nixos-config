{ config, pkgs, ... }:

let
  # Define shared configurations here
  commonConfig = {
    programs = {
      zsh = {
        enable = true;
        promptInit = ''
          autoload -U promptinit; promptinit
          prompt pure  # Replace with your preferred zsh prompt theme
        '';
      };
      neovim = {
        enable = true;
        extraConfig = ''
          " Replace this with your custom neovim configuration ";
        '';
      };
      git = {
        enable = true;
        globalUserConfig = ''
          user.name Zoellner122
          user.email your.email@example.com
        '';
      };
      # Add more Home Manager programs and configurations as needed.
      # For example, to enable the fish shell, you can use:
      # fish = { enable = true; };
    };

    # Add any custom Home Manager configuration, such as additional home.file, home.text, etc.
    # For example:
    home.file.".ssh/config".text = ''
      # Your custom SSH configuration goes here
    '';

    home.text = ''
      # Additional custom configuration goes here
    '';
  };
in

{
  home.username = "zoellner122";  # Default username

  # Check the hostname and override configurations for "Normandy"
  homeConfig = if config.networking.hostName == "normandy" then {
    home.username = "rick";  # Use a different username for Normandy
    programs.git.globalUserConfig = ''
      # Different git configuration for Normandy
      user.name Rick
      user.email rick@example.com
    '';
  } else commonConfig;

  # Merge the shared configurations with the specific configurations for the host
  config = homeConfig // commonConfig;
}