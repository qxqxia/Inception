FROM alpine:3.16
RUN apt update 
RUN apt install nginx -y 
RUN mkdir -p /etc/nginx/ssl 
RUN apt install openssl -y 
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/qxia.42.fr.crt -keyout /etc/nginx/ssl/qxia.42.fr.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=qxia.42.fr/UID=qxia"
RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
COPY conf/nginx.conf /etc/nginx/nginx.conf
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

