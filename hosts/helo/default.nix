{ ... }:
{
  imports = [
    ../common.nix
  ];

  # home-manager configurations
  users.users.mgustin = {
    name = "mgustin";
    home = "/Users/mgustin";
  };
  home-manager.backupFileExtension = "backup";

  system.defaults.dock.persistent-apps = [
    "${pkgs.alacritty}/Applications/Alacritty.app"
    "${pkgs.logseq}/Applications/Logseq.app"
    "${pkgs.google-chrome}/Applications/Google Chrome.app"
  ];
}