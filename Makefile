.PHONY: deploy get-pods stop clean

deploy:
	kubectl apply -f elasticsearch-storage.yaml \
	&& kubectl apply -f elasticsearch-pvc.yaml \
	&& kubectl apply -f elasticsearch-service.yaml \
	&& kubectl apply -f elasticsearch-deployment.yaml \
	&& kubectl apply -f kibana-service.yaml \
	&& kubectl apply -f kibana-deployment.yaml

get-pods:
	kubectl get pods

start:
	kubectl apply -f elasticsearch-deployment.yaml \
	&& kubectl apply -f kibana-deployment.yaml

stop:
	kubectl delete pods --all

clean:
	kubectl delete -f kibana-deployment.yaml \
	&& kubectl delete -f elasticsearch-service.yaml \
	&& kubectl delete -f kibana-service.yaml \
	&& kubectl delete -f elasticsearch-deployment.yaml \
	&& kubectl delete -f elasticsearch-pvc.yaml \
	&& kubectl delete -f elasticsearch-storage.yaml
