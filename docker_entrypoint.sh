#/bin/bash

echo "Running NGINX"
service nginx start

echo "Creating file watcher"
while true
do
        inotifywait --exclude .swp -e create -e modify -e delete -e move  /vhosts
        nginx -t
        if [ $? -eq 0 ]
        then
                echo "Reloading Nginx Configuration"
                service nginx reload
        fi
done