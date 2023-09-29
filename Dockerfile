FROM ruby:3.0.0

RUN apt-get update && apt-get install -y build-essential apt-utils 
#nodejs

WORKDIR /docker/app

RUN gem install bundler

# RUN gem uninstall nokogiri
# RUN bundle config set force_ruby_platform true
# RUN bundle install


COPY Gemfile* ./

RUN bundle install

ADD . /docker/app

EXPOSE 3000

CMD ["rails","server"]
