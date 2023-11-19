FROM ruby:3.0.3
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get install nodejs

WORKDIR /usr/src/app

RUN npm install -g yarn && yarn install --check-files

COPY . .
RUN bundle install

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
