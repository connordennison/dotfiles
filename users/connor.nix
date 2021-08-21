{ config, pkgs, ... }:

{
  users.users.connor = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    hashedPassword = "$6$5x5zl6Ztze5VTi$IY/9vKrnemcmNWqDU/K1hLCiLfjnNPRS3NEyN/u/nuI61RIT3Kk4Zq6hI20TSBOPSAPgU6/Tgnp/hjb6HJCZq.";

    packages = with pkgs; [
      firefox
      discord
      libreoffice
      kate
      neofetch
      nodejs
      yarn
      git
      vscode
      alacritty
      starship
      gotop
      ark
      obsidian
      gwenview

      # Theoretically required for VSCode
      desktop-file-utils
      libsecret
      gnome.gnome-keyring
    ];
  };

  home-manager.users.connor = {
    home.sessionVariables.GIT_YOINK_ROOT = "~/Documents/Programming/";

    programs.bash = {
      enable = true;
      shellAliases.skate = "SUDO_EDITOR=kate sudoedit";

      # Sourced in .bash_profile, not .bashrc, so this gets us environment variables
      # in interactive sessions like terminals.
      initExtra = ''
        . "$HOME/.profile"
      '';
    };

    programs.git = {
      enable = true;
      userName = "connor";
      userEmail = "me@cnnd.co.uk";
      extraConfig = {
        init.defaultBranch = "main";
        # user.signingkey = "";
        # commit.gpgsign = true;
      };
      aliases.get = "!npx git-yoink";
    };

    programs.starship = {
      enable = true;
      enableBashIntegration = true;
    };

    programs.alacritty = {
      enable = true;
      settings = {
        font.normal.family = "FiraCode Nerd Font";

        colors = {
          primary = {
            background = "0x1e2127";
            foreground = "0xabb2bf";
            bright_foreground = "0xe6efff";
          };

          normal = {
            black = "0x1e2127";
            red = "0xe06c75";
            green = "0x98c379";
            yellow = "0xd19a66";
            blue = "0x61afef";
            magenta = "0xc678dd";
            cyan = "0x56b6c2";
            white = "0x828791";
          };

          bright = {
            black = "0x5c6370";
            red = "0xe06c75";
            green = "0x98c379";
            yellow = "0xd19a66";
            blue = "0x61afef";
            magenta = "0xc678dd";
            cyan = "0x56b6c2";
            white = "0xe6efff";
          };

          dim = {
            black = "0x1e2127";
            red = "0xe06c75";
            green = "0x98c379";
            yellow = "0xd19a66";
            blue = "0x61afef";
            magenta = "0xc678dd";
            cyan = "0x56b6c2";
            white = "0x828791";
          };
        };
      };
    };
  };
}