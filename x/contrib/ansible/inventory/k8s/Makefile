.DEFAULT_GOAL := graph

# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

# If .secrets file exists, include the file and export all env vars.
-include .secrets
.EXPORT_ALL_VARIABLES:

## Graph

graph: k8s-graph
k8s-graph:
	devenv shell -- ansible-inventory --inventory inventory.k8s.yml --graph

## Dependencies

deps:
	devenv shell -- ansible-galaxy install --role-file requirements.yml --force
