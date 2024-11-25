{
  config,
  pkgs,
  lib,
  ...
}: 

{
  options = {
    default-utils.enable = 
      lib.mkEnableOption "enables default utils";
  };

  config = lib.mkIf config.default-utils.enable  {
    home.packages = with pkgs; [
      # neovim
      tmux
      oh-my-zsh
      
      # git stuff
      git
      gh
      github-copilot-cli
      git-credential-manager
      # github-desktop
      
      #standard language etc
      nodejs_22
      go
      python3
      (with dotnetCorePackages; combinePackages [
        sdk_8_0_4xx
        sdk_9_0
      ])
      sqlite
      
      #utils
      ack
      age
      chromedriver
      ffmpeg_7
      go-task        
      hyperfine
      jq
      ripgrep
      yq
      yazi
      neofetch
      btop
      base16-shell-preview
  
      nixd # nix lsp



      #docker/k8s
      kubectl
      k9s
      kind
      kubernetes-helm
      # colima

      qemu

      #iac
      terraform
      sops

      #cloud tools
      confluent-cli
      google-cloud-sdk

      #azure stuff is broken in nixpkg right now so using homebrew. 
      # azd
      # azure-cli
      # aztfexport
      # azure-functions-core-tools@4
      

      # CI/CD
      act
      actionlint
      argocd
      dapr-cli
      runme

      #GUI apps
      alacritty
      vscode

      google-chrome

      raycast

      # azuredatastudio

    ];
  };
}