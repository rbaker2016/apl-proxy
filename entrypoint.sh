#! /bin/sh
# appLariat generic entrypoint.sh

echo "Printing build log"
cat /tmp/build.log

exec nginx -g "daemon off;"
