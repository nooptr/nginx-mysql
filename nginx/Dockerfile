FROM    centos:centos6
MAINTAINER Ngo Van Thang <thangnvbkhn@gmail.com>

# Set TERM env to avoid mysql client error message "TERM environment variable not set" when running from inside the container
ENV TERM xterm

RUN     cp -p /usr/share/zoneinfo/Japan /etc/localtime

# Install common packages
RUN     yum -y \
        install \
        wget \
        curl \
        sudo \
        passwd \
        git \
        openssh-server \
        vim \
        mysql-server \
        epel*

ADD     remi-release-6.rpm  /usr/local/src/remi-release-6.rpm
RUN     rpm -Uvh /usr/local/src/remi-release-6.rpm

COPY    nginx.repo  /etc/yum.repos.d/nginx.repo

RUN     yum -y install \
        php \
        php-fpm \
        php-xml \
        php-pear \
        php-phpunit-PHPUnit　\
        php-mysql \
        php-common \
        php-devel \
        php-mbstring \
        php-cli \
        php-mcrypt \
        php-process \
        php-soap \
        php-pecl-xdebug \
        --enablerepo=remi-php56

RUN     yum -y install nginx

COPY    www.conf /etc/php-fpm.d/www.conf

RUN     rm -rf /etc/nginx/conf.d/default.conf && \
        rm -rf /etc/nginx/conf.d/virtual.conf
COPY    virtual.conf /etc/nginx/conf.d/virtual.conf

RUN     mkdir -p /srv/www/ && \
        chmod 777 /srv/www/

COPY	bin/start.sh /usr/local/bin/start.sh
RUN	chmod +x /usr/local/bin/start.sh

# Make user centos
RUN useradd -m centos
RUN echo "centos:centos" | chpasswd
# Permit centos user to user wheel
RUN gpasswd -a centos wheel

# Docker側でlistenするポート番号を指定
EXPOSE  80 22 443

WORKDIR /srv/www/web

# Launch some service when launching the container
CMD ["/usr/local/bin/start.sh"]
