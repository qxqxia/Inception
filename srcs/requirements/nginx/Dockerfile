FROM debian:buster

RUN apt-get update -y && \
	apt-get install -y \
	nginx openssl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	mkdir -p /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -days 365 \
		-keyout /etc/nginx/ssl/nginx-selfsigned.key \
		-out /etc/nginx/ssl/nginx-selfsigned.crt \
		-subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=student/CN=qxia.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
# Deamon off because nginx need to run in foreground
