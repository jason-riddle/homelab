.DEFAULT_GOAL := backup

backup:
	curl --fail --silent --show-error --location http://go/.export \
		| tee backups/LATEST/golinks.jsonl

deploy:
	flyctl deploy --ha=false

# vol-create:
# 	flyctl volumes create golink_data_machines --region=lax --size=1

# vol-list:
# 	flyctl volumes list

# vol-delete:
# 	flyctl volumes destroy <vol_id>
