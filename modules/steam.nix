{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
    lutris
    protontricks
  ];
  
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

  };

  # programs.steam.package = pkgs.steam.override {
  #   # withPrimus = true;
  #   # extraPkgs = pkgs: [ bumblebee glxinfo ]; # for some reson this no work???
  #   withJava = true;
  # };

  programs.steam.gamescopeSession.enable = true;

  programs.java.enable = true; 

  programs.gamemode.enable = true;


}