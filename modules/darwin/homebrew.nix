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
        "azure/homebrew-azd"
        "azure/functions"
      ];
      brews = [
        "mas"

        #future nixpkgs, but broken python stuff right now
        "azure-cli"
        "azd"
        "aztfexport"
        "azure-functions-core-tools@4"
        
        "podman"
        "podman-compose"
        # "docker"

      ];
      casks = [
        "iina"
        "the-unarchiver"
        "betterdisplay"
        "gitify"
        "elecom-mouse-util"
        "aerospace"
        "podman-desktop" #theoretically there's a nixpkg for this, but it wasn't working
       
        # linux only nix pkgs
        "github" #nix pkg is linux only. 
        "mongodb-compass" #nix pkg is linux only

        "logseq" #nixpkg causing issues??

        "windows-app" #microsoft remote desktop

      ] ++ lib.optionals (!config.systemConfig.isWork) [
        "adobe-creative-cloud"
        "balenaetcher"
        "protokol"

        # linux only nix pkgs
        "filezilla"
        "handbrake"

      ];
      masApps = {
        "Hidden Bar" = 1452453066;
        #"Xcode" = 497799835;
        "Hand Mirror" = 1502839586;
        "PR Focuse" = 6449602269;
        "PluralSight" = 431748264;
      } // lib.optionalAttrs (!config.systemConfig.isWork) {
        "WireGuard" = 1451685025;
      };
      onActivation.cleanup = "zap";
      onActivation.autoUpdate = false;
      onActivation.upgrade = true;
    };

  };


}
