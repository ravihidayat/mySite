FROM ubuntu

WORKDIR /

RUN apt update \
    && apt upgrade -y \
    && apt install nginx -y \
    && rm -v /etc/nginx/nginx.conf

ADD nginx.conf /etc/nginx/

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY . /var/www/html

EXPOSE 80

CMD ["usr/sbin/nginx"]