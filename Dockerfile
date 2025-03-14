FROM php:8.2-fpm

# Install PDO MySQL extension
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Set working directory
WORKDIR /var/www/html

# Copy PHP files to container
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html
