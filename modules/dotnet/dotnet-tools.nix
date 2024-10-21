{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    dotnet-tools.enable = 
      lib.mkEnableOption "enables dotnet-tools config";
  };

  config = lib.mkIf config.dotnet-tools.enable {
    home.packages = with pkgs;
    [
        #dotnet tools
        # find the version on nuget.  When upgrading, the first build will fail b/c the hash won't match. Update the hash and you're good to go
        (pkgs.buildDotnetGlobalTool {
            pname = "Microsoft.dotnet-interactive";
            version = "1.0.522904";
            nugetHash = "sha256-ULnG2D7BUJV39cSC4sarWlrngtv492vpd/BjeB5dKYQ=";
            executables = "dotnet-interactive";
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "dotnet-repl";
            version = "0.1.216";
            nugetHash = "sha256-JHatCW+hl2792S+HYeEbbYbCIS+N4DmOctqXB/56/HU=";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "docfx";
            version = "2.77.0";
            nugetHash = "sha256-wIoKciEMeE8WOysMSmaoPvMtyPi8M0fPF9nkvPss6Js=";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "dotnet-counters";
            version = "8.0.547301";
            nugetHash = "sha256-AYT06BqaY1IPA8YTlvLNdQQgmslKmZK6tS7s8Lm8Rss=";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "dotnet-coverage";
            version = "17.12.6";
            nugetHash = "sha256-Lpp4nwe4yKvwq7/YVM87RNv8nWF6nBUdz3FwCtjyNYs=";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "dotnet-reportgenerator-globaltool";
            version = "5.3.11";
            nugetHash = "sha256-UdDU7vVk4BCp3s6MpsED/4BUdV8V1Ge4/CGd0fPd7ss=";
            executables = "reportgenerator";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "dotnet-ef";
            version = "8.0.10";
            nugetHash = "sha256-J12XiJquBNUp3OwHdv43hIFoaJ9dz2P6BEIzgZf+w0I=";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "dotnet-monitor";
            version = "8.0.5";
            nugetHash = "sha256-+mzgx8f+GOO1BnhVuuxGq+2pkoSK0mUen1LuU0FII6k=";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "dotnet-stryker";
            version = "4.3.0";
            nugetHash = "sha256-WsLGga2Yw0/t9fveadnMwSu7ujTfmO25iCioUn9zghA=";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "dotnet-trace";
            version = "8.0.547301";
            nugetHash = "sha256-de+w/XJ9zK8RAVKrdvKzuPv5GOhSH2WCanFGSgyWFuU=";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "PlantUmlClassDiagramGenerator";
            version = "1.4.0";
            nugetHash = "sha256-77wB/WZhH6f4nHFy8IR6sIE7PdabXlNUMSKQByk+Kc4=";
            executables = "puml-gen";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })
        (pkgs.buildDotnetGlobalTool {
            pname = "upgrade-assistant";
            version = "0.5.793";
            nugetHash = "sha256-eOq3wvPSbRY6hPdm+SLGkwiD7JgIYs8k2xPX3NdAdVU=";
            dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
            dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        })

    ];

  };


}
