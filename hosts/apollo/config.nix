{ ... }:
{
  imports = [
    ../../vars
  ];

  config = {
    systemConfig.isWork = false;
    systemConfig.username = "gustin";
    systemConfig.git_userName = "Mike Gustin";
    systemConfig.git_userEmail = "gustin.mike@gmail.com";
  };
}