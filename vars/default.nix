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
    systemConfig.git_userName = lib.mkOption {
      type = lib.types.str;
      default = "Mike Gustin";
    };
    systemConfig.git_userEmail = lib.mkOption {
      type = lib.types.str;
    };
  };
}