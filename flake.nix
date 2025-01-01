{
  description = "Ash's Nixos configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: 
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {

      workstation = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/base.nix
          ./modules/hyprland.nix
          ./modules/programs.nix
          ./modules/steam.nix
          ./modules/devenv.nix
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

      devShells.x86_64-Linux.default = (import ./shell.nix {inherit pkgs;});
    };
  };
}
