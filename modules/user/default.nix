{ lib, ... }:
{
    imports = [
        ./default-utils.nix
    ];

    default-utils.enable = lib.mkDefault true;
}