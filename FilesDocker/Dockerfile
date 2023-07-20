FROM php:8.3-rc-apache
RUN apt-get update && apt-get install -y \
		libfreetype-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		g++ \
		libicu-dev \
		libc6 \
		libgomp1 \
		libmagickcore-6.q16-dev \
		libmagickwand-6.q16-dev \

	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-install intl 
RUN docker-php-ext-install simplexml


#RUN apt-get install -y imagemagick
#RUN docker-php-source extract 
#RUN docker-php-ext-install simplexml
COPY codei.conf /etc/apache2/sites-available/
COPY codei /var/www/codei
RUN chmod 766 -R /var/www/codei/writable \
	&& chown www-data:www-data -R /var/www/codei
RUN a2ensite codei.conf \
	&& a2dissite 000-default \	
	&& a2enmod rewrite
#RUN docker-php-source extract && docker-php-ext-install mbstring



