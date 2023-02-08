FROM ruby:3.1.1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn \
  && mkdir /my_dictionary_api
WORKDIR /my_dictionary_api
COPY Gemfile /my_dictionary_api/Gemfile
COPY Gemfile.lock /my_dictionary_api/Gemfile.lock
RUN gem update --system
RUN bundle install
COPY . /my_dictionary_api

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
