{ config, ...}:

let
  hostConfig = builtins.readFile ("~/.nix-config/hosts/" + builtins.getEnv "HOSTNAME" + "/*.nix");
in
import (builtins.fromJSON hostConfig)