#!/bin/sh
# To check that most notebooks can be executed:
#
#    IDR_HOST=<host> -e IDR_USER=<user> -e IDR_PASSWORD=<password> ./test.sh
#
# This will exclude notebooks that take a long time to execute or require
# manual input; you should test these manually in the Jupyter notebook web
# interface.
# See comments in test_notebooks.sh for details.

set -e

docker rm -f test-jupyter-docker || true
docker build -t test-jupyter-docker ..
docker run -d -p 8888:8888 --name test-jupyter-docker \
    -e IDR_HOST="$IDR_HOST" \
    -e IDR_USER="$IDR_USER" \
    -e IDR_PASSWORD="$IDR_PASSWORD" \
    test-jupyter-docker

sleep 10
curl -fL http://localhost:8888/ | head

# IDR_* variables are only defined on the official branches and when testing
# locally
if [ -n "$TRAVIS_PULL_REQUEST" -a "$TRAVIS_PULL_REQUEST" != "false" ]; then
    echo "WARNING: Skipping test_notebooks.sh (TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST)"
else
    echo Running test_notebooks.sh
    docker exec test-jupyter-docker /home/jovyan/notebooks/docker/test_notebooks.sh
fi
