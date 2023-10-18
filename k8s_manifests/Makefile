.DEFAULT_GOAL := apply

apply:
	kubectl apply --kustomize .

prune:
	kubectl apply --kustomize . --prune

# Apps

argocd:
	kubectl --namespace argocd port-forward service/argo-cd-argocd-server 8080:80

argocd-user:
	@echo admin

argocd-pass:
	kubectl --namespace argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode ; echo

http-https-echo:
	kubectl --namespace examples port-forward service/http-https-echo 8080:80
