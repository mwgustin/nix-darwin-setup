{ pkgs, ... } :
{
  stylix.enable = true;
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-mirage.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/edge-dark.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/heetch.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/harmonic16-dark.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/github.yaml"; #no dark version??
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/google-dark.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark-dark.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/material-vivid.yaml";
  stylix.image = ../assets/wallpapers/Twilight-Illumination-3840.png;
  stylix.opacity.applications = 0.85;
  stylix.opacity.desktop = 0.85;
  stylix.opacity.terminal = 0.85;
  stylix.fonts = {

    sansSerif = {
      package = pkgs.nerdfonts.override { fonts = ["FiraCode" ];};
      name = "FiraCode Nerd Font Propo";
    };

    monospace = {
      package = pkgs.nerdfonts.override { fonts = ["FiraCode"];} ;
      name = "FiraCode Nerd Font Mono";
    };
  };
}