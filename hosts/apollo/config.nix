{ ... }:
{
  imports = [
    ../../vars
  ];

  config = {
    systemConfig.isWork = false;
    systemConfig.username = "gustin";
  };
}