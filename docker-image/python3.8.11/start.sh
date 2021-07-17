#!/bin/bash

set -e

/etc/init.d/nginx start

uwsgi /etc/uWSGI.ini

exec "$@"
