## Version 1.0.0
FROM fortytwoio/base-image
MAINTAINER Thomas Fritz <thomas.fritz@forty-two.io>

RUN \
    DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
        php5-fpm \
        php-apc \
        php5-gd \
        php5-curl \
        php5-memcached \
        php5-mysqlnd \
        php5-pgsql \
        php5-mcrypt \
        php5-sqlite \
        php5-imagick

ADD ./etc/php5 /etc/php5
RUN mkdir -p /var/log/php
VOLUME ["/srv/www/"]
WORKDIR "/srv/www"
EXPOSE 9000
ENTRYPOINT ["/usr/sbin/php5-fpm"]
CMD ["--nodaemonize", "--force-stderr"]


