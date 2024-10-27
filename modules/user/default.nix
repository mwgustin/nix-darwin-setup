{ lib, config, ... }:
{
    imports = [
        ./default-utils.nix
        ./home-utils.nix
    ];

    default-utils.enable = lib.mkDefault true;
    home-utils.enable = !config.systemConfig.isWork;
}