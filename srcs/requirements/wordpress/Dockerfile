FROM debian:buster

RUN apt-get update -y && apt-get -y install \
	curl php php-fpm php-mysql mariadb-client && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /run/php /var/www/html

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./wp_script.sh /etc/

RUN chmod +x /etc/wp_script.sh

RUN chmod -R 777 /var/www/html
WORKDIR /var/www/html

EXPOSE 9000

CMD ["sh", "/etc/wp_script.sh"]
