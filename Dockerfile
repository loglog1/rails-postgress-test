FROM ruby:2.7.4
ENV LANG C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y build-essential \
            libpq-dev \
            nodejs 
            # && \
    # mkdir /app

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT/Gemfile
ADD Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install


ADD . $APP_ROOT