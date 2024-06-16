FROM ruby:3.3.0-slim
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  default-libmysqlclient-dev \
  nodejs && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v 2.5

WORKDIR /rails-api
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./
