{ pkgs, config, ... }:
{
  
  imports = [
    ../darwin-common
    ./config.nix
  ];


  # home-manager configurations
  users.users."${config.systemConfig.username}" = {
    name = config.systemConfig.username;
    home = "/Users/${config.systemConfig.username}";
  };
  home-manager.backupFileExtension = "backup";

  system.defaults.dock.persistent-apps = [
    "${pkgs.wezterm}/Applications/WezTerm.app"
    "/Applications/Logseq.app"
    "${pkgs.google-chrome}/Applications/Google Chrome.app"
  ];
}