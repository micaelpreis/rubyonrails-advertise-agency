# Base image
FROM ruby:latest

ENV HOME /home/rails/webapp

# Install PGsql dependencies and js engine
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR $HOME

# Install gems
ADD Gemfile* $HOME/
RUN gem install bundler && bundle install

# Add the app code
ADD . $HOME

# Expose port 3000 to the Docker host, so we can access it from the outside.
EXPOSE 3000

# Default command
CMD ["bundle", "exec", "rails", "server", "--binding", "0.0.0.0"]
