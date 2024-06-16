.DEFAULT_GOAL := backup

SERVICE_NAME := http-https-echo
SERVICE_YAML := service.yml

backup:
	devenv shell -- gcloud run services describe $(SERVICE_NAME) --format export > $(SERVICE_YAML)
	devenv shell -- gcloud run services describe $(SERVICE_NAME) --format export > backups/LATEST/$(SERVICE_YAML)

deploy:
	devenv shell -- gcloud run services replace $(SERVICE_YAML)
