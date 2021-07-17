#!/bin/bash

/etc/init.d/nginx start

uwsgi /etc/uWSGI.ini
