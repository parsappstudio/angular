# STEP 1 build static website
FROM node:alpine as builder
# STEP 2 build a small nginx image with static website
FROM nginx:alpine
## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*
#Remove nginx default file if exists
Run rm -rf /etc/nginx/conf.d/default.conf
#Copy nginx default file from ./Nginx/default to image
Copy nginxDefault /etc/nginx/conf.d/default.conf
#-------------Nginx finish------------------

Run apk add nano

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


