.DEFAULT_GOAL := deps

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

# If .secrets file exists, include the file and export all env vars.
-include .secrets
.EXPORT_ALL_VARIABLES:

## Cluster

### Provisioning

.PHONY: cluster
cluster:
	devenv shell -- ansible-playbook cluster/main.yml

cp: control_plane
control_plane:
	devenv shell -- ansible-playbook cluster/main.yml --tags control_plane

nodes:
	devenv shell -- ansible-playbook cluster/main.yml --tags nodes

### Kubeconfig

kubeconfig:
	devenv shell -- ansible-playbook cluster/main.yml --tags kubeconfig

### Deploy

build:
	devenv shell -- kustomize build --enable-helm cluster/manifests | grep -v Requirement > cluster/manifests/manifest.yml

apply: build
	devenv shell -- kubectl apply --filename cluster/manifests/manifest.yml

# TODO: Not working
# prune:
# 	devenv shell -- kubectl apply --filename cluster/manifests/manifest.yml --prune --all

### Maintenance

ping:
	devenv shell -- ansible cluster --module-name ansible.builtin.ping --args="data=pong" --ask-pass -v

reboot:
	devenv shell -- ansible cluster --module-name ansible.builtin.reboot --args="reboot_timeout=300" --ask-pass

### Debug

graph:
	devenv shell -- ansible-inventory --graph

facts:
	devenv shell -- ansible cluster --module-name ansible.builtin.setup --tree /tmp/ansible-facts

sn:
	devenv shell -- ansible cluster --module-name ansible.builtin.command --args='cat /sys/firmware/devicetree/base/serial-number' --one-line

## ESPHome

.PHONY: esphome
esphome:
	devenv shell -- esphome run esphome/airgradient/config.yml --device http://192.168.1.162

esphome-usb:
	devenv shell -- esphome run esphome/airgradient/config.yml --device /dev/cu.usbserial-2130

## Dependencies

deps:
	devenv shell -- ansible-galaxy install --role-file requirements.yml --force
