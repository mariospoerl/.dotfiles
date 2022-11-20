{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "mario";
  home.homeDirectory = "/home/mario";
  
  # My packages
  home.packages = with pkgs; [
    onlyoffice-bin
    thunderbird
    freecad
    git
    git-crypt
    gnupg
    pinentry_qt
  ];

  # Switch on GPG Encryption for Git-Crypt
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };
  
  # My ZSH Shell
  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "strug";
    };
  };

  # My Emacs Configuration
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.web-mode
      epkgs.vterm
    ];
    extraConfig = ''
      ; Display line numbers
      (global-display-line-numbers-mode)
    ''; 
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
