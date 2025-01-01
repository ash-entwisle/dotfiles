{ config, pkgs, ... }:

{
  imports = [
    ../hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  users.users.ash = {
    isNormalUser = true;
    description = "Ash Entwisle";
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [];
    initialHashedPassword = "password"; # Set an initial password, rmbr to change it on first login lol
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    helix
    wget
    git
    fish
    zoxide
    bottom
  ];

  environment.variables = {
    XCURSOR_SIZE = "24";
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  security.sudo.wheelNeedsPassword = true;

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PermitRootLogin = "no";
      UseDns = true;
      PasswordAuthentication = false;
    };
  };

  # TODO: find all ports that need to be open for the good ol gamin'
  # networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ 22 ];
  networking.firewall.enable = false;


  system.stateVersion = "24.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Systemd Service to Disable ASPM for AX210
  systemd.services.disable-aspm = {
    description = "Disable ASPM on AX210 at boot";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      # ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.pciutils}/bin/setpci -s 08:00.0 0x50.B=0x40'";
      ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.pciutils}/bin/setpci -s \"$(${pkgs.pciutils}/bin/lspci | ${pkgs.gawk}/bin/awk \\'/AX210/{print \\$1}\\')\" 0x50.B=0x40'";
      ExecStop = "${pkgs.bash}/bin/bash -c '${pkgs.pciutils}/bin/setpci -s \"$(${pkgs.pciutils}/bin/lspci | ${pkgs.gawk}/bin/awk \\'/AX210/{print \\$1}\\')\" 0x50.B=0x42'";
      RemainAfterExit = "yes";
    };
  };

}
