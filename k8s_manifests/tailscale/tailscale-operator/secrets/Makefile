.DEFAULT_GOAL := build

apply: build
	kubectl apply -f manifest.yml

build:
	kustomize build --enable-helm . > manifest.yml

delete:
	kubectl apply --prune --all -f manifest.yml
