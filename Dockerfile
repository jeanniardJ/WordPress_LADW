FROM php:8.2-apache AS dev

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    unzip \
    git \
    && apt-get clean

# Install PHP extensions
RUN docker-php-ext-install gd zip mysqli pdo pdo_mysql
RUN docker-php-ext-enable gd zip mysqli pdo pdo_mysql 

# Copy source code
COPY . /var/www/html

# Change working directory
WORKDIR /var/www/html

EXPOSE 80 443

# Enable Apache mod_rewrite
RUN a2enmod rewrite ssl

# Start Apache
CMD ["apache2-foreground"]