FROM		alpine:3.16
RUN		apk update
RUN		apk upgrade

#==== NGINX ===================================================================#
RUN		apk add nginx

RUN		mkdir -p /var/www/html/

#==== OPENSSL =================================================================#
RUN		apk add openssl
RUN		mkdir -p /etc/nginx/ssl

RUN		openssl req \
		-newkey rsa:4096 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-subj "/C=FR/ST=Paris/L=Paris/O=Ecole42/CN=localhost" \
		-keyout /etc/nginx/ssl/inception.key \
		-out /etc/nginx/ssl/inception.crt

RUN		apk add openrc
RUN		rc-update add nginx default

EXPOSE	443
CMD		["nginx", "-g", "daemon off;"]
