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

  config = lib.mkIf config.default-utils.enable  {
    home.packages = with pkgs; [
      discord
      filezilla
      handbrake
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