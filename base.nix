{ pkgs, inputs, self, ... }:
{
  imports = [
    ./modules/darwin
    ./modules/stylix.nix
  ];
  # homebrewConfig.enable = true;
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.mkalias
    pkgs.nixfmt-rfc-style

    pkgs.neovim
    pkgs.tmux

    pkgs.base16-schemes

  ];

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = ["FiraCode" "JetBrainsMono"]; })
      font-awesome
      material-design-icons
    ];
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  

  # home-manager configurations
  users.users.mgustin = {
    name = "mgustin";
    home = "/Users/mgustin";
  };
  home-manager.backupFileExtension = "backup";
  nix.configureBuildUsers = true;

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
}