FROM ruby:2.4

RUN apt-get update \
        && apt-get -y install build-essential \
        && apt-get -qq -y clean \
        && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/ruby \
        && mkdir -p /opt/ruby/log \
        && mkdir -p /opt/ruby/tmp/pids

WORKDIR /opt/ruby

COPY Gemfile .

RUN gem install bundler
RUN bundle install 
COPY . .
#CMD ["ruby" "downloader.rb -t ultra"]
CMD ruby downloader.rb -t ultra
