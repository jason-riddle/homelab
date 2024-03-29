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
    pkgs.kubernetes-helm
    pkgs.kustomize
    pkgs.tio
  ];

  enterShell = ''
    pip install --upgrade pip
    pip install "esphome==2023.12.9" "pillow==10.1.0"
  '';

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks.shellcheck.enable = false;

  # See full reference at https://devenv.sh/reference/options/
}
