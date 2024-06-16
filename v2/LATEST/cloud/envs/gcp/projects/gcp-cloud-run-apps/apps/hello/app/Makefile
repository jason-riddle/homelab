.DEFAULT_GOAL := backup

SERVICE_NAME := hello
SERVICE_YAML := service.yml

backup:
	gcloud run services describe $(SERVICE_NAME) --format export > $(SERVICE_YAML)
	gcloud run services describe $(SERVICE_NAME) --format export > backups/LATEST/$(SERVICE_YAML)

deploy:
	gcloud run services replace $(SERVICE_YAML)
