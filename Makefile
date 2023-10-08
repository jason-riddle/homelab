.DEFAULT_GOAL := ping

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

## Ansible

ha:
	ansible-playbook provisioning/ha.yml --ask-pass --ask-become-pass

pi_cluster:
	ansible-playbook provisioning/pi_cluster.yml --ask-pass --ask-become-pass

ping:
	ansible all --module-name ansible.builtin.ping --args="data=pong" --ask-pass

reboot:
	ansible all --module-name ansible.builtin.reboot --args="reboot_timeout=300" --ask-pass

upgrade:
	ansible-playbook provisioning/tasks/upgrade.yml --ask-pass --ask-become-pass

deps:
	ansible-galaxy install --role-file provisioning/requirements.yml --force
