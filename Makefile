.DEFAULT_GOAL := deps

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

## Cluster

### Maintenance

cluster-ping:
	ansible cluster --module-name ansible.builtin.ping --args="data=pong" --ask-pass -v

cluster-reboot:
	ansible cluster --module-name ansible.builtin.reboot --args="reboot_timeout=300" --ask-pass

### Provisioning

.PHONY: cluster
cluster:
	ansible-playbook cluster/main.yml

cluster-setup:
	ansible-playbook cluster/setup.yml --ask-pass --ask-become-pass

cluster-upgrade:
	ansible-playbook cluster/upgrade.yml --ask-pass --ask-become-pass

### Manifests

build:
	kustomize build --enable-helm cluster/manifests > cluster/manifests/manifest.yml

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
	ansible-playbook home-assistant/setup.yml --ask-pass --ask-become-pass

ha-upgrade:
	ansible-playbook home-assistant/upgrade.yml --ask-pass --ask-become-pass

### Debug

ha-console:
	sudo tio /dev/cu.usbserial-210

ha-screen:
	sudo screen /dev/cu.usbserial-210 115200

## ESPHome

.PHONY: esphome
esphome:
	devenv shell -- esphome run esphome/airgradient.yml --device http://192.168.1.232

.PHONY: esphome-usb
esphome-usb:
	devenv shell -- esphome run esphome/airgradient.yml --device /dev/cu.usbserial-2130

## Dependencies

deps:
	ansible-galaxy install --role-file requirements.yml --force

## Debug

graph:
	ansible-inventory --graph
