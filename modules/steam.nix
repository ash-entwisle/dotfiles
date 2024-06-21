{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    winetricks
  ];
  
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

  };

  programs.steam.package = pkgs.steam.override {
    withPrimus = true;
    extraPkgs = pkgs: [ bumblebee glxinfo ];
    withJava = true;
  };

  programs.steam.gamescopeSession.enable = true;

  programs.java.enable = true; 

  programs.gamemode.enable = true;

  programs.lutris.enable = true;
  programs.wineWowPackages.stable.enable = true;
  programs.winetricks.enable = true;
  programs.protontricks.enable = true;


}