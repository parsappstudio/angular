FROM node:alpine as node
Run apt-get update

#-------------Install nginx and copy config file----------------
Run apt-get install -y nginx 


#Remove nginx default file if exists
Run rm /etc/nginx/sites-enabled/default


#Copy nginx default file from ./Nginx/default to image
Copy nginxDefault /etc/nginx/sites-enabled/default
#-------------Nginx finish------------------


COPY entrypoint.sh /bin/entrypoint.sh

RUN chmod +x /bin/entrypoint.sh
RUN sed -i -e 's/\r$//' /bin/entrypoint.sh


#install unzip
Run apt-get install -y unzip

ENV HOME=/home/app
RUN mkdir -p $HOME

RUN groupadd -r app &&\
    useradd -r -g app -d $HOME -s /sbin/nologin -c "Docker image user" app

RUN chown -R app:app $HOME



CMD ["/bin/entrypoint.sh"]


