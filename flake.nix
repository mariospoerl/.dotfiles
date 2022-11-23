{
  description = "Marios NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
    
    lib = nixpkgs.lib;
    
  in {
    homeManagerConfigurations = {
      mario = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        username = "mario";
        homeDirectory = "/home/mario";
        configuration = {
          imports = [
            ./users/mario/home.nix
          ];
        };
      };
    };
    
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;

        modules = [
          ./system/configuration.nix
        ];
      };
    };
    
  };
}
