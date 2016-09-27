all:
	docker build -t schana/recommendation-api schana/recommendation-api && \
	docker build -t schana/recommendation-api-test schana/recommendation-api-test
