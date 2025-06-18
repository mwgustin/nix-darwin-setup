{ ... }:
{
  imports = [
    ../../vars
  ];

  config = {
    systemConfig.isWork = true;
    systemConfig.username = "mgustin";
    systemConfig.git_userName = "Michael Gustin";
    systemConfig.git_userEmail = "Michael.Gustin@hcahealthcare.com";
  };
}