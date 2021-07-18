# Flask Docker Base Image

![GitHub issues](https://img.shields.io/github/issues/jench2103/flask-docker-base-image) ![Docker Image Version (latest semver)](https://img.shields.io/docker/v/jench2103/flask-uwsgi-nginx?label=docker%20latest%20version) ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/jench2103/flask-uwsgi-nginx) ![Docker Pulls](https://img.shields.io/docker/pulls/jench2103/flask-uwsgi-nginx) ![GitHub](https://img.shields.io/github/license/Jench2103/flask-docker-base-image)

This is a Docker base image with uWSGI and Nginx for Flask web applications.


## Quick reference
- **GitHub**: https://github.com/Jench2103/flask-docker-base-image
- **Docker Hub**: https://hub.docker.com/r/jench2103/flask-uwsgi-nginx


## Supported tags and respective `Dockerfile` links
- [`python3.9.6`, `latest`](https://github.com/Jench2103/flask-docker-base-image/blob/main/docker-image/python3.9.6)
- [`python3.8.11`](https://github.com/Jench2103/flask-docker-base-image/blob/main/docker-image/python3.8.11)
- [`python3.6.9`](https://github.com/Jench2103/flask-docker-base-image/blob/main/docker-image/python3.6.9)


## Usage
- Directly pull the image from Docker Hub
    ```bash
    $ docker pull jench2103/flask-uwsgi-nginx:<version>
    ```
- Write a `Dockerfile` to build your image
    ```dockerfile
    FROM jench2103/flask-uwsgi-nginx:<version>

    COPY /host/path/to/app.py /workspace
    COPY /host/path/to/requirements.txt /container/path/to/requirements.txt

    RUN pip install -r /container/path/to/requirements.txt
    ```
- The default python code which uWSGI tries to run is `/workspace/app.py` with the Flask object named `app`.
- The reverse proxy service Nginx is continuous listening to port 80 in the container, which should be mapped to a host port so that you are available to access the Flask application from web browsers.
    - When use `docker run` command:
        ```bash
        $ docker run -p <host port>:80 -it <image name>
        ```
    - When use `docker-compose.yml`:
        ```yml
        services:
            <serivce name>:
                # ... skip ... #
                ports:
                    - <host port>:80
        ```


## Technical reference
- [uWSGI Official Documentation](https://uwsgi-docs.readthedocs.io/en/latest/)
- [uWSGI - Wikipedia](https://en.wikipedia.org/wiki/UWSGI)
- [Nginx Official Documentation](https://nginx.org/en/docs/)
- [Nginx - Wikipedia](https://en.wikipedia.org/wiki/Nginx)


## License
This project is licensed under the [MIT License](https://github.com/Jench2103/flask-docker-base-image/blob/main/LICENSE).
