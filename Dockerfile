FROM ruby:2.4.1

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --without development test
ADD . /app
CMD ./wait-for-it.sh db:5432 -s -- unicorn -c /app/config/unicorn.rb
