.DEFAULT_GOAL := start

start:
	minikube config set cpus 2
	minikube config set memory 2048
	minikube config set driver docker
	minikube start

delete:
	minikube delete
