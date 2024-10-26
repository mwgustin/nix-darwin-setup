{ lib, ... }:
{
  options = {
    systemConfig.isWork =  lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    systemConfig.username = lib.mkOption {
      type = lib.types.str;
      default = "mgustin";
    };
  };
}