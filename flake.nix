{
  description = "Gustin Darwin Flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util = 
    {
      url = "github:hraban/mac-app-util";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      home-manager,
      mac-app-util,
      ...
    }:
    let
      specialArgs = {
        inherit
          inputs
          self
          nix-darwin
          nix-homebrew
          nixpkgs
          home-manager
          mac-app-util
          ;
      };
    in
    {
      # Build darwin flake using:
      darwinConfigurations = 
      {
        # $ darwin-rebuild switch --flake .#Helo
        Helo = nix-darwin.lib.darwinSystem {
          inherit specialArgs;
          modules = [
            ./hosts/helo/base.nix
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = "mgustin";
              };
            }
            inputs.stylix.darwinModules.stylix
            mac-app-util.darwinModules.default
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.mgustin = import ./home.nix;
              home-manager.sharedModules = [
                mac-app-util.homeManagerModules.default
              ];
            }
          ];
        };
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations.Helo.pkgs;
    };
}
