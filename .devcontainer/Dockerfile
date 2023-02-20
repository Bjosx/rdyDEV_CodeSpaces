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

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

# [Optional] Docker
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends \
#         ca-certificates \
#         curl \
#         gnupg \
#         lsb-release

# RUN mkdir -m 0755 -p /etc/apt/keyrings \
#     && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# RUN echo \
#     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
#     $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends \
#     docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# RUN usermod -aG docker vscode