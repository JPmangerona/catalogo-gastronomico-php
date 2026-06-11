#!/bin/bash
set -e

# Garante que apenas o mpm_prefork esteja ativo (resolve conflito no Railway)
a2dismod mpm_event mpm_worker 2>/dev/null || true
a2enmod mpm_prefork 2>/dev/null || true

# Instala dependências do composer
composer install --no-interaction --no-dev --optimize-autoloader

# Inicia o Apache
apache2-foreground
