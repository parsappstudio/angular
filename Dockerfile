# STEP 1 build static website
FROM node:alpine as builder
# STEP 2 build a small nginx image with static website
FROM nginx:alpine
## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


