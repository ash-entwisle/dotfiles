{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    firefox
    dolphin
    nemo
    discord
    vesktop
    lxappearance
    adwaita-qt
    adwaita-qt6
    gnome.adwaita-icon-theme
    morewaita-icon-theme
  ];






}