# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

# If .secrets file exists, include the file and export all env vars.
-include .secrets
.EXPORT_ALL_VARIABLES:

## Home Assistant

### Maintenance

hass-ping:
	devenv shell -- ansible hass --module-name ansible.builtin.ping --args="data=pong" --ask-pass -v

hass-reboot:
	devenv shell -- ansible hass --module-name ansible.builtin.reboot --args="reboot_timeout=300" --ask-pass

### Provisioning

.PHONY: hass
hass:
	devenv shell -- ansible-playbook hass/main.yml

hass-setup:
	devenv shell -- ansible-playbook hass/setup.yml --ask-pass --ask-become-pass

hass-upgrade:
	devenv shell -- ansible-playbook hass/upgrade.yml --ask-pass --ask-become-pass

### Debug

hass-console:
	sudo tio /dev/cu.usbserial-210

hass-screen:
	sudo screen /dev/cu.usbserial-210 115200
