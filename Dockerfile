# 1. Base image
FROM ruby:3.2.2

# 2. Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# 3. Define diretório de trabalho
WORKDIR /app

# 4. Copia arquivos do projeto
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY . .

# 5. Define variáveis de ambiente para produção
ENV RAILS_ENV=production
ENV RAILS_MASTER_KEY=564945cdd3f39d30567df144e82ecfdc
ENV DATABASE_URL=postgresql://catalogo_filmes_prod_user:2FCBBA22xPzPTAdIVqbot4eH3kjIDH23@dpg-d3v4b5n5r7bs73fv1m8g-a/catalogo_filmes_prod

# 6. Pré-compila os assets
RUN bundle exec rails assets:precompile

# 7. Exponha porta
EXPOSE 3000

# 8. Entrypoint padrão (inicia o servidor Rails)
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
