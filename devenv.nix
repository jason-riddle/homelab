{ pkgs, ... }:

{
  # https://devenv.sh/languages/
  languages.python = {
    enable = true;
    venv.enable = true;
  };

  # https://devenv.sh/packages/
  packages = [
    pkgs.ansible
    pkgs.kubectl
    pkgs.kustomize
    pkgs.tio
  ];

  # enterShell = ''
  #   pip3 install "esphome==2023.8.3" "pillow>4.0.0,<10.0.0"
  # '';

  enterShell = ''
    pip3 install "esphome==2023.12.5" "pillow==10.1.0"
  '';

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks.shellcheck.enable = false;

  # See full reference at https://devenv.sh/reference/options/
}
