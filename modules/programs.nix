{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    firefox
    dolphin
    cinnamon.nemo
    discord
    vesktop
    lxappearance
    adwaita-qt
    adwaita-qt6
    gnome.adwaita-icon-theme
    clapper
    morewaita-icon-theme
    (wrapOBS {
    plugins = with obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  })
  ];






}
