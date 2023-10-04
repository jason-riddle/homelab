.DEFAULT_GOAL := build

build:
	kustomize build --enable-helm . > manifest.yml

apply: build
	kubectl apply --filename manifest.yml

prune:
	kubectl apply --prune --all --filename manifest.yml

# Apps

argocd:
	kubectl --namespace gitops port-forward service/argocd-server 8080:80

argocd-user:
	@echo admin

argocd-pass:
	kubectl --namespace gitops get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode ; echo
