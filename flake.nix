{
  description = "Ash's Nixos configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }: 
  let lib = nixpkgs.lib;
  in {
    nixosConfigurations = {

      workstation = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/base.nix
          ./modules/hyprland.nix
          ./modules/programs.nix
          ./modules/steam.nix
        ];
      };

      # # TODO: Write separate configurations for both laptop and server
      # laptop = lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [

      #   ];
      # };

      # server = lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [

      #   ];
      # };

    }
  }
}