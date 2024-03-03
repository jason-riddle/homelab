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
	devenv shell -- ansible-playbook playbooks/hass/main.yml

hass-setup:
	devenv shell -- ansible-playbook playbooks/hass/setup.yml --ask-pass --ask-become-pass

hass-upgrade:
	devenv shell -- ansible-playbook playbooks/hass/upgrade.yml --ask-pass --ask-become-pass

## MacPorts

### Provisioning

.PHONY: macports
macports:
	devenv shell -- ansible-playbook playbooks/macports/main.yml
