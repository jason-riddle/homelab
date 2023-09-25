.DEFAULT_GOAL := ping

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

## Ansible

main:
	ansible-playbook main.yml

k8s:
	ansible-playbook provisioning/k8s_control_plane.yml

pi_cluster:
	ansible-playbook provisioning/pi_cluster.yml

ping:
	ansible all --module-name ansible.builtin.ping --args="data=pong"
