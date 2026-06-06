{ pkgs, dfs, ... }:

{
  home.username = "glebdovzhenko";
  home.homeDirectory = "/home/glebdovzhenko";
  home.stateVersion = "26.05";

  programs.neovim = {
    enable = true;
    withPython3 = true;
    extraPackages = with pkgs; [
      ripgrep
      fd
      tree-sitter
      clang-tools
      nixd
      nixpkgs-fmt
      lua-language-server
      gopls
      pyright
    ];
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Gleb Dovzhenko";
        email = "dovjenko.g@gmail.com";
      };
    };
  };

  programs.tmux = {
    enable = true;
  };

  home.packages = with pkgs; [ 
    # font with extra symbols
    nerd-fonts.dejavu-sans-mono
    # other general stuff
    lazygit
  ];

  home.file = {
    nvim = {
      target = ".config/nvim";
      source = "${dfs.outPath}/nvim";
      recursive = true;
      force = true;
    };
    tmux = {
      target = ".config/tmux";
      source = "${dfs.outPath}/tmux";
      recursive = true;
      force = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
