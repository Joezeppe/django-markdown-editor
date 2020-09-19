#!/usr/bin/env bash

# start-server.sh

# shellcheck disable=SC1019
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ]; then
	# shellcheck disable=SC2164
	( cd martor_demo; python manage.py createsuperuser --no-input)
fi
# shellcheck disable=SC2164
(cd martor_demo; gunicorn martor_demo.wsgi --user www-data --bind 0.0.0.0:8010 --workers 3) &
nginx -g "daemon off;"
