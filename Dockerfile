FROM alpine

RUN apk add --update \
  ca-certificates \
  curl \
  openssh-client \
  ruby \
  ruby-json
RUN RUN gem install octokit httpclient --no-rdoc --no-ri

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*
