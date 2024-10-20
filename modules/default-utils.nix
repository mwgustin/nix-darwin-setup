{
    config,
    pkgs,
    ...
}: 

{
    home.packages = with pkgs; [
        pkgs.oh-my-zsh
        
        pkgs.git
        pkgs.gh
        pkgs.github-copilot-cli
        pkgs.git-credential-manager

        
        #standard languages
        pkgs.dotnetCorePackages.sdk_8_0_4xx
        pkgs.nodejs_22
        pkgs.go
        pkgs.python3

        pkgs.go-task        
        pkgs.jq
        pkgs.yq

        #docker/k8s
        pkgs.kubectl
        pkgs.k9s
        pkgs.kind

        pkgs.ripgrep
        pkgs.kubernetes-helm
        pkgs.sops
        pkgs.ack
        pkgs.terraform
    ];
}