FROM nginx
MAINTAINER docker@menzo.io

RUN apt-get update

RUN apt-get -y install inotify-tools

RUN apt-get clean

#Force NGINX to run in the foreground
#RUN echo "daemon off;\n$(cat /etc/nginx/nginx.conf)" > /etc/nginx/nginx.conf

#Create a vhosts directory, incase no volume is mounted we still want the container is ran
RUN mkdir /vhosts

#Auto load vhosts from the /vhosts directory
RUN echo "include /vhosts/*.conf;" > /etc/nginx/conf.d/load-vhosts.conf

COPY docker_entrypoint.sh /docker_entrypoint.sh

RUN chmod +x /docker_entrypoint.sh

ENTRYPOINT ["/bin/bash", "/docker_entrypoint.sh"]