{ ... }:
{
  imports = [
    ../../vars
  ];

  config = {
    systemConfig.isWork = true;
    systemConfig.username = "mgustin";
  };
}