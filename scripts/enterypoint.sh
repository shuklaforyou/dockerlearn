#!/bin/sh

set -e
 
python manage.py collectstatic --noinput

uwsgi --socket :3000 --master --enable-threads --module app.wsgi