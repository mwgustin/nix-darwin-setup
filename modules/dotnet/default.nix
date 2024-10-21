{ lib, ... }:
{
    imports = [
        ./dotnet-tools.nix
    ];

    dotnet-tools.enable = lib.mkDefault true;
}