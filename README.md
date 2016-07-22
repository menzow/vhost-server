# About this Repo

vhost-server is a dockerized nginx server that acts as a front-facing proxy to other docker container running a webserver.

It uses the [vhost-storage](https://github.com/menzow/vhost-storage) image to create a storage container that can be exposed to other containers. This storage contains Server Blocks that proxy requests to specific container.

You can check the [vhost-example](https://github.com/menzow/vhost-example) repository for a example on how to create a virtual host behind this proxy .

Right now this is purely used for educational purposes. It isn't secured for production environments. Everything runs on default configuration and minimal setups.


## Running the server

To run this server you need the following tools:
* Docker
* docker-compose
* Git


#### Step 1
First thing you need to do is grab the source files from this repostiory.
```sh
#Pull the repository
git pull https://github.com/menzow/vhost-server.git vhost-server

#Go into the newly created directory
cd vhost-server
```


#### Step 2
Like mentioned in the introduction there is a image that will be used to create a storage container. This storage container is nothing more than a busybox image that creates a volume called `vhosts`. After the container is started, it is immediately stopped again. It is not required for the container to be running for the storage to work.

```sh
#Initialize vhost-storage
./create-storage.sh
```

#### Step 3

Now that the storage container is created, the server can be started. Running `docker-compose up` we will start the `vhost-server` and expose port 80 and 443. Within the container a nginx server will be started and a directory watcher is created. This directory watcher will constantly poll for changes to any configurations found in the vhost_storage volume. If changes occur, the nginx server is reloaded to apply the new config.

```sh
#Run the server
docker-compose up
```


## License

Copyright (c) Menzo Wijmenga. https://menzo.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
