.DEFAULT_GOAL := backup

backup:
	curl --fail --silent --show-error --location http://go/.export \
		| tee LATEST/golinks.jsonl
