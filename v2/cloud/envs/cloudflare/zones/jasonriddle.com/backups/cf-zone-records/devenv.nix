{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  # env.ANSIBLE_LOAD_CALLBACK_PLUGINS = "True";
  # env.ANSIBLE_STDOUT_CALLBACK = "yaml";

  # https://devenv.sh/languages/
  languages.terraform = {
    enable  = true;
    version = "1.8.4";
  };

  # https://devenv.sh/packages/
  packages = [
    pkgs.cf-terraforming
  ];

  # enterShell = ''
  #   pip install --upgrade pip
  #   pip install "esphome==2023.12.9" "pillow==10.1.0"
  # '';

  # https://devenv.sh/tests/
  # enterTest = ''
  #   echo "Running tests"
  #   git --version | grep "2.42.0"
  # '';

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks.shellcheck.enable = false;

  # See full reference at https://devenv.sh/reference/options/
}
