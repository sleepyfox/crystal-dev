FROM alpine:3.8

# Install Crystal
RUN apk update && apk add --no-cache crystal shards curl alpine-sdk openssl-dev

# Set group and user IDs for docker user
ARG GID=1000
ARG UID=1000
ARG USER=me

# Create the group and user
RUN addgroup -g $GID -S $USER && adduser -D -u $UID -G $USER -S $USER

WORKDIR /var/app
RUN chmod 777 /var/app
USER $USER
WORKDIR /var/app/project

