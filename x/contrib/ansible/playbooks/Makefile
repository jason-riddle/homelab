# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

# If .secrets file exists, include the file and export all env vars.
-include .secrets
.EXPORT_ALL_VARIABLES:

## Home Assistant

### Provisioning

.PHONY: hass
hass:
	devenv shell -- ansible-playbook hass/main.yml

hass-setup:
	devenv shell -- ansible-playbook hass/setup.yml --ask-pass --ask-become-pass

hass-upgrade:
	devenv shell -- ansible-playbook hass/upgrade.yml --ask-pass --ask-become-pass

## MacPorts

### Provisioning

mp: macports

.PHONY: macports
macports:
	devenv shell -- ansible-playbook macports/packages.yml --ask-become-pass

## OSX

### Provisioning

osx: osx-cli-tools

.PHONY: osx-cli-tools
osx-cli-tools:
	devenv shell -- ansible-playbook osx-cli-tools/install.yml --ask-become-pass

## Dependencies

deps: macports-deps osx-cli-tools-deps

macports-deps:
	devenv shell -- ansible-galaxy install --role-file macports/requirements.yml --force

osx-cli-tools-deps:
	devenv shell -- ansible-galaxy install --role-file osx-cli-tools/requirements.yml --force
