FROM mcr.microsoft.com/vscode/devcontainers/ruby:2.6-bullseye

# Currently, Debian containers are having issues with key expirations. Once the base image is updated this can be removed.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor > /usr/share/keyrings/yarn-archive-keyring.gpg

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="lts/*"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends build-essential default-mysql-client wait-for-it

# [Optional] Uncomment this line to install additional gems.
RUN gem install 'nokogiri:1.13.10' 'rails:4.2.11.3'

# This section copies the mysql client configuration to the dev container so the user doesn't have to pass the mysql username & password each time
COPY --chmod=664 ./.devcontainer/my.cnf /etc/mysql/my.cnf

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1