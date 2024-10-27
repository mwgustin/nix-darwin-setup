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
    "${pkgs.alacritty}/Applications/WezTerm.app"
    "${pkgs.logseq}/Applications/Logseq.app"
    "${pkgs.google-chrome}/Applications/Google Chrome.app"
    "${pkgs.google-chrome}/Applications/Discord.app"
  ];
}