.DEFAULT_GOAL := build

build:
	kustomize build --enable-helm base > manifest.yml

apply: build
	kubectl apply --filename manifest.yml

prune:
	kubectl apply --prune --all --filename manifest.yml
