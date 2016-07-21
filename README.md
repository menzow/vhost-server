# About this Repo

vhost-server is a dockerized nginx server that acts as a front-facing proxy to other docker container running a webserver.

It uses the [vhost-storage](https://github.com/menzow/vhost-storage) image to create a storage container that can be exposed to other containers. This storage contains Server Blocks that proxy requests to specific container.

You can check the [vhost-example](https://github.com/menzow/vhost-example) repository for a example on how to create a virtual host behind this proxy .

Right now this is purely used for educational purposes. It isn't secured for production environments. Everything runs on default configuration and minimal setups.


## Usage

To run this server you need the following tools:
* Docker
* docker-compose
* Git

```sh
#Pull the repository
git pull https://github.com/menzow/vhost-server.git vhost-server

#Go into the newly created directory
cd vhost-server

#Initialize vhost-storage
./create-storage.sh

#Run the server
docker-compose up
```

The `create-storage.sh` shell script will pull the `vhost-storage`  image from [hub.docker.com](https://hub.docker.com/r/menzo/vhost-storage/) and run a container named `vhost_storage`.

	
After that `docker-compose up` run the vhost-server image. This will expose port 80 and 443 and link the volume(s) from vhost_storage.
