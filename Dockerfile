FROM php:8.3-rc-apache
# Instalamos las extensiones de php que nos interesan
# Pendiente: imagemagick
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
	&& docker-php-ext-install intl \ 
	&& docker-php-ext-install simplexml

#Copiamos la configuración del virtualhost
COPY ./Virtualhost/codei.conf /etc/apache2/sites-available/
# Activación del virtualhost
RUN a2ensite codei.conf \
	&& a2dissite 000-default \	
	&& a2enmod rewrite


COPY codei /var/www/codei
# Permisos de los ficheros (Debe realizarse un bind-mount)
RUN chmod 766 -R /var/www/codei/writable \
	&& chown www-data:www-data -R /var/www/codei



