## This file is currently pinned.
## To un-pin, make this line active and then disable the other `pkgs` definition.
# { pkgs ? import <nixpkgs> {} }:

let
  pins = {
    ## nixpkgs v22.05: Good for php74
    v2205 = fetchTarball {
      url = "https://github.com/nixos/nixpkgs/archive/ce6aa13369b667ac2542593170993504932eb836.tar.gz";
      sha256 = "0d643wp3l77hv2pmg2fi7vyxn4rwy0iyr8djcw1h5x72315ck9ik";
    };
    ## nixpkgs v23.11: Good for php82
    v2311 = fetchTarball {
      url = "https://github.com/nixos/nixpkgs/archive/057f9aecfb71c4437d2b27d3323df7f93c010b7e.tar.gz";
      sha256 = "1ndiv385w1qyb3b18vw13991fzb9wg4cl21wglk89grsfsnra41k";
    };
  };
  pkgs = import (pins.v2205) {};
  php =  pkgs.php74.buildEnv {
    ## EVALUATE: apcu_bc
    # extensions = { all, enabled}: with all; enabled++ [opcache ];
    extraConfig = ''
      memory_limit=-1
    '';
  };

in pkgs.mkShell {
    nativeBuildInputs = [
      php
      php.packages.composer

      ## Commonly needed for shells, but not specifically assessed re:PHPGitIgnore
      pkgs.bash-completion
      pkgs.bzip2
      pkgs.coreutils
      pkgs.curl
      pkgs.gnumake
      pkgs.gnutar
      pkgs.patch
      pkgs.unzip
      pkgs.which
      pkgs.zip
    ];
    shellHook = ''
      source ${pkgs.bash-completion}/etc/profile.d/bash_completion.sh
    '';
  }
