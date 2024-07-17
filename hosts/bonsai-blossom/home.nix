{ pkgs, username, ... }:

{
  # Configs
  ## Sway
  home.file.".config/sway/config".source = ../../programs/sway/config;
  ## ZSH
  programs.zsh = {
    enable = true;

    shellAliases = {
      battery = "cat /sys/class/power_supply/BAT0/capacity";
    };
  };

  # Wallpapers
  home.file."pictures/wallpapers".source = ../../wallpapers;

  home.stateVersion = "23.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}