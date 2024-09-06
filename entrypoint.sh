#!/bin/bash -e

rm -f /app/tmp/pids/server.pid

if [ "$RAILS_ENV" = "development" ]; then
  bundle install
  yarn install
fi

bundle exec rails db:prepare

exec "$@"