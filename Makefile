.DEFAULT_GOAL := ping

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

## Ansible

k8s:
	ansible-playbook provisioning/k8s.yml

pi_cluster:
	ansible-playbook provisioning/pi_cluster.yml --ask-pass --ask-become-pass

ping:
	ansible all --module-name ansible.builtin.ping --args="data=pong" --ask-pass
