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
      taps = [
        "nikitabobko/tap"
      ];
      brews = [
        "mas"
      ];
      casks = [
        "iina"
        "the-unarchiver"
        "betterdisplay"
        "gitify"
        "elecom-mouse-util"
        "github" #nix pkg is linux only. 
        "aerospace"
        # "podman-desktop" #theoretically there's a nixpkg for this, but it wasn't working
        
      ] ++ lib.optionals (!config.systemConfig.isWork) [
        "adobe-creative-cloud"
        "balenaetcher"
        "protokol"
      ];
      masApps = {
        "Hidden Bar" = 1452453066;
        #"Xcode" = 497799835;
        "Hand Mirror" = 1502839586;
        "PR Focuse" = 6449602269;
        "PluralSight" = 431748264;
      };
      if (!config.systemConfig.isWork) then {
        masApps = {
          "WireGuard" = 1451685025;
        }
      } else {};
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = false;
      onActivation.upgrade = true;
    };

  };


}
