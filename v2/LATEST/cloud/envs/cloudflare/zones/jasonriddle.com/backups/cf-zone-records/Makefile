.DEFAULT_GOAL := backup

# jasonriddle.com
ZONE := 9f93875a5fa04d2c57407aac00a18ce9

backup:
	cf-terraforming generate \
		--resource-type "cloudflare_record" \
		--zone $(ZONE) | tee LATEST/cf-zone-records.tf.backup
