# 1. Base image
FROM ruby:3.2.2

# 2. Dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# 3. Diretório de trabalho
WORKDIR /app

# 4. Copia Gemfile e instala gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# 5. Copia o restante do projeto
COPY . .

# 6. Variáveis de ambiente
ENV RAILS_ENV=production
ENV RAILS_MASTER_KEY=564945cdd3f39d30567df144e82ecfdc

# 7. Pré-compila assets
RUN bundle exec rails assets:precompile

# 8. Porta do container
EXPOSE 3000

# 9. Start do Rails
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
