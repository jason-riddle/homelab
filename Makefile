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

### Debug

cluster-facts:
	devenv shell -- ansible cluster --module-name ansible.builtin.setup --tree /tmp/ansible-facts --ask-pass -v

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

## ESPHome

.PHONY: esphome
esphome:
	devenv shell -- esphome run esphome/airgradient/config.yml --device http://192.168.1.162

.PHONY: esphome-usb
esphome-usb:
	devenv shell -- esphome run esphome/airgradient/config.yml --device /dev/cu.usbserial-2130

## Dependencies

deps:
	devenv shell -- ansible-galaxy install --role-file requirements.yml --force

## Debug

graph:
	devenv shell -- ansible-inventory --graph
