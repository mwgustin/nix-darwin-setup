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
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util = 
    {
      url = "github:hraban/mac-app-util";
      inputs.nixpkgs.follows = "nixpkgs";
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
      inherit (self) outputs;
      # inherit (nixpkgs) lib;
      specialArgs = {
        inherit
          inputs
          outputs
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
            ./hosts/helo
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = "mgustin"; # TODO: how to fix this so it gets username from host config
              };
            }
            inputs.stylix.darwinModules.stylix
            mac-app-util.darwinModules.default
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.mgustin = import ./home.nix; # TODO: how to fix this so it gets username from host config
              home-manager.sharedModules = [
                mac-app-util.homeManagerModules.default
                ./hosts/helo/config.nix
              ];
            }
          ];
        };

        # $ darwin-rebuild switch --flake .#Apollo
        Apollo = nix-darwin.lib.darwinSystem {
          inherit specialArgs;
          modules = [
            ./hosts/apollo
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = "gustin"; # TODO: how to fix this so it gets username from host config
                autoMigrate = true;
              };
            }
            inputs.stylix.darwinModules.stylix
            mac-app-util.darwinModules.default
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.gustin = import ./home.nix; # TODO: how to fix this so it gets username from host config
              home-manager.sharedModules = [
                mac-app-util.homeManagerModules.default
                ./hosts/apollo/config.nix
              ];
            }
          ];
        };
      };
      
      # Expose the package set, including overlays, for convenience.
      darwinPackages = {
        Helo = self.darwinConfigurations.Helo.system;
        Apollo = self.darwinConfigurations.Apollo.system;
      };
    };
}
