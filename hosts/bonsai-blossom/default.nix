# Blossom - Personal Laptop

{ config, pkgs, home-manager, ... }:

{
  imports = [ 
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "bonsai-blossom";
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Perth";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Define user accounts
  users.users.si = {
    description = "Work Account";

    group = "users";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    isNormalUser = true;
    useDefaultShell = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.si = import ../../users/si.nix;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Installing Packages
  environment.systemPackages = with pkgs; [
    wl-clipboard # Wayland copy&paste support
    # Browser
    firefox-devedition
    # Terminal
    kitty
  ];

  # Window Manager
  security.polkit.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1"; # Alt Key
      terminal = "kitty";
      output = {
        "Virtual-1" = {
          mode = "1920x1080@120Hz";
        };
      };
    };
  };
}
