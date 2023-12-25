.DEFAULT_GOAL := deps

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

## Home-Assistant

### Maintenance

ha-ping:
	ansible home-assistant --module-name ansible.builtin.ping --args="data=pong" --ask-pass -v

ha-reboot:
	ansible home-assistant --module-name ansible.builtin.reboot --args="reboot_timeout=300" --ask-pass

### Provisioning

ha:
	ansible-playbook home-assistant/main.yml

ha-setup:
	ansible-playbook home-assistant/tasks/setup.yml --ask-pass --ask-become-pass

ha-upgrade:
	ansible-playbook home-assistant/tasks/upgrade.yml --ask-pass --ask-become-pass

## ESPHome

.PHONY: esphome
esphome:
	esphome run esphome/airgradient.yml --device http://192.168.1.232

.PHONY: esphome-usb
esphome-usb:
	esphome run esphome/airgradient.yml --device /dev/cu.usbserial-2130

## Dependencies

deps:
	ansible-galaxy install --role-file requirements.yml --force

## Debug

graph:
	ansible-inventory --graph
