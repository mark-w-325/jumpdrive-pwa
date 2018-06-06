FROM python:latest
MAINTAINER Mark Williams <maw325@gmail.com>

ARG my_dir

RUN \
  apt-get update && \
  apt-get install -yqq apt-transport-https
RUN \
  echo "deb https://deb.nodesource.com/node_8.x jessie main" > /etc/apt/sources.list.d/nodesource.list && \
  wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
  wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  apt-get update && \
  apt-get install -yqq nodejs yarn expect
RUN \
  npm install -g vue-cli webpack webpack-dev-server && \
  rm -rf /var/lib/apt/lists/* && \
  mkdir $my_dir

COPY auto_build_vue-cli.exp ./$my_dir

WORKDIR ./$my_dir

RUN chmod +x auto_build_vue-cli.exp && expect auto_build_vue-cli.exp

WORKDIR ./frontend

EXPOSE 8080

#ENTRYPOINT ["npm install && npm run dev"]