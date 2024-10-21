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
            # pkgs.github-desktop
            
            #standard language etc
            pkgs.nodejs_22
            pkgs.go
            pkgs.python3
            pkgs.dotnetCorePackages.sdk_8_0_4xx
            pkgs.sqlite


            #dotnet tools
            # csharprepl
            # diffenginetray?
            # craftsman?
            # docfx
            # dotnet-counters
            # dotnet-coverage
            # dotnet-ef
            # dotnet-monitor
            # reportgenerator
            # dotnet-stryker
            # dotnet-trace
            # dotnet-interactive
            # puml-gen
            # livingdoc
            # upgrade-assistant
            

            #utils
            pkgs.ack
            pkgs.age
            pkgs.chromedriver
            pkgs.ffmpeg_7
            pkgs.go-task        
            pkgs.hyperfine
            pkgs.jq
            pkgs.ripgrep
            pkgs.yq


            #docker/k8s
            pkgs.kubectl
            pkgs.k9s
            pkgs.kind
            pkgs.kubernetes-helm

            #iac
            pkgs.terraform
            pkgs.sops

            #cloud tools
            pkgs.confluent-cli
            pkgs.google-cloud-sdk
            # azd
            # azure-cli
            # aztfexport
            # azure-functions-core-tools@4
            

            # CI/CD
            pkgs.act
            pkgs.actionlint
            pkgs.argocd
            pkgs.dapr-cli
            pkgs.runme

        ];
    };
}