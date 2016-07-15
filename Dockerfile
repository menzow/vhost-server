FROM nginx
MAINTAINER docker@menzo.io

RUN apt-get update

RUN apt-get -y install inotify-tools

RUN apt-get clean

#Create a vhosts directory, incase no volume is mounted we still want the container is ran
RUN mkdir /vhosts

#Auto load vhosts from the /vhosts directory
RUN echo "include /vhosts/*.conf;" > /etc/nginx/conf.d/load-vhosts.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker_entrypoint.sh

ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]