{ config, pkgs, options, ... }:

{
  # Core Systems Settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "thetreehouse";
  networking.networkmanager.enable = true;

  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Overlays 
  nix.nixPath = [
    "nixpkgs-overlays=/etc/nixos/Overlays/"
  ];
  
  # Suckless DWM
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        src = /home/larry/Suckless/DWM;
      });
    })
  ];
  
  # Visual and Graphics Settings
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;

  services.xserver.enable = true;

  services.xserver.displayManager.startx.enable = true; 
  services.xserver.windowManager.dwm.enable = true;

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable the Printing Services
  services.printing.enable = true;

  # Audio Configuration
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Touchpad Support for Laptops
  services.xserver.libinput.enable = true;

  # Global Sudo Configuration
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # SSH Settings
  programs.mtr.enable = true;
  programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # Daemon Services & Configurations
  services.openssh.enable = true;
  services.emacs.enable = true;
}
