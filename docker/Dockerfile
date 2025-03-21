# ARG für dynamische PHP-Version
ARG PHP_VERSION=8.4
FROM php:${PHP_VERSION}-fpm AS base

LABEL org.opencontainers.image.source = "https://github.com/mindbox/docker-apache-php-fpm"

RUN <<EOF
    DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y --no-install-recommends \
    libxml2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libpq-dev \
    libzip-dev \
    zlib1g-dev \
    imagemagick \
    libmagickwand-dev \
    libicu-dev \
    ghostscript \
    unzip \
    locales \
    locales-all \
    locales \
    apache2 \
    libapache2-mod-fcgid \
    apache2-utils \
    pv \
    tini

    docker-php-ext-configure gd --with-libdir=/usr/include/ --with-jpeg --with-freetype
    docker-php-ext-configure intl
    docker-php-ext-install -j$(nproc) mysqli soap gd zip opcache intl exif
    pecl install imagick
    docker-php-ext-enable imagick opcache
    
    a2enmod proxy_fcgi setenvif rewrite headers expires deflate
    rm -rf /etc/apache2/sites-enabled/ /etc/apache2/sites-available/ /usr/local/etc/php-fpm.d/zz-docker.conf
    
    locale-gen
EOF

# Set Locale for Typo3
COPY <<-EOT /etc/locale.gen
de_DE.UTF-8 UTF-8
en_US.UTF-8 UTF-8
en_GB.UTF-8 UTF-8
ru_RU.UTF-8 UTF-8
fr_FR.UTF-8 UTF-8
ar_AR.UTF-8 UTF-8
vi_VI.UTF-8 UTF-8
fa_IR.UTF-8 UTF-8
EOT


# Set some need php settings
COPY docker/php.ini /usr/local/etc/php/conf.d/zzz-custom.ini
COPY docker/www.conf /usr/local/etc/php-fpm.d/zzz-custom.conf
COPY docker/apache2.conf /etc/apache2/apache2.conf
COPY docker/entrypoint.sh /bin/entrypoint.sh

# Get composer installer
ADD https://getcomposer.org/installer /tmp/composer-installer
# Set up composer
RUN <<EOF
    mkdir /etc/apache2/conf.d
    chmod +x /bin/entrypoint.sh
    php /tmp/composer-installer --install-dir=/usr/local/bin --filename=composer
EOF

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/bin/entrypoint.sh"]
