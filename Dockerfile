FROM debian:buster

COPY srcs/bd.sql /tmp/
COPY srcs/wordpress.sql /tmp/

RUN apt-get -y upgrade; apt-get -y update;
RUN apt-get install -y vim;
RUN apt-get install -y nginx ;
RUN apt-get install -y mariadb-server;
RUN apt-get install -y mariadb-client;
RUN apt-get install -y php-fpm;
RUN apt-get install -y php-mysql;
RUN apt-get install -y php-mbstring;
RUN apt-get install -y wordpress;
RUN apt-get install -y openssl;
RUN service mysql start; mysql -u root --password= < /tmp/bd.sql;
RUN	service mysql start; mysql wordpress -u root --password= < /tmp/wordpress.sql;
#exitRUN	openssl req -x509 -nodes -days 365;
#RUN	-newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42/CN=127.0.0.1";
#RUN	-keyout /etc/ssl/private/lcanales.key;
#RUN	-out /etc/ssl/certs/lcanales.crt &&;
#RUN openssl dhparam -out /etc/nginx/dhparam.pem 1000;

COPY srcs/wordpress /var/www/html/wordpress
COPY srcs/phpmyadmin /var/www/html/phpmyadmin
COPY srcs/index.html /var/www/html
COPY srcs/style.css /var/www/html
COPY srcs/default /etc/nginx/sites-available/

RUN chown -R www-data:www-data /var/www/html 
# cambia el propietarioo de toda la carpeta
RUN chmod -R 755 /var/www/html

EXPOSE 80
CMD service nginx start && \
	service mysql start && \
	service php7.3-fpm start && \
	bash