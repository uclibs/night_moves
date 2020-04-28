FROM ruby:2.5.8-alpine3.11

RUN apk --update add build-base sqlite-dev nodejs yarn libreoffice ffmpeg clamav tzdata libxslt-dev libxml2-dev vim ghostscript imagemagick xvfb curl bash sudo

# fetch clamav local database
# initial update of av databases
RUN mkdir -p /var/lib/clamav && \
  wget -O /var/lib/clamav/main.cvd http://database.clamav.net/main.cvd && \
  wget -O /var/lib/clamav/daily.cvd http://database.clamav.net/daily.cvd && \
  wget -O /var/lib/clamav/bytecode.cvd http://database.clamav.net/bytecode.cvd && \
  chown clamav:clamav /var/lib/clamav/*.cvd

# install java
RUN apk update
RUN apk fetch openjdk8
RUN apk add openjdk8
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

# install FITS for file characterization
RUN mkdir -p /opt/fits && \
  curl -fSL -o /opt/fits-1.0.5.zip http://projects.iq.harvard.edu/files/fits/files/fits-1.0.5.zip && \
  cd /opt && unzip fits-1.0.5.zip && chmod +X fits-1.0.5/fits.sh

# Install gems
RUN mkdir -p /home/dev/night_moves
WORKDIR /home/dev/night_moves
ADD . /home/dev/night_moves
RUN gem install bundler
RUN bundle install
RUN rails generate roles
RUN rails db:migrate
RUN bundle exec rake hyrax:default_collection_types:create
RUN rails db:seed

# add dev user
RUN adduser dev -h /home/dev/ -Ds /bin/bash && adduser dev wheel
RUN echo dev:password | chpasswd
RUN chown -R dev:dev /home/dev/

USER dev

EXPOSE 3000

#Start services and rails server
CMD ["rails", "hydra:server", "HOST=0.0.0.0"]
