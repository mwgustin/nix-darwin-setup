{ lib, ... }:
{
    imports = [
        ./homebrew.nix
    ];

    homebrewConfig.enable = lib.mkDefault true;
}