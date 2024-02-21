FROM ruby:3.2.2

# Установка зависимостей
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Установка Bundler
RUN gem install bundler

# Создание директории приложения
WORKDIR /app

# Копирование Gemfile и Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Установка гемов
RUN bundle install

# Копирование кода приложения
COPY . .

# Запуск сервера
CMD ["rails", "server", "-b", "0.0.0.0"]
