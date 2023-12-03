.DEFAULT_GOAL := ping

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

## Cluster

### Maintenance

ping:
	ansible cluster --module-name ansible.builtin.ping --args="data=pong" --ask-pass

reboot:
	ansible cluster --module-name ansible.builtin.reboot --args="reboot_timeout=300" --ask-pass

### Provisioning

setup:
	ansible-playbook cluster/tasks/setup.yml --ask-pass --ask-become-pass

tailscale:
	ansible-playbook cluster/tasks/tailscale.yml --ask-pass --ask-become-pass

upgrade:
	ansible-playbook cluster/tasks/upgrade.yml --ask-pass --ask-become-pass

## Home-Assistant

### Maintenance

ha-ping:
	ansible ha --module-name ansible.builtin.ping --args="data=pong" --ask-pass

ha-reboot:
	ansible ha --module-name ansible.builtin.reboot --args="reboot_timeout=300" --ask-pass

### Provisioning

ha-setup:
	ansible-playbook home-assistant/tasks/setup.yml --ask-pass --ask-become-pass

ha-tailscale:
	ansible-playbook home-assistant/tasks/tailscale.yml --ask-pass --ask-become-pass

ha-upgrade:
	ansible-playbook home-assistant/tasks/upgrade.yml --ask-pass --ask-become-pass

## ESPHome

.PHONY: esphome
esphome:
	esphome run esphome/airgradient.yml --device http://192.168.1.232

.PHONY: esphome-usb
esphome-usb:
	esphome run esphome/airgradient.yml --device /dev/cu.usbserial-2130

## Development

deps:
	ansible-galaxy install --role-file requirements.yml --force
