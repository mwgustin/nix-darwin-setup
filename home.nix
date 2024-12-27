# home.nix

{ pkgs, lib, config, ... }:

{
  imports = [
    ./modules/user
    ./modules/dotnet
    # ./modules/stylix.nix
  ];


  home.stateVersion = "23.05";

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      rebuild-switch = "darwin-rebuild switch --flake ~/nix#Helo";

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

      docker="podman";

      # tasks
      t = "task";
      tt = "task test";
      ttr = "task test-report";

      # pto analyzer
      pto = "pto-analyzer";

    };

    
    sessionVariables = {
      ZVM_VI_INSERT_ESCAPE_BINDKEY="kj";
      EDITOR = "nvim";
      DiffEngine_ToolOrder = "VisualStudioCode";
      XDG_HOME_CONFIG = "$HOME/.config";
    };
    
    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

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

    initExtra = "

# --- initExtra

#custom bins
export PATH=/Users/${config.systemConfig.username}/bin:$PATH

#yazi setup
function y() {
	local tmp=\"$(mktemp -t \"yazi-cwd.XXXXXX\")\" cwd
	yazi \"$@\" --cwd-file=\"$tmp\"
	if cwd=\"$(command cat -- \"$tmp\")\" && [ -n \"$cwd\" ] && [ \"$cwd\" != \"$PWD\" ]; then
		builtin cd -- \"$cwd\"
	fi
	rm -f -- \"$tmp\"
}

# --- end initExtra
    ";

  };

  programs.nushell = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = config.systemConfig.git_userName;
    userEmail = config.systemConfig.git_userEmail;

    extraConfig = {
      init.defaultBranch = "main";
    };
    
    ignores = [
      ".DS_Store"
      "flake.nix"
    ];
  };


# programs.git.ignores
  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    

  };
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    # need to set webGpu frontend or it gets mangled on mac`
    extraConfig = ''
    local config = wezterm.config_builder()
    config.front_end = "WebGpu"
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    config.use_fancy_tab_bar = true
    config.macos_window_background_blur = 40
    return config
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };


  # home.activation.artifact-cred-provider = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   sh -c "$(curl -fsSL https://aka.ms/install-artifacts-credprovider.sh)"
  # '';
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".aerospace.toml".source = ./home/.aerospace.toml;
    # ".logseq".source = ./home/.logseq;
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
