FROM php:8.2-apache

# Instala as dependências do sistema e extensões do PHP
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql zip

# Habilita o mod_rewrite do Apache e desativa MPMs conflitantes (comum no Railway)
RUN a2dismod mpm_event mpm_worker || true
RUN a2enmod mpm_prefork rewrite

# Altera a raiz do servidor para a pasta /public
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Instala o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copia os arquivos do projeto
COPY . /var/www/html

# Define permissões
RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

# Expõe a porta 80
EXPOSE 80
