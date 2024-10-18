{
  description = "Gustin Darwin Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager = {
    	url = "github:nix-community/home-manager";
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
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
	  nixpkgs.config.allowUnfree = true;

          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.alacritty
            pkgs.mkalias
            pkgs.nixfmt-rfc-style
            pkgs.neovim
	    pkgs.logseq
	    

	    pkgs.gh
	    pkgs.github-copilot-cli
	    pkgs.go-task
	    
	    pkgs.python3 

            pkgs.dotnetCorePackages.sdk_8_0_4xx
	    #pkgs.azure-cli
	    #pkgs.azure-functions-core-tools

            pkgs.tmux

	    pkgs.google-chrome

          ];
          fonts.packages = [
            (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
          ];

	  homebrew = {
	    enable = true;
	    brews = [
	      "mas"
	    ];
	    casks = [
	      "iina"
	      "the-unarchiver"
	      "betterdisplay"
	    ];
	    masApps = {
	      "Hidden Bar" = 1452453066;
	      #"Xcode" = 497799835;
	      "Hand Mirror" = 1502839586;
	      "PR Focuse" = 6449602269;
	      "PluralSight" = 431748264;
	    };
	    onActivation.cleanup = "zap";
	    onActivation.autoUpdate = true;
	    onActivation.upgrade = true;
	  };


	  # home-manager configurations
	  users.users.mgustin = {
	    name = "mgustin";
            home = "/Users/mgustin";
	  };
	  home-manager.backupFileExtension = "backup";
	  nix.configureBuildUsers = true;


	  # Handle mapping gui packages to Applications so it indexes properly
          system.activationScripts.applications.text =
            let
              env = pkgs.buildEnv {
                name = "system-applications";
                paths = config.environment.systemPackages;
                pathsToLink = "/Applications";
              };
            in
            pkgs.lib.mkForce ''
              # Set up applications.
              echo "setting up /Applications..." >&2
              rm -rf /Applications/Nix\ Apps
              mkdir -p /Applications/Nix\ Apps
              find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
              while read src; do
                app_name=$(basename "$src")
                echo "copying $src" >&2
                ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
              done
            '';

	  # system settings
	  system.defaults = {
	    # dock
	    dock.autohide = true;
	    dock.tilesize = 32;
	    dock.orientation = "left";
	    dock.persistent-apps = [
	      "${pkgs.alacritty}/Applications/Alacritty.app"
              "${pkgs.logseq}/Applications/Logseq.app"
	      "${pkgs.google-chrome}/Applications/Google Chrome.app"

	    ];
	    finder.FXPreferredViewStyle = "clmv";
	    NSGlobalDomain.AppleInterfaceStyle = "Dark";
	    NSGlobalDomain.AppleICUForce24HourTime = true;
	    NSGlobalDomain.KeyRepeat = 2;
	    NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
	  };

          # keyboard remaps
	  system.keyboard = {
	    enableKeyMapping = true;
	    userKeyMapping = [
	      # remap capslock to cmd
	      { 
	        HIDKeyboardModifierMappingSrc = 30064771129;
                HIDKeyboardModifierMappingDst = 30064771299;
	      }
	    ];
          };


          # Auto upgrade nix package and the daemon service.
          services.nix-daemon.enable = true;
          # nix.package = pkgs.nix;

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Create /etc/zshrc that loads the nix-darwin environment.
          programs.zsh.enable = true; # default shell on catalina
          # programs.fish.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Mikes-MacBook-Pro
      darwinConfigurations."Mikes-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        modules = [ 
		configuration 
		nix-homebrew.darwinModules.nix-homebrew
		{
		  nix-homebrew = {
		    enable = true;
		    enableRosetta = true;
		    user = "mgustin";
		  };
		}
		home-manager.darwinModules.home-manager {
		  home-manager.useGlobalPkgs = true;
		  home-manager.useUserPackages = true;
		  home-manager.users.mgustin = import ./home.nix;

		}
	];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."Mikes-MacBook-Pro".pkgs;
    };
}
