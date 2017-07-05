#! /bin/sh
# appLariats generic nginx build script
# Requirements - A valid nginx.conf file exists within the /src/conf/ path
# Copies the nginx.conf file from the /src/conf/ and copies it into /etc/nginx/nginx.conf

#Log everything in /src/build.log
logfile=/tmp/build.log
exec > $logfile 2>&1
set -x

#make sure nginx.conf exists in /conf dir
#overwrite the default nginx.conf file with the user provided config
#optionally replace conf/nginx.conf with your own to customize nginx
if [ -e /conf/nginx.conf ]
then
    cp -f /conf/nginx.conf /etc/nginx/nginx.conf
else
 echo "ERROR! did not find nginx.conf file in /conf folder"
 exit 1
fi

cp -rf /src/* /usr/share/nginx/html

#Cleaning up after ourselves
rm -rf /src
rm -rf /conf