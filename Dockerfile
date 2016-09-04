FROM ruby:2.3.1-slim

RUN apt-get update -qq && apt-get install -y build-essential git libmysqlclient-dev libsqlite3-dev

ARG BUNDLE_ARGS="--without development test"

RUN mkdir /viva-challenge
ADD . /viva-challenge
WORKDIR /viva-challenge

RUN bundle install --jobs=4 --retry=3 $BUNDLE_ARGS
CMD bundle exec puma -C config/puma.rb
