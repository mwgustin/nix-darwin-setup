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
      kicad
      lmstudio
      moonlight-qt
      obs-studio
      spotify
      steam
      tytools
      vcv-rack
      vlc

    ];
  };
}