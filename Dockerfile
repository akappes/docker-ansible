FROM python:3.7-alpine3.9

MAINTAINER "Arthur Kappes <artkappes@gmail.com>"

RUN apk update && \
    apk add --no-cache --virtual .build-deps \
    build-base \
    libffi-dev \
    python3-dev \
    openssl-dev \
    openssh
RUN pip install --user ansible --no-cache-dir
RUN apk del .build-deps
RUN apk add --no-cache rsync

CMD ["ansible", "--help"]
