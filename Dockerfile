# Resmi PHP-FPM tabanlı imajdan başlıyoruz
FROM php:8.2-fpm

# Sistemin bağımlılıklarını güncelle
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    libzip-dev \
    nano

# GD Kütüphanesi için gerekli olan bağımlılıkları kuruyoruz
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# Diğer gerekli PHP eklentilerini kuruyoruz
RUN docker-php-ext-install pdo pdo_mysql zip exif pcntl mysqli

# Composer'ı kuruyoruz
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Çalışma dizinini belirliyoruz
WORKDIR /var/www

# Portu belirliyoruz
EXPOSE 9000

# PHP-FPM'yi başlatıyoruz
CMD ["php-fpm"]
