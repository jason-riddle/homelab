.DEFAULT_GOAL := deps

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

# If .secrets file exists, include the file and export all env vars.
-include .secrets
.EXPORT_ALL_VARIABLES:

## Cluster

### Maintenance

cluster-ping:
	devenv shell -- ansible cluster --module-name ansible.builtin.ping --args="data=pong" --ask-pass -v

cluster-reboot:
	devenv shell -- ansible cluster --module-name ansible.builtin.reboot --args="reboot_timeout=300" --ask-pass

### Provisioning

.PHONY: cluster
cluster:
	devenv shell -- ansible-playbook cluster/main.yml

cluster-setup:
	devenv shell -- ansible-playbook cluster/setup.yml --ask-pass --ask-become-pass

cluster-upgrade:
	devenv shell -- ansible-playbook cluster/upgrade.yml --ask-pass --ask-become-pass

### Manifests

build:
	devenv shell -- kustomize build --enable-helm cluster/manifests | grep -v Requirement > cluster/manifests/manifest.yml

apply: build
	devenv shell -- kubectl apply --filename cluster/manifests/manifest.yml

# TODO: Not working
# prune:
# 	devenv shell -- kubectl apply --filename cluster/manifests/manifest.yml --prune --all

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

## ESPHome

.PHONY: esphome
esphome:
	devenv shell -- esphome run esphome/airgradient/config.yml --device http://192.168.1.232

.PHONY: esphome-usb
esphome-usb:
	devenv shell -- esphome run esphome/airgradient/config.yml --device /dev/cu.usbserial-2130

## Dependencies

deps:
	devenv shell -- ansible-galaxy install --role-file requirements.yml --force

## Debug

graph:
	devenv shell -- ansible-inventory --graph
