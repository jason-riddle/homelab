.DEFAULT_GOAL := build

apply: build
	kubectl apply --filename manifest.yml

build:
	kustomize build --enable-helm base > manifest.yml

delete:
	kubectl apply --prune --all --filename manifest.yml
