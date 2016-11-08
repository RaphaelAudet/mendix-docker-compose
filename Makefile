build:
	docker build -t nginx_compose -f dockerfile-nginx_compose .
	docker build -t mendix_compose -f dockerfile-mendix_compose .

