# A simple Dockerfile for a RoR application

FROM phusion/baseimage:0.9.19

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /aws-s3-bucket-api

WORKDIR /aws-s3-bucket-api

ADD Gemfile /aws-s3-bucket-api/Gemfile
ADD Gemfile.lock /aws-s3-bucket-api/Gemfile.lock

RUN bundle install
ADD . /aws-s3-bucket-api
CMD ["bundle", "exec", "rails", "s", "-p", "8080", "-b", "0.0.0.0"]
