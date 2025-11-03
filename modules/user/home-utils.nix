{
  config,
  pkgs,
  lib,
  ...
}: 

{ 
  options = {
    home-utils.enable = 
      lib.mkEnableOption "enables home utils";
  };

  config = lib.mkIf config.home-utils.enable  {
    home.packages = with pkgs; [
      discord
      # moonlight-qt  # Disabled on macOS due to Wayland dependency
      spotify
      # tytools

    ];
  };
}