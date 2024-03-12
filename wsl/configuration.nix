# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, inputs, ... }:

{
  # Define user accounts
  users.users = {
    # Personal Account
    albalamia = {
      createHome = true;
      description = "Personal Account";
      extraGroups = [ "wheel" ];
      group = "users";
      isNormalUser = true;
    };
    # Work Account
    # si = {
    #   createHome = true;
    #   description = "Work Account";
    #   extraGroups = [ "wheel" ];
    #   group = "users";
    #   isNormalUser = true;
    # };
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "si" = import ../users/si.nix;
    };
  };

  # Installing Packages
  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  # WSL
  wsl.enable = true;
  wsl.defaultUser = "nixos";
  wsl.docker-desktop.enable = true;

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}