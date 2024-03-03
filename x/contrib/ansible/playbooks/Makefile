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

.PHONY: macports
macports:
	devenv shell -- ansible-playbook macports/main.yml --ask-become-pass

## Dependencies

deps: macports-deps
macports-deps:
	devenv shell -- ansible-galaxy install --role-file macports/requirements.yml --force
