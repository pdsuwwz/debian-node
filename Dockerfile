FROM debian:latest

SHELL ["/bin/bash", "--login", "-c"]

RUN mkdir /usr/local/nvm
ENV NVM_DIR=/usr/local/nvm
ENV CURRENT_NODE_VERSION=8.12.0

RUN apt-get update  --fix-missing
RUN apt-get install -y curl

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $CURRENT_NODE_VERSION \
    && nvm alias default $CURRENT_NODE_VERSION \
    && nvm use default

ENV NODE_PATH=$NVM_DIR/v$CURRENT_NODE_VERSION/lib/node_modules
ENV PATH=$NVM_DIR/versions/node/v$CURRENT_NODE_VERSION/bin:$PATH

RUN nvm --version
RUN node -v
RUN npm -v