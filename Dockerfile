FROM debian:buster-slim

RUN apt update \
  && apt install -y nginx default-mysql-server-core php-fpm php-mysql \
  && rm -rf /var/lib/apt/lists/* 

COPY ./docker-config/nginx-strikeout /etc/nginx/sites-available

RUN  rm -rf /etc/nginx/sites-enabled/* \
  && ln -s /etc/nginx/sites-available/nginx-strikeout /etc/nginx/sites-enabled \
  && sed -i 's/short_open_tag\s=\sOff/short_open_tag = On/g' /etc/php/7.3/fpm/php.ini \
  && groupadd mysql \
  && useradd -r -g mysql -s /bin/false mysql \
  && mkdir /var/lib/mysql \
  && chown mysql:mysql /var/lib/mysql \
  && chmod 750 /var/lib/mysql \
  && mkdir /var/run/mysqld \
  && chown mysql:mysql /var/run/mysqld \
  && chmod 750 /var/run/mysqld \
  && mysql_install_db --user=mysql 
  
EXPOSE 80 3306

WORKDIR /app

CMD ["./docker_entry.sh"]
