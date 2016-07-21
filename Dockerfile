FROM djhr/php56-zts-apache

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install unzip -y \
	&& cd /tmp \
	&& curl -LO https://github.com/krakjoe/pthreads/archive/PHP5.zip \
	&& unzip PHP5.zip \
	&& cd pthreads-PHP5 \
	&& phpize \
	&& ./configure \
	&& make \
	&& make install \
	&& docker-php-ext-enable pthreads \
    && rm -rf /tmp/*