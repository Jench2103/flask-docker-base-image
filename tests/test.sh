#!/bin/bash

source env_setup.sh

docker build -t flask-base-$PYTHON_VERSION "../docker-image/$PYTHON_VERSION"

docker build --build-arg BASE=flask-base-${PYTHON_VERSION} -t flask-app-$PYTHON_VERSION .

if [ $TTY == true ]; then
    if [ $OSTYPE == "msys" ]; then
        winpty docker run -p $PREFER_PORT:80 --name flask-app-$PYTHON_VERSION -it --rm flask-app-$PYTHON_VERSION bash
    else
        docker run -p $PREFER_PORT:80 --name flask-app-$PYTHON_VERSION -it --rm flask-app-$PYTHON_VERSION bash
    fi
else
    docker run -p $PREFER_PORT:80 --name flask-app-$PYTHON_VERSION -d flask-app-$PYTHON_VERSION
    python -m webbrowser http://localhost:$PREFER_PORT
fi
