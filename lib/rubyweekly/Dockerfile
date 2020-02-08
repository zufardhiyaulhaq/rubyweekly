# Start from the ruby base image
FROM ruby:latest

# Add Maintainer Info
LABEL maintainer="Zufar Dhiyaulhaq <zufardhiyaulhaq@gmail.com>"

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Set the Current Working Directory inside the container
WORKDIR /app/

# run bundle first
ADD Gemfile* /app/

# run bundle ruby
RUN gem install bundler -v '2.1.4'
RUN bundle install -j 8
RUN gem install activesupport -v 5.0.0.1

# Copy the source from the current directory to the Working Directory inside the container
ADD . /app/

# Command to run the ruby files
CMD ["ruby", "main.rb"]