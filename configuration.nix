{ pkgs, ... }:
{
  users.users."repro" = {
    initialPassword = "password";
    isNormalUser = true;
    shell = pkgs.nushell;
  };
  services.getty.autologinUser = "repro";
  programs.sway = {
    enable = true;
  };
  services.xserver.xkb.layout = "de";
  services.xserver.xkb.variant = "dvorak";
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-mozc ];
  };
  services.dbus.enable = true;
  environment.sessionVariables = {
    QT_IM_MODULE = "fcitx";
    GTK_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
  environment.systemPackages = [
    pkgs.wmenu
    pkgs.foot
    pkgs.librewolf
  ];
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "24.11";
}
