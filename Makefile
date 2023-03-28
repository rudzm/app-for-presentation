DOCKER_REPO=rudzmic1
FIRST_APP_NAME=firstapp
FIRST_APP_VERSION=firstapp
SHOP_APP_NAME=shopapp
PIZZA_APP_NAME=pizzaapp
BEER_APP_NAME=beerapp


build-firstapp:
	cd firstapp && docker build --tag $(DOCKER_REPO)/$(FIRST_APP_NAME):$(FIRST_APP_VERSION) .

push-firstapp:
	docker push $(DOCKER_REPO)/$(FIRST_APP_NAME):$(FIRST_APP_VERSION)

build-ingress-apps:
	cd shopapp/ && docker build --tag $(DOCKER_REPO)/$(SHOP_APP_NAME):1.0 .
	cd pizzaapp/ && docker build --tag $(DOCKER_REPO)/$(PIZZA_APP_NAME):1.0 .
	cd beerapp/ && docker build --tag $(DOCKER_REPO)/$(BEER_APP_NAME):1.0 .


push-ingress-apps:
	docker push $(DOCKER_REPO)/$(SHOP_APP_NAME):1.0
	docker push $(DOCKER_REPO)/$(PIZZA_APP_NAME):1.0
	docker push $(DOCKER_REPO)/$(BEER_APP_NAME):1.0
	