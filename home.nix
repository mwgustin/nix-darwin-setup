# home.nix

{ config, pkgs, lib, ... }:

{
  imports = [
    ./modules/default-utils.nix
  ];

  home.stateVersion = "23.05";
  home.packages = [
    pkgs.alacritty
    pkgs.vscode
    pkgs.logseq
    
    pkgs.google-chrome

  ];


  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update-nix = "darwin-rebuild switch --flake ~/nix";

      hg = "history | grep -i";

      dnb = "dotnet build";
      dnr = "dotnet run";
      dns = "dotnet restore";
      dnsi = "dotnet restore --interactive";
      dnt = "dotnet test";

      gaa = "git add -A";
      gcm = "git commit -m";
      gps = "git push";
      gpl = "git pull";
      gs = "git status";
      gcam = "git commit -a -m";
      gca = "git commit -a";
    };

    sessionVariables = {
      PATH = "/opt/homebrew/bin:$PATH";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "dotenv"
        "dotnet"
        "docker"
        "docker-compose"
        "kubectl"
        "terraform"
        "vscode"
      ];
      theme = "robbyrussell";
    };
  };

  programs.git = {
    enable = true;
    userName = "Mike Gustin";
    userEmail = "gustin.mike@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # home.activation.artifact-cred-provider = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   sh -c "$(curl -fsSL https://aka.ms/install-artifacts-credprovider.sh)"
  # '';
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

    #".zshrc".source = ~/dotfiles/.zshrc;
    #".shell_config".source = ~/dotfiles/.shell_config;

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/davish/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
