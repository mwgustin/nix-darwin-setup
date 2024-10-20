{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    homebrewConfig.enable = 
      lib.mkEnableOption "enables homebrew config";
  };

  config = lib.mkIf config.homebrewConfig.enable {
    homebrew = {
      enable = true;
      brews = [
        "mas"
        # "podman-tui"
      ];
      casks = [
        "iina"
        "the-unarchiver"
        "betterdisplay"
        "gitify"
        # "podman-desktop" #theoretically there's a nixpkg for this, but it wasn't working
      ];
      masApps = {
        "Hidden Bar" = 1452453066;
        #"Xcode" = 497799835;
        "Hand Mirror" = 1502839586;
        "PR Focuse" = 6449602269;
        "PluralSight" = 431748264;
      };
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = false;
      onActivation.upgrade = true;
    };

  };


}
