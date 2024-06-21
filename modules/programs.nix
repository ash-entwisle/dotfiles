{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    firefox
    dolphin
    cinnamon.nemo
    discord
    vesktop

    # TODO: sort these
    lxappearance
    adwaita-qt
    adwaita-qt6
    gnome.adwaita-icon-theme
    morewaita-icon-theme
    jetbrains-mono
  ];






}