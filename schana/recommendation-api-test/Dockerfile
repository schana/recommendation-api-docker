FROM schana/recommendation-api

# Test the environment
WORKDIR /srv/recommendation/recommendation-api
RUN pip3 install tox
RUN tox -e py34
