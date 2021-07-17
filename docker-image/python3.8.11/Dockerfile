FROM python:3.8.11

LABEL maintainer="Jen-Chien Chang <jench2103@gmail.com>"

RUN mkdir /workspace

RUN apt update \
    && apt install -y nginx dos2unix

RUN pip install uWSGI

COPY uWSGI.ini /etc

COPY nginx.conf /etc/nginx/sites-available/default

COPY start.sh /usr/local/bin/

RUN chmod 755 /usr/local/bin/start.sh

RUN dos2unix -ic /usr/local/bin/start.sh | xargs dos2unix

ENTRYPOINT [ "/usr/local/bin/start.sh" ]
