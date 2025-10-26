#!/bin/bash
set -e

echo "Iniciando container..."

# Rodar migrations
echo "Rodando migrations..."
bundle exec rails db:migrate

# Rodar seeds apenas se o banco estiver vazio
if [ "$(bundle exec rails runner 'puts Movie.count')" -eq 0 ]; then
  echo "Rodando seeds..."
  bundle exec rails db:seed
fi

# Pré-compila assets
echo "Pré-compilando assets..."
bundle exec rails assets:precompile

# Executa o comando passado ao container (Rails server)
exec "$@"
