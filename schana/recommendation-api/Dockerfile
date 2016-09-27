FROM debian

RUN apt-get update

RUN apt-get install -y git
RUN apt-get install -y nginx
RUN apt-get install -y npm
RUN apt-get install -y python3
RUN apt-get install -y python3-pip

# Direct dependencies
RUN apt-get install -y python3-flask
RUN apt-get install -y python3-requests
RUN apt-get install -y python3-numpy
RUN apt-get install -y python3-yaml

# Dependencies of bravado-core
RUN apt-get install -y python3-jsonschema
RUN apt-get install -y python3-dateutil
RUN apt-get install -y python3-simplejson
RUN apt-get install -y python3-webcolors

# Dependencies not available as debian packages
WORKDIR /srv/recommendation
RUN git clone https://gerrit.wikimedia.org/r/research/recommendation-api/wheels
RUN pip3 install --use-wheel --no-deps ./wheels/wheels/swagger_spec_validator*.whl
RUN pip3 install --use-wheel --no-deps ./wheels/wheels/strict_rfc3339*.whl
RUN pip3 install --use-wheel --no-deps ./wheels/wheels/rfc3987*.whl
RUN pip3 install --use-wheel --no-deps ./wheels/wheels/bravado_core*.whl

# Install app
RUN git clone https://gerrit.wikimedia.org/r/research/recommendation-api
RUN pip3 install --no-deps ./recommendation-api

# Node and bower
RUN ln -s /usr/bin/nodejs /usr/bin/node
WORKDIR /srv/recommendation/resources
RUN npm install bower
RUN ./node_modules/bower/bin/bower install --allow-root /srv/recommendation/recommendation-api/recommendation/web/static/bower.json

# Configuration
RUN sed -i 's|event_logger.*|event_logger = http://localhost/event|' /etc/recommendation/recommendation.ini
