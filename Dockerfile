FROM ruby:2.3.1

# Install dependencies required to run Rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Configure the main working directory
RUN mkdir -p /app
WORKDIR /app

# Add gemfiles and install gems
ADD Gemfile* ./
RUN gem install bundler && bundle install

# Copy the main application.
COPY . ./

# Expose port 3000 to the Docker host, so we can access it from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also tell the Rails dev server to bind to all interfaces by default.
CMD ["bundle", "exec", "rails", "server", "--binding", "0.0.0.0"]
