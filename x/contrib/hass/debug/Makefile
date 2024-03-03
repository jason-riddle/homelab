# REF: https://github.com/ansible/ansible/issues/76322
# REF: https://docs.ansible.com/ansible/latest/reference_appendices/faq.html#running-on-macos-as-a-controller
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY := YES

# If .secrets file exists, include the file and export all env vars.
-include .secrets
.EXPORT_ALL_VARIABLES:

## Home Assistant

### Debug

hass-console:
	sudo tio /dev/cu.usbserial-210

hass-screen:
	sudo screen /dev/cu.usbserial-210 115200
