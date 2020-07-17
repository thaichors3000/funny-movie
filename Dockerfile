# We use ruby 2.7 image
FROM ruby:2.7

# We install dependencies
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client

# We set working directory
WORKDIR /app

# We copy these files from our current application to the /app container
COPY Gemfile Gemfile.lock package.json yarn.lock /app/

# We install all the dependencies
RUN bundle install
RUN yarn install

# We copy all the files from our current application to the /app container
COPY . /app

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
