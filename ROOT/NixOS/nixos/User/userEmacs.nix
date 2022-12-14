{ pkgs ? import <nixpkgs> {} }: 

let
  treeHouseEmacs = pkgs.emacs; 
  emacsWithPackages = (pkgs.emacsPackagesFor treeHouseEmacs).emacsWithPackages; 
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [ 
    # No Packages Installed Via Stable yet
  ]) ++ (with epkgs.melpaPackages; [
    evil # Vim Bindings for Emacs
    vterm # Virtual Terminal for Emacs
    which-key # Displays Keys from Keybinds
    doom-modeline # Custom Modeline from Doom Emacs
    projectile # Project Library
    all-the-icons # Font Icons
    all-the-icons-ivy # Adds Icons for Ivy
    all-the-icons-dired # Adds Icons for Dired
    ivy-rich # Friendly Interface for Ivy
    all-the-icons-ivy-rich # Adds Icon Support to Ivy Rich
    highlight-parentheses # Highlights Functions
    dashboard # Startup Menu
    cmake-mode # Editing Mode for Cmake
    desktop-environment # XF86 Keys Support for EXWM
    tree-sitter # Syntax Support
    tree-sitter-langs # Syntax Support for Tree-Sitter
    sudo-edit # Open Locked Files using Sudo
    rust-mode # Rust Lang Support
    go-mode # Go Lang Support
    haskell-mode # Haskell Lang Support
    yaml-mode # Yaml Syntax Support
    nix-mode # Nix Lang Support
  ]) ++ (with epkgs.elpaPackages; [ 
    use-package # Isolate Installed Pkgs
    exwm # Emacs X Window Manager
    beacon # Highlights Cursor When Scrolling         
    counsel # Cleans Up Emacs Interface
    ivy # Cleans Up Emacs Interface
    rainbow-mode # Highlights Colors of Hex-Codes
  ]))
