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
            # diffenginetray?
            # craftsman?
            # dotnet-ef
            # dotnet-monitor
            # reportgenerator
            # dotnet-stryker
            # dotnet-trace
            # dotnet-interactive
            # puml-gen
            # livingdoc
            # upgrade-assistant
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
        # (pkgs.buildDotnetGlobalTool {
        #     pname = "reportgenerator";
        #     version = "5.3.11";
        #     nugetHash = "sha256-96rc9YDqb67lOp5S+cFUHw4XJZjha5tklGvipzzs6pQ=";
        #     executables = "reportgenerator";
        #     dotnet-sdk = pkgs.dotnetCorePackages.sdk_8_0;
        #     dotnet-runtime = pkgs.dotnetCorePackages.sdk_8_0;
        # })
    ];

  };


}
