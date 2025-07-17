{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    stow
  ];
  environment.variables = {
    EDITOR = "emacs -nw";
  };
  environment.shells = with pkgs; [
    bash
    zsh    
  ];
  environment.shellAliases = {
    "ls" = "ls -a";
    "nixit" =      
      "cd /Users/${username}/.nix "
      + "&& sudo $(which nix) build .#darwinConfigurations.ETAir.system --show-trace "
      + "&& sudo $(which nix) run nix-darwin -- switch --flake .#ETAir ";
      /*+ "&& sudo $(which darwin-rebuild) switch --flake";*/
  };
  
  nix-homebrew = {
    enable = true;
    user = username;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    # Install from Mac App Store using mas
    # See https://github.com/mas-cli/mas
    masApps = {
      Amphetamine = 937984704;
      Bitwarden = 1352778147;
    };    
    brews = [
      "ollama"
      "npm"
    ];
    casks = [
      "mactex"
      "google-chrome"
      "librewolf"
      "emacs"
      "rectangle"
      "spotify"
      "discord"
      "slack"
      "electronmail"
      "karabiner-elements"
      "libreoffice"
      "mullvadvpn"
    ];    
  };
}
