FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

#Installation apache and php8.1
RUN apt-get update && apt-get install -y \
apache2 \
php8.1 \
php8.1-curl \
php8.1-zip \
php8.1-gd \
php8.1-intl \
php8.1-dom \
php8.1-fileinfo \
php8.1-imap \
php8.1-xmlrpc \
php8.1-simplexml \
php8.1-mbstring \
php8.1-xmlwriter \
php8.1-ldap \
php8.1-xmlreader \
php8.1-apcu \
libapache2-mod-php8.1 \
php8.1-mysql \
php8.1-bz2 \
cron \
wget \
&& rm -rf /var/lib/apt/lists/*

# Download and extract GLPI
WORKDIR /tmp

RUN wget https://github.com/glpi-project/glpi/releases/download/10.0.6/glpi-10.0.6.tgz && \
    tar -xzvf glpi-10.0.6.tgz && \
    cp -r ./glpi /var/www/ && \
    rm glpi-10.0.6.tgz
RUN chown -R www-data:www-data /var/www/glpi && \
    chmod -R 755 /var/www/glpi
COPY glpi.conf /etc/apache2/sites-available/
RUN a2ensite glpi.conf
RUN a2dissite 000-default.conf
RUN a2enmod rewrite

# Add your cron job script (e.g., cronjob.sh) to the container
COPY cronjob.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/cronjob.sh

# Add the cron job to the crontab
RUN crontab -l | { cat; echo "*/15 * * * * /usr/local/bin/cronjob.sh"; } | crontab -

WORKDIR /var/www/html/glpi

EXPOSE 80

# Start Apache and Cron when the container starts
CMD ["bash", "-c", "service cron start && apachectl -D FOREGROUND"]