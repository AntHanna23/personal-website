FROM ubuntu:18.04

RUN apt update && apt upgrade -y \
    && apt install -y nginx 

RUN rm -rf /etc/nginx/sites-enabled/default 

COPY start.sh /
COPY anthonyhanna.com /var/www/anthonyhanna.com
COPY nginx.conf /etc/nginx/nginx.conf
COPY anthonyhanna.conf /etc/nginx/sites-enabled/

ENTRYPOINT ./start.sh



