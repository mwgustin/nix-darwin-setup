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
            
            pkgs.oh-my-zsh
            
            # git stuff
            pkgs.git
            pkgs.gh
            pkgs.github-copilot-cli
            pkgs.git-credential-manager
            
            #standard languages
            pkgs.dotnetCorePackages.sdk_8_0_4xx
            pkgs.nodejs_22
            pkgs.go
            pkgs.python3

            #utils
            pkgs.go-task        
            pkgs.jq
            pkgs.yq
            pkgs.ripgrep
            pkgs.ack

            #docker/k8s
            pkgs.kubectl
            pkgs.k9s
            pkgs.kind
            pkgs.kubernetes-helm

            #iac
            pkgs.terraform
            pkgs.sops
        ];
    };
}