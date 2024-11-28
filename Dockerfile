FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y \
    nginx \
    curl \
    ca-certificates \
    php8.4 \
    php8.4-cli \
    php8.4-common \
    php8.4-mysql \
    php8.4-zip \
    php8.4-gd \
    php8.4-mbstring \
    php8.4-curl \
    php8.4-xml \
    php8.4-bcmath \
    php8.4-sqlite3 \
    php8.4-pgsql \
    php8.4-fpm \
    php8.4-soap \
    php8.4-exif \
    php8.4-tokenizer \
    php8.4-simplexml \
    composer \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m container
USER container
ENV USER=container
ENV HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
