FROM nginx:latest

COPY conf/default.conf /etc/nginx/default.conf

COPY nginx/ssl/fullchain.pem /etc/nginx/ssl/fullchain.pem
COPY nginx/ssl/privkey.pem /etc/nginx/ssl/privkey.pem

RUN chmod 600 /etc/nginx/ssl/*

