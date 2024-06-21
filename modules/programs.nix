{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    firefox
    dolphin
    discord
    vesktop
  ];






}