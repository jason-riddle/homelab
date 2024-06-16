.DEFAULT_GOAL := esphome

## ESPHome

esphome:
	devenv shell -- esphome run ./config.yml --device http://192.168.1.162

esphome-usb:
	devenv shell -- esphome run ./config.yml --device /dev/cu.usbserial-2130
