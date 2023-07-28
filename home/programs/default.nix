{ config, pkgs, ... }:

{
  commonPrograms = [

    # Default tools I use
    wget
    git
    net-tools
    vscodium
    via
    clamav
    alacritty

    # Web browsers
    brave
    firefox #fallback

    # Communication
    discord
  ];

  normandyPrograms = [
    mattermost
    _1password
  ];

  tempestPrograms = [
    lutris
    steam
    wine-wayland
  ]
}