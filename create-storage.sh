#/bin/bash

STORAGE_CONTAINER=vhost_storage

EXISTS=$(docker inspect --format="{{ .State.Running }}" $STORAGE_CONTAINER 2> /dev/null)
if [ $? -eq 1 ]; then
  echo "Storage container not found. Creating it now.."
  docker run -ti --name $STORAGE_CONTAINER menzo/basevhost-storage:0.1 echo "Created storage container $STORAGE_CONTAINER"
  exit 0
fi

echo "Storage container intialized under $STORAGE_CONTAINER"