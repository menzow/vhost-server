# vhost-server

vhost-server is a dockerized nginx server that acts as a front-facing proxy to other docker container running any kind of webserver.

It uses the vhost-storage image to create a storage container that can be exposed to other containers. This storage contains Server Blocks that proxy requests to specific container.

You can check the vhost-example repository for a example on how to use this server.